-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2021 at 12:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `final_decision`
--

CREATE TABLE `final_decision` (
  `id` int(11) NOT NULL,
  `pre_decsion_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `pdf` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pre_decision`
--

CREATE TABLE `pre_decision` (
  `id` int(11) NOT NULL,
  `created_at` text DEFAULT NULL,
  `updated_at` text DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `program` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `Name_ar` text DEFAULT NULL,
  `Name_eng` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `schoolType` varchar(15) DEFAULT NULL,
  `schoolName` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_requirements`
--

CREATE TABLE `student_requirements` (
  `id` int(11) NOT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `raghba_1` int(11) DEFAULT NULL,
  `raghba_2` int(11) DEFAULT NULL,
  `raghba_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `theem`
--

CREATE TABLE `theem` (
  `id` int(11) NOT NULL,
  `them` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `final_decision`
--
ALTER TABLE `final_decision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_decsion_id` (`pre_decsion_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_requirements`
--
ALTER TABLE `student_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `raghba_1` (`raghba_1`),
  ADD KEY `raghba_2` (`raghba_2`),
  ADD KEY `raghba_3` (`raghba_3`);

--
-- Indexes for table `theem`
--
ALTER TABLE `theem`
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
-- AUTO_INCREMENT for table `final_decision`
--
ALTER TABLE `final_decision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_decision`
--
ALTER TABLE `pre_decision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_requirements`
--
ALTER TABLE `student_requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theem`
--
ALTER TABLE `theem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `final_decision`
--
ALTER TABLE `final_decision`
  ADD CONSTRAINT `final_decision_ibfk_1` FOREIGN KEY (`pre_decsion_id`) REFERENCES `pre_decision` (`id`),
  ADD CONSTRAINT `final_decision_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD CONSTRAINT `pre_decision_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_requirements`
--
ALTER TABLE `student_requirements`
  ADD CONSTRAINT `student_requirements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_requirements_ibfk_2` FOREIGN KEY (`raghba_1`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `student_requirements_ibfk_3` FOREIGN KEY (`raghba_2`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `student_requirements_ibfk_4` FOREIGN KEY (`raghba_3`) REFERENCES `programs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
