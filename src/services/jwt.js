import jwt from 'jsonwebtoken'

const secretKey = process.env.SECRETKEY ?? 'my_secret_key'

export function generateUserToken(user) {
    const payload = {id: user.id}       // crée un token qui encrypte l'id du user
    const token = jwt.sign(payload, secretKey, {expiresIn: '1h'})
    return token

}

export function verifyUserToken(token) {
    return new Promise((accept, reject) => {
        jwt.verify(token, secretKey, (err, decodedPayLoad) => {
            if(err) {
                reject(err)
            } else {
                accept(decodedPayLoad)
            }
        })
    })
}
