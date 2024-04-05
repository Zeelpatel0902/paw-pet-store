-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 10:56 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happypawpetstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment` int(11) NOT NULL,
  `appointment_time` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_status` int(11) NOT NULL,
  `c_id_id` int(11) NOT NULL,
  `doctor_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`) VALUES
(1, 'ranip'),
(2, 'new ranip');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add area', 1, 'add_area'),
(2, 'Can change area', 1, 'change_area'),
(3, 'Can delete area', 1, 'delete_area'),
(4, 'Can view area', 1, 'view_area'),
(5, 'Can add category', 2, 'add_category'),
(6, 'Can change category', 2, 'change_category'),
(7, 'Can delete category', 2, 'delete_category'),
(8, 'Can view category', 2, 'view_category'),
(9, 'Can add customer', 3, 'add_customer'),
(10, 'Can change customer', 3, 'change_customer'),
(11, 'Can delete customer', 3, 'delete_customer'),
(12, 'Can view customer', 3, 'view_customer'),
(13, 'Can add doctor', 4, 'add_doctor'),
(14, 'Can change doctor', 4, 'change_doctor'),
(15, 'Can delete doctor', 4, 'delete_doctor'),
(16, 'Can view doctor', 4, 'view_doctor'),
(17, 'Can add order', 5, 'add_order'),
(18, 'Can change order', 5, 'change_order'),
(19, 'Can delete order', 5, 'delete_order'),
(20, 'Can view order', 5, 'view_order'),
(21, 'Can add shelter_home', 6, 'add_shelter_home'),
(22, 'Can change shelter_home', 6, 'change_shelter_home'),
(23, 'Can delete shelter_home', 6, 'delete_shelter_home'),
(24, 'Can view shelter_home', 6, 'view_shelter_home'),
(25, 'Can add sub_category', 7, 'add_sub_category'),
(26, 'Can change sub_category', 7, 'change_sub_category'),
(27, 'Can delete sub_category', 7, 'delete_sub_category'),
(28, 'Can view sub_category', 7, 'view_sub_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add order_item', 9, 'add_order_item'),
(34, 'Can change order_item', 9, 'change_order_item'),
(35, 'Can delete order_item', 9, 'delete_order_item'),
(36, 'Can view order_item', 9, 'view_order_item'),
(37, 'Can add gallery', 10, 'add_gallery'),
(38, 'Can change gallery', 10, 'change_gallery'),
(39, 'Can delete gallery', 10, 'delete_gallery'),
(40, 'Can view gallery', 10, 'view_gallery'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback'),
(45, 'Can add cart', 12, 'add_cart'),
(46, 'Can change cart', 12, 'change_cart'),
(47, 'Can delete cart', 12, 'delete_cart'),
(48, 'Can view cart', 12, 'view_cart'),
(49, 'Can add appointment', 13, 'add_appointment'),
(50, 'Can change appointment', 13, 'change_appointment'),
(51, 'Can delete appointment', 13, 'delete_appointment'),
(52, 'Can view appointment', 13, 'view_appointment'),
(53, 'Can add log entry', 14, 'add_logentry'),
(54, 'Can change log entry', 14, 'change_logentry'),
(55, 'Can delete log entry', 14, 'delete_logentry'),
(56, 'Can view log entry', 14, 'view_logentry'),
(57, 'Can add permission', 15, 'add_permission'),
(58, 'Can change permission', 15, 'change_permission'),
(59, 'Can delete permission', 15, 'delete_permission'),
(60, 'Can view permission', 15, 'view_permission'),
(61, 'Can add group', 16, 'add_group'),
(62, 'Can change group', 16, 'change_group'),
(63, 'Can delete group', 16, 'delete_group'),
(64, 'Can view group', 16, 'view_group'),
(65, 'Can add user', 17, 'add_user'),
(66, 'Can change user', 17, 'change_user'),
(67, 'Can delete user', 17, 'delete_user'),
(68, 'Can view user', 17, 'view_user'),
(69, 'Can add content type', 18, 'add_contenttype'),
(70, 'Can change content type', 18, 'change_contenttype'),
(71, 'Can delete content type', 18, 'delete_contenttype'),
(72, 'Can view content type', 18, 'view_contenttype'),
(73, 'Can add session', 19, 'add_session'),
(74, 'Can change session', 19, 'change_session'),
(75, 'Can delete session', 19, 'delete_session'),
(76, 'Can view session', 19, 'view_session'),
(77, 'Can add wishlist', 20, 'add_wishlist'),
(78, 'Can change wishlist', 20, 'change_wishlist'),
(79, 'Can delete wishlist', 20, 'delete_wishlist'),
(80, 'Can view wishlist', 20, 'view_wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `c_date` date NOT NULL,
  `c_qty` int(11) NOT NULL,
  `total_amt` int(11) NOT NULL,
  `c_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `c_date`, `c_qty`, `total_amt`, `c_id_id`, `product_id_id`) VALUES
(21, '2022-04-05', 2, 90, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_descripation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_descripation`) VALUES
(1, 'Pets Food', 'dhchcncjncnanjcajlajljcaljcjlajcljaljaclcjal'),
(2, 'Pets Toys', 'cmsmcmcmcnlsnccncncnncncn');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_email` varchar(254) NOT NULL,
  `c_contact` varchar(20) NOT NULL,
  `c_address` varchar(200) NOT NULL,
  `c_password` varchar(20) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `c_otp` varchar(10) DEFAULT NULL,
  `c_otp_used` int(11) DEFAULT NULL,
  `area_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `c_email`, `c_contact`, `c_address`, `c_password`, `is_admin`, `c_otp`, `c_otp_used`, `area_id_id`) VALUES
(1, 'shreekar', 'shreekarpatel8055@gmail.com', '157854888', 'fhkhuuhuaijf', '456', 1, NULL, NULL, 1),
(2, 'aum', 'aummehta06@gmail.com', '515488488', 'indralok society, new ranip', '147', 0, NULL, NULL, 2),
(3, 'vandit', 'sd@gmail.com', '2235525', 'ssajs,ahihhahi', '147', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(14, 'admin', 'logentry'),
(16, 'auth', 'group'),
(15, 'auth', 'permission'),
(17, 'auth', 'user'),
(18, 'contenttypes', 'contenttype'),
(13, 'happypawpetstore_Admin', 'appointment'),
(1, 'happypawpetstore_Admin', 'area'),
(12, 'happypawpetstore_Admin', 'cart'),
(2, 'happypawpetstore_Admin', 'category'),
(3, 'happypawpetstore_Admin', 'customer'),
(4, 'happypawpetstore_Admin', 'doctor'),
(11, 'happypawpetstore_Admin', 'feedback'),
(10, 'happypawpetstore_Admin', 'gallery'),
(5, 'happypawpetstore_Admin', 'order'),
(9, 'happypawpetstore_Admin', 'order_item'),
(8, 'happypawpetstore_Admin', 'product'),
(6, 'happypawpetstore_Admin', 'shelter_home'),
(7, 'happypawpetstore_Admin', 'sub_category'),
(20, 'happypawpetstore_Admin', 'wishlist'),
(19, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-12 08:04:58.445220'),
(2, 'auth', '0001_initial', '2022-02-12 08:04:58.648296'),
(3, 'admin', '0001_initial', '2022-02-12 08:04:58.695160'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-12 08:04:58.695160'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-12 08:04:58.710783'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-12 08:04:58.726403'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-12 08:04:58.757645'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-02-12 08:04:58.757645'),
(9, 'auth', '0004_alter_user_username_opts', '2022-02-12 08:04:58.773267'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-02-12 08:04:58.788888'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-02-12 08:04:58.788888'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-12 08:04:58.804511'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-02-12 08:04:58.804511'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-12 08:04:58.820132'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-02-12 08:04:58.820132'),
(16, 'auth', '0011_update_proxy_permissions', '2022-02-12 08:04:58.835753'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-12 08:04:58.851374'),
(18, 'happypawpetstore_Admin', '0001_initial', '2022-02-12 08:04:59.163800'),
(19, 'sessions', '0001_initial', '2022-02-12 08:04:59.179421'),
(20, 'happypawpetstore_Admin', '0002_wishlist', '2022-02-12 08:09:43.709270'),
(21, 'happypawpetstore_Admin', '0003_feedback_rate', '2022-02-12 08:32:17.968538'),
(22, 'happypawpetstore_Admin', '0004_order_item_total_amount', '2022-03-05 10:33:33.692712'),
(23, 'happypawpetstore_Admin', '0005_shelter_home_shelter_location', '2022-03-05 14:57:34.716087'),
(24, 'happypawpetstore_Admin', '0006_doctor_doctor_image', '2022-03-06 09:39:42.062491');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9iuv7ubwlztzce6tc1qa8xzi6bk22jrb', '.eJyrVkrOyUzNK4lPzU3MzFGyUkoszc1NzShJNDBzSAcJ6SXn5yrpwFQVJBYXl-cXpQAVGpqYI8QzgSJGtQAoKBpy:1nLNrh:FVoQAcjGr-3XXXovEMmEjRryVfGg9DGuLopJsBXqZyo', '2022-03-05 11:25:25.773308'),
('d0z8jdr7q6kusqx0ymfv8ejv9bh79izo', '.eJyrVkrOyUzNK4lPzU3MzFGyUkoszc1NzShJNDBzSAcJ6SXn5yrpwFQVJBYXl-cXpQAVGpqYI8QzgSJGtQAoKBpy:1nLMgW:hchZ_0tyki91MFn86nhvk3OqIog5mNo80jrbBY16MHk', '2022-03-05 10:09:48.725584'),
('g0u53iklvvggialx44egalda317g4a0p', '.eJyrVkpOLCpRsqqu1VFKzslMzSuJT81NzMxRslIqTnFIBzH1kvNzleCyBYnFxeX5RSlABYYm5gjxTKCIcS0AShca3g:1nSwk2:Eu57Gy3RDaWmO2Hmu_vBdxHxngs2J0vlbcw7-iCCz9M', '2022-03-26 08:04:46.471306'),
('k4vzxe93turbq0gn7hpywna8i1khnpxc', '.eJyrVkrOyUzNK4lPzU3MzFGyUkoszc1NzShJNDBzSAcJ6SXn5yrpwFQVJBYXl-cXpQAVGpqYI8QzgSJGtQAoKBpy:1nN8DM:Q1kLaZV7MC29361nk2eARwvVCkRrrSnLmPx3Azr_9fw', '2022-03-10 07:07:00.691573'),
('kkmpvd80c7g4xvojd5rox6e584mnxt13', '.eJxVzNEKQDAUgOF3OdfSyJArb6ITJ5YdtE0u5N1NMtx-_f07tFrR5BpiVBoqwJWZBocir_uL4nZmiJ5qQWu32XQ-TLLideUljQA7VlNY2cEQjWgWdKRLIeXveLefYSbzwNcvOU6_KTU8:1nc5An:sK6Ayy5WRHeNqFa2NOeyJY112cWteUmjVw21JR7bh1w', '2022-04-20 12:54:09.269541'),
('lsqfmwfaarab2vi2ddyon42wvas7bikp', '.eJyrVkpOLCpRsqpWMgQRmSlKVoY6SoWliXklmSWVYE5BUWZyqpKVkqmegZKOUl5iLogTUJRanFyUWVCSmZ-n4JKZWgKUysxNTAfJGeplFaQr1dbWAgAv2hzy:1nLgRA:qqYHSGySUtwBNRJX_JZNKMOoGF02n1WoUxZ7DAI2Cso', '2022-03-06 07:15:16.318880'),
('owa6fwim3yp34dbpuytmau2e2jjrfxkc', '.eJyrVkpOLCpRsqqu1VFKzslMzSuJT81NzMxRslJKLM3NTc0oSTQwc0gHCekl5-cqwVUVJBYXl-cXpQAVGpqYI8QzgSJGtQA5dR2-:1nMWAC:TufGTRT869z6oAIrb367I8WlHNCGv05Rdzm0CELZeyw', '2022-03-08 14:29:12.964861'),
('unfjmvipb1kgug31q923u5qr4igp66tj', '.eJxVjMsKgCAQAP9lzxIZWdGpP4mllpJcCzU6RP9egfS4zgyzA_asbUuM2kANfnREE7oFA5kqVaoZbpN0M4OI7YLeb7PrrzxXxYP1BaSAzmiy4RniykxjwLT4nWL1Wcm8fPn9yo4Tr5E1PA:1nN7v9:09J0coEYwcH7seHnWV9TEDO-9Bb4m8qFSKR2ttYugy0', '2022-03-10 06:48:11.405403');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `doctor_name` varchar(20) NOT NULL,
  `doctor_email` varchar(254) NOT NULL,
  `doctor_password` varchar(20) NOT NULL,
  `doctor_contact` varchar(20) NOT NULL,
  `doctor_address` varchar(200) NOT NULL,
  `doctor_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `doctor_name`, `doctor_email`, `doctor_password`, `doctor_contact`, `doctor_address`, `doctor_image`) VALUES
(6, 'dr.aums', 'sjs@gmail.com', '147', '25888444', 'ncocnonc', 'team-1.jpg'),
(7, 'dr.vish', 'ss@gmail.com', '123', '14711', 'ohohoio', 'team-4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_message` varchar(100) NOT NULL,
  `feedback_date` date NOT NULL,
  `c_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_message`, `feedback_date`, `c_id_id`, `product_id_id`, `rate`) VALUES
(5, 'nice', '2022-04-05', 2, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `image_path`, `product_id_id`) VALUES
(2, 'pro_4.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` double NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `c_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_date`, `total_amount`, `order_status`, `payment_status`, `c_id_id`) VALUES
(31, '2022-04-06', 95, '1', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `qty_id` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `order_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `total_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `qty_id`, `product_price`, `order_id_id`, `product_id_id`, `total_amount`) VALUES
(27, '2', 45, 31, 6, 90);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` varchar(400) NOT NULL,
  `product_price` double NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(200) NOT NULL,
  `sub_category_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_quantity`, `product_image`, `sub_category_id_id`) VALUES
(5, 'Hill\'s Prescription Diet', 'The Hill\'s Prescription i/d Canine Digestive Care/Gi Restore dog food helps to settle your pet\'s.', 120, 25, 'pro_1.png', 1),
(6, 'Diet Dry Dog Food – Joint Care j/d', 'Improving your dog’s mobility is as easy as feeding the right nutrition. Being proactive about mobility issues early can avoid the need for more aggressive treatments. Hill’s™ Prescription Diet™ j/d™ helps your dog walk, run and jump more easily in just 21 days. Hill’s™ Prescription Diet™ j/d™ Canine is a complete and balanced food that provides all the nutrition with your dog needs.', 45, 25, 'pro_2.png', 1),
(7, 'Ball for Dogs, Bite Resistant Soft Rubber Bouncy', 'This zqasales Pet ball is the perfect interactive learning, feeding and playtime toy. So, if you are a proud pug, whippet, west highland white terrier, cocker spaniel, schnauzer or Yorkshire terrier owner, bring home this fun feeding toy. Your dog (under 30 lbs.) will need to discover how to roll the ball in order to get his snacks out and to hear the soft sound.', 10, 24, 'pro_3.png', 2),
(8, 'Petsport Giant Tuff Ball Squeak Dog Toy', 'Tuff Balls, the original tennis ball for dogs, now comes with a Squeaker! Tuff Balls have extra-thick natural rubber walls which give added durability and bounce. A great cure for boredom and aggressive chewers.', 15, 28, 'pro_4.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shelter_home`
--

CREATE TABLE `shelter_home` (
  `shelter_id` int(11) NOT NULL,
  `shelter_name` varchar(20) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `shelter_email` varchar(254) NOT NULL,
  `shelter_contact` varchar(20) NOT NULL,
  `shelter_address` varchar(200) NOT NULL,
  `shelter_password` varchar(20) NOT NULL,
  `shelter_image` varchar(200) NOT NULL,
  `shelter_location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter_home`
--

INSERT INTO `shelter_home` (`shelter_id`, `shelter_name`, `owner_name`, `shelter_email`, `shelter_contact`, `shelter_address`, `shelter_password`, `shelter_image`, `shelter_location`) VALUES
(1, 'pet care', 'shrey', 'petcare@gmail.com', '9875647014', 'Pet care, Jay Mangal, A\'BAD', '156', 'petshelterphoto.jpg', 'https://goo.gl/maps/SmmwoaNSLFpdtSmWA'),
(2, 'Dog Care', 'Raj Patel', 'dogcare123@gmail.com', '9548821441', 'Dog Care, Jay Mangal,A\'BAD', '123', 'petshelterphoto.jpg', 'https://goo.gl/maps/B2BaUkVAwQiuiKJz5');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_category_id` int(11) NOT NULL,
  `sub_category_name` varchar(20) NOT NULL,
  `sub_category_descripation` varchar(200) NOT NULL,
  `category_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_category_id`, `sub_category_name`, `sub_category_descripation`, `category_id_id`) VALUES
(1, 'Dog Food', 'nnvknvsnvovnojvojvojvosjvojovsjvojjnnvosnovnvonvsosuiosuurru', 1),
(2, 'Dog Toy', 'llvnhhehvveovoevhohheoheohohvvhoevhhhhvohvohovo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `w_date` date NOT NULL,
  `c_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `w_date`, `c_id_id`, `product_id_id`) VALUES
(5, '2022-04-06', 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment`),
  ADD KEY `appointment_c_id_id_44133311_fk_customer_c_id` (`c_id_id`),
  ADD KEY `appointment_doctor_id_id_ec616c3c_fk_doctor_doctor_id` (`doctor_id_id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_c_id_id_abe934c8_fk_customer_c_id` (`c_id_id`),
  ADD KEY `cart_product_id_id_ad4479a7_fk_product_product_id` (`product_id_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `c_email` (`c_email`),
  ADD KEY `customer_area_id_id_f3f19cd3_fk_area_area_id` (`area_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD UNIQUE KEY `doctor_email` (`doctor_email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `feedback_c_id_id_1b84f593_fk_customer_c_id` (`c_id_id`),
  ADD KEY `feedback_product_id_id_a830a78e_fk_product_product_id` (`product_id_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `gallery_product_id_id_84599568_fk_product_product_id` (`product_id_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_c_id_id_65d43963_fk_customer_c_id` (`c_id_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_item_order_id_id_48324a19_fk_order_order_id` (`order_id_id`),
  ADD KEY `order_item_product_id_id_aeb88c86_fk_product_product_id` (`product_id_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_sub_category_id_id_e54a2fe8_fk_sub_categ` (`sub_category_id_id`);

--
-- Indexes for table `shelter_home`
--
ALTER TABLE `shelter_home`
  ADD PRIMARY KEY (`shelter_id`),
  ADD UNIQUE KEY `shelter_email` (`shelter_email`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_category_id`),
  ADD KEY `sub_category_category_id_id_88045227_fk_category_category_id` (`category_id_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `wishlist_c_id_id_e819212a_fk_customer_c_id` (`c_id_id`),
  ADD KEY `wishlist_product_id_id_41a0723e_fk_product_product_id` (`product_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shelter_home`
--
ALTER TABLE `shelter_home`
  MODIFY `shelter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_c_id_id_44133311_fk_customer_c_id` FOREIGN KEY (`c_id_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `appointment_doctor_id_id_ec616c3c_fk_doctor_doctor_id` FOREIGN KEY (`doctor_id_id`) REFERENCES `doctor` (`doctor_id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_c_id_id_abe934c8_fk_customer_c_id` FOREIGN KEY (`c_id_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `cart_product_id_id_ad4479a7_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_area_id_id_f3f19cd3_fk_area_area_id` FOREIGN KEY (`area_id_id`) REFERENCES `area` (`area_id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_c_id_id_1b84f593_fk_customer_c_id` FOREIGN KEY (`c_id_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `feedback_product_id_id_a830a78e_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_product_id_id_84599568_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_c_id_id_65d43963_fk_customer_c_id` FOREIGN KEY (`c_id_id`) REFERENCES `customer` (`c_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_order_id_id_48324a19_fk_order_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_item_product_id_id_aeb88c86_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_sub_category_id_id_e54a2fe8_fk_sub_categ` FOREIGN KEY (`sub_category_id_id`) REFERENCES `sub_category` (`sub_category_id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_category_id_id_88045227_fk_category_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_c_id_id_e819212a_fk_customer_c_id` FOREIGN KEY (`c_id_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `wishlist_product_id_id_41a0723e_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
