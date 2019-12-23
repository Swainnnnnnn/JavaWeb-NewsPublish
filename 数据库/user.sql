-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 register.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `display_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `role_id` int(11) NOT NULL,
  `pwdanswer1` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `pwdanswer2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  register.user 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `username`, `display_name`, `password`, `role_id`, `pwdanswer1`, `pwdanswer2`) VALUES
	(1, 'admin', 'admin', 'admin', 1, 'h', 'h'),
	(2, 'dmh', 'dmh', '321', 3, 'h', 'h'),
	(3, 'h', 'h', 'h', 3, 'h', 'h'),
	(4, '1', '1', '1', 3, '1', '1'),
	(5, '2', '2', '2', 3, '2', '2'),
	(6, '3', '3', '3', 3, '3', '3'),
	(7, '4', '4', '44', 3, '4', '4'),
	(8, '5', '5', '55', 3, '5', '5'),
	(9, 'test', 'test', '11', 3, 'test', 'red'),
	(10, 'hhh', 'hhh', '22', 3, 'hhh', 'red'),
	(11, 'user', 'user', '11', 3, 'hh', 'blue'),
	(12, 'wxl', 'wxl', '111', 3, 'wxl', 'yellow'),
	(13, 'syq', 'syq', 'syq123456', 3, NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
