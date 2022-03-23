/*
  Warnings:

  - You are about to drop the column `email` on the `products` table. All the data in the column will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `categories` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[korean_name]` on the table `products` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `category_id` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `english_name` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `korean_name` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `products_email_key` ON `products`;

-- AlterTable
ALTER TABLE `products` DROP COLUMN `email`,
    ADD COLUMN `category_id` INTEGER NOT NULL,
    ADD COLUMN `english_name` VARCHAR(191) NOT NULL,
    ADD COLUMN `korean_name` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `product_images` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `image_url` VARCHAR(191) NOT NULL,
    `product_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `allergies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products_allergies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `allergy_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nutritions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `caffein` VARCHAR(191) NOT NULL,
    `fat` VARCHAR(191) NOT NULL,
    `sugar` VARCHAR(191) NOT NULL,
    `sodium` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `nutritions_product_id_key`(`product_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `categories_name_key` ON `categories`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `products_korean_name_key` ON `products`(`korean_name`);

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_images` ADD CONSTRAINT `product_images_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products_allergies` ADD CONSTRAINT `products_allergies_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products_allergies` ADD CONSTRAINT `products_allergies_allergy_id_fkey` FOREIGN KEY (`allergy_id`) REFERENCES `allergies`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `nutritions` ADD CONSTRAINT `nutritions_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
