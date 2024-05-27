document.getElementById('search-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const movieTitle = document.getElementById('movie-title').value;
    fetchMovieData(movieTitle);
});

function fetchMovieData(title) {
    const apiKey = '4fc7c187'; // clave de API OMDb
    const url = `https://www.omdbapi.com/?t=${title}&apikey=${apiKey}`;

    //Muchachos, la película de la gente

    fetch(url)
        .then(response => response.json())
        .then(data => displayMovieData(data))
        .catch(error => console.error('Error:', error));
}

function displayMovieData(data) {
    const movieDetails = document.getElementById('movie-details');
    movieDetails.innerHTML = '';

    if (data.Response === 'True') {
        const poster = data.Poster;
       
        const movieInfo = `
            <img src="${poster}" alt="${data.Title}" class="movie-poster">
            <div class="movie-info">
                <h2>${data.Title}</h2>
                <p><strong>Año:</strong> ${data.Year}</p>
                <p><strong>Género:</strong> ${data.Genre}</p>
                <p><strong>Director:</strong> ${data.Director}</p>
                <p><strong>Actores:</strong> ${data.Actors}</p>
                <p><strong>Trama:</strong> ${data.Plot}</p>
                <p><strong>IMDB Rating:</strong> ${data.imdbRating}</p>
            </div>
        `;
        movieDetails.innerHTML = movieInfo;
    } else {
        movieDetails.innerHTML = `<p>Película no encontrada</p>`;
    }
}
