-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5175
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for warehouse
CREATE DATABASE IF NOT EXISTS `warehouse` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `warehouse`;

-- Dumping structure for table warehouse.accused
CREATE TABLE IF NOT EXISTS `accused` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `casetype` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `prosecutor` int(11) DEFAULT NULL,
  `card_id` varchar(50) DEFAULT NULL COMMENT 'เลขบัตรประชาชน',
  `name` text DEFAULT NULL,
  `national` int(11) DEFAULT NULL COMMENT '1 = ไทย , 2 = ต่างชาติ',
  `gender` int(11) DEFAULT NULL COMMENT '1 = ชาย, 2 = ญ',
  `lawyer_name` varchar(255) DEFAULT NULL COMMENT 'ทนายจำเลย',
  `connection` text DEFAULT NULL COMMENT 'system',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='4 : จำเลย';

-- Dumping data for table warehouse.accused: ~2 rows (approximately)
/*!40000 ALTER TABLE `accused` DISABLE KEYS */;
INSERT INTO `accused` (`id`, `casetype`, `department`, `sector`, `case`, `prosecutor`, `card_id`, `name`, `national`, `gender`, `lawyer_name`, `connection`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, 101, 1, 1, '1234567890123', 'นายจำเลย จำเลย', 1, 1, 'นายทนาย จำเลย', NULL, '2017-11-01 14:44:05', '2017-11-01 14:44:05'),
	(2, 2, 1, 102, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 15:16:34', '2017-11-01 15:16:34');
/*!40000 ALTER TABLE `accused` ENABLE KEYS */;

-- Dumping structure for table warehouse.appeal
CREATE TABLE IF NOT EXISTS `appeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `accused` int(11) unsigned DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `prosecutor` int(11) unsigned DEFAULT NULL,
  `highjudgementtype` int(11) DEFAULT NULL COMMENT 'ประเภทการตัดสิน',
  `dismissaltype` int(11) DEFAULT NULL COMMENT 'ผลคำพิพากษา=>กรณียกฟ้อง',
  `black_abb` varchar(100) DEFAULT NULL,
  `black_no` varchar(100) DEFAULT NULL,
  `black_year` varchar(100) DEFAULT NULL,
  `recieve_date` date DEFAULT NULL,
  `red_abb` varchar(100) DEFAULT NULL,
  `red_no` varchar(100) DEFAULT NULL,
  `red_year` varchar(100) DEFAULT NULL,
  `judgement_date` date DEFAULT NULL COMMENT 'วันตัดสินคดี',
  `judgement_detail` text DEFAULT NULL COMMENT 'รายละเอียดคำพิพากษา',
  `judgement_dismiss_other` text DEFAULT NULL COMMENT 'กรณียกฟ้อง อื่นๆ เขียนเพิ่มเติม',
  `judgement_paper_status` int(11) DEFAULT NULL COMMENT 'สถานะคำพิพากษาตัวจริง',
  `judgement_paper_date` date DEFAULT NULL COMMENT 'วันที่คำพิพากษาตัวจริงเสร็จ',
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ชั้นอุทธรณ์';

-- Dumping data for table warehouse.appeal: ~0 rows (approximately)
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;

-- Dumping structure for table warehouse.appeal_change_appoint
CREATE TABLE IF NOT EXISTS `appeal_change_appoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case` int(11) DEFAULT NULL,
  `appeal` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table warehouse.appeal_change_appoint: ~0 rows (approximately)
/*!40000 ALTER TABLE `appeal_change_appoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `appeal_change_appoint` ENABLE KEYS */;

-- Dumping structure for table warehouse.bailtype
CREATE TABLE IF NOT EXISTS `bailtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ประเภทประกัน';

-- Dumping data for table warehouse.bailtype: ~4 rows (approximately)
/*!40000 ALTER TABLE `bailtype` DISABLE KEYS */;
INSERT INTO `bailtype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'บุคคล', '2017-11-02 10:23:07', '2017-11-02 10:23:08'),
	(2, 'เงินสด', '2017-11-02 10:23:40', '2017-11-02 10:23:41'),
	(3, 'หลักทรัพย์', '2017-11-02 10:23:55', '2017-11-02 10:23:56'),
	(4, 'เงินสด+หลักทรัพย์', '2017-11-02 10:24:13', '2017-11-02 10:24:13');
/*!40000 ALTER TABLE `bailtype` ENABLE KEYS */;

-- Dumping structure for table warehouse.case
CREATE TABLE IF NOT EXISTS `case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `black_abb` varchar(100) DEFAULT NULL,
  `black_no` varchar(100) DEFAULT NULL,
  `black_year` varchar(100) DEFAULT NULL,
  `recieve_date` date DEFAULT NULL,
  `red_abb` varchar(100) DEFAULT NULL,
  `red_no` varchar(100) DEFAULT NULL,
  `red_year` varchar(100) DEFAULT NULL,
  `judgement_date` date DEFAULT NULL COMMENT 'วันตัดสินคดี',
  `injustice_place` int(11) DEFAULT NULL COMMENT '2 = inter , 1 = local',
  `accusation_tail` text DEFAULT NULL COMMENT 'ฐานความผิดท้ายฟ้อง',
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='3 : รับฟ้องคดี';

-- Dumping data for table warehouse.case: ~36 rows (approximately)
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` (`id`, `department`, `sector`, `casetype`, `black_abb`, `black_no`, `black_year`, `recieve_date`, `red_abb`, `red_no`, `red_year`, `judgement_date`, `injustice_place`, `accusation_tail`, `comment`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 101, 1, 'อ.', '139', '2558', '2015-01-13', '', '1730', '2558', '2015-03-19', 1, NULL, NULL, '2017-10-27 13:43:58', '2017-11-03 12:59:01'),
	(2, 1, 102, 2, 'คม.', '55', '2558', '2017-11-01', 'คม.', '555', '2558', '2017-10-27', NULL, NULL, NULL, '2017-10-27 13:52:54', '2017-10-31 14:30:48'),
	(3, 1, 103, 3, 'คคม.', '33', '2558', '2017-11-01', 'คคม.', '333', '2558', '2017-10-27', NULL, NULL, NULL, '2017-10-27 15:07:06', '2017-10-31 14:31:04'),
	(4, 1, 104, 4, 'ปม.', '44', '2558', '2017-10-27', 'ปม.', '444', '2558', '2017-10-27', NULL, NULL, NULL, '2017-10-27 15:10:06', '2017-10-31 14:31:10'),
	(5, 1, 105, 1, 'คม.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-30 09:21:12', '2017-10-31 14:31:15'),
	(7, NULL, NULL, 1, NULL, '1/2558', NULL, '2017-10-26', NULL, '101/2558', NULL, NULL, NULL, NULL, NULL, '2017-10-31 09:34:08', '2017-10-31 09:34:08'),
	(8, NULL, NULL, 1, NULL, '1/2558', NULL, '2017-10-26', NULL, '101/2558', NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:41:27', '2017-10-31 14:41:27'),
	(9, 1, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:00:39', '2017-10-31 15:00:39'),
	(10, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:13:15', '2017-10-31 15:13:15'),
	(11, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:13:18', '2017-10-31 15:13:18'),
	(12, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:13:19', '2017-10-31 15:13:19'),
	(13, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:13:20', '2017-10-31 15:13:20'),
	(14, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:02', '2017-10-31 15:14:02'),
	(15, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:03', '2017-10-31 15:14:03'),
	(16, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:04', '2017-10-31 15:14:04'),
	(17, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:04', '2017-10-31 15:14:04'),
	(18, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:05', '2017-10-31 15:14:05'),
	(19, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:06', '2017-10-31 15:14:06'),
	(20, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:14:06', '2017-10-31 15:14:06'),
	(21, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 15:30:26', '2017-10-31 15:30:26'),
	(22, 1, 104, 1, 'อ.', '12', '60', '2017-10-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 16:28:28', '2017-10-31 16:28:28'),
	(23, 1, 104, 1, 'อ.', '112', '59', '2017-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:42:01', '2017-11-01 16:42:01'),
	(24, 1, 104, 1, 'v.', '113', '59', '2017-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:46:01', '2017-11-01 16:46:01'),
	(25, 1, 104, 2, 'อ.', '12', '64', '2017-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-01 16:48:12', '2017-11-01 16:48:12'),
	(26, 1, 101, 1, 'อ.', '2', '60', '2017-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-02 08:47:10', '2017-11-02 08:47:10'),
	(27, 1, 101, 1, 'อ.', '2', '60', '2017-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-02 08:47:16', '2017-11-02 08:47:16'),
	(28, 2, 201, 1, 'คม.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-02 08:49:24', '2017-11-02 08:49:24'),
	(29, 2, 201, NULL, 'คม.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-02 15:31:40', '2017-11-02 15:31:40'),
	(30, 2, 201, NULL, 'คม.', NULL, NULL, '2017-11-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-11-02 15:37:07', '2017-11-02 15:37:07'),
	(31, NULL, NULL, NULL, 'อ.', '234', '50', '2017-03-01', 'อ.', '234', '50', '2017-05-31', 2, NULL, NULL, '2017-11-03 08:45:11', '2017-11-03 08:45:11'),
	(31, NULL, NULL, NULL, 'อ.', '234', '50', '2017-03-01', 'อ.', '234', '50', '2017-05-31', 2, NULL, NULL, '2017-11-03 08:48:17', '2017-11-03 08:48:17'),
	(31, NULL, NULL, NULL, 'อ.', '234', '50', '2017-03-01', 'อ.', '234', '51', '2017-05-31', 2, NULL, NULL, '2017-11-03 08:48:23', '2017-11-03 08:48:23'),
	(32, 1, 104, 1, 'อ.', 'ึ78', '60', '2000-01-01', 'อ.', '89', 'ุ60', '2000-01-31', 1, NULL, NULL, '2017-11-03 08:56:58', '2017-11-03 08:56:58'),
	(33, 1, 101, 1, '123', '123', '123', '2017-01-31', '234', '234', '234', '2017-01-31', 1, '12', NULL, '2017-11-03 09:02:25', '2017-11-03 09:42:27'),
	(34, 1, 101, 2, '123', '123', '122', '2016-12-31', '01', '01', '123', '2016-12-31', 1, '123', 'ทดลองเปลี่ยน type', '2017-11-03 09:45:22', '2017-11-03 09:50:24'),
	(35, 1, 101, 1, 'อ.', '13', '50', '2016-10-01', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2017-11-03 13:25:14', '2017-11-03 13:25:14');
/*!40000 ALTER TABLE `case` ENABLE KEYS */;

-- Dumping structure for table warehouse.casetype
CREATE TABLE IF NOT EXISTS `casetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='1 : ประเภทคดี';

-- Dumping data for table warehouse.casetype: ~4 rows (approximately)
/*!40000 ALTER TABLE `casetype` DISABLE KEYS */;
INSERT INTO `casetype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'ความผิดตามประมวลกฎหมายอาญา มาตรา 112', '2017-10-27 13:35:12', '2017-10-27 13:41:22'),
	(2, 'ความผิดต่อพระราชบัญญัติป้องกันและปราบปรามการค้ามนุษย์ พ.ศ.2551', '2017-10-27 13:35:26', '2017-10-27 13:40:38'),
	(3, 'ความผิดต่อความมั่นคง', '2017-10-27 13:36:25', '2017-10-27 13:36:25'),
	(4, 'ความผิดต่อพระราชกำหนดการประมง พ.ศ.2558', '2017-10-27 13:37:10', '2017-10-27 13:37:10');
/*!40000 ALTER TABLE `casetype` ENABLE KEYS */;

-- Dumping structure for table warehouse.department
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `connection` text DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1 : สังกัดหน่วยงาน';

-- Dumping data for table warehouse.department: ~15 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`, `name`, `remark`, `connection`, `createdAt`, `updatedAt`) VALUES
	(0, 'หน่วยงานส่วนกลาง', '', NULL, NULL, '2017-11-02 06:46:36'),
	(1, 'สำนักศาลยุติธรรมประจำภาค 1', '', NULL, NULL, '2017-10-31 14:12:13'),
	(10, 'ศาลสูง', '', NULL, NULL, '2017-10-31 14:12:13'),
	(11, 'ศาลพิเศษ', '', NULL, NULL, '2017-10-31 14:12:13'),
	(12, 'ศาลชำนัญพิเศษ', '', NULL, NULL, '2017-10-31 14:12:13'),
	(13, 'ศาลชั้นต้นในเขตกรุงเทพมหานคร', '', NULL, NULL, '2017-10-31 14:12:13'),
	(14, 'ศาลชั้นต้น', NULL, NULL, '2017-11-02 06:10:49', '2017-11-02 06:10:59'),
	(2, 'สำนักศาลยุติธรรมประจำภาค 2', '', NULL, NULL, '2017-10-31 14:12:13'),
	(3, 'สำนักศาลยุติธรรมประจำภาค 3', '', NULL, NULL, '2017-10-31 14:12:13'),
	(4, 'สำนักศาลยุติธรรมประจำภาค 4', '', NULL, NULL, '2017-10-31 14:12:13'),
	(5, 'สำนักศาลยุติธรรมประจำภาค 5', '', NULL, NULL, '2017-10-31 14:12:13'),
	(6, 'สำนักศาลยุติธรรมประจำภาค 6', '', NULL, NULL, '2017-10-31 14:12:13'),
	(7, 'สำนักศาลยุติธรรมประจำภาค 7', '', NULL, NULL, '2017-10-31 14:12:13'),
	(8, 'สำนักศาลยุติธรรมประจำภาค 8', '', NULL, NULL, '2017-10-31 14:12:13'),
	(9, 'สำนักศาลยุติธรรมประจำภาค 9', '', NULL, NULL, '2017-10-31 14:12:13');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table warehouse.dismissaltype
CREATE TABLE IF NOT EXISTS `dismissaltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ประเภทยกฟ้อง';

-- Dumping data for table warehouse.dismissaltype: ~4 rows (approximately)
/*!40000 ALTER TABLE `dismissaltype` DISABLE KEYS */;
INSERT INTO `dismissaltype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'ไม่ครบองค์ประกอบ', '2017-11-03 05:16:02', '2017-11-03 05:16:02'),
	(2, 'ขาดพยานหลักฐาน', '2017-11-03 05:16:18', '2017-11-03 05:16:18'),
	(3, 'ยกประโยชน์แห่งความสงสัย', '2017-11-03 05:16:41', '2017-11-03 05:16:42'),
	(4, 'อื่นๆ', '2017-11-03 05:16:51', '2017-11-03 05:16:52');
/*!40000 ALTER TABLE `dismissaltype` ENABLE KEYS */;

-- Dumping structure for table warehouse.highjudgementtype
CREATE TABLE IF NOT EXISTS `highjudgementtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table warehouse.highjudgementtype: ~4 rows (approximately)
/*!40000 ALTER TABLE `highjudgementtype` DISABLE KEYS */;
INSERT INTO `highjudgementtype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'ยืน', '2017-11-03 08:48:05', '2017-11-03 08:48:06'),
	(2, 'ยก', '2017-11-03 08:48:15', '2017-11-03 08:48:16'),
	(3, 'กลับ', '2017-11-03 08:49:20', '2017-11-03 08:49:20'),
	(4, 'แก้', '2017-11-03 08:49:36', '2017-11-03 08:49:36');
/*!40000 ALTER TABLE `highjudgementtype` ENABLE KEYS */;

-- Dumping structure for table warehouse.imprisoned
CREATE TABLE IF NOT EXISTS `imprisoned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) NOT NULL DEFAULT 0,
  `sector` int(11) NOT NULL DEFAULT 0,
  `casetype` int(11) NOT NULL DEFAULT 0,
  `case` int(11) NOT NULL DEFAULT 0,
  `accused` int(11) NOT NULL DEFAULT 0,
  `bailtype` int(11) NOT NULL DEFAULT 0,
  `no` int(11) NOT NULL DEFAULT 0,
  `black_abb` varchar(50) NOT NULL DEFAULT '0',
  `black_no` varchar(50) NOT NULL DEFAULT '0',
  `black_year` varchar(50) NOT NULL DEFAULT '0',
  `requester_name` varchar(255) DEFAULT NULL COMMENT 'ชื่อผู้ร้อง',
  `arrest_date` date DEFAULT NULL COMMENT 'วันที่จับกุม',
  `imprisoned_time` int(11) NOT NULL DEFAULT 0,
  `imprisoned_start_date` date DEFAULT NULL COMMENT 'วันที่ฝากขัง',
  `imprisoned_end_date` date DEFAULT NULL COMMENT 'วันครบกำหนดฝากขัง',
  `temporary_release_time` int(11) NOT NULL DEFAULT 0 COMMENT 'การปล่อยตัวชั่วคราว',
  `bail_price` double NOT NULL DEFAULT 0 COMMENT 'ราคาประกัน (บาท)',
  `comment` text NOT NULL DEFAULT '\'0\'' COMMENT 'หมายเหตุ',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ชั้นฝากขัง';

-- Dumping data for table warehouse.imprisoned: ~0 rows (approximately)
/*!40000 ALTER TABLE `imprisoned` DISABLE KEYS */;
/*!40000 ALTER TABLE `imprisoned` ENABLE KEYS */;

-- Dumping structure for table warehouse.investigatetype
CREATE TABLE IF NOT EXISTS `investigatetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='การสืบพยานล่วงหน้า';

-- Dumping data for table warehouse.investigatetype: ~5 rows (approximately)
/*!40000 ALTER TABLE `investigatetype` DISABLE KEYS */;
INSERT INTO `investigatetype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'ไม่มีการขอสืบ', '2017-11-02 15:32:53', '2017-11-02 15:32:54'),
	(2, 'มีการขอสืบ', '2017-11-02 15:33:12', '2017-11-02 15:33:13'),
	(3, 'ขอสืบ(ปาก)', '2017-11-02 15:37:09', '2017-11-02 15:37:09'),
	(4, 'ศาลยกคำร้องขอสืบ', '2017-11-02 15:37:35', '2017-11-02 15:37:35'),
	(5, 'ศาลยกคำร้องขอสืบ(ปาก)', '2017-11-02 15:38:35', '2017-11-02 15:38:36');
/*!40000 ALTER TABLE `investigatetype` ENABLE KEYS */;

-- Dumping structure for table warehouse.judgement
CREATE TABLE IF NOT EXISTS `judgement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `prosecutor` int(11) DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `testimonytype` int(11) DEFAULT NULL COMMENT 'ประเภทคำให้การ',
  `investigatetype` int(11) DEFAULT NULL COMMENT 'ประเภทการสืบ (ดึงข้อมูล)',
  `check_evidence_date` date DEFAULT NULL COMMENT 'วันที่ตรวจพยานหลักฐาน',
  `amount_witness_prosecutor` int(11) DEFAULT NULL COMMENT 'จำนวนพยานโจทก์',
  `amount_witness_accused` int(11) DEFAULT NULL COMMENT 'จำนวนพยานจำเลย',
  `investigate_date` date DEFAULT NULL COMMENT 'วันที่สืบพยาน',
  `interpreter` int(11) DEFAULT NULL COMMENT 'ใช้ล่าม 1 = มี, 2 = ไม่มี',
  `conference` int(11) DEFAULT NULL COMMENT 'มีการใช้ conferrence 1=มี 2=ไม่มี',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ข้อมูลชั้นพิจารณา 1';

-- Dumping data for table warehouse.judgement: ~1 rows (approximately)
/*!40000 ALTER TABLE `judgement` DISABLE KEYS */;
INSERT INTO `judgement` (`id`, `department`, `sector`, `prosecutor`, `case`, `casetype`, `testimonytype`, `investigatetype`, `check_evidence_date`, `amount_witness_prosecutor`, `amount_witness_accused`, `investigate_date`, `interpreter`, `conference`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 101, 1, 1, 1, 1, 1, '2017-11-03', 3, 4, '2017-11-03', 0, 0, '2017-11-03 11:43:56', '2017-11-03 11:43:57');
/*!40000 ALTER TABLE `judgement` ENABLE KEYS */;

-- Dumping structure for table warehouse.judgementstatus
CREATE TABLE IF NOT EXISTS `judgementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `prosecutor` int(11) DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `dismissaltype` int(11) DEFAULT NULL COMMENT 'ผลคำพิพากษา=>กรณียกฟ้อง',
  `end_in_first` int(11) DEFAULT NULL COMMENT 'คดีถึงที่สุดในศาลชั้นต้น',
  `end_in_appeal` int(11) DEFAULT NULL COMMENT 'คดีถึงที่สุดในศาลอุทธรณ์',
  `end_in_supreme` int(11) DEFAULT NULL COMMENT 'คดีถึงที่สุดในศาลชั้นฎีกา',
  `proceed_on_first` int(11) DEFAULT NULL COMMENT 'กำลังดำเนินการในชั้นต้น',
  `proceed_on_appeal` int(11) DEFAULT NULL COMMENT 'กำลังดำเนินการในชั้นอุทธรณ์',
  `proceed_on_supreme` int(11) DEFAULT NULL COMMENT 'กำลังดำเนินการในชั้นฎีกา',
  `first_judgement_date` date DEFAULT NULL COMMENT 'วันที่ศาลชั้นต้นมีคำพิพากษา',
  `judgement_paper_status` int(11) DEFAULT NULL COMMENT 'สถานะคำพิพากษาตัวจริง',
  `judgement_paper_date` int(11) DEFAULT NULL COMMENT 'วันที่คำพิพากษาตัวจริงเสร็จ',
  `end_by` int(11) DEFAULT NULL COMMENT '1 = รับสารภาพ, 2 = สืบพยาน',
  `result_penalize` text DEFAULT NULL COMMENT 'ผลคำพิพากษา=>กรณีลงโทษ',
  `judgement_dismiss_other` text DEFAULT NULL COMMENT 'กรณียกฟ้อง อื่นๆ เขียนเพิ่มเติม',
  `claims_status` int(11) DEFAULT NULL COMMENT 'ผู้เสียหายยื่นคำร้องขอค่าสินไหมทดแทนตามป.วิอาญาม. 44/1',
  `claims_price` text DEFAULT NULL COMMENT 'พิพากษาให้ค่าสินไหมทดแทน(บาท)',
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='สถานะของคดี (ข้อมูลชั้นพิจารณา2)';

-- Dumping data for table warehouse.judgementstatus: ~0 rows (approximately)
/*!40000 ALTER TABLE `judgementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `judgementstatus` ENABLE KEYS */;

-- Dumping structure for table warehouse.judgement_change_appoint
CREATE TABLE IF NOT EXISTS `judgement_change_appoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case` int(11) DEFAULT NULL,
  `judgementstatus` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table warehouse.judgement_change_appoint: ~0 rows (approximately)
/*!40000 ALTER TABLE `judgement_change_appoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `judgement_change_appoint` ENABLE KEYS */;

-- Dumping structure for table warehouse.prosecutor
CREATE TABLE IF NOT EXISTS `prosecutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `person_type` int(11) NOT NULL DEFAULT 1 COMMENT 'ราษฎร = 1, เจ้าหน้าที่รัฐ = 2',
  `connection` text DEFAULT NULL COMMENT 'System require',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='4 : โจทก์';

-- Dumping data for table warehouse.prosecutor: ~14 rows (approximately)
/*!40000 ALTER TABLE `prosecutor` DISABLE KEYS */;
INSERT INTO `prosecutor` (`id`, `case`, `name`, `person_type`, `connection`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 'นายโจทก์ โจทก์', 1, NULL, '2017-11-01 14:49:26', '2017-11-02 15:49:24'),
	(2, 2, 'พนักงานอัยการ สำนักงานอัยการสูงสุด', 1, NULL, '2017-11-01 15:15:29', '2017-11-02 15:49:29'),
	(3, 3, 'พนักงานอัยการ สำนักงานอัยการสูงสุด', 1, NULL, '2017-11-03 11:13:53', '2017-11-03 11:16:51'),
	(4, NULL, 'นายก', 1, NULL, '2017-11-03 11:27:06', '2017-11-03 11:27:06'),
	(5, 33, 'นายก', 1, NULL, '2017-11-03 11:28:56', '2017-11-03 11:28:56'),
	(6, 34, '34', 1, NULL, '2017-11-03 11:32:52', '2017-11-03 11:32:52'),
	(7, 34, '34', 1, NULL, '2017-11-03 11:33:15', '2017-11-03 11:33:15'),
	(8, 34, 'นายก', 1, NULL, '2017-11-03 11:40:44', '2017-11-03 11:40:44'),
	(9, 34, 'นายข', 1, NULL, '2017-11-03 11:56:39', '2017-11-03 11:56:39'),
	(10, 34, 'นายค', 1, NULL, '2017-11-03 12:00:48', '2017-11-03 12:00:48'),
	(11, 34, 'นางง', 1, NULL, '2017-11-03 12:02:22', '2017-11-03 12:02:22'),
	(12, 34, 'นางง2', 1, NULL, '2017-11-03 12:05:59', '2017-11-03 12:05:59'),
	(13, 34, '36', 1, NULL, '2017-11-03 12:07:58', '2017-11-03 12:08:13'),
	(14, 35, 'นายก', 1, NULL, '2017-11-03 13:33:03', '2017-11-03 13:33:03');
/*!40000 ALTER TABLE `prosecutor` ENABLE KEYS */;

-- Dumping structure for table warehouse.release
CREATE TABLE IF NOT EXISTS `release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `prosecutor` int(11) DEFAULT NULL,
  `accused` int(11) DEFAULT NULL,
  `warrant_detention_date` date DEFAULT NULL COMMENT 'วันที่ออกหมายขัง',
  `warrant_release_date` date DEFAULT NULL COMMENT 'วันที่ออกหมายจำคุก',
  `warrant_imprison_date` date DEFAULT NULL COMMENT 'วันที่ออกหมายจำคุก',
  `warrant_arrest_had` int(11) DEFAULT NULL,
  `warrant_arrest_finish` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `connection` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='5 : ปล่อยตัวชั่วคราวและหมายจับ';

-- Dumping data for table warehouse.release: ~1 rows (approximately)
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
INSERT INTO `release` (`id`, `department`, `sector`, `casetype`, `case`, `prosecutor`, `accused`, `warrant_detention_date`, `warrant_release_date`, `warrant_imprison_date`, `warrant_arrest_had`, `warrant_arrest_finish`, `comment`, `connection`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 101, 1, 1, 1, 1, '2017-11-02', '2017-11-02', '2017-11-02', NULL, NULL, NULL, NULL, '2017-11-02 10:39:20', '2017-11-02 10:47:00');
/*!40000 ALTER TABLE `release` ENABLE KEYS */;

-- Dumping structure for table warehouse.release_bail
CREATE TABLE IF NOT EXISTS `release_bail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `release` int(11) DEFAULT NULL,
  `bailtype` int(11) DEFAULT NULL COMMENT 'ประเภทหลักประกัน',
  `bail_price` double DEFAULT NULL COMMENT 'ราคาประกัน',
  `time` int(11) DEFAULT NULL COMMENT 'ขอปล่อยตัวครั้งที่',
  `first_injunction` int(11) DEFAULT NULL COMMENT 'คำสั่งศาลชั้นต้น (อนุญาต/ไม่อนุญาต)',
  `appeal_injunction` int(11) DEFAULT NULL COMMENT 'คำสั่งศาลชั้นอุทธรณ์ (อนุญาต/ไม่อนุญาต)',
  `supreme_injunction` int(11) DEFAULT NULL COMMENT 'คำสั่งศาลชั้นฎีกา (อนุญาต/ไม่อนุญาต)',
  `accused_escape` int(11) DEFAULT NULL COMMENT 'จำเลยหนีระหว่างปล่อยตัว',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ปล่อยตัว และการทำประกัน';

-- Dumping data for table warehouse.release_bail: ~2 rows (approximately)
/*!40000 ALTER TABLE `release_bail` DISABLE KEYS */;
INSERT INTO `release_bail` (`id`, `release`, `bailtype`, `bail_price`, `time`, `first_injunction`, `appeal_injunction`, `supreme_injunction`, `accused_escape`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, 160000, 1, 1, 0, 0, 0, '2017-11-02 11:54:29', '2017-11-02 11:54:30'),
	(2, 1, 1, 160000, 1, 0, 1, 0, 0, '2017-11-02 11:55:03', '2017-11-02 11:55:03');
/*!40000 ALTER TABLE `release_bail` ENABLE KEYS */;

-- Dumping structure for table warehouse.sector
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(11) NOT NULL COMMENT 'รหัสหน่วยงาน',
  `department` int(11) DEFAULT NULL COMMENT 'ภาค',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อหน่วยงาน',
  `worktype` char(1) DEFAULT NULL COMMENT 'ปรเภทหน่วยงาน 1 ส่วนกลาง 2 ศาลไม่สังกัดภาค 3ภาค 4ศาลในภาค 5หน่วยงานภายนอก',
  `judge` int(11) DEFAULT NULL COMMENT 'จำนวนผู้พิพากษา',
  `officer` int(11) DEFAULT NULL COMMENT 'จำนวนข้าราชการ',
  `officer2` int(11) DEFAULT NULL COMMENT 'จำนวนพนักงานราชการ',
  `officer3` int(11) DEFAULT NULL COMMENT 'จำนวนลูกจ้างประจำ',
  `officer4` int(11) DEFAULT NULL COMMENT 'จำนวนลูกจ้างชั่วคราว',
  `connection` text DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2 : ชื่อศาล';

-- Dumping data for table warehouse.sector: ~273 rows (approximately)
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` (`id`, `department`, `name`, `worktype`, `judge`, `officer`, `officer2`, `officer3`, `officer4`, `connection`, `createdAt`, `updatedAt`) VALUES
	(1, 0, 'สำนักประธานศาลฎีกา', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(3, 0, 'สำนักคณะกรรมการตุลาการศาลยุติธรรม (ก.ต.)', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(4, 0, 'สำนักคณะกรรมการข้าราชการศาลยุติธรรม (ก.ศ.)', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(5, 0, 'สำนักบริหารกลางและสวัสดิการ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(6, 0, 'หน่วยตรวจสอบภายใน', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(7, 0, 'กองการต่างประเทศ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(8, 0, 'ศูนย์วิทยบริการศาลยุติธรรม', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(9, 0, 'กองสารนิเทศและประชาสัมพันธ์', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(10, 0, 'กองออกแบบและก่อสร้าง', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(11, 0, 'สถาบันพัฒนาข้าราชการฝ่ายตุลาการศาลยุติธรรม', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(12, 0, 'สำนักการคลัง', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(13, 0, 'สำนักเทคโนโลยีสารสนเทศ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(14, 0, 'สำนักระงับข้อพิพาท', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(15, 0, 'สำนักแผนงานและงบประมาณ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(16, 0, 'สำนักกฎหมายและวิชาการศาลยุติธรรม', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(17, 0, 'สถาบันวิจัยรพีพัฒนศักดิ์', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(18, 0, 'กองบริหารทรัพย์สิน', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(19, 0, 'หน่วยตรวจราชการ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(20, 0, 'โรงพยาบาลตุลาการเฉลิมพระเกียรติ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(21, 0, 'สำนักพัฒนาระบบงาน', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(22, 0, 'สำนักรักษาความปลอดภัยและสถานที่', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(23, 0, 'กองสวัสดิการศาลยุติธรรม', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(25, 10, 'ศาลฎีกา', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(26, 10, 'ศาลอุทธรณ์', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(27, 10, 'ศาลอุทธรณ์ภาค 1', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(28, 10, 'ศาลอุทธรณ์ภาค 2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(29, 10, 'ศาลอุทธรณ์ภาค 3', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(30, 10, 'ศาลอุทธรณ์ภาค 4', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(31, 10, 'ศาลอุทธรณ์ภาค 5', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(32, 10, 'ศาลอุทธรณ์ภาค 6', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(33, 10, 'ศาลอุทธรณ์ภาค 7', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(34, 10, 'ศาลอุทธรณ์ภาค 8', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(35, 10, 'ศาลอุทธรณ์ภาค 9', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(36, 11, 'ศาลเยาวชนและครอบครัวกลาง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(37, 12, 'ศาลแรงงานกลาง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(38, 12, 'ศาลภาษีอากรกลาง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(39, 12, 'ศาลทรัพย์สินทางปัญญาและการค้าระหว่างประเทศกลาง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(40, 12, 'ศาลล้มละลายกลาง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(41, 13, 'ศาลแพ่ง', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(42, 13, 'ศาลอาญา', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(43, 13, 'ศาลแพ่งธนบุรี', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(44, 13, 'ศาลอาญาธนบุรี', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(45, 13, 'ศาลแพ่งกรุงเทพใต้', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(46, 13, 'ศาลอาญากรุงเทพใต้', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(100, 1, 'สำนักศาลยุติธรรมประจำภาค 1', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(101, 1, 'ศาลแขวงพระนครเหนือ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(102, 1, 'ศาลแขวงดุสิต', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(103, 1, 'ศาลแขวงธนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(104, 1, 'ศาลแขวงพระนครใต้', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(105, 1, 'ศาลจังหวัดตลิ่งชัน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(106, 1, 'ศาลจังหวัดพระโขนง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(107, 1, 'ศาลแขวงปทุมวัน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(108, 1, 'ศาลจังหวัดมีนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(109, 1, 'ศาลจังหวัดพระนครศรีอยุธยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(110, 1, 'ศาลแขวงพระนครศรีอยุธยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(111, 1, 'ศาลจังหวัดลพบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(112, 1, 'ศาลแขวงลพบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(113, 1, 'ศาลจังหวัดชัยนาท', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(114, 1, 'ศาลจังหวัดสิงห์บุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(115, 1, 'ศาลจังหวัดอ่างทอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(116, 1, 'ศาลจังหวัดสระบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(117, 1, 'ศาลจังหวัดปทุมธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(118, 1, 'ศาลจังหวัดธัญบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(119, 1, 'ศาลจังหวัดนนทบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(120, 1, 'ศาลแขวงนนทบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(121, 1, 'ศาลจังหวัดสมุทรปราการ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(122, 1, 'ศาลแขวงสมุทรปราการ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(123, 1, 'ศาลเยาวชนและครอบครัวจังหวัดนนทบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(124, 1, 'ศาลเยาวชนและครอบครัวจังหวัดสมุทรปราการ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(125, 1, 'ศาลเยาวชนและครอบครัวจังหวัดพระนครศรีอยุธยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(126, 1, 'ศาลเยาวชนและครอบครัวจังหวัดปทุมธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(127, 1, 'ศาลเยาวชนและครอบครัวจังหวัดสระบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(128, 1, 'ศาลเยาวชนและครอบครัวจังหวัดสิงห์บุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(129, 1, 'ศาลแรงงานภาค 1', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(131, 1, 'ศาลเยาวชนและครอบครัวจังหวัดอ่างทอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(132, 1, 'ศาลเยาวชนและครอบครัวจังหวัดลพบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(133, 1, 'ศาลจังหวัดชัยบาดาล', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(134, 1, 'ศาลเยาวชนและครอบครัวจังหวัดชัยนาท', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(135, 1, 'ศาลเยาวชนและครอบครัวกลาง (สาขามีนบุรี)', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(200, 2, 'สำนักศาลยุติธรรมประจำภาค 2', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(201, 2, 'ศาลจังหวัดชลบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(202, 2, 'ศาลแขวงชลบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(203, 2, 'ศาลจังหวัดฉะเชิงเทรา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(204, 2, 'ศาลจังหวัดนครนายก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(205, 2, 'ศาลจังหวัดปราจีนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(206, 2, 'ศาลจังหวัดกบินทร์บุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(207, 2, 'ศาลจังหวัดระยอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(208, 2, 'ศาลจังหวัดตราด', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(209, 2, 'ศาลจังหวัดจันทบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(210, 2, 'ศาลเยาวชนและครอบครัวจังหวัดระยอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(211, 2, 'ศาลเยาวชนและครอบครัวจังหวัดชลบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(212, 2, 'ศาลเยาวชนและครอบครัวจังหวัดจันทบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(213, 2, 'ศาลจังหวัดพัทยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(214, 2, 'ศาลจังหวัดสระแก้ว', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(216, 2, 'ศาลเยาวชนและครอบครัวจังหวัดฉะเชิงเทรา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(217, 2, 'ศาลแรงงานภาค 2', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(218, 2, 'ศาลเยาวชนและครอบครัวจังหวัดตราด', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(219, 2, 'ศาลเยาวชนและครอบครัวจังหวัดสระแก้ว', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(220, 2, 'ศาลเยาวชนและครอบครัวจังหวัดปราจีนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(221, 2, 'ศาลเยาวชนและครอบครัวจังหวัดนครนายก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(300, 3, 'สำนักศาลยุติธรรมประจำภาค 3', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(301, 3, 'ศาลจังหวัดนครราชสีมา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(302, 3, 'ศาลจังหวัดบัวใหญ่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(303, 3, 'ศาลจังหวัดสีคิ้ว', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(304, 3, 'ศาลจังหวัดสีคิ้ว (ปากช่อง)', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(305, 3, 'ศาลแขวงนครราชสีมา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(306, 3, 'ศาลแขวงนครราชสีมา (พิมาย)', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(307, 3, 'ศาลจังหวัดชัยภูมิ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(308, 3, 'ศาลจังหวัดภูเขียว', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(309, 3, 'ศาลจังหวัดบุรีรัมย์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(310, 3, 'ศาลจังหวัดนางรอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(311, 3, 'ศาลจังหวัดสุรินทร์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(312, 3, 'ศาลแขวงสุรินทร์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(313, 3, 'ศาลจังหวัดศรีสะเกษ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(314, 3, 'ศาลจังหวัดอุบลราชธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(315, 3, 'ศาลแขวงอุบลราชธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(316, 3, 'ศาลจังหวัดอำนาจเจริญ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(317, 3, 'ศาลจังหวัดยโสธร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(318, 3, 'ศาลเยาวชนและครอบครัวจังหวัดนครราชสีมา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(319, 3, 'ศาลเยาวชนและครอบครัวจังหวัดอุบลราชธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(320, 3, 'ศาลเยาวชนและครอบครัวจังหวัดอำนาจเจริญ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(321, 3, 'ศาลเยาวชนและครอบครัวจังหวัดบุรีรัมย์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(322, 3, 'ศาลจังหวัดเดชอุดม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(323, 3, 'ศาลจังหวัดกันทรลักษณ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(324, 3, 'ศาลจังหวัดรัตนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(327, 3, 'ศาลเยาวชนและครอบครัวจังหวัดชัยภูมิ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(328, 3, 'ศาลเยาวชนและครอบครัวจังหวัดศรีสะเกษ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(329, 3, 'ศาลเยาวชนและครอบครัวจังหวัดสุรินทร์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(330, 3, 'ศาลเยาวชนและครอบครัวจังหวัดยโสธร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(331, 3, 'ศาลแรงงานภาค 3', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(400, 4, 'สำนักศาลยุติธรรมประจำภาค 4', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(401, 4, 'ศาลจังหวัดขอนแก่น', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(402, 4, 'ศาลจังหวัดพล', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(403, 4, 'ศาลแขวงขอนแก่น', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(404, 4, 'ศาลจังหวัดอุดรธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(405, 4, 'ศาลแขวงอุดรธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(406, 4, 'ศาลจังหวัดหนองคาย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(407, 4, 'ศาลจังหวัดบึงกาฬ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(408, 4, 'ศาลจังหวัดเลย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(409, 4, 'ศาลจังหวัดสกลนคร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(410, 4, 'ศาลจังหวัดสว่างแดนดิน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(411, 4, 'ศาลจังหวัดนครพนม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(412, 4, 'ศาลจังหวัดมุกดาหาร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(413, 4, 'ศาลจังหวัดมหาสารคาม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(414, 4, 'ศาลจังหวัดร้อยเอ็ด', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(415, 4, 'ศาลจังหวัดกาฬสินธุ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(416, 4, 'ศาลเยาวชนและครอบครัวจังหวัดขอนแก่น', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(417, 4, 'ศาลเยาวชนและครอบครัวจังหวัดอุดรธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(418, 4, 'ศาลเยาวชนและครอบครัวจังหวัดร้อยเอ็ด', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(419, 4, 'ศาลเยาวชนและครอบครัวจังหวัดนครพนม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(420, 4, 'ศาลจังหวัดหนองบัวลำภู', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(421, 4, 'ศาลแรงงานภาค 4', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(422, 4, 'ศาลเยาวชนและครอบครัวจังหวัดหนองบัวลำภู', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(423, 4, 'ศาลเยาวชนและครอบครัวจังหวัดมุกดาหาร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(424, 4, 'ศาลเยาวชนและครอบครัวจังหวัดหนองคาย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(425, 4, 'ศาลเยาวชนและครอบครัวจังหวัดเลย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(426, 4, 'ศาลเยาวชนและครอบครัวจังหวัดสกลนคร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(427, 4, 'ศาลเยาวชนและครอบครัวจังหวัดมหาสารคาม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(428, 4, 'ศาลเยาวชนและครอบครัวจังหวัดกาฬสินธุ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(429, 4, 'ศาลเยาวชนและครอบครัวจังหวัดบึงกาฬ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(500, 5, 'สำนักศาลยุติธรรมประจำภาค 5', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(501, 5, 'ศาลจังหวัดเชียงใหม่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(502, 5, 'ศาลแขวงเชียงใหม่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(503, 5, 'ศาลจังหวัดฝาง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(504, 5, 'ศาลจังหวัดลำปาง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(505, 5, 'ศาลแขวงลำปาง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(506, 5, 'ศาลจังหวัดแม่ฮ่องสอน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(507, 5, 'ศาลจังหวัดแม่สะเรียง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(508, 5, 'ศาลจังหวัดเชียงราย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(509, 5, 'ศาลจังหวัดพะเยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(510, 5, 'ศาลจังหวัดน่าน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(511, 5, 'ศาลจังหวัดลำพูน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(512, 5, 'ศาลจังหวัดแพร่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(513, 5, 'ศาลเยาวชนและครอบครัวจังหวัดเชียงใหม่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(514, 5, 'ศาลเยาวชนและครอบครัวจังหวัดลำปาง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(515, 5, 'ศาลแรงงานภาค 5', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(516, 5, 'ศาลเยาวชนและครอบครัวจังหวัดเชียงราย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(517, 5, 'ศาลเยาวชนและครอบครัวจังหวัดแพร่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(518, 5, 'ศาลเยาวชนและครอบครัวจังหวัดน่าน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(519, 5, 'ศาลเยาวชนและครอบครัวจังหวัดลำพูน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(520, 5, 'ศาลเยาวชนและครอบครัวจังหวัดพะเยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(521, 5, 'ศาลจังหวัดเทิง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(522, 5, 'ศาลเยาวชนและครอบครัวจังหวัดแม่ฮ่องสอน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(600, 6, 'สำนักศาลยุติธรรมประจำภาค 6', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(601, 6, 'ศาลจังหวัดพิษณุโลก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(602, 6, 'ศาลแขวงพิษณุโลก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(603, 6, 'ศาลจังหวัดสุโขทัย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(604, 6, 'ศาลจังหวัดสวรรคโลก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(605, 6, 'ศาลจังหวัดอุตรดิตถ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(606, 6, 'ศาลจังหวัดตาก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(607, 6, 'ศาลจังหวัดแม่สอด', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(608, 6, 'ศาลจังหวัดกำแพงเพชร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(609, 6, 'ศาลจังหวัดพิจิตร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(610, 6, 'ศาลจังหวัดเพชรบูรณ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(611, 6, 'ศาลจังหวัดหล่มสัก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(612, 6, 'ศาลจังหวัดนครสวรรค์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(613, 6, 'ศาลแขวงนครสวรรค์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(614, 6, 'ศาลจังหวัดอุทัยธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(615, 6, 'ศาลเยาวชนและครอบครัวจังหวัดนครสวรรค์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(616, 6, 'ศาลเยาวชนและครอบครัวจังหวัดพิษณุโลก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(617, 6, 'ศาลแรงงานภาค 6', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(618, 6, 'ศาลเยาวชนและครอบครัวจังหวัดสุโขทัย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(619, 6, 'ศาลเยาวชนและครอบครัวจังหวัดเพชรบูรณ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(620, 6, 'ศาลเยาวชนและครอบครัวจังหวัดกำแพงเพชร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(621, 6, 'ศาลเยาวชนและครอบครัวจังหวัดอุตรดิตถ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(622, 6, 'ศาลเยาวชนและครอบครัวจังหวัดพิจิตร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(623, 6, 'ศาลเยาวชนและครอบครัวจังหวัดอุทัยธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(624, 6, 'ศาลเยาวชนและครอบครัวจังหวัดตาก', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(700, 7, 'สำนักศาลยุติธรรมประจำภาค 7', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(701, 7, 'ศาลจังหวัดนครปฐม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(702, 7, 'ศาลแขวงนครปฐม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(703, 7, 'ศาลจังหวัดราชบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(704, 7, 'ศาลแขวงราชบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(705, 7, 'ศาลจังหวัดสุพรรณบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(706, 7, 'ศาลแขวงสุพรรณบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(707, 7, 'ศาลจังหวัดกาญจนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(708, 7, 'ศาลจังหวัดทองผาภูมิ', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(709, 7, 'ศาลจังหวัดเพชรบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(710, 7, 'ศาลจังหวัดประจวบคีรีขันธ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(711, 7, 'ศาลจังหวัดสมุทรสาคร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(712, 7, 'ศาลจังหวัดสมุทรสงคราม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(713, 7, 'ศาลเยาวชนและครอบครัวจังหวัดนครปฐม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(714, 7, 'ศาลเยาวชนและครอบครัวจังหวัดสุพรรณบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(715, 7, 'ศาลเยาวชนและครอบครัวจังหวัดราชบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(716, 7, 'ศาลเยาวชนและครอบครัวจังหวัดกาญจนบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(717, 7, 'ศาลแรงงานภาค 7', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(718, 7, 'ศาลเยาวชนและครอบครัวจังหวัดเพชรบุรี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(719, 7, 'ศาลเยาวชนและครอบครัวจังหวัดประจวบคีรีขันธ์', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(720, 7, 'ศาลเยาวชนและครอบครัวจังหวัดสมุทรสาคร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(721, 7, 'ศาลเยาวชนและครอบครัวจังหวัดสมุทรสงคราม', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(800, 8, 'สำนักศาลยุติธรรมประจำภาค 8', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(801, 8, 'ศาลจังหวัดนครศรีธรรมราช', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(802, 8, 'ศาลแขวงนครศรีธรรมราช', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(803, 8, 'ศาลจังหวัดปากพนัง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(804, 8, 'ศาลจังหวัดทุ่งสง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(805, 8, 'ศาลจังหวัดชุมพร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(806, 8, 'ศาลจังหวัดหลังสวน', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(807, 8, 'ศาลจังหวัดสุราษฎร์ธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(808, 8, 'ศาลแขวงสุราษฎร์ธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(809, 8, 'ศาลจังหวัดไชยา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(810, 8, 'ศาลจังหวัดระนอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(811, 8, 'ศาลจังหวัดกระบี่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(812, 8, 'ศาลจังหวัดพังงา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(813, 8, 'ศาลจังหวัดตะกั่วป่า', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(814, 8, 'ศาลจังหวัดภูเก็ต', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(815, 8, 'ศาลเยาวชนและครอบครัวจังหวัดสุราษฎร์ธานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(816, 8, 'ศาลเยาวชนและครอบครัวจังหวัดนครศรีธรรมราช', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(817, 8, 'ศาลเยาวชนและครอบครัวจังหวัดภูเก็ต', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(818, 8, 'ศาลจังหวัดเกาะสมุย', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(819, 8, 'ศาลแรงงานภาค 8', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(820, 8, 'ศาลเยาวชนและครอบครัวจังหวัดชุมพร', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(821, 8, 'ศาลเยาวชนและครอบครัวจังหวัดระนอง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(822, 8, 'ศาลเยาวชนและครอบครัวจังหวัดกระบี่', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(823, 8, 'ศาลเยาวชนและครอบครัวจังหวัดพังงา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(900, 9, 'สำนักศาลยุติธรรมประจำภาค 9', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(901, 9, 'ศาลจังหวัดสงขลา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(902, 9, 'ศาลแขวงสงขลา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(903, 9, 'ศาลจังหวัดตรัง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(904, 9, 'ศาลจังหวัดพัทลุง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(905, 9, 'ศาลจังหวัดสตูล', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(906, 9, 'ศาลจังหวัดปัตตานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(907, 9, 'ศาลจังหวัดยะลา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(908, 9, 'ศาลจังหวัดเบตง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(909, 9, 'ศาลจังหวัดนราธิวาส', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(910, 9, 'ศาลเยาวชนและครอบครัวจังหวัดสงขลา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(911, 9, 'ศาลเยาวชนและครอบครัวจังหวัดตรัง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(912, 9, 'ศาลเยาวชนและครอบครัวจังหวัดนราธิวาส', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(913, 9, 'ศาลเยาวชนและครอบครัวจังหวัดสตูล', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(914, 9, 'ศาลเยาวชนและครอบครัวจังหวัดปัตตานี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(916, 9, 'ศาลแรงงานภาค 9', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(917, 9, 'ศาลเยาวชนและครอบครัวจังหวัดพัทลุง', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(918, 9, 'ศาลเยาวชนและครอบครัวจังหวัดยะลา', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38'),
	(919, 9, 'ศาลจังหวัดนาทวี', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-31 14:11:38');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;

-- Dumping structure for table warehouse.supreme
CREATE TABLE IF NOT EXISTS `supreme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `casetype` int(11) DEFAULT NULL,
  `case` int(11) DEFAULT NULL,
  `highjudgementtype` int(11) DEFAULT NULL COMMENT 'ประเภทการตัดสิน',
  `dismissaltype` int(11) DEFAULT NULL COMMENT 'ผลคำพิพากษา=>กรณียกฟ้อง',
  `black_abb` varchar(100) DEFAULT NULL,
  `black_no` varchar(100) DEFAULT NULL,
  `black_year` varchar(100) DEFAULT NULL,
  `recieve_date` date DEFAULT NULL,
  `red_abb` varchar(100) DEFAULT NULL,
  `red_no` varchar(100) DEFAULT NULL,
  `red_year` varchar(100) DEFAULT NULL,
  `judgement_date` date DEFAULT NULL COMMENT 'วันตัดสินคดี',
  `judgement_dismiss_other` text DEFAULT NULL COMMENT 'กรณียกฟ้อง อื่นๆ เขียนเพิ่มเติม',
  `judgement_detail` text DEFAULT NULL COMMENT 'รายละเอียดคำพิพากษา',
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ชั้นฎีกา';

-- Dumping data for table warehouse.supreme: ~0 rows (approximately)
/*!40000 ALTER TABLE `supreme` DISABLE KEYS */;
/*!40000 ALTER TABLE `supreme` ENABLE KEYS */;

-- Dumping structure for table warehouse.testimonytype
CREATE TABLE IF NOT EXISTS `testimonytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ประเภทคำให้การ';

-- Dumping data for table warehouse.testimonytype: ~2 rows (approximately)
/*!40000 ALTER TABLE `testimonytype` DISABLE KEYS */;
INSERT INTO `testimonytype` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'รับสารภาพ', '2017-11-02 14:22:12', '2017-11-02 14:22:13'),
	(2, 'ปฏิเสธ', '2017-11-02 14:22:31', '2017-11-02 14:22:31');
/*!40000 ALTER TABLE `testimonytype` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
