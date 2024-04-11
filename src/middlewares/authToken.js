import User from "../models/User.js"
import { verifyUserToken } from "../services/jwt.js"

/**
 * 
 * @param {import("express").Request} req 
 * @param {import("express").Response} res 
 * @param {Function} next 
 */

export async function requireToken(req, res, next) {
    const token = req.headers.authorization
    const userPayLoad = await verifyUserToken(token).catch(error=>{
        res.status(403).json({error: true, message: 'Forbidden acces'})
    })

    if(userPayLoad) {
        console.log('UserPayLoad', userPayLoad)
        req.user = await User.findById(userPayLoad.id)
        next()
    }

}


