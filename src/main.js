import express from 'express'
import userRoutes from './routes/userRoutes.js'

const app = express();
const HOST = process.env.HOST ?? 'localhost'
const PORT = process.env.PORT || 3000

app.use(express.static('public'))


/*** Middleware ***/

// Middleware for JSON body parsing
// app.use(express.json())
// Middleware to read FormData (accessible in `req.body`)
app.use(express.urlencoded({extended: true}))

/*** Routeurs ***/

// Routes users
 app.use(userRoutes)

/*** Initialisation ***/

// Serveur express.js
app.listen(PORT, HOST, () => {
  console.log(`Server is running on http://${HOST}:${PORT}`)
});