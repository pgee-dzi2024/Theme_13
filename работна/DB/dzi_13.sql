-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране:  1 апр 2024 в 20:00
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
-- База данни: `dzi_13`
--

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
  `id` bigint(20) NOT NULL,
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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Действие', 7, 'add_log'),
(26, 'Can change Действие', 7, 'change_log'),
(27, 'Can delete Действие', 7, 'delete_log'),
(28, 'Can view Действие', 7, 'view_log'),
(29, 'Can add Действие', 8, 'add_request'),
(30, 'Can change Действие', 8, 'change_request'),
(31, 'Can delete Действие', 8, 'delete_request'),
(32, 'Can view Действие', 8, 'view_request'),
(33, 'Can add Клиент', 9, 'add_clients'),
(34, 'Can change Клиент', 9, 'change_clients'),
(35, 'Can delete Клиент', 9, 'delete_clients'),
(36, 'Can view Клиент', 9, 'view_clients');

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
(1, 'pbkdf2_sha256$260000$4gkqF7u8MsAQrRqpUEfmDe$8w04SG/k1EWdt6txfHpA3rchCpdDAQZyUGhwbgyFGGk=', '2024-03-31 10:47:35.124959', 1, 'admin', '', '', '', 1, 1, '2024-03-05 22:08:48.297732'),
(2, 'pbkdf2_sha256$260000$UpLNSnzDgbtCho8yG1W2dd$IM/Us6uknTpn4DQVX/N6IJihR0M1xsrQHS05d23MR/E=', '2024-04-01 12:08:14.854694', 0, 'staff', 'Иван', 'Петров', '', 1, 1, '2024-03-30 01:14:34.000000'),
(3, 'pbkdf2_sha256$260000$WjWfUOLkE2Jp37LDV2N4Zq$Xv51Xh6DBaC9ZlehJRqJ4xBysR6ST6byY8Epkvx9W+Y=', '2024-04-01 12:07:40.405314', 0, 'client', 'Петър', 'Иванов', '', 0, 1, '2024-03-30 01:15:48.000000'),
(4, 'pbkdf2_sha256$260000$QJ4QYOKmbMz25KxkjOlVmm$ai1s2qeVHRrKTSyNQ3BUEUC/fON8JDXc80WxykzTkNM=', NULL, 0, 'dzi13', 'хотел \"СУПЕР ХОТЕЛ\"', 'Фирма 2 ЕООД Банско', '', 0, 1, '2024-03-31 10:48:37.000000');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, '2024-03-30 01:14:34.801245', '2', 'staff', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-03-30 01:15:08.902307', '2', 'staff', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\"]}}]', 4, 1),
(3, '2024-03-30 01:15:48.326686', '3', 'client', 1, '[{\"added\": {}}]', 4, 1),
(4, '2024-03-30 01:16:10.711716', '3', 'client', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(5, '2024-03-30 19:20:35.616430', '1', 'Еделвайс', 1, '[{\"added\": {}}]', 9, 1),
(6, '2024-03-30 19:21:31.992273', '1', 'Еделвайс', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u044a\\u043b\\u043d\\u043e \\u0438\\u043c\\u0435\"]}}]', 9, 1),
(7, '2024-03-31 10:48:37.725228', '4', 'dzi13', 1, '[{\"added\": {}}]', 4, 1),
(8, '2024-03-31 10:49:51.573522', '4', 'dzi13', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1);

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'main', 'clients'),
(7, 'main', 'log'),
(8, 'main', 'request'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-05 22:06:52.977203'),
(2, 'auth', '0001_initial', '2024-03-05 22:06:53.576322'),
(3, 'admin', '0001_initial', '2024-03-05 22:06:53.735382'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-05 22:06:53.748021'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-05 22:06:53.759050'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-05 22:06:53.823258'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-05 22:06:53.892471'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-05 22:06:53.911638'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-05 22:06:53.923572'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-05 22:06:54.050738'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-05 22:06:54.056233'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-05 22:06:54.068703'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-05 22:06:54.086858'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-05 22:06:54.105220'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-05 22:06:54.128283'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-05 22:06:54.144286'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-05 22:06:54.163786'),
(18, 'sessions', '0001_initial', '2024-03-05 22:06:54.214331'),
(19, 'main', '0001_initial', '2024-03-30 13:41:40.270587'),
(20, 'main', '0002_auto_20240330_1611', '2024-03-30 14:11:06.635974'),
(21, 'main', '0003_auto_20240330_2118', '2024-03-30 19:18:51.524751'),
(22, 'main', '0004_alter_clients_name_full', '2024-03-30 19:21:01.679305'),
(23, 'main', '0005_auto_20240330_2125', '2024-03-30 19:25:28.382016'),
(24, 'main', '0006_auto_20240331_0025', '2024-03-30 22:25:11.727426');

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
('1rdbyv1oew87kqt8wtv72gf75876chdo', '.eJxVjEEOwiAQRe_C2hBoysC4dO8ZCAwzUjU0Ke3KeHdt0oVu_3vvv1RM21rj1nmJU1FnZdXpd8uJHtx2UO6p3WZNc1uXKetd0Qft-joXfl4O9--gpl6_NQqGUdgHi9lkZFeCJec9BsnkKSRrYZRSEggC0UDA4NDLwNY4MKLeH_CkODQ:1rmJAC:ykmroS8pd7LahuBW5_0NiNAABhmzhTUrG1xOiFjt0Fk', '2024-04-01 20:00:52.300082'),
('4k07gq43ovdh59dyovc204ab8ynwbkop', 'e30:1rqMyF:dvGGI4jKyYOzMOo1XQ0K0-xgsDbQl-Ttuvl69xcBEIg', '2024-04-13 00:53:19.434310'),
('cx7uyffm02d7zfznf3ilwmgid22ijgzp', 'e30:1rqN2Q:rSV9nmoHAiNHtjnN7guP30cfUmtJqtdH9yx8MxSzD1E', '2024-04-13 00:57:38.697163'),
('ei3tbl6xt0slwub56snhqbm64o8o9fhz', 'e30:1rqN19:-r9ELOtCAGHWROnjAI8GMUB9DVcQsd2aNkdvlkMMnKc', '2024-04-13 00:56:19.366970'),
('je9uo5oi5pw07qdwwkrlvm1giacc3jim', '.eJxVjEEOwiAQRe_C2hBoysC4dO8ZCAwzUjU0Ke3KeHdt0oVu_3vvv1RM21rj1nmJU1FnZdXpd8uJHtx2UO6p3WZNc1uXKetd0Qft-joXfl4O9--gpl6_NQqGUdgHi9lkZFeCJec9BsnkKSRrYZRSEggC0UDA4NDLwNY4MKLeH_CkODQ:1rhq5R:W1-4z1EGgi87y27FDjXFvjbcwjhtcktWSGdj57fbUN0', '2024-03-20 12:09:29.440520'),
('o0toxeiw6693259k97wr0flwjuvvtc4u', '.eJxVjEEOwiAQRe_C2hAYYWpduvcMZBgGqRpISrsy3l2bdKHb_977LxVoXUpYu8xhSuqsQB1-t0j8kLqBdKd6a5pbXeYp6k3RO-362pI8L7v7d1Col2-dUcR4GRxkx-LYZjTCSBHEO2PEINhxOPpkx8RiLWACoRzRoHV4AvX-APJ4N8E:1rrGSU:av9lyBa3XN6fiqeD3HMwBDHoU7g5EdVa0f8xMGUIYt0', '2024-04-15 12:08:14.860697'),
('qwya5oloz7sitdie7z0ftd0c2iokl0rw', 'e30:1rqN1j:QH-J6WKZa6QKauHt0v3e6Zl3eH2a_XWEIOf3FKFk2L8', '2024-04-13 00:56:55.338692'),
('r5j69efskokaxbzrf1kzwk2cvefox64x', 'e30:1rqMyw:zov9tacv1bzrvrt7SGhK7avYKkBnvAjWnXVA5F8QiAY', '2024-04-13 00:54:02.376211'),
('zc8uj0pskumthrw5mw1x5d7u159ur0v9', '.eJxVjEEOwiAQRe_C2hBoysC4dO8ZCAwzUjU0Ke3KeHdt0oVu_3vvv1RM21rj1nmJU1FnZdXpd8uJHtx2UO6p3WZNc1uXKetd0Qft-joXfl4O9--gpl6_NQqGUdgHi9lkZFeCJec9BsnkKSRrYZRSEggC0UDA4NDLwNY4MKLeH_CkODQ:1rhcyM:D71wruqpGMtMCUibQ-UflQwoT3vxY5TOABxZl3qmwjg', '2024-03-19 22:09:18.750586');

-- --------------------------------------------------------

--
-- Структура на таблица `main_log`
--

DROP TABLE IF EXISTS `main_log`;
CREATE TABLE `main_log` (
  `id` bigint(20) NOT NULL,
  `action` varchar(10) NOT NULL,
  `message` longtext NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `request_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_log`
--

INSERT INTO `main_log` (`id`, `action`, `message`, `date`, `request_id`, `client_id`) VALUES
(1, 'Подадена', '', '2024-03-31 23:44:15.179578', 15, 15),
(2, 'Подадена', '', '2024-03-31 23:45:44.123533', 16, 3),
(3, 'Приета', 'test', '2024-04-01 13:00:24.855441', 16, 3);

-- --------------------------------------------------------

--
-- Структура на таблица `main_request`
--

DROP TABLE IF EXISTS `main_request`;
CREATE TABLE `main_request` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_request`
--

INSERT INTO `main_request` (`id`, `message`, `date`, `user_id`, `status`, `title`, `user_name`) VALUES
(1, '1231231231', '2024-03-31 01:48:51.281548', 3, 'Затворена', '123', 'client'),
(2, '11111', '2024-03-31 00:12:06.484692', 3, 'Затворена', '11111', 'client'),
(3, '333333', '2024-03-31 00:19:46.391467', 3, 'Приета', '3333', 'client'),
(4, '55555555555555555', '2024-03-31 00:25:46.666118', 3, 'Работи се', '5555', 'client'),
(5, '666666666666', '2024-03-31 04:28:14.969771', 4, 'Подадена', '666', 'client'),
(6, '9876543', '2024-03-31 00:32:48.784668', 4, 'Подадена', '123456', 'client'),
(7, 'xxxxxxxxxxxxxxx', '2024-03-31 00:35:56.850991', 3, 'Подадена', 'xxxxxxxxxxxxxxx', 'client'),
(8, 'ccccccccccccccc', '2024-03-31 00:40:46.434639', 3, 'Подадена', 'ccccccccccccccc', 'client'),
(9, 'Получаваме оплаквания от много клиенти, че нямат интернет. Клиентите са от всички корпуси на комплекса.', '2024-03-31 23:31:00.679230', 3, 'Подадена', 'Няма интернет', 'client'),
(10, 'log log log', '2024-03-31 23:33:17.837001', 3, 'Подадена', 'test log', 'client'),
(11, 'test log 2 detals', '2024-03-31 23:38:09.722036', 3, 'Подадена', 'test log 2', 'client'),
(12, 'nmbnb,nb,n ,mn,n,mnm,nm', '2024-03-31 23:39:30.104995', 3, 'Подадена', 'jkjkljlkjlkjl', 'client'),
(13, 'mb,nmbnbmnbm,nbm,n', '2024-03-31 23:40:21.780069', 3, 'Подадена', 'klm;lk;k;lk', 'client'),
(14, ',mnmnm,m,', '2024-03-31 23:42:42.744900', 3, 'Подадена', 'ljkjlkjlkjlk', 'client'),
(15, 'sdasda ASDa ASD fklgdlfkg', '2024-03-31 23:44:15.137448', 3, 'Подадена', 'test log 2222', 'client'),
(16, '3333 3333 33333 3333 333 3333', '2024-03-31 23:45:44.095237', 3, 'Приета', 'test log 33333', 'client');

--
-- Indexes for dumped tables
--

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
-- Индекси за таблица `main_log`
--
ALTER TABLE `main_log`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_request`
--
ALTER TABLE `main_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `main_log`
--
ALTER TABLE `main_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `main_request`
--
ALTER TABLE `main_request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения за дъмпнати таблици
--

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
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
