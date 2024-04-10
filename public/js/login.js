window.addEventListener('DOMContentLoaded', async () => {
    // écoute le formulaire
    const form = document.querySelector('form')
    // après le clic 
    form.addEventListener('submit', async (event) => {
        // j'interdis le navigateur de faire son action par défaut
        event.preventDefault()
        // récupère les données du formulaire
        const data = Object.fromEntries(new FormData(form))
        // récupère dans form : username et password


        // crée la variable sur le fetch --> requête sur l'API sur localhost:3000/login
        // on appel la route de l'API en méthode POST
        const  user = await fetch('/login', {
            method: 'POST',
            // on spécifie qu'on envoie le json avec application/json
            // on transforme notre objet JS "data" en JSON et on l'envoie à l'API
            headers: {
                'Content-Type': 'application/json'
            },
            // quand l'API répond, on lit le JSON et on met le résultat dans la variable user
            body: JSON.stringify(data)
        })
        .then(response => response.JSON())
        .catch(error=> {
            console.log("J'ai une erreur", error);
        })

        
        // Si l'utilisateur existe, 
        if (user) {
            console.log('Je suis connecté', user);
            // on le sauveagarde dans la session navigateur
            sessionStorage.setItem('user', user.id)

            // on redirige sur la page index.html
            document.location.href = '/'
        }
    })
})