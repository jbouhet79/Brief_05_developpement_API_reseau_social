// routes/userRoutes.js
import express from 'express'
import { getUserByIdController, createUserController, getCurrentUser, userLogin, getPost, createPost} from '../controllers/userController.js'
import { requireToken} from '../middlewares/authToken.js'

const router = express.Router()


// Route pour gérer la soumission du formulaire de connexion
router.post('/login', userLogin)
router.get('/user', requireToken, getCurrentUser)
router.get('/users/:id', getUserByIdController)
router.post('/users', createUserController)
router.get('/post', getPost)
router.post('/post', createPost)

export default router