/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : notive_manger

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2017-03-26 17:52:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `D_id` int(11) NOT NULL AUTO_INCREMENT,
  `D_name` varchar(255) NOT NULL,
  `D_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`D_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for eclosure
-- ----------------------------
DROP TABLE IF EXISTS `eclosure`;
CREATE TABLE `eclosure` (
  `E_id` int(11) NOT NULL AUTO_INCREMENT,
  `E_name` varchar(20) DEFAULT NULL,
  `E_url` varchar(100) DEFAULT NULL,
  `E_own` int(11) DEFAULT NULL,
  PRIMARY KEY (`E_id`),
  KEY `E_own` (`E_own`),
  CONSTRAINT `eclosure_ibfk_1` FOREIGN KEY (`E_own`) REFERENCES `notive` (`N_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eclosure
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `P_id` int(11) NOT NULL AUTO_INCREMENT,
  `P_name` varchar(10) DEFAULT NULL,
  `P_mobile` varchar(255) DEFAULT NULL,
  `P_address` varchar(100) DEFAULT NULL,
  `P_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`P_id`),
  KEY `P_department` (`P_department`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`P_department`) REFERENCES `department` (`D_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for notive
-- ----------------------------
DROP TABLE IF EXISTS `notive`;
CREATE TABLE `notive` (
  `N_id` int(11) NOT NULL AUTO_INCREMENT,
  `N_author` int(11) DEFAULT NULL,
  `N_title` varchar(20) DEFAULT NULL,
  `N_type` varchar(8) DEFAULT NULL,
  `N_state` varchar(10) DEFAULT NULL,
  `N_top` varchar(10) DEFAULT NULL,
  `N_release_time` date DEFAULT NULL,
  `N_begin_time` date DEFAULT NULL,
  `N_end_time` date DEFAULT NULL,
  `N_context` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `N_run_state` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`N_id`),
  KEY `notive_ibfk_1` (`N_author`),
  CONSTRAINT `notive_ibfk_1` FOREIGN KEY (`N_author`) REFERENCES `user` (`U_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive
-- ----------------------------
INSERT INTO `notive` VALUES ('35', '14', '123', '通知', '已发布', '已顶置', '2017-03-14', '2017-03-08', '2017-03-14', null, '已失效');
INSERT INTO `notive` VALUES ('38', '14', '456', '通知', '已发布', '已顶置', '2017-03-13', '2017-03-07', '2017-03-13', null, '已失效');
INSERT INTO `notive` VALUES ('39', '14', '2', '', '未发布', '未顶置', '2017-03-13', '2017-03-06', '2017-03-13', null, '已失效');
INSERT INTO `notive` VALUES ('40', '14', '213', '决定', '已发布', '已顶置', '2017-03-13', '2017-02-28', '2017-03-31', null, '已生效');
INSERT INTO `notive` VALUES ('41', '14', '0001', '报告', '已发布', '未顶置', '2017-03-06', '2017-03-13', '2017-03-31', null, '已生效');
INSERT INTO `notive` VALUES ('42', '14', '0002', '决定', '已发布', '未顶置', '2017-03-13', '2017-02-28', '2017-03-21', '', '已失效');

-- ----------------------------
-- Table structure for notive_dept
-- ----------------------------
DROP TABLE IF EXISTS `notive_dept`;
CREATE TABLE `notive_dept` (
  `N_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  PRIMARY KEY (`N_id`,`D_id`),
  KEY `D_id` (`D_id`),
  CONSTRAINT `notive_dept_ibfk_1` FOREIGN KEY (`N_id`) REFERENCES `notive` (`N_id`),
  CONSTRAINT `notive_dept_ibfk_2` FOREIGN KEY (`D_id`) REFERENCES `department` (`D_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive_dept
-- ----------------------------

-- ----------------------------
-- Table structure for notive_employee
-- ----------------------------
DROP TABLE IF EXISTS `notive_employee`;
CREATE TABLE `notive_employee` (
  `N_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  PRIMARY KEY (`N_id`,`P_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `notive_employee_ibfk_1` FOREIGN KEY (`N_id`) REFERENCES `notive` (`N_id`),
  CONSTRAINT `notive_employee_ibfk_2` FOREIGN KEY (`P_id`) REFERENCES `employee` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive_employee
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `U_id` int(5) NOT NULL AUTO_INCREMENT,
  `U_name` varchar(15) DEFAULT NULL,
  `U_password` varchar(20) DEFAULT NULL,
  `U_type` varchar(10) DEFAULT NULL,
  `U_onwer` int(11) DEFAULT NULL,
  PRIMARY KEY (`U_id`),
  KEY `U_onwer` (`U_onwer`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`U_onwer`) REFERENCES `employee` (`P_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('14', '123', '456', null, null);
INSERT INTO `user` VALUES ('15', 'wx', '', null, null);
INSERT INTO `user` VALUES ('16', 'wx_shadow', '4852010', null, null);
INSERT INTO `user` VALUES ('17', '', '', null, null);
INSERT INTO `user` VALUES ('18', '', '', null, null);
