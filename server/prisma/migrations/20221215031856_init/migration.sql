-- CreateEnum
CREATE TYPE "Status" AS ENUM ('Suggestion', 'Planned', 'InProgress', 'Live');

-- CreateEnum
CREATE TYPE "Category" AS ENUM ('Feature', 'UX', 'UI', 'Enhancement', 'Bug');

-- CreateTable
CREATE TABLE "Feedback" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "detail" TEXT NOT NULL,
    "category" "Category" NOT NULL DEFAULT 'Feature',
    "status" "Status" NOT NULL DEFAULT 'Suggestion',

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "feedbackId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_feedbackId_fkey" FOREIGN KEY ("feedbackId") REFERENCES "Feedback"("id") ON DELETE SET NULL ON UPDATE CASCADE;
