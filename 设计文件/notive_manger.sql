/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : notive_manger

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2017-04-07 16:13:46
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '123', '0');
INSERT INTO `department` VALUES ('2', '456', '0');
INSERT INTO `department` VALUES ('3', '456', '0');
INSERT INTO `department` VALUES ('4', '策划部', '0');
INSERT INTO `department` VALUES ('5', '测试用部门', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '梁烨文', '13538601632', '123', null);
INSERT INTO `employee` VALUES ('2', '123', '123', '123', null);
INSERT INTO `employee` VALUES ('3', '123', '123', '123', null);
INSERT INTO `employee` VALUES ('4', '1231', '123', '123', null);
INSERT INTO `employee` VALUES ('5', '123', '123', '123', null);
INSERT INTO `employee` VALUES ('6', '123', '123', '123', null);
INSERT INTO `employee` VALUES ('7', '123', '4', '123', null);
INSERT INTO `employee` VALUES ('8', '123', '453', '123', null);
INSERT INTO `employee` VALUES ('9', '123', '456', '123', null);
INSERT INTO `employee` VALUES ('10', '45687', '879789', '789', null);
INSERT INTO `employee` VALUES ('14', '45', '45', '45', null);
INSERT INTO `employee` VALUES ('15', '测试员001', '123456', '123', '1');

-- ----------------------------
-- Table structure for notive
-- ----------------------------
DROP TABLE IF EXISTS `notive`;
CREATE TABLE `notive` (
  `N_id` int(11) NOT NULL AUTO_INCREMENT,
  `N_author` int(11) DEFAULT NULL,
  `N_title` varchar(100) DEFAULT NULL,
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
  CONSTRAINT `notive_ibfk_1` FOREIGN KEY (`N_author`) REFERENCES `user` (`U_owner`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive
-- ----------------------------
INSERT INTO `notive` VALUES ('40', '1', '213', '通知', '已发布', '已顶置', '2017-03-13', '2017-02-28', '2017-03-31', 0x6E756C6C, '已生效');
INSERT INTO `notive` VALUES ('41', '1', '0001', '通知', '已发布', '已顶置', '2017-03-06', '2017-03-13', '2017-03-31', 0x6E756C6C, '已生效');
INSERT INTO `notive` VALUES ('45', '1', '东方闪电', '通知', '已发布', '未顶置', '2017-03-06', '2017-03-13', '2017-03-31', 0x3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C623EE4B880E38081E4B88AE69CBAE79BAEE79A84EFBC9A3C7370616E3E3C2F7370616E3E3C2F623E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A34322E3070743B746578742D696E64656E743A2D32312E3070743B223E0D0A096C3F20E68E8CE68FA1E799BDE79B92E6B58BE8AF95E4B8ADE79A84E59084E7A78DE6B58BE8AF95E696B9E6B3953C7370616E3E3C2F7370616E3E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C623EE4BA8CE38081E4B88AE69CBAE58685E5AEB9EFBC9A3C7370616E3E3C2F7370616E3E3C2F623E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A0931E38081E4BBA5E5B08FE7BB84E4B8BAE58D95E4BD8DEFBC8CE4B880E7BB84E79A84E68890E59198E5B0BDE9878FE59D90E59CA8E4B880E59D97EFBC8CE4B88AE69CBAE59D90E4BD8DE5B0BDE9878FE4BF9DE68C81E8BF9EE8B4AFE680A7EFBC9B3C7370616E3E3C2F7370616E3E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A0932E38081E58F82E88083E5928CE79086E8A7A3E7ACAC3C7370616E3E333C2F7370616E3EE7ABA0E7ACAC3C7370616E3E323C2F7370616E3EE88A82E79A84E58685E5AEB9EFBC8CE6A0B9E68DAEE69CACE5B08FE7BB84E79A84E7B3BBE7BB9FEFBC8CE7BB8FE8BF87E58585E58886E79A84E8AEA8E8AEBAE5908EEFBC8CE6AF8FE4BABAE98089E68BA9E4B880E4B8AAE696B9E6B395E68896E587BDE695B0EFBC8CE8BF9BE8A18CE799BDE79B92E6B58BE8AF95EFBC8CE59CA8E98089E68BA9E696B9E6B395E697B6EFBC8CE8A681E4BF9DE8AF81E4BBA3E7A081E8A18CE695B0E4B88DE5B091E4BA8E3C7370616E3E35303C2F7370616E3EE8A18CEFBC9B3C7370616E3E3C2F7370616E3E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A0933E38081E8A681E6B182E6AF8FE4BABAE5AFB9E98089E5AE9AE79A84E696B9E6B395E68896E587BDE695B0E58886E588ABE5AE8CE68890E99D99E68081E6B58BE8AF95EFBC88E5A682E4BBA3E7A081E8B5B0E8AFBBE38081E5908CE8A18CE8AF84E5AEA1E7AD89EFBC89E38081E980BBE8BE91E8A686E79B96E6B58BE8AF95E38081E59FBAE69CACE8B7AFE5BE84E6B58BE8AF95EFBC88E8BF9BE8A18CE8B7AFE5BE84E79A84E98089E58F96EFBC89E7AD89E38082E59CA8E6B58BE8AF95E8BF87E7A88BE4B8ADEFBC8CE8A681E58897E587BAE6AF8FE7A78DE6B58BE8AF95E696B9E6B395E79A84E6B58BE8AF95E794A8E4BE8BE8A1A8EFBC9B3C7370616E3E3C2F7370616E3E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A0934E38081E5B08FE7BB84E995BFE58FACE5BC80E5B08FE7BB84E4BC9AE8AEAEEFBC8CE5AFB9E6AF8FE4B8AAE4BABAE79A84E6B58BE8AF95E58685E5AEB9E8BF9BE8A18CE58886E69E90E4B88EE680BBE7BB93EFBC8CE5B9B6E5BE97E587BAE7B3BBE7BB9FE59CA8E69CACE6ACA1E6B58BE8AF95E8BF87E7A88BE4B8ADE79A84E7BB93E8AEBA3C7370616E3E3B3C2F7370616E3E200D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A0935E38081E59CA8E5B08FE7BB84E79A84E4B88AE69CBAE69687E6A1A3E4B8ADE8A681E58699E6B885E6A59AE695B4E4B8AAE7B3BBE7BB9FE79A84E6B58BE8AF95E7BB93E8AEBAEFBC8CE69CACE4BABAE79A84E4B88AE69CBAE69687E6A1A3E8A681E58699E6B885E6A59AE887AAE5B7B1E79A84E6B58BE8AF95E58685E5AEB9E5928CE7BB93E8AEBAEFBC8CE585B6E4BB96E4BABAE59198E79A84E6B58BE8AF95E58685E5AEB9E697A0E99C80E694BEE585A5E380823C7370616E3E3C2F7370616E3E200D0A3C2F703E, '已生效');
INSERT INTO `notive` VALUES ('46', '1', '跳页测试', '决定', '已发布', '已顶置', '2017-03-13', '2017-03-06', '2017-03-14', 0xE6B58BE8AF95E8B7B3E9A1B5E7BB93E69E9C, '已失效');
INSERT INTO `notive` VALUES ('48', '1', '发给', '通知', '未发布', '未顶置', '2017-03-06', '2017-03-06', '2017-03-13', 0xE58F91E4B8AA20E58F91E7BB99E5A4A7E9A39EE593A5E698AFE5A4A7E6B395E5AE98E698AFE5A4A7E6B395E5AE98E6B0B4E794B5E8B4B9E8BF87E6B0B4E794B5E8B4B9E5918AE8AF89E79A84E8A686E79B96E698AFE5A4A7E6B395E5AE98E5958AE698AFE5A4A7E6B395E5AE98E79A844756E68A8AE4B88BE6ACA17662E4B88BE6ACA17662E4B88BE6ACA17662E4B88BE6ACA17662E58D81E5A49AE4B8AAE59388E8BFAAE696AFE68998E7AEA1E4BABAE79A84266E6273703B, '已失效');
INSERT INTO `notive` VALUES ('51', '1', '法国交付给机', '通知', '已发布', '已顶置', '2017-03-13', '2017-03-05', '2017-03-14', 0xE8A686E79B96E5B0B1E5A5BDE6B395E59BBDE7BAA2E98592E6B395E8A784E58F8AE6B395E8A784E58F8AE6B395E59BBDE5B0B1E6B395E59BBDE7BAA2E98592E6B395E59BBDE7BAA2E98592E6B395E8A784E58F8AE6B395E8A784E58F8AE6B395E8A784E58F8AE58F91E9BB84E98791E58886E589B2E9BB84E98791E58886E589B2E4BAA4E4BB98E7BB99E5B0B1, '已失效');
INSERT INTO `notive` VALUES ('52', '1', '123', 'null', '未发布', '未顶置', '2017-03-06', '2017-03-05', '2017-03-14', '', '已失效');
INSERT INTO `notive` VALUES ('53', '1', '部门和员工测试', '决定', '未发布', '未顶置', '2017-03-14', '2017-03-06', '2017-03-25', 0xE983A8E997A8E5928CE59198E5B7A5E6B58BE8AF95303031, '已失效');
INSERT INTO `notive` VALUES ('54', '1', '插入部门和人员测试001', '其他', '已发布', '未顶置', '2017-03-05', '2017-03-12', '2017-03-18', 0xE68F92E585A5E983A8E997A8E5928CE4BABAE59198E6B58BE8AF95303031, '已失效');
INSERT INTO `notive` VALUES ('55', '1', '插入部门和人员测试003', '决定', '已发布', '已顶置', '2017-03-06', '2017-03-09', '2017-03-14', 0xE68F92E585A5E983A8E997A8E5928CE4BABAE59198E6B58BE8AF95303033, '已失效');
INSERT INTO `notive` VALUES ('60', '1', '第三方', 'null', '未发布', '未顶置', '2017-03-06', '2017-03-19', '2017-04-01', 0xE998BFE696AFE89282E88AAC61736466E58F91E588B0E58F91E588B0E58F91E69292E79A84E58F91E698AFE79A84, '已生效');
INSERT INTO `notive` VALUES ('61', '1', '部门和员工测试001', '决定', '已发布', '已顶置', '2017-03-06', '2017-03-19', '2017-03-25', 0xE983A8E997A8E5928CE59198E5B7A5E6B58BE8AF95303031, '已失效');
INSERT INTO `notive` VALUES ('62', '1', '打发', 'null', '未发布', '未顶置', '2017-03-06', '2017-03-09', '2017-03-13', '', '已失效');
INSERT INTO `notive` VALUES ('63', '15', '测试一下', '其他', '已发布', '已顶置', '2017-03-12', '2017-03-18', '2017-04-01', 0x3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C623E3C7374726F6E673E3C656D3EE4B880E38081E4B88AE69CBAE79BAEE79A84EFBC9A3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E3C2F623E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A34322E3070743B746578742D696E64656E743A2D32312E3070743B223E0D0A093C7374726F6E673E3C656D3E266E6273703BE588B6E8AEA2E69CACE7BB84E9A1B9E79BAEE79A84E8BDAFE4BBB6E6B58BE8AF95E8AEA1E58892E380823C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C623E3C7374726F6E673E3C656D3EE4BA8CE38081E4B88AE69CBAE58685E5AEB9EFBC9A3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E3C2F623E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7374726F6E673E3C656D3E31E38081E5BFABE9809FE99885E8AFBBE8AFBEE69CACE79A843C2F656D3E3C2F7374726F6E673E3C7370616E3E3C7374726F6E673E3C656D3E322E312D322E353C2F656D3E3C2F7374726F6E673E3C2F7370616E3E3C7374726F6E673E3C656D3EE58685E5AEB9EFBC8CE79086E8A7A3E8BDAFE4BBB6E6B58BE8AF95E8AEA1E58892E79A84E6848FE4B989E38081E4BD9CE794A8E5928CE4B8BBE8A681E58685E5AEB9EFBC9B3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7374726F6E673E3C656D3E32E38081E59CA8E7BB84E995BFE79A84E5B8A6E9A286E4B88BEFBC8CE585B1E5908CE5AE8CE688903C2F656D3E3C2F7374726F6E673E3C7370616E3E3C7374726F6E673E3C656D3E322E363C2F656D3E3C2F7374726F6E673E3C2F7370616E3E3C7374726F6E673E3C656D3EE88A82E79A84E58685E5AEB9EFBC9B3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7374726F6E673E3C656D3E33E38081E6AF8FE4B880E782B9E79A84E58685E5AEB9E5908EE99DA2EFBC8CE983BDE58FAFE4BBA5E58AA0E4B88AE887AAE5B7B1E4B8AAE4BABAE79A84E8A781E8A7A3EFBC9B203C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7374726F6E673E3C656D3E34E38081E59CA8E7ACAC3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C7374726F6E673E3C656D3E31323C2F656D3E3C2F7374726F6E673E3C2F7370616E3E3C7374726F6E673E3C656D3EE782B9E58685E5AEB9E79A84E5908EE99DA2EFBC8CE5BF85E9A1BBE68A8AE887AAE5B7B1E59CA8E69CACE7BB84E4B8ADE79A84E5B7A5E4BD9CE8818CE8B4A3E4B88EE58886E5B7A5E8AFA6E8BFB0E68F8FE8BFB0E6B885E6A59AEFBC9B3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7374726F6E673E3C656D3E35E38081E6A0B9E68DAEE8AFBEE69CACE5928CE7BD91E7BB9CE58685E5AEB9EFBC8CE7AE80E8BFB0E887AAE5B7B1E5AFB9E8BDAFE4BBB6E6B58BE8AF95E8AEA1E58892E79A84E79086E8A7A3E4B88EE4BD9CE794A8E380823C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C623E3C7374726F6E673E3C656D3EE4B889E38081E4B88AE69CBAE7BB93E69E9CEFBC9A3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E3C2F623E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D226D617267696E2D6C6566743A32312E3070743B223E0D0A093C7370616E3E3C7374726F6E673E3C656D3E313C2F656D3E3C2F7374726F6E673E3C2F7370616E3E3C7374726F6E673E3C656D3EE38081E99984E6AF8FE4B880E4B8AAE4B88AE69CBAE58685E5AEB9E79A84E585B3E994AEE688AAE59BBEEFBC9B3C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C223E0D0A093C7374726F6E673E3C656D3EE59B9BE380813C2F656D3E3C2F7374726F6E673E3C623E3C7374726F6E673E3C656D3EE4B88AE69CBAE5BF83E5BE97EFBC9A3C2F656D3E3C2F7374726F6E673E3C2F623E3C7374726F6E673E3C656D3EE4B8BBE8A681E58699E6849FE683B3E5928CE8BF99E6ACA1E4B88AE69CBAE8BF87E7A88BE79A84E68385E586B5E380823C2F656D3E3C2F7374726F6E673E3C7370616E3E3C2F7370616E3E0D0A3C2F703E, '已生效');
INSERT INTO `notive` VALUES ('64', '1', '关于2014级新生网上核对个人学籍信息的通知', 'null', '已发布', '未顶置', '2017-04-19', '2017-04-20', '2017-04-30', 0x3C7020636C6173733D224D736F4E6F726D616C22207374796C653D22746578742D696E64656E743A32382E3070743B223E0D0A09E6A0B9E68DAEE69599E882B2E983A8E58A9EE585ACE58E85E3808AE69599E882B2E983A8E58A9EE585ACE58E85E585B3E4BA8EE5819AE5A5BD3C7370616E3E323031343C2F7370616E3EE5B9B4E699AEE9809AE9AB98E7AD89E5ADA6E6A0A1E5BD95E58F96E696B0E7949FE5A48DE69FA5E5928CE5ADA6E7B18DE794B5E5AD90E6B3A8E5868CE5B7A5E4BD9CE79A84E9809AE79FA5E3808BEFBC88E69599E5ADA6E58E85E587BD3C7370616E3E5B323031345D32383C2F7370616E3EE58FB7EFBC89E79A84E69687E4BBB6E7B2BEE7A59EEFBC8CE68891E999A23C7370616E3E323031343C2F7370616E3EE7BAA7E696B0E7949FE79A84E5ADA6E7B18DE794B5E5AD90E6B3A8E5868CE5B7A5E4BD9CE5B7B2E9A1BAE588A9E5AE8CE68890EFBC8CE8AFB7E59084E7B3BBE9809AE79FA53C7370616E3E323031343C2F7370616E3EE7BAA7E59084E78FADE5ADA6E7949FE59CA83C7370616E3E31313C2F7370616E3EE69C883C7370616E3E333C2F7370616E3EE697A5E5898DE5AE8CE68890E7BD91E4B88AE5ADA6E7949FE5ADA6E7B18DE4BFA1E681AFE6A0B8E5AFB9E38082E585B7E4BD93E4BA8BE9A1B9E9809AE79FA5E5A682E4B88BEFBC9A3C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D22746578742D696E64656E743A32382E3070743B223E0D0A0931E38081E4B8BAE696B9E4BEBFE5ADA6E7949FE4B88AE7BD91E69FA5E8AFA2EFBC8CE5ADA6E7949FE58FAFE4BA8E3C7370616E3E31303C2F7370616E3EE69C883C7370616E3E32372D33313C2F7370616E3EE697A5E6AF8FE5A4A9E4B88BE58D883C7370616E3E31363C2F7370616E3EEFBC9A3C7370616E3E33302D31373C2F7370616E3EEFBC9A3C7370616E3E33303C2F7370616E3EE5898DE5BE80E59BBEE4B9A6E9A6863C7370616E3E313C2F7370616E3EE6A5BCE69CBAE688BFE8BF9BE8A18CE69FA5E8AFA2E380823C7370616E3E3C2F7370616E3E0D0A3C2F703E0D0A3C7020636C6173733D224D736F4E6F726D616C22207374796C653D22746578742D696E64656E743A32382E3070743B223E0D0A0932E38081E799BBE585A5E69FA5E8AFA2E7BD91E7AB99EFBC9A3C7370616E3E687474703A2F2F786A786C2E636873692E636F6D2E636E2F787363782E616374696F6E3C2F7370616E3EEFBC88E4B8ADE59BBDE9AB98E7AD89E69599E882B2E5ADA6E7949FE4BFA1E681AFE7BD91EFBC89EFBC8CE8BF9BE8A18CE5AE9EE5908DE6B3A8E5868CEFBC88E5A682E4B88BE59BBEEFBC89E380823C7370616E3E3C2F7370616E3E0D0A3C2F703E, '待生效');
INSERT INTO `notive` VALUES ('65', '1', '', 'null', '未发布', '未顶置', '2017-04-09', '2017-04-16', '2017-04-29', 0x7364667364266E6273703B, '待生效');

-- ----------------------------
-- Table structure for notive_dept
-- ----------------------------
DROP TABLE IF EXISTS `notive_dept`;
CREATE TABLE `notive_dept` (
  `N_id` int(11) NOT NULL,
  `D_id` int(11) NOT NULL,
  PRIMARY KEY (`N_id`,`D_id`),
  KEY `D_id` (`D_id`),
  CONSTRAINT `notive_dept_ibfk_1` FOREIGN KEY (`N_id`) REFERENCES `notive` (`N_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notive_dept_ibfk_2` FOREIGN KEY (`D_id`) REFERENCES `department` (`D_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive_dept
-- ----------------------------
INSERT INTO `notive_dept` VALUES ('54', '2');
INSERT INTO `notive_dept` VALUES ('55', '2');
INSERT INTO `notive_dept` VALUES ('61', '2');
INSERT INTO `notive_dept` VALUES ('65', '2');
INSERT INTO `notive_dept` VALUES ('54', '3');
INSERT INTO `notive_dept` VALUES ('55', '3');
INSERT INTO `notive_dept` VALUES ('61', '3');
INSERT INTO `notive_dept` VALUES ('65', '3');
INSERT INTO `notive_dept` VALUES ('64', '4');
INSERT INTO `notive_dept` VALUES ('63', '5');
INSERT INTO `notive_dept` VALUES ('64', '5');

-- ----------------------------
-- Table structure for notive_employee
-- ----------------------------
DROP TABLE IF EXISTS `notive_employee`;
CREATE TABLE `notive_employee` (
  `N_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  PRIMARY KEY (`N_id`,`P_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `notive_employee_ibfk_1` FOREIGN KEY (`N_id`) REFERENCES `notive` (`N_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notive_employee_ibfk_2` FOREIGN KEY (`P_id`) REFERENCES `employee` (`P_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notive_employee
-- ----------------------------
INSERT INTO `notive_employee` VALUES ('61', '1');
INSERT INTO `notive_employee` VALUES ('64', '1');
INSERT INTO `notive_employee` VALUES ('61', '2');
INSERT INTO `notive_employee` VALUES ('61', '3');
INSERT INTO `notive_employee` VALUES ('61', '4');
INSERT INTO `notive_employee` VALUES ('55', '5');
INSERT INTO `notive_employee` VALUES ('61', '5');
INSERT INTO `notive_employee` VALUES ('55', '6');
INSERT INTO `notive_employee` VALUES ('61', '6');
INSERT INTO `notive_employee` VALUES ('55', '7');
INSERT INTO `notive_employee` VALUES ('61', '7');
INSERT INTO `notive_employee` VALUES ('61', '8');
INSERT INTO `notive_employee` VALUES ('65', '8');
INSERT INTO `notive_employee` VALUES ('61', '9');
INSERT INTO `notive_employee` VALUES ('65', '9');
INSERT INTO `notive_employee` VALUES ('61', '10');
INSERT INTO `notive_employee` VALUES ('61', '14');
INSERT INTO `notive_employee` VALUES ('63', '14');
INSERT INTO `notive_employee` VALUES ('63', '15');
INSERT INTO `notive_employee` VALUES ('64', '15');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `U_id` int(5) NOT NULL AUTO_INCREMENT,
  `U_name` varchar(15) DEFAULT NULL,
  `U_password` varchar(20) DEFAULT NULL,
  `U_type` varchar(10) DEFAULT NULL,
  `U_owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`U_id`),
  KEY `user_ibfk_1` (`U_owner`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`U_owner`) REFERENCES `employee` (`P_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('14', '123', '456', null, '1');
INSERT INTO `user` VALUES ('19', 'wx_shadow', 'wx4852010', null, '15');
