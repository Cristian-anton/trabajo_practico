document.addEventListener('DOMContentLoaded',function(){
    const itemsTableBody = this.getElementById('itemsTableBody');

    const loadItems = (()=>{

        fetch('http://localhost/trabajo_practico/api/api.php')
        .then(response=>response.json())
        .then(data=>{
            itemsTableBody.innerHTML = "";
            if(data.peliculas){
                data.peliculas.forEach(pelicula => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                    <td>${pelicula.id}</td>
                    <td>${pelicula.titulo}</td>
                    <td>${pelicula.año}</td>
                    <td>${pelicula.genero}</td>
                    <td>${pelicula.director}</td>
                    <td>${pelicula.reparto}</td>
                    <td>${pelicula.detalles}</td>
                    <td>${pelicula.rating}</td>
                    <td>${pelicula.duracion}</td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteItem(${pelicula.id})">Eliminar</button>
                    </td>
                    <td>
                        <buttonn class="btn btn-success" onclick="editItem(
                        ${pelicula.id},
                        '${pelicula.titulo}',
                        '${pelicula.año}',
                        '${pelicula.genero},
                        '${pelicula.director}',
                        '${pelicula.reparto}',
                        '${pelicula.detalles}',
                        '${pelicula.rating}',
                        '${pelicula.duracion}')">Editar</button>
                    </td>
                    `;
                    itemsTableBody.appendChild(row);
                    
                });
            }
            else{
                console.error('No se encontraron peliculas');
            }
        })
        .catch(error => console.error('Error:', error));
        
    });

    const deleteItem = ((id)=>{
        fetch(`http://localhost/trabajo_practico/api/api.php?id=${id}`,
            {
                method: "DELETE",
                headers: {
                    'Content-Type':'application/json'
                }
            })
            .then(response=>response.json())
            .then(data=>
                {
                    loadItems();
                });
            loadItems();

    })

    window.editItem=function(id, titulo, año, genero, director, reparto, detalles, rating, duracion){
        document.getElementById('id').value = id;
        document.getElementById('titulo').value = titulo;
        document.getElementById('año').value = año;
        document.getElementById('genero').value = genero;
        document.getElementById('director').value = director;
        document.getElementById('reparto').value = reparto;
        document.getElementById('detalles').value = detalles;
        document.getElementById('rating').value = rating;
        document.getElementById('duracion').value = duracion;

    }

    window.deleteItem=deleteItem;
    loadItems();



})