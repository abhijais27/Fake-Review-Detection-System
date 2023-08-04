-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 13, 2023 at 08:14 AM
-- Server version: 5.7.41
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fake_product_review_detection_sentiment_analysis`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_user_id` int(11) NOT NULL,
  `comment_product_id` int(11) NOT NULL,
  `comment_title` text NOT NULL,
  `comment_description` text NOT NULL,
  `comment_rating` float NOT NULL DEFAULT '1',
  `comment_date` varchar(255) NOT NULL,
  `comment_rating_title` varchar(255) NOT NULL,
  `comment_rating_color` varchar(255) NOT NULL,
  `comment_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_user_id`, `comment_product_id`, `comment_title`, `comment_description`, `comment_rating`, `comment_date`, `comment_rating_title`, `comment_rating_color`, `comment_ip`) VALUES
(1, 17, 1, 'Bad product - Amit Kumar', 'Dont buy this. Text is low clarity and colour. If you want like this. Please purchase a small tropy and put printed the text. Worst product\r\n', 2, '2019-02-18 02:30', 'Negative', '229, 24, 181', '10.191.47.83'),
(2, 18, 1, 'Not good Quality - Amit Kumar', 'Don\'t buy this it\'s quality is very poor and I paid for the gift wrap but it did not come with it\r\n', 2, '2019-02-18 02:31', 'Negative', '229, 24, 181', '10.191.47.83'),
(3, 21, 1, 'Good Product - Amit Kumar', 'Good product. Value for money. Good to wear at home in Aug to Oct in north India.\r\n', 5, '2019-02-18 02:31', 'Strongly Positive', '32, 229, 25', '10.191.47.83'),
(4, 20, 1, 'Good for daily wear - Amit Kumar', 'I like this product and we use this for daily wear\r\n', 3, '2019-02-18 02:31', 'Neutral', '24, 78, 229', '10.191.47.83'),
(5, 19, 1, 'The quality of material is good and so is the finish', 'The quality of material is good and so is the finish.\r\nHowever the company dis not send what I had ordered. Only three pants were from the set I ordered and 2 were from some other set, that too of smaller size. Very disappointed.', 2.5, '2019-02-18 02:54', 'Weakly Negative', '249, 144, 144', '10.191.47.83'),
(9, 20, 1, 'Good', 'This is very good product. Best in quality', 5, '2019-09-03 11:56', 'Strongly Positive', '32, 229, 25', '10.191.47.86'),
(10, 20, 1, 'Bad', 'This is worst product, bad quality', 1, '2019-09-03 11:57', 'Strongly Negative', '244, 65, 65', '10.191.47.86'),
(11, 20, 3, 'Good product', 'This is pure cotton comfortable to wear', 4, '2019-09-03 11:58', 'Positive', '65, 244, 149', '10.191.47.86'),
(12, 20, 5, 'asdf', 'asdf', 3, '2019-09-03 15:29', 'Neutral', '24, 78, 229', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`) VALUES
(1, 'Adidas', 'Adidas Company'),
(2, 'Reebok', 'Reebok Company'),
(3, 'Fila', 'Fila Company'),
(4, 'Lee Cooper', 'Lee Cooper Company');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1gjz6jbd26q1fbco56dcyqer2b6lwop8', 'YWYwZWZlY2YwNzVmMGIzZjA3YjZhMTAzZWQ5MDA2N2ZkYWU3MzQxZDp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjI1LCJ1c2VyX2xldmVsX2lkIjoyLCJ1c2VyX25hbWUiOiJLYXVzaGFsIEtpc2hvcmUifQ==', '2019-02-27 09:35:11'),
('1yszxy97tw2qhvxtkfzcipmqmxg5901o', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-01-26 07:59:01'),
('2subht5j5eh6gpk865z79cm5gwtherfs', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2023-03-27 08:13:48'),
('9bgzvan3fd73sdzjqy4fy90dxwzgmltg', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-01-29 14:09:38'),
('c7f2yysow67qjgtrgzabr8rx8eyvdnji', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-01-29 14:19:42'),
('ebqsosvupih3d6rfcy220w6eeoopoqt8', 'NDE1ODNmMjY1ZjNlZDA2Y2ExYzc1ZGU5NWEyNGEzN2IzMWY2OGVjYTp7Im9yZGVyX2lkIjoiMCIsImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-02-21 10:22:08'),
('j1unuxzc2z846m0r1xmkioa3xd63spfg', 'ODFkZmU0YjE3MzI5ODQ5NzQyNzc4Nzc0ODNjZjlkYTlhZWEwMmMxOTp7InVzZXJfaWQiOjI1LCJ1c2VyX2xldmVsX2lkIjoyLCJhdXRoZW50aWNhdGVkIjp0cnVlLCJ1c2VyX25hbWUiOiJLYXVzaGFsIEtpc2hvcmUifQ==', '2018-02-21 09:19:01'),
('lh0p1atfzdmbc1la5umnejnp359zt0zd', 'OThhZmRhMTJlYTM2ZmZlZTQzYmZjYzkxNmQ3ODZjMTM2MjcyZWQ3MTp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjE2LCJ1c2VyX2xldmVsX2lkIjoxLCJ1c2VyX25hbWUiOiJBbWl0IEt1bWFyIn0=', '2019-09-17 06:30:30'),
('nwwa3km5psyorxbrw4vb9hlbh9ietvzq', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2019-03-04 03:18:44'),
('pm9ifc6usfn38cwfcpuget8cu0g48c3k', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-01-29 13:36:24'),
('qcr0ermnpjojdmkor2ibe0etyis25gck', 'OThhZmRhMTJlYTM2ZmZlZTQzYmZjYzkxNmQ3ODZjMTM2MjcyZWQ3MTp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjE2LCJ1c2VyX2xldmVsX2lkIjoxLCJ1c2VyX25hbWUiOiJBbWl0IEt1bWFyIn0=', '2019-09-17 07:20:07'),
('qi4jui1wag7y5kjd3nal07b1h2jlc9ia', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-07-21 11:40:27'),
('qsxborjw4rrqnogv0vx3uftojqs3qxvq', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2019-09-17 10:39:53'),
('siqi62rews2u03v63bm1wg7asa3nt0xb', 'ZGIyNmU4NzE3NmI3NTc5YjljOGQxZDdkMjc5NmVhYmMyNzg4NmM2MTp7ImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2019-03-01 13:32:24'),
('xqitzy5mm8bz740ja8unqi2yzmdyj7ed', 'MDMwNWRjNWZmMGI3MjYyOWE1ZDI2YjE1NWEzMjg3OWVkYzM3MjEwNDp7Im9yZGVyX2lkIjozNCwiYXV0aGVudGljYXRlZCI6ZmFsc2UsInVzZXJfbGV2ZWxfaWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9uYW1lIjpmYWxzZX0=', '2018-02-20 13:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_user_id` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_user_id`, `order_date`, `order_status`, `order_total`) VALUES
(1, '25', '01:49PM on February 06, 2018', '2', '0'),
(2, '25', '01:50PM on February 06, 2018', '5', '0'),
(3, '25', '04:06PM on February 06, 2018', '5', '0'),
(4, '25', '09:19AM on February 07, 2018', '5', '0');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `oi_id` int(11) NOT NULL,
  `oi_order_id` varchar(255) NOT NULL,
  `oi_product_id` varchar(255) NOT NULL,
  `oi_price_per_unit` varchar(255) NOT NULL,
  `oi_cart_quantity` varchar(255) NOT NULL,
  `oi_total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`oi_id`, `oi_order_id`, `oi_product_id`, `oi_price_per_unit`, `oi_cart_quantity`, `oi_total`) VALUES
(1, '1', '7', '1200', '1', '1200'),
(2, '1', '8', '1200', '1', '1200'),
(3, '2', '6', '1170', '1', '1170'),
(4, '2', '2', '1100', '1', '1100'),
(5, '2', '3', '1170', '4', '4680'),
(6, '3', '8', '1200', '1', '1200'),
(7, '4', '1', '1200', '1', '1200'),
(8, '4', '5', '1170', '1', '1170'),
(9, '4', '7', '1200', '2', '2400'),
(10, '4', '9', '3423', '1', '3423');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `os_id` int(11) NOT NULL,
  `os_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`os_id`, `os_title`) VALUES
(1, 'Confirmed'),
(2, 'Processing'),
(3, 'Packed'),
(4, 'Dispatched'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `products_product`
--

CREATE TABLE `products_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type_id` varchar(255) NOT NULL,
  `product_company_id` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `products_product`
--

INSERT INTO `products_product` (`product_id`, `product_name`, `product_type_id`, `product_company_id`, `product_price`, `product_image`, `product_description`, `product_stock`) VALUES
(1, 'Ziyaa Printed Women\'s', '1', '1', '1200', '/uploads/1.jpeg', 'Simple and sophisticated - this kurta from Ziyaa strikes the perfect balance between style and comfort, and is ideal for everyday wear. The straight fit, viscose fabric, the trendy combination of black and red, and its three-fourth sleeves make this round neck kurta a must-have in every college-going girl?s wardrobe.\r\n', '5'),
(2, 'Jackly Combination Screwdriver Set ', '2', '1', '1100', '/uploads/2.jpeg', 'Keyless chuck Swivel thumb rest Compact case stores all parts. Extension included Comes with a plastic holdle to place the screwdriver bits in it Magnetic bits are easy and tight to absorb into the handle. Handle with rubber wrap for comfortable grip. Comes with a plastic storage box Compact storage design^ convenient to place and carry Multi-functional Pocket Screwdriver Set.\n', '91'),
(3, 'AR Sales Men\'s Ankle Length', '5', '4', '1170', '/uploads/3.jpeg', 'It\'s socks total bad product....it\'s type sale sock. Footpath...I paid 165 but socks total price 30 only.... very very bad...plz don\'t purchase..I am very sarrow.', '199'),
(4, 'Asics Running Sport Shoes ', '7', '4', '1170', '/uploads/4.jpg', 'I run about 40-50 kms a week. I bought this shoe after reading the reviews but am disappointed with this shoe. \n', '87'),
(5, 'ARTS CHETAN Copper Jewel Set ', '3', '2', '1170', '/uploads/5.jpeg', 'ARTS CHETAN COPPER GOLD PLATED LONG NECKLACE ST WITH JHUMKIES\n', '12'),
(6, 'Yukth Striped Men\'s Polo Neck', '4', '2', '1170', '/uploads/6.jpeg', 'Product quality is excellent. Pure cotton. Fittings is just perfect. Nice colour combination. Thank you.\n', '15'),
(7, 'Nova NHT 1089 Trimmer', '5', '2', '1200', '/uploads/7.jpeg', 'Facial hair is a prominent feature of a man\'s face and it needs to be groomed regularly if you want to maintain a suave image. Helping you do this is this Nova trimmer. It comes with 40 trim settings which let you trim and style your facial hair. This beard trimmer comes with length settings that range from 0.5 mm to 20 mm making it very useful no matter whether you want to maintain a clean-shaven look or a neat beard. The trimmer is designed with titanium coated blades that provide a superior cutting performance. Whats more it comes with washable body , which means it can be used even under the shower. This trimmer works for 90 mins on one quick charge. Designed in such a way that it works both in corded and cordless mode. It also comes with two combs for beard and head hair trimming.It also comes with universal voltage 110-240v which means it can be used worldwide. All these features are packed in this Trimmer with turbo boost motor for efficiency in trimming.', '97'),
(8, 'Lenovo PA 10400 10400 mAh ', '8', '2', '1200', '/uploads/8.jpeg', 'The Lenovo PA10400 power bank is a high performance and quality product with 2 fast charge output for devices as mobile phone, tablet, etc. It has large capacity of 10400mAH.\n', '100'),
(9, 'Provogue PV1001-Blk-Blk Aviator', '5', '2', '3423', '/uploads/9.jpeg', 'Lens :- UV protective plastic Lens Size :- Medium 58mm Color:- Black color frame with full black lenses Waarnty:- 1 year against manufacturing defects Ideal for:- Men & Women\r\n', '32');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_description`) VALUES
(1, 'Ladies Cloths', 'Ladies Cloths Type Product'),
(2, 'Tools', 'Tools Type Product'),
(3, 'Jwellary', 'Jwellary Type Product'),
(4, 'Mens', 'Mens Type Product'),
(5, 'Assesories', 'Assesories Type Product'),
(6, 'Gifts', 'Gifts Type Product'),
(7, 'Shoes', 'Shoes Type Product'),
(8, 'Hardware', 'Hardware Type Product');

-- --------------------------------------------------------

--
-- Table structure for table `users_city`
--

CREATE TABLE `users_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_city`
--

INSERT INTO `users_city` (`city_id`, `city_name`) VALUES
(1, 'Allahabad'),
(2, 'Varanasi');

-- --------------------------------------------------------

--
-- Table structure for table `users_country`
--

CREATE TABLE `users_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_country`
--

INSERT INTO `users_country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`role_id`, `role_title`, `role_description`) VALUES
(1, 'System Admin', 'Admin Roles and Permissions'),
(2, 'Normal User', 'Users Roles and Permissions'),
(3, 'Doctor', 'Doctors User Permission and Role'),
(4, 'Patient', 'Patient User Permission and Role');

-- --------------------------------------------------------

--
-- Table structure for table `users_state`
--

CREATE TABLE `users_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_state`
--

INSERT INTO `users_state` (`state_id`, `state_name`) VALUES
(1, 'UttarnPradesh'),
(2, 'Madhya Pradesh');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `user_id` int(11) NOT NULL,
  `user_level_id` int(11) NOT NULL DEFAULT '2',
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_add1` varchar(255) NOT NULL,
  `user_add2` varchar(255) NOT NULL,
  `user_city` int(11) NOT NULL,
  `user_state` int(11) NOT NULL,
  `user_country` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`user_id`, `user_level_id`, `user_username`, `user_password`, `user_name`, `user_add1`, `user_add2`, `user_city`, `user_state`, `user_country`, `user_email`, `user_mobile`, `user_gender`, `user_dob`, `user_image`) VALUES
(16, 1, 'admin', 'test', 'Amit Kumar', 'Allahabad', 'Lunckonw', 1, 1, 1, 'amit@gmail.com', '9878987678', 'Male', '2 July,1987', '/uploads/d2.jpg'),
(17, 2, 'manasa', 'test', 'Manasa Singh', 'House no : 768', 'Noida', 2, 1, 1, 'manasa@gmail.com', '9876543212', 'Female', '18 January,1968', '/uploads/d3.jpg'),
(18, 2, 'aman', 'test', 'Aman Kumar', 'House No : 355, Sector 23', 'Noida', 1, 2, 1, 'aman@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/d4.jpg'),
(19, 2, 'kaushal', 'test', 'Kaushal Kishore', 'House No : 355, Sector 23', 'Noida', 2, 2, 2, 'kaushal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p6.jpg'),
(20, 2, 'customer', 'test', 'Pawan Kumar', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'pawan@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p7.jpg'),
(21, 2, 'vishal', 'test', 'Vishal Singh', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'vvishal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p8.jpg'),
(25, 2, 'rahul', 'test', 'Kaushal Kishore', 'S  206 Amrapali Zodiac', 'Sector 120 Noida', 1, 2, 1, 'kaushal.rahuljaiswal@gmail.com', '8376986802', 'Male', '12 February,2018', '/uploads/28bdc83.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`oi_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`os_id`);

--
-- Indexes for table `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users_city`
--
ALTER TABLE `users_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `users_country`
--
ALTER TABLE `users_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users_state`
--
ALTER TABLE `users_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `oi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `os_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products_product`
--
ALTER TABLE `products_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_city`
--
ALTER TABLE `users_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_country`
--
ALTER TABLE `users_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_state`
--
ALTER TABLE `users_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
