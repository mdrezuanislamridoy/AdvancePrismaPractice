-- CreateEnum
CREATE TYPE "Role" AS ENUM ('User', 'Admin');

-- CreateTable
CREATE TABLE "comment" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "createdBy" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "descripiton" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "totalSale" INTEGER NOT NULL,
    "owner" INTEGER NOT NULL,
    "totalFavourites" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "comment_createdBy_productId_key" ON "comment"("createdBy", "productId");

-- CreateIndex
CREATE UNIQUE INDEX "product_owner_key" ON "product"("owner");

-- CreateIndex
CREATE INDEX "product_title_descripiton_idx" ON "product"("title", "descripiton");

-- CreateIndex
CREATE INDEX "user_name_email_role_idx" ON "user"("name", "email", "role");

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comment" ADD CONSTRAINT "comment_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_owner_fkey" FOREIGN KEY ("owner") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
