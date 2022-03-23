const http = require('http')
const express = require('express')
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient() 

const app = express()
app.use(express.json())
app.post('/users/signup', async(req, res) => {
    try{

        const { email, password } = req.body
        console.log('email: ', email, 'password: ', password)

        const createdUser = await prisma.$queryRaw`
        INSERT INTO users(email, password) VALUES (${email}, ${pasword})
        `

        return res.status(201).json({message: "SIGNUP_SUCCESS"})
    }   catch(err) {
        console.log(err)
        return res.status(500).json({message: err.message})
    }
})

const server = http.createServer(app)

const start = async () => {
    try {
        server.listen(8000, () => console.log(`Server is listening on 8000`))
    }   catch(err) {
      console.log(err)
    }
}


start()