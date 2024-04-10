// routes/userRoutes.js
import express from 'express'
import { getUserByIdController, createUserController } from '../controllers/userController.js'
import { userLogin } from '../controllers/userController.js'


const router = express.Router()


// Route pour gérer la soumission du formulaire de connexion
router.post('/login', userLogin)


router.get('/users/:id', getUserByIdController)
router.post('/users', createUserController)

export default router