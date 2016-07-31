
insert  into `sys_button`(`button_id`,`menu_id`,`button_name`,`button_url`,`status`) values (1,2,'新增分类/菜单','right/addMenu',1),(2,2,'修改分类/菜单','right/editMenu',1),(3,2,'删除分类/菜单','right/deleteMenu',1),(4,2,'批量删除分类/菜单','right/batchDeleteMenu',1),(5,2,'菜单信息','right/subMenu',1),(6,2,'按钮信息','right/button',1),(7,2,'新增按钮','right/addBtn',1),(8,2,'修改按钮','right/editBtn',1),(9,2,'删除按钮','right/deleteBtn',1),(10,2,'批量删除按钮','right/batchDeleteBtn',1),(11,3,'新增','user/add',1),(12,3,'修改','user/edit',1),(13,3,'删除','user/delete',1),(14,3,'批量删除','user/batchDelete',1),(15,3,'授权','user/editRole',1),(16,4,'新增','role/add',1),(17,4,'修改','role/edit',1),(18,4,'删除','role/delete',1),(19,4,'批量删除','role/batchDelete',1),(20,4,'编辑权限','role/editRight',1),(21,50,'服务器信息/修改','serverinfo/edit',1),(22,50,'服务器信息/添加','serverinfo/add',1);

insert  into `sys_menu`(`menu_id`,`menu_name`,`menu_url`,`parent_id`,`menu_order`,`menu_icon`,`menu_type`,`removable`,`description`,`status`) values (1,'系统管理','#',0,1,'',1,0,'系统管理',1),(2,'权限管理','right',1,2,'',2,1,'权限管理',1),(3,'用户管理','user',1,3,'',2,1,'用户管理',1),(4,'角色管理','role',1,4,'',2,1,'角色管理',1),(49,'服务器信息管理','#',0,2,NULL,1,1,'',1),(50,'服务器信息','serverinfo',49,1,NULL,2,1,'1',1),(51,'ttttt','#',0,1,NULL,1,1,'11',-1);

insert  into `sys_role`(`role_id`,`role_name`,`removable`,`allocatable`,`description`,`status`) values (1,'系统管理员',0,1,'系统管理员',1),(102,'测试角色',1,1,'测试',-1),(103,'test',1,1,'test',-1),(104,'fds',1,1,'fdsa',-1),(105,'agc',1,1,'afdsa',-1),(106,'fdsafdsafdsa',1,1,'fdsafdsa',-1),(107,'fdsafdsa',1,1,'fsafdsasd8888',-1),(108,'fdsa',1,1,'fdsa',-1),(109,'服务器管理员',1,1,'',1);

insert  into `sys_role_resource`(`id`,`role_id`,`resource_id`,`resource_type`) values (99,109,49,1),(100,109,50,2),(101,1,1,1),(102,1,2,2),(103,1,3,2),(104,1,4,2),(105,1,49,1),(106,1,50,2);

insert  into `sys_user`(`user_id`,`login_name`,`password`,`name`,`last_login`,`ip`,`status`,`description`,`email`,`phone`,`skin`) values (1,'admin','223ce7b851123353479d85757fbbf4e320d1e251',NULL,'2016-07-31 12:19:36','0:0:0:0:0:0:0:1','1',NULL,NULL,NULL,1),(39,'test','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3',NULL,'2015-05-16 17:23:26',NULL,'-1',NULL,NULL,NULL,1),(40,'dzk','c76c524115b16a7e0c71fff97089b34dca7dc45a','dzk','2015-05-18 09:32:28',NULL,'-1','测试','dzk@163.com','123',1),(41,'s','0d3af63f25971b9e0cddc6955d09130fd2b8bace','s','2015-05-18 12:48:58',NULL,'1','1','s@s.com','1',1);

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,1,1),(17,40,102),(18,39,102),(20,41,109);

