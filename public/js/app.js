window.addEventListener('DOMContentLoaded', async () => {
    const mainEl = document.querySelector('main')

    // avec le user (user.id) pour simuler le token avec le jwt
    // const token = sessionStorage.getItem('user')
    // version avec le token et jwt
    const token = sessionStorage.getItem('token')
    if (!token) {
        document.location.href = '/login.html'
        return
    }

    // version avec le token = user.id
    // const user = await fetch(`/users/${token}`, {
    // version avec le token et le jwt
    const user = await fetch(`/user`, {
        headers: {
            'Authorization': `${token}`
        }
    })
        .then(async response => {
            if (response.ok) {
                return response.json()
            }
            throw await response.json()
        })
        .catch(error => {
            mainEl.innerText = error.message
        })

    if (user) {
        mainEl.innerText = 'Bonjour ' + user.username
    }

    const posts = await fetch(`/post`)
        .then(response => response.json())
        .catch(error => {
            console.error(error)
        })
    if (posts) {
        mainEl.innerHTML += '<br/><br/>' + posts.map(post => `<article>${post.content}</article>`).join('')
    }
})

