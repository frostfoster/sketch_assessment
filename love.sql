-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2022 at 07:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `love`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicationform`
--

CREATE TABLE `applicationform` (
  `id` int(11) NOT NULL,
  `paddress` varchar(100) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `civilstat` varchar(50) NOT NULL,
  `licenseclass` varchar(50) NOT NULL,
  `drivingskillacquired` varchar(10) NOT NULL,
  `highesteducational` varchar(50) NOT NULL,
  `bloodtype` varchar(50) NOT NULL,
  `organdonor` varchar(50) NOT NULL,
  `eyecolor` varchar(50) NOT NULL,
  `typeofapplication` varchar(50) NOT NULL,
  `fathername` varchar(50) NOT NULL,
  `mothername` varchar(50) NOT NULL,
  `spousename` varchar(50) NOT NULL,
  `emercontact` varchar(50) NOT NULL,
  `vehiclecat` varchar(50) NOT NULL,
  `conditions` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `mname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicationform`
--

INSERT INTO `applicationform` (`id`, `paddress`, `nationality`, `sex`, `birthdate`, `height`, `weight`, `civilstat`, `licenseclass`, `drivingskillacquired`, `highesteducational`, `bloodtype`, `organdonor`, `eyecolor`, `typeofapplication`, `fathername`, `mothername`, `spousename`, `emercontact`, `vehiclecat`, `conditions`, `userid`, `status`, `mname`) VALUES
(1, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 3, 'approved', 'undefined'),
(2, 'Dahican', 'Filipino', 'Male', '2021-12-29', '145', '87', 'Single', 'License', 'Bike', 'College', 'O', 'no', 'brown', 'driver', 'Merham', 'Merhamdin', 'Merhamdine', '0190219', 'haha', 'nope', 1, 'declined', 'penecios'),
(3, 'chicken', 'chicken', 'chicken', '2021-12-27', '123', '123', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 'chicken', 7, 'declined', 'penecios'),
(4, 'sadasd', 'male', 'mearl', '2021-12-26', '123', '123', 'single', 'safsa', 'safsaf', 'asfsaf', 'asfsa', 'asfsa', 'asfsaf', 'safasf', 'asfsaf', 'asfasf', 'asfasf', '123213', 'asdsad', 'asfsaf', 8, 'approved', 'mer'),
(5, 'sadasd', 'saasdasd', 'asdsad', '2021-12-27', '123', '123', 'asdasd', 'sadfsaf', 'afasf', 'safasf', 'asfasf', 'safasf', 'asfasf', 'asfsaf', 'asfas', 'asfsa', 'asfasf', '213123', 'asfa', 'asfasf', 9, 'declined', 'asdasd'),
(6, 'kajdnakd', 'kjsndkaM', 'skjnaskjf', '2021-12-29', 'asfasf', 'asfaf', 'asfsaf', 'fsaf', 'sfasf', 'asfa', 'asfsa', 'asfasf', 'afasf', 'afsaf', 'sfsaf', 'afasf', 'asdasdsadad', 'sfasf', 'sfsaf', 'safaf', 11, 'approved', 'mer'),
(7, 'kjsndakj', 'mefak', 'male', '2022-01-02', '1dasd', 'wdsd', 'asdasd', 'asda', 'adsad', 'sdad', 'sadasd', 'adsad', 'adasd', 'asdasd', 'asdasd', 'adasd', 'asdasd', 'asdad', 'asdas', 'adad', 12, 'declined', 'pencecir'),
(8, 'merhamdin', 'mer', 'mer', '2022-01-30', '124', '512', 'mer', 'mer', 'mer', 'mer', 'mer', 'mer', 'mer', 'merm', 'erme', 'mer', 'mer', '1314', 'mermer', 'meremer', 13, 'declined', 'merhamdin'),
(9, 'asdasda', 'asfasfaf', 'fsafsaf', '2022-01-04', '123', '123', 'DFDSF', 'FDFD', 'DFAFA', 'AFASF', 'AFSF', 'afasfsa', 'safsaf', 'asfasf', 'asfaf', 'asfasf', 'asfasf', '123', 'sadsad', 'asdasd', 14, 'approved', 'aasdasdsadsad');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(20) NOT NULL,
  `food_price` int(11) NOT NULL,
  `food_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `food_name`, `food_price`, `food_quantity`) VALUES
(3, 'banana', 5, 10),
(4, 'grapes', 3, 20),
(5, 'apple', 10, 25);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `food_id`, `quantity`, `user_id`, `status`, `order_date`) VALUES
(49, 3, 1, 3, 'pending', '2022-01-30 17:10:29'),
(50, 4, 2, 3, 'pending', '2022-01-30 17:10:29'),
(51, 5, 2, 3, 'pending', '2022-01-30 17:10:29'),
(52, 3, 1, 3, 'pending', '2022-01-30 17:16:59'),
(53, 4, 2, 3, 'pending', '2022-01-30 17:16:59'),
(54, 5, 3, 3, 'pending', '2022-01-30 17:16:59'),
(55, 3, 1, 3, 'pending', '2022-01-30 17:24:13'),
(56, 4, 2, 3, 'pending', '2022-01-30 17:24:13'),
(57, 5, 3, 3, 'pending', '2022-01-30 17:24:13'),
(58, 3, 3, 3, 'pending', '2022-01-30 17:25:08'),
(59, 4, 3, 3, 'pending', '2022-01-30 17:25:08'),
(60, 5, 3, 3, 'pending', '2022-01-30 17:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `contactno` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fname`, `lname`, `contactno`, `email`, `role`) VALUES
(1, 'jack', '123', 'jack', 'umbukan', 21313, 'jackumbukan@gmail.com', 'guest'),
(2, 'jake', '123', 'jake', 'sada', 123, 'lkfmaklf@gmail.com', 'guest'),
(3, 'merham', '123', 'merham', 'jsdnakj', 23123, 'ksfjnakjf@gmail.com', 'admin'),
(4, 'jank', '123', 'jank', 'kjnsafkj', 23131, 'kasfjnk@gmak.com', 'guest'),
(5, 'jaek', '123', 'jaek', '123', 34343, 'aks@gmail.com', 'guest'),
(6, 'jillian', '123', 'jillian', 'umbukan', 92130123, 'alsnakjfn@gm.com', 'guest'),
(7, 'jillian1', '123', 'jillian', 'umbukan', 213213213, 'mer@gmail.com', 'guest'),
(8, 'merhamdin', '123', 'merhamdin', 'umbukan', 9213213, 'merumbukan@gmail.com', 'guest'),
(9, 'merhamdinu', '123', 'merhmadin', 'umbukan', 123131, 'merumbukan@gmail.com', 'guest'),
(10, 'merz', '123', 'mer', 'umbukan', 2131312, 'merumbukan@gmail.com', 'guest'),
(11, 'jacque', '123', 'jacque', 'romero', 13123, 'merumbukan@gmail.com', 'guest'),
(12, 'merkun', '123', 'mer', 'umbukan', 1129031, 'merumbukan@gmail.com', 'guest'),
(13, 'pops', '123', 'pops', 'pops', 123, 'pops@gmail.com', 'guest'),
(14, 'paps', '123', 'paps', 'paps', 123, 'pops@gmail.com', 'guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicationform`
--
ALTER TABLE `applicationform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicationform`
--
ALTER TABLE `applicationform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
