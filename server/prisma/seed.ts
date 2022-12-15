import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
async function main() {
   await prisma.feedback.deleteMany()
   const feedbacks = await prisma.feedback.createMany({data: [
      {
         title: "This is a feedback",
         detail: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "         
      },
      {
         title: "This is a feedback",
         detail: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "         
      },
      {
         title: "This is a feedback",
         detail: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "         
      },
   ]})

}
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })