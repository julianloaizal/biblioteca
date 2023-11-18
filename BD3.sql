-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para biblioteca
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `biblioteca`;

-- Volcando estructura para tabla biblioteca.autores
CREATE TABLE IF NOT EXISTS `autores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.autores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` (`id`, `codigo`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, '9788497883207', 'Toni Granollers i Saltiveri', '2023-10-02 16:51:16', '2023-10-02 16:51:16'),
	(2, '9788497883207', 'Jesús Lorés Vidal', '2023-10-02 16:51:50', '2023-10-02 16:51:50'),
	(3, '9788497883207', 'José Juan Cañas Delgado', '2023-10-02 16:52:17', '2023-10-02 16:52:17'),
	(5, '25454585', 'PEPITO PEREZ', '2023-10-04 02:45:51', '2023-10-04 02:45:51');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.autores_libros
CREATE TABLE IF NOT EXISTS `autores_libros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autor_id` bigint(20) unsigned NOT NULL,
  `libro_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autores_libros_autor_id_foreign` (`autor_id`),
  KEY `autores_libros_libro_id_foreign` (`libro_id`),
  CONSTRAINT `autores_libros_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `autores_libros_libro_id_foreign` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.autores_libros: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `autores_libros` DISABLE KEYS */;
INSERT INTO `autores_libros` (`id`, `autor_id`, `libro_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2023-10-02 14:47:18', '2023-10-02 14:47:19'),
	(2, 2, 1, '2023-10-02 14:47:48', '2023-10-02 14:47:48'),
	(3, 3, 1, '2023-10-02 14:48:13', '2023-10-02 14:48:14');
/*!40000 ALTER TABLE `autores_libros` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.ejemplares
CREATE TABLE IF NOT EXISTS `ejemplares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localizacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libros_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ejemplares_libros` (`libros_id`),
  CONSTRAINT `fk_ejemplares_libros` FOREIGN KEY (`libros_id`) REFERENCES `libros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.ejemplares: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ejemplares` DISABLE KEYS */;
INSERT INTO `ejemplares` (`id`, `codigo`, `localizacion`, `libros_id`, `created_at`, `updated_at`) VALUES
	(1, '9788497883207', 'Ingenieria', NULL, '2023-10-02 16:54:01', '2023-10-02 16:54:01');
/*!40000 ALTER TABLE `ejemplares` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ISBN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editorial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paginas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.libros: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` (`id`, `codigo`, `titulo`, `ISBN`, `editorial`, `paginas`, `created_at`, `updated_at`) VALUES
	(1, '9788497883207', 'Diseño de sistemas interactivos centrados en el usuario', '8497883209', 'Editorial FactorSim', 280, '2023-10-02 16:49:58', '2023-10-02 16:49:58');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.migrations: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_10_02_162413_create_autores_table', 1),
	(6, '2023_10_02_162429_create_libros_table', 1),
	(7, '2023_10_02_162439_create_autores_libros_table', 1),
	(8, '2023_10_02_162448_create_ejemplares_table', 1),
	(9, '2023_10_02_162456_create_usuarios_table', 1),
	(10, '2023_10_02_162503_create_prestamos_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
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

-- Volcando datos para la tabla biblioteca.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.prestamos
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ejemplar_id` bigint(20) unsigned NOT NULL,
  `usuario_id` bigint(20) unsigned NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prestamos_ejemplar_id_foreign` (`ejemplar_id`),
  KEY `prestamoss_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `prestamos_ejemplar_id_foreign` FOREIGN KEY (`ejemplar_id`) REFERENCES `ejemplares` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prestamos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.prestamos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` (`id`, `ejemplar_id`, `usuario_id`, `fecha_devolucion`, `fecha_prestamo`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2023-10-20', '2023-10-02', '2023-10-02 11:57:55', '2023-10-02 11:57:56');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'julian', 'prueba@prueba.com', NULL, '$2y$10$AbQ5lZTBVhEwrXpo1If.mOAC7byWFYGIGYGYwcXEBZPaId01xmKhK', NULL, '2023-10-02 16:34:48', '2023-10-02 16:34:48'),
	(2, 'prueba', 'prueba2@prueba.com', NULL, '$2y$10$xFO7qc2EHAM9lnEcLRHAY.jCU0343pQ60fUYp5FlFlmx1aSexfOKO', NULL, '2023-10-04 02:43:34', '2023-10-04 02:43:34'),
	(3, 'prueba', 'prueba1@prueba.com', NULL, '$2y$10$1AmXLGLkppiWgbH/4n77iuW2YT6cqhyGMeV5J6UGC.KPMbiCKttcm', NULL, '2023-10-08 13:26:55', '2023-10-08 13:26:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla biblioteca.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla biblioteca.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `codigo`, `nombre`, `telefono`, `direccion`, `created_at`, `updated_at`) VALUES
	(1, '70458963', 'Pepito Perez', '3002356789', 'Carre 12 # 27-04', '2023-10-02 16:54:57', '2023-10-02 16:54:57');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
