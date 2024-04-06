/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : im

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2021-10-18 22:53:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS `im_group`;
CREATE TABLE `im_group` (
  `gid` int(11) NOT NULL COMMENT '群id',
  `username` varchar(500) NOT NULL COMMENT '群名称',
  `admin_uid` int(11) NOT NULL COMMENT '群主用户id',
  `notice` varchar(250) DEFAULT NULL COMMENT '群公告',
  `icon` varchar(500) NOT NULL COMMENT '群图标',
  `create_time` timestamp NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群信息表';

-- ----------------------------
-- Records of im_group
-- ----------------------------

-- ----------------------------
-- Table structure for im_group_msg_content
-- ----------------------------
DROP TABLE IF EXISTS `im_group_msg_content`;
CREATE TABLE `im_group_msg_content` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `content` varchar(1000) NOT NULL COMMENT '消息内容',
  `sender_id` int(11) NOT NULL COMMENT '发送消息用户id',
  `gid` int(11) NOT NULL COMMENT '群id',
  `msg_type` tinyint(11) NOT NULL COMMENT '消息类型：1-文本消息，2-红包消息，3-语音消息，4-视频消息',
  `create_time` timestamp NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群聊消息内容表';

-- ----------------------------
-- Records of im_group_msg_content
-- ----------------------------

-- ----------------------------
-- Table structure for im_msg_content
-- ----------------------------
DROP TABLE IF EXISTS `im_msg_content`;
CREATE TABLE `im_msg_content` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `content` varchar(1000) NOT NULL COMMENT '消息内容',
  `sender_id` int(11) NOT NULL COMMENT '发送消息用户id',
  `recipient_id` int(11) NOT NULL COMMENT '接收消息用户id',
  `msg_type` tinyint(11) NOT NULL COMMENT '消息类型：1-文本消息，2-红包消息，3-语音消息，4-视频消息',
  `is_received` tinyint(11) NOT NULL DEFAULT '0' COMMENT '消息是否已被接收：0-未接收，1-已接收',
  `create_time` timestamp NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='消息内容表';

-- ----------------------------
-- Records of im_msg_content
-- ----------------------------
INSERT INTO `im_msg_content` VALUES ('1', 'hi，lisi', '1', '2', '1', '0', '2021-08-25 13:15:28');
INSERT INTO `im_msg_content` VALUES ('2', 'hello，zhangsan', '2', '1', '1', '0', '2021-08-25 13:16:39');

-- ----------------------------
-- Table structure for im_user
-- ----------------------------
DROP TABLE IF EXISTS `im_user`;
CREATE TABLE `im_user` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(500) NOT NULL COMMENT '用户名',
  `password` varchar(500) NOT NULL COMMENT '密码',
  `email` varchar(250) DEFAULT NULL COMMENT '邮箱',
  `icon` varchar(500) NOT NULL COMMENT '头像图标',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of im_user
-- ----------------------------
INSERT INTO `im_user` VALUES ('1', 'zhangsan', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', '123456@qq.com', '');
INSERT INTO `im_user` VALUES ('2', 'lisi', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', '111222@qq.com', '');
INSERT INTO `im_user` VALUES ('3', 'wangwu', '$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', '333333@qq.com', '');

-- ----------------------------
-- Table structure for im_user_msg_box
-- ----------------------------
DROP TABLE IF EXISTS `im_user_msg_box`;
CREATE TABLE `im_user_msg_box` (
  `owner_uid` int(11) NOT NULL COMMENT '信箱拥有用户id',
  `other_uid` int(11) NOT NULL COMMENT '消息参与的另一方',
  `mid` int(11) NOT NULL COMMENT '消息id',
  `box_type` tinyint(11) NOT NULL COMMENT '信箱类型：1-发件箱，2-收件箱',
  `create_time` timestamp NOT NULL,
  PRIMARY KEY (`owner_uid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信箱消息索引表';

-- ----------------------------
-- Records of im_user_msg_box
-- ----------------------------
INSERT INTO `im_user_msg_box` VALUES ('1', '2', '1', '1', '2021-08-25 13:15:28');
INSERT INTO `im_user_msg_box` VALUES ('1', '2', '2', '2', '2021-08-25 13:16:39');
INSERT INTO `im_user_msg_box` VALUES ('2', '1', '1', '2', '2021-08-25 13:15:28');
INSERT INTO `im_user_msg_box` VALUES ('2', '1', '2', '1', '2021-08-25 13:16:39');
