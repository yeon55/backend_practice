const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const sendCategories = async (req, res) => {

  const categories = await prisma.$queryRaw`
    SELECT id, name FROM categories ORDER BY id DESC;
  `
  return res.status(200).json({ categories })
}

module.exports = { sendCategories } 