INSERT INTO `sys_menu` VALUES (1, '系统管理', '#', 0, 1, '', 1, 0, '系统管理', 1);
INSERT INTO `sys_menu` VALUES (2, '权限管理', 'right', 1, 2, '', 2, 1, '权限管理', 1);
INSERT INTO `sys_menu` VALUES (3, '用户管理', 'user', 1, 3, '', 2, 1, '用户管理', 1);
INSERT INTO `sys_menu` VALUES (4, '角色管理', 'role', 1, 4, '', 2, 1, '角色管理', 1);
INSERT INTO `sys_menu` VALUES (49, '服务器信息管理', '#', 0, 2, NULL, 1, 1, '', 1);
INSERT INTO `sys_menu` VALUES (50, '服务器信息', 'serverinfo', 49, 1, NULL, 2, 1, '', 1);
INSERT INTO `sys_menu` VALUES (51, '用户管理', '#', 0, 3, NULL, 1, 1, '', 1);
INSERT INTO `sys_menu` VALUES (52, '债权追收', 'credit', 57, 1, NULL, 2, 1, '', 1);
INSERT INTO `sys_menu` VALUES (53, '用户信息', 'webUser/cr_page', 51, 1, NULL, 2, 1, '', 1);
INSERT INTO `sys_menu` VALUES (54, '专家顾问库', 'webUser/ex_page', 51, 2, NULL, 2, 1, '', 1);
INSERT INTO `sys_menu` VALUES (55, '资讯管理', '#', 0, 6, NULL, 1, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (56, '媒体报道和文章', 'blog/page', 55, 1, NULL, 2, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (57, '债权及悬赏管理', '#', 0, 4, NULL, 1, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (58, '悬赏管理', '', 57, 3, NULL, 2, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (59, '资源下载', 'filemanager', 55, 3, NULL, 2, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (60, '反馈管理', '#', 0, 8, NULL, 1, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (61, '案例及用户心声', '', 55, 2, NULL, 2, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (62, '债权转让', 'credit', 57, 2, NULL, 2, 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (63, '反馈管理', 'feedback', 60, 1, NULL, 2, 1, NULL, 1);

/***********2016-08-05***************/
CREATE TABLE `cr_sample` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '状态' ,
`sam_name`  varchar(30) NULL COMMENT '名称' ,
`trade`  varchar(60) NULL COMMENT '行业' ,
`amount`  double NULL COMMENT '金额' ,
`sam_type`  smallint(3) NULL COMMENT '类型(1案例、2用户心声)' ,
`sam_img`  varchar(300) NULL COMMENT '图片路径' ,
`description`  varchar(600) NULL COMMENT '描述' ,
`status`  smallint NULL COMMENT '状态' ,
PRIMARY KEY (`id`)
)
;

/***********2016-08-07***************/
alter table cr_credit add COLUMN is_audit smallint(3)COMMENT '债权审核标志(1审核通过，-1审核不通过，0待审核)';
UPDATE cr_credit SET is_audit=0;

/***********2016-08-15***************/
ALTER TABLE `cr_blog`
MODIFY COLUMN `blog_source`  varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源' AFTER `create_time`,
MODIFY COLUMN `blog_author`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者' AFTER `blog_source`;


/***********2016-08-16***************/
alter table cr_blog add COLUMN blog_status smallint(3)COMMENT '博客状态';


/***********2016-08-17***************/
ALTER TABLE cr_credit ADD COLUMN signed_path VARCHAR(256) COMMENT '处置签约协议地址';
ALTER TABLE cr_credit ADD COLUMN legal_service_path VARCHAR(256) COMMENT '法律服务协议';
ALTER TABLE cr_credit ADD COLUMN deal_team_name VARCHAR(64) COMMENT '处置团队名称';
ALTER TABLE cr_credit ADD COLUMN dept_type SMALLINT(3) COMMENT '债权人性质（1个人，2企业）' AFTER contact_number;

/***********2016-08-18***************/
ALTER TABLE `cr_credit`
MODIFY COLUMN `cr_status`  smallint(3) NULL DEFAULT NULL COMMENT '债权状态1、招标中，2、已签处置协议，3、处置中，4、还款中，9、已终结' AFTER `cr_amount`;




