-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 01:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clubreg`
--
CREATE DATABASE IF NOT EXISTS `clubreg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clubreg`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
CREATE TABLE `backup` (
  `club_id` int(4) NOT NULL,
  `club_name` varchar(30) NOT NULL,
  `co_ordinator` varchar(30) NOT NULL,
  `co_ordinator_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup`
--

INSERT INTO `backup` (`club_id`, `club_name`, `co_ordinator`, `co_ordinator_id`) VALUES
(1234, 'AIML', 'harish kundar', 6254),
(12334, 'Asquare', 'Harish kundar', 3212);

--
-- Triggers `backup`
--
DROP TRIGGER IF EXISTS `restore`;
DELIMITER $$
CREATE TRIGGER `restore` BEFORE DELETE ON `backup` FOR EACH ROW INSERT INTO clubinfo VALUES (OLD.club_id, old.club_name,old.co_ordinator,old.co_ordinator_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clubinfo`
--

DROP TABLE IF EXISTS `clubinfo`;
CREATE TABLE `clubinfo` (
  `club_id` int(4) NOT NULL,
  `club_name` varchar(30) NOT NULL,
  `co_ordinator` varchar(30) NOT NULL,
  `co_ordinator_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubinfo`
--

INSERT INTO `clubinfo` (`club_id`, `club_name`, `co_ordinator`, `co_ordinator_id`) VALUES
(1234, 'Rostrum', 'Rakib Hasan', 1232),
(2342, 'Asquare', 'Mehedi Hasan', 6254),
(4206, 'Edwins lab', 'Arif Anwar', 5268),
(4209, 'Algoris Club', 'Disha Chowdhury', 5264),
(4210, 'Apple iOS', 'Tanvir Rahman', 5264),
(4216, 'Chirp Club', 'Tania Akter', 5483),
(4234, 'Srishti club', 'Nusrat Jahan', 45126),
(4245, 'Language lab', 'Rezaul Karim', 5264),
(4258, 'Life Skills Club', 'Naimul Islam', 5244),
(4259, 'Adhyathma club', 'Anupama Khatun', 5264),
(4526, 'Photography club', 'Moinul Haque', 5624),
(4527, 'NSS', 'Sohail Parvez', 5246),
(4578, 'Swachh Mijar', 'Shakib Parvez', 5244),
(4579, 'Tulu Sangha', 'Farhana Koli', 5246),
(4589, 'Fine Art', 'Gias Uddin', 5468),
(4856, 'NCC', 'Dr. Yousuf Ali', 5624),
(4857, 'Kannada Sangha', 'Wasim Shahriar', 5246),
(4858, 'Readers Club', 'Pradip Chandra', 5246),
(4962, 'SSB club', 'Parvez Sheikh', 5216),
(4985, 'Women empowerment cell', 'Bidya Sultana', 5325);
-- Triggers `clubinfo`
--
DROP TRIGGER IF EXISTS `mybackup`;
DELIMITER $$
CREATE TRIGGER `mybackup` BEFORE DELETE ON `clubinfo` FOR EACH ROW INSERT INTO backup VALUES(OLD.club_id,OLD.club_name,OLD.co_ordinator,OLD.co_ordinator_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

DROP TABLE IF EXISTS `contact_form`;
CREATE TABLE `contact_form` (
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`name`, `phone`, `email`, `subject`, `message`) VALUES
('Rakib Hasan', '+8801712345678', 'rakibhasan@gmail.com', 'About fest', 'is their any non_veg items be their in the food fest'),
('Nusrat Jahan', '+8801811223344', 'nusratjahan@gmail.com', 'jss', 'is their ewvent twrw'),
('Mehedi Alam', '+8801912345678', 'mehedialam@gmail.com', 'Tickets', 'is it necessary to sell all the tickets that i received from faculty co-ordinator');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `slno` int(4) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`slno`, `email`, `message`) VALUES
(1, 'hemanth.arya1947@gmail.com', 'The site is good and easy to use'),
(2, 'vid@gmail.com', 'btffesed');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `club_name` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `club_name`, `password`) VALUES
(9616, 'Rakib Hasan', 'rakibhasan@gmail.com', 'Algoris Club', '852741963&Rt'),
(9617, 'Mehedi Hasan', 'mehedihasan@gmail.com', 'Apple iOS', '098765%Yt'),
(9618, 'Nusrat Jahan', 'nusratjahan@gmail.com', 'Chirp Club', '123456*Gh'),
(9619, 'Tania Akter', 'taniaakter@gmail.com', 'Srishti club', 'LkJHGFD45674'),
(9620, 'Arif Anwar', 'arifanwar@gmail.com', 'Language lab', '951753*3Hu'),
(9621, 'Naimul Islam', 'naimulislm@gmail.com', 'Life Skills Club', '8521265Kl*'),
(9622, 'Sumaiya Akter', 'sumaiyaakter@gmail.com', 'Adhyathma club', 'Magana3456&'),
(9623, 'Moinul Haque', 'moinulhaque@gmail.com', 'Photography club', '852741(Ij'),
(9624, 'Pradip Chandra', 'pradipchandra@gmail.com', 'Readers Club', 'qwex@12343I'),
(9625, 'Farhana Koli', 'farhanakoli@gmail.com', 'NSS', '@gJhail.com567'),
(9626, 'Shakib Parvez', 'shakibparvez@gmail.com', 'Swachh Mijar', '@gmaH3474@.com'),
(9627, 'Raju Ahmed', 'rajuahmed@gmail.com', 'Tulu Sangha', '@12al.G@com'),

(9628, 'Nusrat Sultana', 'nusratsultana@gmail.com', 'Fine Art', '@gmail.coD741'),
(9629, 'Rezaul Karim', 'rezaulkarim@gmail.com', 'NCC', '@gmailH741'),
(9630, 'Wasim Shahriar', 'wasimshahriar@gmail.com', 'Kannada Sangha', '@gmail.cB852'),
(9631, 'Sadman Chowdhury', 'sadmanchowdhury@gmail.com', 'Readers Club', '@gmail.coU963'),
(9632, 'Parvez Sheikh', 'parvezsheikh@gmail.com', 'SSB club', '@gmail.coA741'),
(9633, 'Bidya Sultana', 'bidyasultana@gmail.com', 'Women empowerment cell', 'DFG@gmail.com8'),
(9634, 'Arif Rahman', 'arifrahman@gmail.com', 'Edwins lab', '@gmail.com7F'),
(9635, 'Yousuf Ali', 'yousufali@gmail.com', 'Algoris Club', 'Hemi@12345'),
(9636, 'Tanvir Ahmed', 'tanvirahmed@gmail.com', 'Kannada Sangha', 'Alva@123'),
(9637, 'Sakib Rahman', 'sakibrahman@gmail.com', 'Algoris Club', 'Alvas@123'),
(9638, 'Suraiya Akter', 'suraiyaakter@gmail.com', 'Readers Club', 'Surya#123'),
(9642, 'Shahriar Kabir', 'shahriarkabir@gmail.com', 'SSB club', 'Alvas@12345'),
(9643, 'Mizanur Rahman', 'mizanurrahman@gmail.com', 'Rostrum', 'Sunil1234'),
(9644, 'Hasibul Islam', 'hasibulislam@gmail.com', 'Swachh Mijar', 'Dhruvan@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexes for table `clubinfo`
--
ALTER TABLE `clubinfo`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `slno` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9645;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
