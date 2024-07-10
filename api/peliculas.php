<?php 

class Peliculas {

    public $id;
    public $titulo;
    public $año;
    public $genero;
    public $director;
    public $reparto;
    public $detalles;
    public $rating;
    public $duracion;

    public function __construct($id=null, $titulo, $año, $genero="Deportes", $director=null, $reparto=null, $detalles=null, $rating=null, $duracion = null){
        $this->id = $id;
        $this->titulo = $titulo;
        $this->año = $año;
        $this->genero = $genero;
        $this->director = $director;
        $this->reparto = $reparto;
        $this->detalles = $detalles;
        $this->rating = $rating; 
        $this->duracion = $duracion;
        

    }

    public static function fromArray($data){
        return new self(
            $data['id'] ?? null,
            $data['titulo'] ?? null,
            $data['año'] ?? null,
            $data['genero'] ?? null,
            $data['director'] ?? null,
            $data['reparto'] ?? null,
            $data['detalles'] ?? null,
            $data['rating'] ?? null,
            $data['duracion'] ?? null
            

        );
    }

    public function toArray(){
        return get_object_vars($this);
    }

}

?>