/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : uuhouse

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-02-25 00:30:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(10) NOT NULL COMMENT '用户表ID',
  `nickname` varchar(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `headimg` varchar(100) NOT NULL DEFAULT '/house/defaultheadimg.jpg' COMMENT '头像',
  `sex` varchar(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` varchar(0) NOT NULL DEFAULT '' COMMENT '生日',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '笑颜如花', '/house/defaultheadimg.jpg', '1', '', '0', '0');
INSERT INTO `user` VALUES ('3', '泰泰', '/house/defaultheadimg.jpg', '0', '', '0', '0');
INSERT INTO `user` VALUES ('5', '如花', '/house/defaultheadimg.jpg', '1', '', '0', '0');

-- ----------------------------
-- Table structure for `user_auths`
-- ----------------------------
DROP TABLE IF EXISTS `user_auths`;
CREATE TABLE `user_auths` (
  `id` varchar(10) NOT NULL COMMENT '用户授权表ID',
  `uid` varchar(10) NOT NULL COMMENT '用户表ID',
  `identity_type` varchar(16) NOT NULL DEFAULT '' COMMENT '登录类型',
  `identifier` varchar(30) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `credential` varchar(30) NOT NULL DEFAULT '' COMMENT '密码凭证',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` datetime NOT NULL DEFAULT '2018-02-24 16:43:48' COMMENT '注册时间',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `update_time` datetime NOT NULL DEFAULT '2018-02-24 16:43:48' COMMENT '更新时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` datetime NOT NULL DEFAULT '2018-02-24 16:43:48' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  KEY `uid_ref` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表授权表';

-- ----------------------------
-- Records of user_auths
-- ----------------------------
INSERT INTO `user_auths` VALUES ('1', '2', 'phone', '13227870223', '123', '0', '2018-02-24 16:24:03', '0', '2018-02-24 16:43:48', '0', '2018-02-24 16:24:12', '0');
INSERT INTO `user_auths` VALUES ('2', '3', 'username', 'yst', '321', '0', '2018-02-24 16:24:08', '30', '2018-02-24 16:43:53', '0', '2018-02-25 00:26:11', '1');
INSERT INTO `user_auths` VALUES ('3', '1', 'username', 'lyt', '222', '0', '2018-02-25 00:28:55', '0', '2018-02-25 00:28:59', '0', '2018-02-25 00:29:03', '0');
