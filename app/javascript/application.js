// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


    const lista = document.querySelector("#pokemon_name");
    lista.addEventListener("change", (event) => {
        // const mensagem = document.querySelector('.mensagem');

        mensagem.textContent = event.target.value;
        pokemon_name = event.target.value;
        const url = `https://pokeapi.co/api/v2/pokemon/${pokemon_name}`;
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'json';
        xhr.send();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {  
                    var r = xhr.response;
                    document.getElementById('pokemon_base_experience').value = r['base_experience'];
                    document.getElementById('pokemon_value_satoshi').value = r['base_experience'];
                }
            }
        }
    });