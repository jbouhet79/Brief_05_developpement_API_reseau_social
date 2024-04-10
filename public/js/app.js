const express = require('express');
const session = require('express-session');

const app = express();

app.use(session({
  secret: 'your_secret_key', // Change this to a secure random string
  resave: false,
  saveUninitialized: false
}));

app.get('/login', (req, res) => {
    // Simulated authentication
    const user = { id: 1, username: 'john_doe' };
    req.session.user = user;
    res.send('Logged in successfully!');
  });
  
  app.get('/profile', (req, res) => {
    const userId = req.session.user?.id; // Peux ne pas exister si l'utilisateur n'est pas passé par la route `/login`
    res.send(`User ID: ${userId}`);
  });