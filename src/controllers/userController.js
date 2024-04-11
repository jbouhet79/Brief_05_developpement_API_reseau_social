// userController.js
import User from '../models/User.js'
import Post from '../models/Post.js'
import { generateUserToken } from '../services/jwt.js'

export async function getCurrentUser(req, res) {
  res.json(req.user)
}

export async function getPost(req, res) {
  const posts = await Post.findAllPosts()
  res.json(posts)
}

export async function createPost(req, res) {
  const content = req.body.content
  const post = await new Post(content, new Date()).savePost()
  res.json(post)
}

export async function getUserByIdController(req, res, next) {
  const userId = req.params.id
  const user = await User.findById(userId).catch(error => {
    next(error)
  })
  if (user) {
    res.json(user)
  }
}

export async function createUserController(req, res, next) {
  const { username, email, password } = req.body
  const newUser = new User(username, email, password)
  const savedUser = await newUser.save().catch(error => {
    next(error)
  })
  if (user) {
    res.status(201).json(savedUser)
  }
}

export async function userLogin(req, res) {
  const { username, password } = req.body
  console.log(username, password)
  const user = await User.findByUsernameAndPassword(username, password)
  if (user) {
    const token = generateUserToken(user)
    // res.send('Connexion réussie !')
    res.json({ token })
    // id: user.id,
    // name: user.name,
    // first_name: user.first_name,
    // username: user.username,
    // email: user.email,
    // tel: user.tel
    // })
  } else {
    res.status(401).send('Échec de la connexion. Veuillez vérifier vos identifiants.')
  }

  // if (username === 'admin' && password === 'simplon2024') {
  //   res.send('Connexion réussie !')
  // } else {
  //   res.status(401).send('Échec de la connexion. Veuillez vérifier vos identifiants.')
  // }
}