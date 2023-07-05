-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2023 at 07:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abcjobs`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_Email` int(11) NOT NULL,
  `Admin_password` int(11) NOT NULL,
  `Admin_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_email`
--

CREATE TABLE `bulk_email` (
  `Content` int(11) NOT NULL,
  `_recipient_email` int(11) NOT NULL,
  `Subject` int(11) NOT NULL,
  `Email_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs_posted`
--

CREATE TABLE `jobs_posted` (
  `Job_ID` int(11) NOT NULL,
  `Job_title` int(11) NOT NULL,
  `Job_description` int(11) NOT NULL,
  `Expected_salary` int(11) NOT NULL,
  `Users_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

CREATE TABLE `manage` (
  `Users_ID` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `Message_ID` int(11) NOT NULL,
  `Sender_name` int(11) NOT NULL,
  `Receiver_name` int(11) NOT NULL,
  `Content` int(11) NOT NULL,
  `Users_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_reply`
--

CREATE TABLE `post_reply` (
  `Users_ID` int(11) NOT NULL,
  `Thread_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sends`
--

CREATE TABLE `sends` (
  `Admin_ID` int(11) NOT NULL,
  `Email_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `Thread_ID` int(11) NOT NULL,
  `Title` int(11) NOT NULL,
  `Content` int(11) NOT NULL,
  `Reply` int(11) NOT NULL,
  `Poster_name` int(11) NOT NULL,
  `Replier_name` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Users_ID` int(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Education` varchar(100) DEFAULT NULL,
  `Experience` varchar(200) DEFAULT NULL,
  `Certification` varchar(200) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Users_ID`, `Email`, `Name`, `Country`, `Education`, `Experience`, `Certification`, `Password`) VALUES
(1, 'admin@email.com', 'admin', 'Indonesia', 'Lithan', 'administration', 'Java', 'admin123'),
(6, 'tes@hi', 'Darren Farrell', 'Indonesia', 'education', 'halo my name is darren', 'JavaScript developer', '12345'),
(8, 'john@gmail.com', 'John', 'India', 'Bachelor', 'none', 'LinkedInlearning', 'awhawh'),
(9, 'darren@gmail.com', 'darren', 'Italy', 'High school', 'none', 'none', 'darren'),
(19, 'darren@email.com', 'Darren Farrell', 'Indonesia', 'Lithan Academy', 'Internship @Microsoft for 6 months', 'Spring MVC', '12345'),
(20, 'JohnSyk@email.com', 'John adam', 'Germany', 'University', '1 year of internship', 'Java developer', 'darren'),
(22, 'monday@email.com', 'darren', 'Indonesia', 'Harvard', 'Software engineer for 1 year', 'HTML CSS java', 'darren'),
(25, 'jose@gmail.com', 'Mike jose', 'USA', 'University of colorado', 'None', 'Java', '12345'),
(26, 'fury123@gmail.com', 'Tyson Fury', NULL, NULL, NULL, NULL, 'fury123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `bulk_email`
--
ALTER TABLE `bulk_email`
  ADD PRIMARY KEY (`Email_ID`);

--
-- Indexes for table `jobs_posted`
--
ALTER TABLE `jobs_posted`
  ADD PRIMARY KEY (`Job_ID`),
  ADD KEY `Users_ID` (`Users_ID`);

--
-- Indexes for table `manage`
--
ALTER TABLE `manage`
  ADD PRIMARY KEY (`Users_ID`,`Admin_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`Message_ID`),
  ADD KEY `Users_ID` (`Users_ID`);

--
-- Indexes for table `post_reply`
--
ALTER TABLE `post_reply`
  ADD PRIMARY KEY (`Users_ID`,`Thread_ID`),
  ADD KEY `Thread_ID` (`Thread_ID`);

--
-- Indexes for table `sends`
--
ALTER TABLE `sends`
  ADD PRIMARY KEY (`Admin_ID`,`Email_ID`),
  ADD KEY `Email_ID` (`Email_ID`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`Thread_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Users_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_email`
--
ALTER TABLE `bulk_email`
  MODIFY `Email_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs_posted`
--
ALTER TABLE `jobs_posted`
  MODIFY `Job_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Message_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `Thread_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Users_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs_posted`
--
ALTER TABLE `jobs_posted`
  ADD CONSTRAINT `jobs_posted_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`);

--
-- Constraints for table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`),
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`);

--
-- Constraints for table `post_reply`
--
ALTER TABLE `post_reply`
  ADD CONSTRAINT `post_reply_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`),
  ADD CONSTRAINT `post_reply_ibfk_2` FOREIGN KEY (`Thread_ID`) REFERENCES `thread` (`Thread_ID`);

--
-- Constraints for table `sends`
--
ALTER TABLE `sends`
  ADD CONSTRAINT `sends_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`),
  ADD CONSTRAINT `sends_ibfk_2` FOREIGN KEY (`Email_ID`) REFERENCES `bulk_email` (`Email_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
