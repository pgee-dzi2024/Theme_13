-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране:  1 апр 2024 в 20:01
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_13_s`
--

-- --------------------------------------------------------

--
-- Структура на таблица `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add profile', 1, 'add_profile'),
(2, 'Can change profile', 1, 'change_profile'),
(3, 'Can delete profile', 1, 'delete_profile'),
(4, 'Can view profile', 1, 'view_profile'),
(5, 'Can add grievance', 2, 'add_grievance'),
(6, 'Can change grievance', 2, 'change_grievance'),
(7, 'Can delete grievance', 2, 'delete_grievance'),
(8, 'Can view grievance', 2, 'view_grievance'),
(9, 'Can add complaint', 3, 'add_complaint'),
(10, 'Can change complaint', 3, 'change_complaint'),
(11, 'Can delete complaint', 3, 'delete_complaint'),
(12, 'Can view complaint', 3, 'view_complaint'),
(13, 'Can add log entry', 4, 'add_logentry'),
(14, 'Can change log entry', 4, 'change_logentry'),
(15, 'Can delete log entry', 4, 'delete_logentry'),
(16, 'Can view log entry', 4, 'view_logentry'),
(17, 'Can add permission', 5, 'add_permission'),
(18, 'Can change permission', 5, 'change_permission'),
(19, 'Can delete permission', 5, 'delete_permission'),
(20, 'Can view permission', 5, 'view_permission'),
(21, 'Can add group', 6, 'add_group'),
(22, 'Can change group', 6, 'change_group'),
(23, 'Can delete group', 6, 'delete_group'),
(24, 'Can view group', 6, 'view_group'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add content type', 8, 'add_contenttype'),
(30, 'Can change content type', 8, 'change_contenttype'),
(31, 'Can delete content type', 8, 'delete_contenttype'),
(32, 'Can view content type', 8, 'view_contenttype'),
(33, 'Can add session', 9, 'add_session'),
(34, 'Can change session', 9, 'change_session'),
(35, 'Can delete session', 9, 'delete_session'),
(36, 'Can view session', 9, 'view_session'),
(37, 'Can add site', 10, 'add_site'),
(38, 'Can change site', 10, 'change_site'),
(39, 'Can delete site', 10, 'delete_site'),
(40, 'Can view site', 10, 'view_site'),
(41, 'Can add email address', 11, 'add_emailaddress'),
(42, 'Can change email address', 11, 'change_emailaddress'),
(43, 'Can delete email address', 11, 'delete_emailaddress'),
(44, 'Can view email address', 11, 'view_emailaddress'),
(45, 'Can add email confirmation', 12, 'add_emailconfirmation'),
(46, 'Can change email confirmation', 12, 'change_emailconfirmation'),
(47, 'Can delete email confirmation', 12, 'delete_emailconfirmation'),
(48, 'Can view email confirmation', 12, 'view_emailconfirmation'),
(49, 'Can add social account', 13, 'add_socialaccount'),
(50, 'Can change social account', 13, 'change_socialaccount'),
(51, 'Can delete social account', 13, 'delete_socialaccount'),
(52, 'Can view social account', 13, 'view_socialaccount'),
(53, 'Can add social application', 14, 'add_socialapp'),
(54, 'Can change social application', 14, 'change_socialapp'),
(55, 'Can delete social application', 14, 'delete_socialapp'),
(56, 'Can view social application', 14, 'view_socialapp'),
(57, 'Can add social application token', 15, 'add_socialtoken'),
(58, 'Can change social application token', 15, 'change_socialtoken'),
(59, 'Can delete social application token', 15, 'delete_socialtoken'),
(60, 'Can view social application token', 15, 'view_socialtoken');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$nVdt1sDNCg5vXFKhM18evH$wAk+bfgfxjA2aTSkZHSICh2UgzQU8aGhyedEy6/duFc=', '2024-03-12 22:02:36.760063', 0, 'user1', 'UserFirstName', 'UserLastName', 'user@mysite.com', 0, 1, '2024-03-05 22:27:41.641847'),
(2, 'pbkdf2_sha256$260000$m98LO1SotsGJL8ORjp7ob3$D3Iedn31zwNeT9uNYrxo66QTKRxj2tvq8zXPAYXDaws=', '2024-03-29 11:40:20.305260', 1, 'admin', '', '', '', 1, 1, '2024-03-05 22:42:27.030478'),
(3, 'pbkdf2_sha256$260000$IhyRCQjk4RgTspA7QRSpM5$+BgD0kRJudouYuUA2VF18TzjRjK/Fx+gUy2hpC+ifsY=', '2024-03-27 22:12:34.183595', 0, 'u1', 'U', 'U', 'abc@abv.com', 0, 1, '2024-03-18 20:14:17.531550');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `complaintms_complaint`
--

DROP TABLE IF EXISTS `complaintms_complaint`;
CREATE TABLE `complaintms_complaint` (
  `id` bigint(20) NOT NULL,
  `Subject` varchar(200) DEFAULT NULL,
  `Type_of_complaint` varchar(200) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Time` date NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `complaintms_complaint`
--

INSERT INTO `complaintms_complaint` (`id`, `Subject`, `Type_of_complaint`, `Description`, `Time`, `status`, `user_id`) VALUES
(1, 'Оплакване 1', 'ClassRoom', 'адсдас СДа А\r\nс аСДА\r\nасдАСДА', '2024-03-13', 3, 1),
(2, 'test 1', 'ClassRoom', 'tttt tttt 1111', '2024-03-28', 1, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `complaintms_grievance`
--

DROP TABLE IF EXISTS `complaintms_grievance`;
CREATE TABLE `complaintms_grievance` (
  `id` bigint(20) NOT NULL,
  `guser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `complaintms_profile`
--

DROP TABLE IF EXISTS `complaintms_profile`;
CREATE TABLE `complaintms_profile` (
  `user_id` int(11) NOT NULL,
  `collegename` varchar(29) NOT NULL,
  `contactnumber` varchar(10) NOT NULL,
  `type_user` varchar(20) NOT NULL,
  `Branch` varchar(29) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `complaintms_profile`
--

INSERT INTO `complaintms_profile` (`user_id`, `collegename`, `contactnumber`, `type_user`, `Branch`) VALUES
(1, 'College1', '0812345678', 'student', 'ComputerScience'),
(2, '', '', 'student', 'InformationTechnology'),
(3, 'College1', '', 'student', 'InformationTechnology');

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-03-28 17:20:33.901817', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 3, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(11, 'account', 'emailaddress'),
(12, 'account', 'emailconfirmation'),
(4, 'admin', 'logentry'),
(6, 'auth', 'group'),
(5, 'auth', 'permission'),
(7, 'auth', 'user'),
(3, 'ComplaintMS', 'complaint'),
(2, 'ComplaintMS', 'grievance'),
(1, 'ComplaintMS', 'profile'),
(8, 'contenttypes', 'contenttype'),
(9, 'sessions', 'session'),
(10, 'sites', 'site'),
(13, 'socialaccount', 'socialaccount'),
(14, 'socialaccount', 'socialapp'),
(15, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-05 22:20:24.246270'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-03-05 22:20:24.328524'),
(3, 'auth', '0001_initial', '2024-03-05 22:20:25.159539'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-03-05 22:20:25.225540'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-03-05 22:20:25.246539'),
(6, 'auth', '0004_alter_user_username_opts', '2024-03-05 22:20:25.259540'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-03-05 22:20:25.326613'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-03-05 22:20:25.336611'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-03-05 22:20:25.350596'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-03-05 22:20:25.374617'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-03-05 22:20:25.396594'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-03-05 22:20:25.419595'),
(13, 'auth', '0011_update_proxy_permissions', '2024-03-05 22:20:25.437596'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-03-05 22:20:25.460595'),
(15, 'ComplaintMS', '0001_initial', '2024-03-05 22:20:25.785613'),
(16, 'ComplaintMS', '0002_alter_profile_branch', '2024-03-05 22:20:25.799594'),
(17, 'account', '0001_initial', '2024-03-05 22:20:26.044006'),
(18, 'account', '0002_email_max_length', '2024-03-05 22:20:26.072986'),
(19, 'admin', '0001_initial', '2024-03-05 22:20:26.255005'),
(20, 'admin', '0002_logentry_remove_auto_add', '2024-03-05 22:20:26.273985'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-05 22:20:26.290366'),
(22, 'sessions', '0001_initial', '2024-03-05 22:20:26.351386'),
(23, 'sites', '0001_initial', '2024-03-05 22:20:26.381394'),
(24, 'sites', '0002_alter_domain_unique', '2024-03-05 22:20:26.433365'),
(25, 'socialaccount', '0001_initial', '2024-03-05 22:20:27.006542'),
(26, 'socialaccount', '0002_token_max_lengths', '2024-03-05 22:20:27.052534'),
(27, 'socialaccount', '0003_extra_data_default_dict', '2024-03-05 22:20:27.069514'),
(28, 'ComplaintMS', '0002_auto_20240320_0123', '2024-03-19 23:24:01.242062');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8wa67qt2aisdpohqul7t2f4hpgx4b51z', '.eJxVjMsOwiAQAP-FsyHLoxI8evcbyMLuStXQpLQn478bkh70OjOZt0q4bzXtndc0k7ooq06_LGN5chuCHtjuiy5L29Y565How3Z9W4hf16P9G1TsdWyNgBihaIJHLEDOoHiK7JywlwyTxIkEMrvg85kIHAIGwmLZWF_U5wsHXTkB:1rmJOQ:rvtKtjCQNjlzMThb76Hppj6hbV3o7xuCfUI-ZRiDH3o', '2024-04-01 20:15:34.706703'),
('buk03h8sm3mexfqb11a0ikgrg84knriw', '.eJxVjMsOwiAQAP-FsyHLoxI8evcbyMLuStXQpLQn478bkh70OjOZt0q4bzXtndc0k7ooq06_LGN5chuCHtjuiy5L29Y565How3Z9W4hf16P9G1TsdWyNgBihaIJHLEDOoHiK7JywlwyTxIkEMrvg85kIHAIGwmLZWF_U5wsHXTkB:1rkAEB:KTg83YMx6qsrzWV8Y7MZpCUXgYOaa42TwKPBZSCkW-c', '2024-03-26 22:04:07.748434'),
('evumoj9lhef8hukux4plutozfjajsxua', '.eJxVjEEOwiAQRe_C2hDqwAAu3fcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIiQJx-txTpwXUH-R7rrUlqdV3mJHdFHrTLsWV-Xg_376DEXr41ZgUGPVtHZBVnrzKwI6U5Akx68DqZiQmYz9FajU4lREw0EBsyyOL9AeleOEE:1rpbVa:phcP2Dh7oLLQ-Fxvz8pk2-a1pvAZiGtfPGhxbkuMhRY', '2024-04-10 22:12:34.191022'),
('h2434cahazgbx8jw36hg8zqxguct1hco', '.eJxVjMsOwiAQAP-FsyHLoxI8evcbyMLuStXQpLQn478bkh70OjOZt0q4bzXtndc0k7ooq06_LGN5chuCHtjuiy5L29Y565How3Z9W4hf16P9G1TsdWyNgBihaIJHLEDOoHiK7JywlwyTxIkEMrvg85kIHAIGwmLZWF_U5wsHXTkB:1rhq3M:iTzrmCYP-5L90juI4fVaVEBtdlfoHHjyKk-o20eQZTg', '2024-03-20 12:07:20.941441'),
('jw2dy5cql76henevsgi5z5ak5jmwf18l', '.eJxVjEEOwiAQRe_C2hDqwAAu3fcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIiQJx-txTpwXUH-R7rrUlqdV3mJHdFHrTLsWV-Xg_376DEXr41ZgUGPVtHZBVnrzKwI6U5Akx68DqZiQmYz9FajU4lREw0EBsyyOL9AeleOEE:1rmipJ:CzdXRnxpxxq6KcFLV9aBuYyM5tzFJyz0LkwqSt6SyVQ', '2024-04-02 23:25:01.965788'),
('l7efmq7n14sh20o6zhqik7scybrwfdiv', '.eJxVjEEOwiAQRe_C2hDqwAAu3fcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIiQJx-txTpwXUH-R7rrUlqdV3mJHdFHrTLsWV-Xg_376DEXr41ZgUGPVtHZBVnrzKwI6U5Akx68DqZiQmYz9FajU4lREw0EBsyyOL9AeleOEE:1rpFHC:8wqaERKWbEQpZEEBKanTjIOpmUZhInfnSa8GOSZRrUo', '2024-04-09 22:28:14.484069'),
('pqg6k8jzip7q5z0md1eprneytpk6m76h', '.eJxVjEEOwiAQRe_C2hDqwAAu3fcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIiQJx-txTpwXUH-R7rrUlqdV3mJHdFHrTLsWV-Xg_376DEXr41ZgUGPVtHZBVnrzKwI6U5Akx68DqZiQmYz9FajU4lREw0EBsyyOL9AeleOEE:1rpDPC:YN_xpwavgpACGj6tJrmw_pyCaXHXx-R3UQ9CSkAQw8k', '2024-04-09 20:28:22.594888'),
('xnheya3h8dvazfmy6l2lqaddx7h1egmh', '.eJxVjMsOwiAQAP-FsyHLoxI8evcbyMLuStXQpLQn478bkh70OjOZt0q4bzXtndc0k7ooq06_LGN5chuCHtjuiy5L29Y565How3Z9W4hf16P9G1TsdWyNgBihaIJHLEDOoHiK7JywlwyTxIkEMrvg85kIHAIGwmLZWF_U5wsHXTkB:1rqAaq:lf9uewfewuG0xWifPG_-Ak14vXKHSuZuH5t3u9oZYmQ', '2024-04-12 11:40:20.312187');

-- --------------------------------------------------------

--
-- Структура на таблица `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(3, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Структура на таблица `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `complaintms_complaint`
--
ALTER TABLE `complaintms_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ComplaintMS_complaint_user_id_5f64c674_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `complaintms_grievance`
--
ALTER TABLE `complaintms_grievance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guser_id` (`guser_id`);

--
-- Индекси за таблица `complaintms_profile`
--
ALTER TABLE `complaintms_profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Индекси за таблица `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Индекси за таблица `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaintms_complaint`
--
ALTER TABLE `complaintms_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaintms_grievance`
--
ALTER TABLE `complaintms_grievance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `complaintms_complaint`
--
ALTER TABLE `complaintms_complaint`
  ADD CONSTRAINT `ComplaintMS_complaint_user_id_5f64c674_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `complaintms_grievance`
--
ALTER TABLE `complaintms_grievance`
  ADD CONSTRAINT `ComplaintMS_grievance_guser_id_ea676cdf_fk_auth_user_id` FOREIGN KEY (`guser_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `complaintms_profile`
--
ALTER TABLE `complaintms_profile`
  ADD CONSTRAINT `ComplaintMS_profile_user_id_3d340a1f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Ограничения за таблица `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
