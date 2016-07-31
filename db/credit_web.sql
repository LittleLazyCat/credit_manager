/*
SQLyog v10.2 
MySQL - 5.6.21-log : Database - credit_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`credit_web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `credit_web`;

/*Table structure for table `cr_blog` */

DROP TABLE IF EXISTS `cr_blog`;

CREATE TABLE `cr_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `blog_type` smallint(3) DEFAULT NULL COMMENT '业务文章分类',
  `blog_title` varchar(256) DEFAULT NULL COMMENT '业务文章标题',
  `blog_context` text COMMENT '业务文章内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `blog_source` varchar(60) DEFAULT NULL COMMENT '来源',
  `blog_author` varchar(60) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `cr_credit` */

DROP TABLE IF EXISTS `cr_credit`;

CREATE TABLE `cr_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) DEFAULT NULL COMMENT '债权发布人id',
  `cr_type` smallint(3) DEFAULT NULL COMMENT '债权类型',
  `cr_amount` double DEFAULT NULL COMMENT '债权金额',
  `cr_status` smallint(3) DEFAULT NULL COMMENT '债权转让',
  `disposal_type` varchar(16) DEFAULT NULL,
  `commision_range` varchar(32) DEFAULT NULL COMMENT '佣金范围',
  `contact_name` varchar(32) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `debt_name` varchar(64) DEFAULT NULL COMMENT '债权方名称',
  `debt_province` varchar(32) DEFAULT NULL COMMENT '债权方省份',
  `debt_city` varchar(32) DEFAULT NULL COMMENT '债权方城市',
  `debt_phone` varchar(32) DEFAULT NULL COMMENT '债权方电话',
  `debt_proof` varchar(1024) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL COMMENT '债权方描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `open_date` datetime DEFAULT NULL COMMENT '开启日期',
  `agreed_date` datetime DEFAULT NULL COMMENT '约定日期',
  `credit_type` smallint(3) DEFAULT NULL COMMENT '债权类型(1债权处置，2债权转让)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Table structure for table `cr_feedback` */

DROP TABLE IF EXISTS `cr_feedback`;

CREATE TABLE `cr_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_name` varchar(64) DEFAULT NULL COMMENT '反馈者姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '反馈者电话',
  `user_email` varchar(32) DEFAULT NULL COMMENT '反馈者邮件',
  `context` text COMMENT '反馈内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `cr_file_manager` */

DROP TABLE IF EXISTS `cr_file_manager`;

CREATE TABLE `cr_file_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `file_type` smallint(3) DEFAULT NULL COMMENT '文件类型',
  `file_title` varchar(32) DEFAULT NULL COMMENT '文件名称',
  `download_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Table structure for table `cr_reward` */

DROP TABLE IF EXISTS `cr_reward`;

CREATE TABLE `cr_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `reward_type` smallint(3) DEFAULT NULL COMMENT '悬赏类型',
  `reward_amount` double DEFAULT NULL COMMENT '悬赏金额',
  `reward_name` varchar(64) DEFAULT NULL COMMENT '悬赏人',
  `cart_id` varchar(64) DEFAULT NULL COMMENT '身份证',
  `car_brand` varchar(32) DEFAULT NULL COMMENT '车牌',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `images` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `end_time` datetime DEFAULT NULL COMMENT '悬赏有效日期',
  `description` varchar(256) DEFAULT NULL COMMENT '悬赏描述',
  `reward_status` smallint(3) DEFAULT NULL COMMENT '悬赏状态',
  `user_id` int(11) DEFAULT NULL COMMENT '登录用户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `cr_user` */

DROP TABLE IF EXISTS `cr_user`;

CREATE TABLE `cr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_email` varchar(32) DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(32) DEFAULT NULL COMMENT '用户手机',
  `user_type` smallint(3) DEFAULT NULL COMMENT '会员类型（）',
  `nickname` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `user_pwd` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `user_level` smallint(3) DEFAULT NULL COMMENT '用户等级',
  `user_role` varchar(32) DEFAULT NULL COMMENT '用户角色',
  `user_head_images` varchar(64) DEFAULT NULL COMMENT '用户头像',
  `description` text COMMENT '用户描述',
  `user_status` smallint(3) DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_button` */

DROP TABLE IF EXISTS `sys_button`;

CREATE TABLE `sys_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `menu_icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 资源类型：1-分类； 2-菜单',
  `removable` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `removable` int(3) NOT NULL DEFAULT '0' COMMENT '可被删除 0=不行 1=可以',
  `allocatable` int(3) DEFAULT '1' COMMENT '可被分配 0=不行 1=可以',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `last_login` varchar(255) DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) DEFAULT NULL,
  `skin` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户和角色';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
