/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `amenities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `building_contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `building_filament_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filament_user_id` bigint unsigned NOT NULL,
  `building_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `buildings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` int NOT NULL,
  `owner_id` bigint unsigned NOT NULL,
  `price` double(8,2) NOT NULL,
  `rent_price` double(8,2) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barangay` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_number` varchar(255) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (concat(`name`,_utf8mb4' ',`room`)) VIRTUAL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `filament_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `filament_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `filament_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL,
  `two_factor_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `financial_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `financial_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `financials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `building_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_transacted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `lease_contracts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint unsigned NOT NULL,
  `signatory_id` bigint unsigned NOT NULL,
  `building_id` bigint unsigned NOT NULL,
  `monthly_rent` double(8,2) NOT NULL,
  `duration` int NOT NULL,
  `contract_start` datetime NOT NULL,
  `number_of_advance` int NOT NULL,
  `number_of_deposit` int NOT NULL,
  `mode_of_payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `owners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `signatories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





INSERT INTO `building_filament_user` (`id`, `filament_user_id`, `building_id`, `created_at`, `updated_at`) VALUES
(1, 1, 23, NULL, NULL);


INSERT INTO `buildings` (`id`, `name`, `type`, `room`, `floor`, `owner_id`, `price`, `rent_price`, `address`, `street`, `barangay`, `city`, `created_at`, `updated_at`) VALUES
(23, 'BSA', 'condo', '905B', 9, 1, 10.00, 10.00, 'BSA Twin Towers', 'no', 'no', 'Mandaluyong', '2022-11-06 14:55:49', '2022-11-06 14:55:49');
INSERT INTO `buildings` (`id`, `name`, `type`, `room`, `floor`, `owner_id`, `price`, `rent_price`, `address`, `street`, `barangay`, `city`, `created_at`, `updated_at`) VALUES
(24, 'PRC', 'condo', '1110', 11, 1, 10.00, 10.00, 'Parc Royale Condo', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49');
INSERT INTO `buildings` (`id`, `name`, `type`, `room`, `floor`, `owner_id`, `price`, `rent_price`, `address`, `street`, `barangay`, `city`, `created_at`, `updated_at`) VALUES
(25, 'PRC', 'condo', '1409', 14, 1, 10.00, 10.00, 'Parc Royale Condo', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49');
INSERT INTO `buildings` (`id`, `name`, `type`, `room`, `floor`, `owner_id`, `price`, `rent_price`, `address`, `street`, `barangay`, `city`, `created_at`, `updated_at`) VALUES
(26, 'Millenia', 'condo', '32DE', 32, 1, 10.00, 10.00, 'Millenia Suites', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(27, 'BSA', 'condo', '3102B', 31, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(28, 'BSA', 'condo', '3108B', 31, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(29, 'BSA', 'condo', '32LM', 31, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(30, 'Millenia', 'condo', '15Q', 15, 1, 10.00, 10.00, 'Millenia', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(31, 'BSA', 'condo', '1701B', 17, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(32, 'Sonata', 'condo', '29D', 29, 1, 10.00, 10.00, 'Sonata', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(33, 'BSA', 'condo', '1501A', 15, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(34, 'BSA', 'condo', '4713A', 47, 1, 10.00, 10.00, 'BSA', 'no', 'no', 'Ortigas', '2022-11-06 14:55:49', '2022-11-06 14:55:49'),
(35, 'company', 'office', 'company', 0, 1, 0.00, 0.00, 'Company', 'Company', 'Compan', 'Company', '2022-11-06 15:06:48', '2022-11-06 15:07:26');



INSERT INTO `filament_password_resets` (`email`, `token`, `created_at`) VALUES
('normal@yahoo.com', '$2y$10$7QkYDpWX0qEkFxtrsycW3elAmotNLyv2EcgfnzbCOah/5t36p4Dmi', '2022-10-26 03:18:22');


INSERT INTO `filament_users` (`id`, `email`, `password`, `first_name`, `last_name`, `expires_at`, `two_factor_expires_at`, `two_factor_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'master@yahoo.com', '$2y$10$0BcBR6V8YUop9dGNVFGYpu.U/ZaG8GfIYIEYwEk9th4KbkFuvHoDK', 'jay', 'jay', NULL, NULL, NULL, NULL, '2022-10-26 03:12:08', '2022-10-26 03:12:08');
INSERT INTO `filament_users` (`id`, `email`, `password`, `first_name`, `last_name`, `expires_at`, `two_factor_expires_at`, `two_factor_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'normal@yahoo.com', 'K30xXIDubFLnMcQwquxaaHnpIgU1IuCh05cW8Ju4', 'normal', 'normal', NULL, NULL, NULL, NULL, '2022-10-26 03:18:22', '2022-10-26 03:18:22');
INSERT INTO `filament_users` (`id`, `email`, `password`, `first_name`, `last_name`, `expires_at`, `two_factor_expires_at`, `two_factor_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'test@yahoo.com', '$2y$10$nke40QLsEPND5nm888FojetN3nL8IvuQgw0eA/BYinDiuBP7KhOJe', 'test', 'test', NULL, NULL, NULL, 'wu898dGIUUws5sLHPUM418fkMKOkikUoXDnmNoguHnMxDHgR0BlwAZUWk9uG', '2022-10-26 03:19:10', '2022-10-26 03:19:25');



INSERT INTO `financials` (`id`, `building_id`, `description`, `type`, `total`, `created_at`, `updated_at`, `payment_type`, `body`, `date_transacted`) VALUES
(537, '35', 'Money from quitclaim from deigh', 'bank', 54407.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07');
INSERT INTO `financials` (`id`, `building_id`, `description`, `type`, `total`, `created_at`, `updated_at`, `payment_type`, `body`, `date_transacted`) VALUES
(538, '35', 'from josie. deposit', 'bank', 30000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07');
INSERT INTO `financials` (`id`, `building_id`, `description`, `type`, `total`, `created_at`, `updated_at`, `payment_type`, `body`, `date_transacted`) VALUES
(539, '28', 'from the renewal rent of 3108B', 'bank', 60000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07');
INSERT INTO `financials` (`id`, `building_id`, `description`, `type`, `total`, `created_at`, `updated_at`, `payment_type`, `body`, `date_transacted`) VALUES
(540, '27', 'from the payment advance of 3102B', 'bank', 56000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(541, '27', 'deposit for 3102B', 'bank', 28000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(542, '35', 'Money from bibo', 'bank', 300000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(543, '35', 'lyn\'s deposit', 'bank', 9500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(544, '35', 'payment for samsung washer and ref', 'bank', 22000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(545, '35', 'commission I got from josie..', 'bank', 11400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(546, '35', 'got from client in shore', 'bank', 180000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(547, '35', 'got from bibo', 'bank', 71000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(548, '23', 'got from sybil 905 payment', 'bank', 360000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(549, '35', 'company', 'bank', 270000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(550, '35', 'company', 'bank', 60000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(551, '35', 'from security bank', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(552, '28', 'Check money', 'bank', 30000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(553, '31', 'deposit advance for 1701B', 'bank', 135000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(554, '28', '3108B payment', 'bank', 120000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(555, '25', '1409 payment', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(556, '24', '2 months Advance and Deposit  1110', 'bank', 60000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(557, '28', 'Checks - March 2022 - April 2022', 'bank', 50000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(558, '28', 'Check - May 2022', 'bank', 25000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(559, '26', 'Reservation Fee for 32DE', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(560, '25', 'Client pay 1409', 'bank', 54000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(561, '25', 'Client Advance 1+1', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(562, '24', '1110 payment', 'bank', 15000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(563, '24', 'payment', 'bank', 15000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(564, '28', 'June and July dues', 'bank', 50000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(565, '30', 'Millenia 15Q', 'bank', 21890.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(566, '31', 'Keycard of 1701B', 'bank', 150.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(567, '35', 'For the F4 Print', 'bank', 170.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(568, '32', 'Association dues for  29D', 'bank', 122708.97, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(569, '32', 'Meralco bill for 29D.', 'bank', 1900.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(570, '32', 'for 4 people who carry and uninstall', 'bank', 4000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(571, '32', 'for the driver', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(572, '32', 'for the car ( car wash and gasoline )', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(573, '35', '', 'bank', 378000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(574, '35', 'for bibo', 'bank', 2500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(575, '35', 'my salary', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(576, '33', 'Josie\'s refund for washing machine and A1501 Realty Tax', 'bank', 11000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(577, '27', 'Bought some cleaning tools to clean 3102 in bsa and clean it', 'bank', 400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(578, '35', 'paid lazada and shopee for sir jay', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(579, '29', 'locksmith in 32LM', 'bank', 1200.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(580, '31', 'sent 2 maid to clean B1701 for viewing', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(581, '26', '2 maid clean 2 units in Millenia 32DE and 32LM', 'bank', 1500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(582, '35', 'I get my salary for january', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(583, '35', 'Gave to client this February 10. 2021. ', 'bank', 106000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(584, '35', 'fare when I go to shore.', 'bank', 92.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(585, '35', 'Grab when I go to moana to go back to ortigas', 'bank', 150.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(586, '35', 'Deposit bank to wang shaojia', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(587, '35', 'Shopee credit for sir', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(588, '24', 'half / Parc Assoc Dues', 'bank', 2750.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(589, '35', 'loaded for sir jay shopee', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(590, '35', 'Shopee credit for sir', 'bank', 45000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(591, '35', 'Shopee credit for sir', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(592, '35', 'February salary', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(593, '35', 'send gcash to sir jay', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(594, '35', 'Sent to gcash and lazada', 'bank', 360000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(595, '35', 'to account eastw st', 'bank', 80000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(596, '35', 'to maria dulce', 'bank', 190000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(597, '28', 'grab transpo for going to manila bank of china', 'bank', 1100.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(598, '27', '2 access card in bsa for 3102 and 1501 because I gave to sybill and the tenant of 3102 lost the card.', 'bank', 300.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(599, '35', 'Transpo to china bank again', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(600, '35', 'for josie', 'bank', 21000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(601, '35', 'Salary march', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(602, '35', 'shopee credits', 'bank', 35000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(603, '35', 'Grab courier payment for the security bank account card', 'bank', 110.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(604, '35', 'GRAB Transpo to Bank of china to get 30k for this May 9 check', 'bank', 946.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(605, '23', 'for printing documents and ID for BSA 905', 'bank', 100.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(606, '35', 'May 31 meralco transporation back and forth.', 'bank', 400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(607, '35', 'June 1 Meralco transporation again but I came 6am in morning', 'bank', 400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(608, '24', 'Parc Royale 1110 Association dues for 1 month', 'bank', 3500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(609, '27', 'BSA 3102 Bill Payment for meralco disconnection', 'bank', 8600.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(610, '30', '15Q Return deposit Millenia', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(611, '28', 'Payment for dues in BSA', 'bank', 54000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(612, '25', 'Dues in 1409', 'bank', 40587.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(613, '35', 'pasay grab fare', 'bank', 850.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(614, '35', 'shopee', 'bank', 18000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(615, '35', 'april', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(616, '35', 'may', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(617, '35', 'june', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(618, '35', 'july', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(619, '35', 'August', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(620, '35', 'september', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(621, '35', 'transport fee', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(622, '24', 'parc royale dues', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(623, '35', 'payment for josie', 'bank', 130000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(624, '35', 'october', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(625, '35', 'Salary november - February', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(626, '35', 'bank of china fare', 'bank', 700.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(627, '35', 'fare ', 'bank', 400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(628, '35', 'fare', 'bank', 400.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(629, '35', 'fare', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(630, '35', 'Fare', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(631, '35', 'Grab expensess for working on January - July', 'bank', 3100.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(632, '25', 'Meralco', 'bank', 37800.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(633, '35', 'March - April salary', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(634, '28', 'Assoc Dues - January 2022 - April 2022 BSA 3108', 'bank', 16000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(635, '35', 'JOSH take money Just take my salary in May - July', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(636, '25', 'Fixed bowl, sink, and shower in parc royale, Including cleaning the unit', 'bank', 5000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(637, '28', 'General repair of door in 3108', 'bank', 2500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(638, '35', 'Printing documents, contracts and notarization fee', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(639, '24', '1110 Dues 1 of 4 payment', 'bank', 9943.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(640, '24', '1110 Dues 2 of 4 payment', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(641, '24', '1110 Dues 3 of 4 payment', 'bank', 13150.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(642, '24', '1110 of Dues 4 of 4 payment', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(643, '26', 'Dues for 32DE from August 2021 - February 2022', 'bank', 40000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(644, '25', 'Full dues until 2022 1409', 'bank', 35989.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(645, '25', 'payment for 1409', 'bank', 9013.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(646, '25', 'Shower. bidet, faucet changing in 1409', 'bank', 5500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(647, '25', 'Renovation of cr leaking', 'bank', 8500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(648, '25', 'Meralco payment  1409', 'bank', 8756.48, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(649, '25', 'Bedsheets', 'bank', 999.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(650, '25', 'Cleaning 1409', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(651, '24', 'Cleaning 1110', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(652, '28', '3108B dues', 'bank', 12000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(653, '26', 'Millenia 32DE', 'bank', 20000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(654, '35', 'gave money to jay', 'bank', 29000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(655, '35', 'Transport fee for august to september', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(656, '28', 'August', 'bank', 25000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(657, '28', 'September', 'bank', 25000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(658, '28', 'October', 'bank', 25000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(659, '24', 'Parc Royale payment dues', 'bank', 10000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(660, '35', 'Rita Electric Bills', 'bank', 2000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(661, '28', 'Meliber Villareal 3108 Bills', 'bank', 11800.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(662, '35', 'Jay Payment', 'bank', 38000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(663, '26', 'Millenia 32DE Payment', 'bank', 7221.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(664, '34', 'Jose take 500 for cleaning', 'bank', 500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(665, '34', '3 people helped to carry things and cleaning', 'bank', 3500.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(666, '23', 'locksmith for the door problem in 905', 'bank', 1000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07'),
(667, '24', 'payment for dues 1110', 'bank', 15000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'revenue', '', '2022-11-06 15:14:07'),
(668, '24', 'client paid 1110 for november', 'bank', 15000.00, '2022-11-06 15:14:07', '2022-11-06 15:14:07', 'expenses', '', '2022-11-06 15:14:07');





INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_13_155647_create_financial_table', 1),
(6, '2022_07_13_160345_create_financial_item', 1),
(7, '2022_07_18_154143_create_media_table', 1),
(8, '2022_07_22_145921_create_condos_table', 1),
(9, '2022_07_22_150958_create_amenities_table', 1),
(10, '2022_07_22_151941_create_building_contacts_table', 1),
(11, '2022_07_23_040852_add_payment_type_in_financials', 1),
(12, '2022_07_23_091025_add_body_in_financials', 1),
(13, '2022_08_22_163107_create_owners', 1),
(14, '2022_08_26_175130_add_type_in_user', 1),
(15, '2022_08_26_180411_create_filament_users_table', 1),
(16, '2022_08_26_180412_create_filament_password_resets_table', 1),
(17, '2022_08_26_180807_create_permission_tables', 1),
(18, '2022_08_26_194656_create_building_filament_user', 1),
(19, '2022_08_27_153811_create_signatories', 1),
(20, '2022_08_28_125804_add_date_in_financials', 1),
(21, '2022_08_28_152606_create_lease_contracts', 1),
(22, '2022_09_07_173953_add_body_in_lease_contracts', 1);



INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Chiiya\\FilamentAccessControl\\Models\\FilamentUser', 1);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'Chiiya\\FilamentAccessControl\\Models\\FilamentUser', 2);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'Chiiya\\FilamentAccessControl\\Models\\FilamentUser', 3);

INSERT INTO `owners` (`id`, `name`, `address`, `nationality`, `created_at`, `updated_at`) VALUES
(1, 'Xing Zhan', 'China', 'Chinese', '2022-11-06 15:06:17', '2022-11-06 15:06:17');




INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin-users.update', 'filament', '2022-10-26 03:11:49', '2022-10-26 03:11:49');
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'permissions.update', 'filament', '2022-10-26 03:11:49', '2022-10-26 03:11:49');




INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 1);


INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'filament', '2022-10-26 03:11:49', '2022-10-26 03:11:49');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'filament', '2022-10-26 03:18:04', '2022-10-26 03:18:04');







/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;