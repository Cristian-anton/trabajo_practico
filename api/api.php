<?php 
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

include 'db.php';
include 'peliculas.php';

$method = $_SERVER['REQUEST_METHOD'];

switch ($method){
    case "GET": handleGet($conn);
                break;
    case "POST": handlePost($conn);
                break;
    case "PUT": handlePut($conn);
                break;
    case "DELETE": handleDelete($conn);
                break;
    default: json_encode(['message'=>'metodo no permitido']);
    break;
}

//funcion para traer peliculas
function handleGet($conn){
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;

    if($id > 0){
        $stmt = $conn->prepare("SELECT * FROM peliculas WHERE id = ?");
        $stmt->execute([$id]);
        $pelicula = $stmt->fetch(PDO::FETCH_ASSOC);

        if($pelicula){
            $peliculaObj = Peliculas::fromArray($pelicula);
            echo json_encode($peliculaObj->toArray());
        }
        else{
            http_response_code(404);
            echo json_encode(['message'=>'No se encontradron datos']);
        }
    }
    else{
        $stmt = $conn->query("SELECT * FROM peliculas");
        $peliculas = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $peliculaObjs = array_map(fn($pelicula) => Peliculas::fromArray($pelicula)->toArray(), $peliculas);
        echo json_encode(['peliculas' => $peliculaObjs]);

    }
}

//Funcion para agregar peliculas
function handlePost($conn){
    if ($conn ===null){
        echo json_encode(['message'=>'Error en la conexion con la BD']);
        return;
    }

    $data =  json_decode(file_get_contents('php://input'), true);
    $requiredFields = ['titulo', 'año', 'genero'];
    foreach ($requiredFields as $fields){
        if(!isset($data[$fields])){
            echo json_encode(['message'=>'Datos de peliculas incompleto']);
            return;
        }
    }

    $pelicula = Peliculas::fromArray($data);

    try{
        $stmt = $conn->prepare("INSERT INTO peliculas (titulo, año, genero, director, reparto, detalles, rating, duracion) VALUES (?,?,?,?,?,?,?,?)");
        $stmt->execute([
            $pelicula->titulo,
            $pelicula->año,
            $pelicula->genero,
            $pelicula->director,
            $pelicula->reparto,
            $pelicula->detalles,
            $pelicula->rating,
            $pelicula->duracion
        ]);
        echo json_encode(['message'=>'Pelicula ingresada correctamente']);

    }
    catch(PDOException $e){
        echo json_encode(['message'=>'Error al ingresar la pelicula', 'error'=>$e->getMessage()]);
    }

}   

//funcion para editar peliculas
function handlePut($conn){
    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    if ($id > 0){
        $data = json_decode(file_get_contents('php://input'), true);
        $pelicula = Peliculas::fromArray($data);
        $pelicula->id = $id;

        $fields=[];
        $params=[];

        if($pelicula->titulo !== null){
            $fields[] = 'titulo = ?';
            $params[] = $pelicula->titulo;
        }
        if($pelicula->año !== null){
            $fields[] = 'año = ?';
            $params[] = $pelicula->año;
        }
        if($pelicula->genero !== null){
            $fields[] = 'genero = ?';
            $params[] = $pelicula->genero;
        }
        if($pelicula->director !== null){
            $fields[] = 'director = ?';
            $params[] = $pelicula->director;
        }
        if($pelicula->reparto !== null){
            $fields[] = 'reparto = ?';
            $params[] = $pelicula->reparto;
        }
        if($pelicula->detalles !== null){
            $fields[] = 'detalles = ?';
            $params[] = $pelicula->detalles;
        }
        if($pelicula->rating !== null){
            $fields[] = 'rating = ?';
            $params[] = $pelicula->rating;
        }
        if($pelicula->duracion !== null){
            $fields[] = 'duracion = ?';
            $params[] = $pelicula->duracion;
        }

        if(!empty($fields)){
            $params[]=$id;
            $stmt = $conn->prepare("UPDATE peliculas SET ".implode(',',$fields)."WHERE id = ?");
            $stmt->execute($params);
            echo json_encode(['message'=>'Pelicula actualizada con exito']);
           
        }else{
            echo json_encode(['message'=>'No hay campos para actualzar']);
        }

    }
    else{
        echo json_encode(['message'=>'ID no proporcionado']);
    } 


}

//funcion para eliminar peliculas
function handleDelete($conn){

    $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
    if($id>0){
        $stmt = $conn->prepare('DELETE FROM peliculas WHERE id = ?');
        $stmt->execute([$id]);
        echo json_encode(['message'=>'pelicula eliminada con exito']);
    }else{
        echo json_encode(['mesaage'=>'ID no proporcionado']);
    }



}
