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

    public function __construct($titulo, $año, $genero="Deportes", $director, $reparto, $detalles, $rating, $duracion = null, $id=null){
        $this->titulo = $titulo;
        $this->año = $año;
        $this->genero = $genero;
        $this->director = $director;
        $this->reparto = $reparto;
        $this->detalles = $detalles;
        $this->rating = $rating; 
        $this->duracion = $duracion;
        $this->id = $id;   

    }

    public static function fromArray($data){
        return new self(
            $data['titulo'] ?? null,
            $data['año'] ?? null,
            $data['genero'] ?? null,
            $data['director'] ?? null,
            $data['reparto'] ?? null,
            $data['detalles'] ?? null,
            $data['rating'] ?? null,
            $data['duracion'] ?? null,   
            $data['id'] ?? null

        );
    }

    public function toArray(){
            return get_object_vars( $this );
    }

}

?>