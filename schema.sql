-- Database Name: user_management_db
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS user_management_db;
USE user_management_db;
-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
-- This table stores the different roles available (e.g., Admin, User).
-- Normalization (3NF): By separating this from the users table, we avoid 
-- transitive dependencies and data duplication.
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
-- Insert default roles
INSERT INTO `roles` (`role_name`)
VALUES ('Admin'),
  ('User') ON DUPLICATE KEY
UPDATE `role_name` =
VALUES(`role_name`);
-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
-- This table stores user information.
-- Normalization:
-- 1NF: All columns hold atomic values (e.g., one email per row).
-- 2NF: No partial dependency because the primary key is a single column (`id`).
-- 3NF: No transitive dependency because `role_id` is a foreign key referencing `roles`.
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `profile_picture` VARCHAR(255) DEFAULT 'default.png',
  `role_id` INT NOT NULL DEFAULT 2,
  -- Default to 'User' (id=2)
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;