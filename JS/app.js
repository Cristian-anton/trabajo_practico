document.addEventListener('DOMContentLoaded',function()
{
const form=document.getElementById('itemForm');
const itemsTableBody = document.getElementById('itemsTableBody');

    form.addEventListener('submit', function(event){
        
        event.preventDefault();

        const formData = new FormData(form);
        const itemId = formData.get('id');

        
        //construir objeto con los datos del formulario

        const data ={
            id: formData.get('id'),
            titulo: formData.get('titulo'),
            año: formData.get('año'),
            genero: formData.get('genero'),
            director: formData.get('director'),
            reparto: formData.get('reparto'),
            detalles: formData.get('detalles'),
            rating: formData.get('rating'),
            duracion: formData.get('duracion')
        };
        if(itemId){
            updateItems(data);
        }else{
            createItem(data);
        }
    });
    
    const createItem= ((data)=>{
        fetch('http://localhost/trabajo_practico/api/api.php',
            {
                method:'POST',
                headers: {
                    'Content-type':'application/json',
                },
                body: JSON.stringify(data)
            }
        )
        .then(response =>
        {
            if(!response.ok){
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(result=>{
            consule.log('success:',result);

            loadItems();
            form.reset();
        })
        .catch(error=>{
            console.error('Error:', error);
            alert('Error al ingresar el item');
        });
    })
    
    
    
    const loadItems = (()=>{

        fetch('http://localhost/trabajo_practico/api/api.php')
        .then(response => response.json())
        .then(data => {
            itemsTableBody.innerHTML = '';
            if (data.peliculas) 
                {
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
                else 
                {
                    console.error('No se encontraron películas');
                }
            })
            .catch(error => console.error('Error:', error));
        
    })



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


    const updateItems = ((data)=>{
        fetch(`http://localhost/trabajo_practico/api/api.php?id=${data.id}`,
            {
                method: 'PUT',
                headers:{
                    'Content-type':'application/json',
                },
                body: JSON.stringify(data)
            })
        .then(response=>
        {
            if(!response.ok){
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(result=>{
            console.log('Success:', result);
            loadItems();
            form.reset();
        })
        .catch(error => 
            {
            console.error('Error:', error);
            alert('Error al actualizar el item');
        });
            
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

    };

    window.deleteItem=deleteItem;
    loadItems();

});