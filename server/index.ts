import { Prisma, PrismaClient } from '@prisma/client'
import express from 'express'

const prisma = new PrismaClient()
const app = express()

app.use(express.json())



app.get('/feedbacks', async (req, res) => {
  const users = await prisma.feedback.findMany()
  res.json(users)
})


app.get(`/feedbacks/:id`, async (req, res) => {
  const { id }: { id?: string } = req.params

  const post = await prisma.feedback.findUnique({
    where: { id: String(id) },
  })
  console.log(post);
  
  res.json(post)
})



const server = app.listen(8888, () =>
  console.log(`
🚀 Server ready at: http://localhost:8888`),
)