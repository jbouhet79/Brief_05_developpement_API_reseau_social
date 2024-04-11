window.addEventListener('DOMContentLoaded', async () => {
    const form = document.querySelector('form')
    form.addEventListener('poster', async (event) => {
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
        .then(response => response.json())
        .catch(error=> {
            console.log("J'ai une erreur", error)
        })

        
        // Si l'utilisateur existe, 
        if (user) {
            console.log('Je suis connecté', user)
            // on le sauveagarde le user.id dans la session navigateur pour simuler le token
            // sessionStorage.setItem('user', user.id)

            // version avec le token sauvegarde dans le navigateur avec le jwt
            sessionStorage.setItem('token', user.token)


            // on redirige sur la page index.html
            document.location.href = '/'
        }
    })
})