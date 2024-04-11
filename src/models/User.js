import db from '../services/db.js'

export default class User {
  constructor(username, email, password) {
    this.username = username
    this.email = email
    this.password = password
  }

  async save() {
    const client = await db.connect()
    try {
      const queryText = 'INSERT INTO account (user_name, email, password) VALUES ($1, $2, $3) RETURNING *'
      const values = [this.username, this.email, this.password]
      const result = await client.query(queryText, values)
      return User.fromDbUser(result.rows[0])
      // retourne de

    } finally {
      client.release()
    }
  }

  static async findById(userId) {
    const client = await db.connect()
    try {
      const queryText = 'SELECT * FROM account WHERE id = $1'
      const values = [userId]
      const result = await client.query(queryText, values)
      return User.fromDbUser(result.rows[0])

    } finally {
      client.release()
    }
  }

  static async findByUsernameAndPassword(username, password) {
    const client = await db.connect()
    try {
      // ATTENTION : nom des données de la BDD (user_name !)
      const queryText = 'SELECT * FROM account WHERE user_name = $1 and password = $2'
      const values = [username, password]
      const result = await client.query(queryText, values)
      return User.fromDbUser(result.rows[0])
    } finally {
      client.release()
    }
  }

  // adapter le nom de données de la BDD à l'appli utilisateur
  static fromDbUser(db_user) {
    const { id, name, first_name, user_name: username, password, email, tel } = db_user
    return { id, name, first_name, username, password, email, tel }
  }
}

