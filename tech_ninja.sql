-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 10:51 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tech ninja`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogpost`
--

CREATE TABLE `blogpost` (
  `sno` int(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogpost`
--

INSERT INTO `blogpost` (`sno`, `title`, `subtitle`, `slug`, `content`, `img`, `date`) VALUES
(1, 'Computer Programming', 'Coding ', 'programming', 'Computer programming is the process of designing and building an executable computer program to accomplish a specific computing result or to perform a specific task. Programming involves tasks such as: analysis, generating algorithms, profiling algorithms\' accuracy and resource consumption, and the implementation of algorithms in a chosen programming language (commonly referred to as coding). The source code of a program is written in one or more languages that are intelligible to programmers, rather than machine code, which is directly executed by the central processing unit. The purpose of programming is to find a sequence of instructions that will automate the performance of a task (which can be as complex as an operating system) on a computer, often for solving a given problem. Proficient programming thus often requires expertise in several different subjects, including knowledge of the application domain, specialized algorithms, and formal logic.\r\n\r\nTasks accompanying and related to programming include: testing, debugging, source code maintenance, implementation of build systems, and management of derived artifacts, such as the machine code of computer programs. These might be considered part of the programming process, but often the term software development is used for this larger process with the term programming, implementation, or coding reserved for the actual writing of code. Software engineering combines engineering techniques with software development practices. Reverse engineering is a related process used by designers, analysts and programmers to understand and re-create/re-implement.', 'about-bg.jpg', '2021-04-04 15:21:26'),
(2, 'Web Development', 'Websites designing and development', 'web', 'Web development is the work involved in developing a Web site for the Internet (World Wide Web) or an intranet (a private network). Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.\r\n\r\n\r\nAmong Web professionals, \"Web development\" usually refers to the main non-design aspects of building Web sites: writing markup and coding. Web development may use content management systems (CMS) to make content changes easier and available with basic technical skills.\r\n\r\n\r\nFor larger organizations and businesses, Web development teams can consist of hundreds of people (Web developers) and follow standard methods like Agile methodologies while developing Web sites. Smaller organizations may only require a single permanent or contracting developer, or secondary assignment to related job positions such as a graphic designer or information systems technician. Web development may be a collaborative effort between departments rather than the domain of a designated department. There are three kinds of Web developer specialization: front-end developer, back-end developer, and full-stack developer. Front-end developers are responsible for behavior and visuals that run in the user browser, while back-end developers deal with the servers.', 'about-bg.jpg', '2021-04-04 18:36:39'),
(3, 'Machine Learning', 'M/L', 'ml', 'Machine learning (ML) is the study of computer algorithms that improve automatically through experience and by the use of data. It is seen as a part of artificial intelligence. Machine learning algorithms build a model based on sample data, known as \"training data\", in order to make predictions or decisions without being explicitly programmed to do so. Machine learning algorithms are used in a wide variety of applications, such as email filtering and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.\r\n\r\nA subset of machine learning is closely related to computational statistics, which focuses on making predictions using computers; but not all machine learning is statistical learning. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning. In its application across business problems, machine learning is also referred to as predictive analytics.', 'web.jpeg', '2021-04-05 13:12:30'),
(4, 'Artificial Intelligence', 'AI', 'ai', 'Hello Programmers!!!', 'home-bg.jpg', '2021-04-06 09:54:51');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone`, `message`, `date`) VALUES
(1, 'Mayank', 'mayank@gmail.com', '9003456712', 'This is first message', '2021-04-04 12:56:40'),
(2, 'Mayank Kumar Singh', 'mk@gmail.com', '7717723782', 'Hello', '2021-04-04 07:36:26'),
(3, 'Mayank Kumar Singh', 'a@gmail.com', '7717723782', 'Hi there!!', '2021-04-04 13:11:04'),
(4, 'Raj', 'abc@gmail.com', '6575363463', 'Test Message...', '2021-04-04 13:30:36'),
(5, 'Mayank Kumar Singh', 'kmayank298@gmail.com', '7717723782', 'Hi there!! \r\nI wanted to test the message...', '2021-04-04 15:07:59'),
(6, 'Mayank Kumar Singh', 'kmayank298@gmail.com', '7717723782', 'Hi there!! \r\nI wanted to test the message...', '2021-04-04 15:08:22'),
(7, 'Rahul', 'rstar@gmail.com', '6554563787', 'Hello, I am Rahul.', '2021-04-04 15:13:37'),
(8, 'Rishi', 'rishi00@gmail.com', '7866556787', 'I wanted to get some information..', '2021-04-04 18:29:19'),
(9, 'Rishi', 'rishi00@gmail.com', '7866556787', 'I wanted to get some information..', '2021-04-04 18:30:15'),
(10, 'Rohit', 'rohit@gmail.com', '7842246367', 'Hello I am Rohit....', '2021-04-04 19:15:12'),
(11, 'Mayank Kumar Singh', 'm12@gmail.com', '7717723782', 'Hello', '2021-04-04 19:16:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogpost`
--
ALTER TABLE `blogpost`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogpost`
--
ALTER TABLE `blogpost`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
