//Post.js
import db from '../services/db.js'

export default class Post {
    constructor(content, date) {
        this.content = content
        this.date = date
    }

    async savePost() {
        const client = await db.connect()
        try {
            const queryText = 'INSERT INTO post (content, date) VALUES ($1, $2) RETURNING *'
            const values = [this.content, this.date]
            const result = await client.query(queryText, values)
            return result.rows[0]
            // retourne de

        } finally {
            client.release()
        }
    }

    static async findAllPosts() {
        const client = await db.connect()
        try {
            const queryText = 'SELECT * FROM post'
            const result = await client.query(queryText)
            return result.rows

        } finally {
            client.release()
        }
    }

}
