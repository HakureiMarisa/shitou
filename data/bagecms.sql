/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : bagecms

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-11-06 14:32:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bage_ad
-- ----------------------------
DROP TABLE IF EXISTS `bage_ad`;
CREATE TABLE `bage_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) NOT NULL COMMENT '广告名称',
  `title_alias` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `width` varchar(10) NOT NULL DEFAULT '' COMMENT '图片宽',
  `height` varchar(10) NOT NULL DEFAULT '' COMMENT '图片高',
  `intro` text COMMENT '广告描述',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `expired_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `attach_file` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of bage_ad
-- ----------------------------
INSERT INTO `bage_ad` VALUES ('1', '首页banner', 'index_banner', 'http://www.bagecms.com', '', '', '', '', '0', '1379520000', '1546272000', 'uploads/201309/523a2c04a37a1.jpg', '8', 'N', '1379544068');
INSERT INTO `bage_ad` VALUES ('2', '首页banner', 'index_banner', '', '', '', '', '', '0', '1379520000', '1546272000', 'uploads/201309/523a2c4baba12.jpg', '9', 'N', '1379544139');
INSERT INTO `bage_ad` VALUES ('3', '首页banner', 'index_banner', '', '', '', '', '', '0', '1379520000', '1379606400', 'uploads/201411/62465c2f06cf4492bd0b04149307c2d7.jpg', '10', 'Y', '1379544231');
INSERT INTO `bage_ad` VALUES ('4', '首页', 'index_banner', '', '', '', '', '', '0', '1379520000', '1379606400', 'uploads/201411/a3c456fb4ea14dbeb925046e2b61c5c9.png', '1', 'Y', '1415253411');

-- ----------------------------
-- Table structure for bage_admin
-- ----------------------------
DROP TABLE IF EXISTS `bage_admin`;
CREATE TABLE `bage_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL COMMENT '用户',
  `password` char(32) NOT NULL COMMENT '密码',
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(15) NOT NULL DEFAULT '0' COMMENT 'QQ',
  `notebook` text COMMENT '备忘',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机',
  `last_login_ip` char(15) NOT NULL DEFAULT '127' COMMENT '最后登录ip',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '用户状态',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of bage_admin
-- ----------------------------
INSERT INTO `bage_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '1', '123@qq.com', '0', '', '', '', '0.0.0.0', '1415245376', '5', 'Y', '1414992611');

-- ----------------------------
-- Table structure for bage_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `bage_admin_group`;
CREATE TABLE `bage_admin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL COMMENT '组名称',
  `acl` text NOT NULL COMMENT '权限',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员组';

-- ----------------------------
-- Records of bage_admin_group
-- ----------------------------
INSERT INTO `bage_admin_group` VALUES ('1', '超级管理', 'administrator', '', '0');
INSERT INTO `bage_admin_group` VALUES ('2', '禁用', 'administrator', 'Y', '0');

-- ----------------------------
-- Table structure for bage_admin_logger
-- ----------------------------
DROP TABLE IF EXISTS `bage_admin_logger`;
CREATE TABLE `bage_admin_logger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `catalog` enum('login','create','update','delete','other','browse') NOT NULL DEFAULT 'other' COMMENT '类型',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `intro` text COMMENT '操作',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT '操作ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='管理员日志';

-- ----------------------------
-- Records of bage_admin_logger
-- ----------------------------
INSERT INTO `bage_admin_logger` VALUES ('1', '1', 'login', '/bagecms/index.php?r=admini/public/login', '用户登录成功:admin', '0.0.0.0', '1414992639');
INSERT INTO `bage_admin_logger` VALUES ('2', '1', 'update', '/bagecms/index.php?r=admini/config/index', '更新系统配置，模块：index', '0.0.0.0', '1414992889');
INSERT INTO `bage_admin_logger` VALUES ('3', '1', 'update', '/bagecms/index.php?r=admini/page/update&id=1', '编辑单页，ID:1', '0.0.0.0', '1414993081');
INSERT INTO `bage_admin_logger` VALUES ('4', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=4', '编辑全局分类,ID:4,名称：产品', '0.0.0.0', '1414993261');
INSERT INTO `bage_admin_logger` VALUES ('5', '1', 'delete', '/bagecms/index.php?r=admini/catalog/batch&command=delete&id=6', '删除全局分类，ID:6', '0.0.0.0', '1414993458');
INSERT INTO `bage_admin_logger` VALUES ('6', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=5', '编辑全局分类,ID:5,名称：新品上市', '0.0.0.0', '1414993496');
INSERT INTO `bage_admin_logger` VALUES ('7', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=5', '编辑全局分类,ID:5,名称：760H模拟摄像机', '0.0.0.0', '1414993510');
INSERT INTO `bage_admin_logger` VALUES ('8', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：960H模拟摄像机', '0.0.0.0', '1414993557');
INSERT INTO `bage_admin_logger` VALUES ('9', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：枪式', '0.0.0.0', '1414993587');
INSERT INTO `bage_admin_logger` VALUES ('10', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=7', '编辑全局分类,ID:7,名称：960H模拟摄像机', '0.0.0.0', '1414993747');
INSERT INTO `bage_admin_logger` VALUES ('11', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=5', '编辑全局分类,ID:5,名称：760H模拟摄像机', '0.0.0.0', '1414993808');
INSERT INTO `bage_admin_logger` VALUES ('12', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：行业新闻1-1', '0.0.0.0', '1414993935');
INSERT INTO `bage_admin_logger` VALUES ('13', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=9', '编辑全局分类,ID:9,名称：行业新闻1-1', '0.0.0.0', '1414993955');
INSERT INTO `bage_admin_logger` VALUES ('14', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=4', '编辑全局分类,ID:4,名称：产品', '0.0.0.0', '1414995997');
INSERT INTO `bage_admin_logger` VALUES ('15', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=4', '编辑全局分类,ID:4,名称：产品', '0.0.0.0', '1415000899');
INSERT INTO `bage_admin_logger` VALUES ('16', '1', 'login', '/bagecms/index.php?r=admini/public/login', '用户登录成功:admin', '0.0.0.0', '1415067568');
INSERT INTO `bage_admin_logger` VALUES ('17', '1', 'login', '/bagecms/index.php?r=admini/public/login', '用户登录成功:admin', '0.0.0.0', '1415067568');
INSERT INTO `bage_admin_logger` VALUES ('18', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：660H模拟摄像机', '0.0.0.0', '1415093284');
INSERT INTO `bage_admin_logger` VALUES ('19', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：卧式', '0.0.0.0', '1415093319');
INSERT INTO `bage_admin_logger` VALUES ('20', '1', 'login', '/bagecms/index.php?r=admini/public/login', '用户登录成功:admin', '0.0.0.0', '1415151210');
INSERT INTO `bage_admin_logger` VALUES ('21', '1', 'create', '/bagecms/index.php?r=admini/post/create', '录入内容,ID:19', '0.0.0.0', '1415151507');
INSERT INTO `bage_admin_logger` VALUES ('22', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=8', '编辑全局分类,ID:8,名称：枪式', '0.0.0.0', '1415151630');
INSERT INTO `bage_admin_logger` VALUES ('23', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=5', '编辑全局分类,ID:5,名称：760H模拟摄像机', '0.0.0.0', '1415152196');
INSERT INTO `bage_admin_logger` VALUES ('24', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=5', '编辑全局分类,ID:5,名称：760H模拟摄像机', '0.0.0.0', '1415152330');
INSERT INTO `bage_admin_logger` VALUES ('25', '1', 'update', '/bagecms/index.php?r=admini/post/update&id=4', '编辑内容,ID:4', '0.0.0.0', '1415157155');
INSERT INTO `bage_admin_logger` VALUES ('26', '1', 'create', '/bagecms/index.php?r=admini/catalog/create', '录入全局分类,ID:名称：产品1', '0.0.0.0', '1415166166');
INSERT INTO `bage_admin_logger` VALUES ('27', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=12', '编辑全局分类,ID:12,名称：产品1', '0.0.0.0', '1415166187');
INSERT INTO `bage_admin_logger` VALUES ('28', '1', 'login', '/bagecms/index.php?r=admini/public/login', '用户登录成功:admin', '0.0.0.0', '1415245376');
INSERT INTO `bage_admin_logger` VALUES ('29', '1', 'update', '/bagecms/index.php?r=admini/catalog/update&id=8', '编辑全局分类,ID:8,名称：枪式', '0.0.0.0', '1415246156');
INSERT INTO `bage_admin_logger` VALUES ('30', '1', 'delete', '/bagecms/index.php?r=admini/catalog/batch&command=delete&id=9', '删除全局分类，ID:9', '0.0.0.0', '1415246209');
INSERT INTO `bage_admin_logger` VALUES ('31', '1', 'update', '/bagecms/index.php?r=admini/config/custom', '更新系统配置，模块：custom', '0.0.0.0', '1415250445');
INSERT INTO `bage_admin_logger` VALUES ('32', '1', 'update', '/bagecms/index.php?r=admini/config/seo', '更新系统配置，模块：seo', '0.0.0.0', '1415250482');
INSERT INTO `bage_admin_logger` VALUES ('33', '1', 'update', '/bagecms/index.php?r=admini/page/update&id=1', '编辑单页，ID:1', '0.0.0.0', '1415250572');
INSERT INTO `bage_admin_logger` VALUES ('34', '1', 'update', '/bagecms/index.php?r=admini/operation/adUpdate&id=1', '编辑广告，ID:1', '0.0.0.0', '1415252490');
INSERT INTO `bage_admin_logger` VALUES ('35', '1', 'update', '/bagecms/index.php?r=admini/operation/adUpdate&id=2', '编辑广告，ID:2', '0.0.0.0', '1415253318');
INSERT INTO `bage_admin_logger` VALUES ('36', '1', 'update', '/bagecms/index.php?r=admini/operation/adUpdate&id=1', '编辑广告，ID:1', '0.0.0.0', '1415253363');
INSERT INTO `bage_admin_logger` VALUES ('37', '1', 'create', '/bagecms/index.php?r=admini/operation/adCreate', '录入广告，ID:4', '0.0.0.0', '1415253411');
INSERT INTO `bage_admin_logger` VALUES ('38', '1', 'update', '/bagecms/index.php?r=admini/config/upload', '更新系统配置，模块：upload', '0.0.0.0', '1415253641');
INSERT INTO `bage_admin_logger` VALUES ('39', '1', 'update', '/bagecms/index.php?r=admini/operation/adUpdate&id=4', '编辑广告，ID:4', '0.0.0.0', '1415253653');
INSERT INTO `bage_admin_logger` VALUES ('40', '1', 'update', '/bagecms/index.php?r=admini/operation/adUpdate&id=3', '编辑广告，ID:3', '0.0.0.0', '1415253970');

-- ----------------------------
-- Table structure for bage_attr
-- ----------------------------
DROP TABLE IF EXISTS `bage_attr`;
CREATE TABLE `bage_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scope` enum('config','post','page') NOT NULL DEFAULT 'post' COMMENT '使用范围',
  `attr_name` varchar(50) NOT NULL COMMENT '字段名称',
  `attr_name_alias` char(50) NOT NULL DEFAULT '' COMMENT '字段别名',
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `tips` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `attr_type` enum('select','input','file','checkbox','textarea','radio') NOT NULL DEFAULT 'input' COMMENT '字段类型',
  `data_default` text COMMENT '字段默认数据',
  `max_lenght` int(11) NOT NULL DEFAULT '0' COMMENT '长度',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='扩展字段管理';

-- ----------------------------
-- Records of bage_attr
-- ----------------------------
INSERT INTO `bage_attr` VALUES ('1', 'config', '手机', 'mobile', '0', '', '0', 'input', '', '0', '1379553842');
INSERT INTO `bage_attr` VALUES ('2', 'config', '传真', 'fax', '0', '', '0', 'input', '', '0', '1379553920');
INSERT INTO `bage_attr` VALUES ('3', 'config', '电话', 'telephone', '0', '', '0', 'input', '', '0', '1379553920');
INSERT INTO `bage_attr` VALUES ('4', 'config', '400电话', 'telephone_400', '0', '', '0', 'input', '', '0', '1379553920');
INSERT INTO `bage_attr` VALUES ('5', 'config', '地址', 'address', '0', '', '0', 'input', '', '0', '1379553920');

-- ----------------------------
-- Table structure for bage_attr_val
-- ----------------------------
DROP TABLE IF EXISTS `bage_attr_val`;
CREATE TABLE `bage_attr_val` (
  `val_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性编号',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_val` text COMMENT '属性内容',
  PRIMARY KEY (`val_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属性内容';

-- ----------------------------
-- Records of bage_attr_val
-- ----------------------------

-- ----------------------------
-- Table structure for bage_catalog
-- ----------------------------
DROP TABLE IF EXISTS `bage_catalog`;
CREATE TABLE `bage_catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `catalog_name` varchar(100) NOT NULL COMMENT '名称',
  `catalog_name_second` varchar(100) DEFAULT '' COMMENT '副名称',
  `catalog_name_alias` varchar(100) NOT NULL DEFAULT '' COMMENT '别名',
  `content` text COMMENT '详细介绍',
  `seo_title` varchar(100) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` text COMMENT 'seo描述',
  `attach_file` varchar(100) DEFAULT '' COMMENT '附件',
  `attach_thumb` varchar(100) DEFAULT '' COMMENT '缩略图',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `data_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数据量',
  `page_size` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '每页显示数量',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `menu_is` enum('Y','N') DEFAULT 'N' COMMENT '是否导航显示',
  `redirect_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `display_type` enum('page','list') NOT NULL DEFAULT 'list' COMMENT '显示方式',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_page` varchar(100) NOT NULL DEFAULT '' COMMENT '单页模板',
  `template_show` varchar(100) NOT NULL DEFAULT '' COMMENT '内容页模板',
  `acl_browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览权限',
  `acl_operate` varchar(255) NOT NULL DEFAULT '' COMMENT '操作权限',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='全局分类';

-- ----------------------------
-- Records of bage_catalog
-- ----------------------------
INSERT INTO `bage_catalog` VALUES ('1', '0', '新闻', '新闻', 'news', '新闻栏目介绍', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_text', 'list_page', 'show_post', '', '', '1379545020');
INSERT INTO `bage_catalog` VALUES ('2', '1', '公司动态', '公司动态', 'company-news', '公司动态栏目介绍', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_text', 'list_page', 'show_post', '', '', '1379545199');
INSERT INTO `bage_catalog` VALUES ('3', '1', '行业新闻', '行业新闻', 'industry-news', '行业新闻栏目介绍', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_text', 'list_page', 'show_post', '', '', '1379545248');
INSERT INTO `bage_catalog` VALUES ('4', '0', '产品', '产品', 'goods', '产品栏目介绍', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_post', '', '', '1379545330');
INSERT INTO `bage_catalog` VALUES ('5', '4', '760H摄像机', '760H模拟摄像机', '760H', '新品上市栏目介绍', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_goods', '', '', '1379545388');
INSERT INTO `bage_catalog` VALUES ('7', '4', '960H摄像机', '960H模拟摄像机', '960H', '', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_post', '', '', '1414993557');
INSERT INTO `bage_catalog` VALUES ('8', '5', '枪式', '枪式', 'qiang', '', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_goods', '', '', '1414993587');
INSERT INTO `bage_catalog` VALUES ('10', '4', '660H摄像机', '660H模拟摄像机', '660H', '', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_post', '', '', '1415093284');
INSERT INTO `bage_catalog` VALUES ('11', '5', '卧式', '卧式', 'woshi', '', '', '', '', '', '', '0', '0', '0', 'Y', 'N', '', 'list', 'list_product', 'list_page', 'show_post', '', '', '1415093319');

-- ----------------------------
-- Table structure for bage_config
-- ----------------------------
DROP TABLE IF EXISTS `bage_config`;
CREATE TABLE `bage_config` (
  `scope` char(20) NOT NULL DEFAULT '' COMMENT '范围',
  `variable` varchar(50) NOT NULL COMMENT '变量',
  `value` text COMMENT '值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置';

-- ----------------------------
-- Records of bage_config
-- ----------------------------
INSERT INTO `bage_config` VALUES ('base', 'site_name', '石头安防', '');
INSERT INTO `bage_config` VALUES ('base', 'site_domain', 'http://www.bagecms.com', '');
INSERT INTO `bage_config` VALUES ('base', 'admin_email', 'abc@qq.com', '');
INSERT INTO `bage_config` VALUES ('base', 'site_icp', '', '');
INSERT INTO `bage_config` VALUES ('base', 'site_closed_summary', '系统维护中，请稍候......', '');
INSERT INTO `bage_config` VALUES ('base', 'site_stats', '', '');
INSERT INTO `bage_config` VALUES ('base', 'seo_title', '石头安防', '');
INSERT INTO `bage_config` VALUES ('base', 'seo_description', '石头安防', '');
INSERT INTO `bage_config` VALUES ('base', 'seo_keywords', '安防', '');
INSERT INTO `bage_config` VALUES ('base', 'admin_telephone', '18606712910', '');
INSERT INTO `bage_config` VALUES ('base', 'site_status', 'open', '');
INSERT INTO `bage_config` VALUES ('base', 'site_status_intro', '网站升级中..........', '');
INSERT INTO `bage_config` VALUES ('base', 'admin_logger', 'open', '');
INSERT INTO `bage_config` VALUES ('base', 'user_status', 'open', '');
INSERT INTO `bage_config` VALUES ('base', 'user_mail_verify', 'open', '');
INSERT INTO `bage_config` VALUES ('base', 'site_copyright', 'COPYRIGHT © 2012 - 2014 BageCMS. ALL RIGHTS RESERVED.八哥内容管理系统 版权所有', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_size', '100x100', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_file', 'static/watermark.png', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_status', 'close', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_allow_ext', 'jpg,gif,bmp,jpeg,png,doc,zip,rar,7z,txt,sql,pdf', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_max_size', '2000', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_scope', '100x100', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_position', '5', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_padding', '5', '');
INSERT INTO `bage_config` VALUES ('base', 'upload_water_trans', '30', '');
INSERT INTO `bage_config` VALUES ('custom', '_address', '上海市浦东新区川沙镇', '');
INSERT INTO `bage_config` VALUES ('custom', '_fasdf', 'fasfcccccccccccc', '');
INSERT INTO `bage_config` VALUES ('custom', '_telephone', '(+86 10) 5992 8888', '');
INSERT INTO `bage_config` VALUES ('custom', '_telephone_400', '400 888 888', '');
INSERT INTO `bage_config` VALUES ('custom', '_fax', '传真:(+86 10) 5992 0000', '');
INSERT INTO `bage_config` VALUES ('custom', '_mobile', '18600000000', '');

-- ----------------------------
-- Table structure for bage_link
-- ----------------------------
DROP TABLE IF EXISTS `bage_link`;
CREATE TABLE `bage_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) NOT NULL COMMENT '名称',
  `site_url` varchar(255) NOT NULL COMMENT '链接地址',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `link_type` enum('image','txt') NOT NULL DEFAULT 'txt' COMMENT '链接类型',
  `attach_file` varchar(100) NOT NULL DEFAULT '' COMMENT '链接图片',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '显示状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of bage_link
-- ----------------------------

-- ----------------------------
-- Table structure for bage_page
-- ----------------------------
DROP TABLE IF EXISTS `bage_page`;
CREATE TABLE `bage_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `title_second` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_alias` char(40) NOT NULL COMMENT '标签',
  `html_path` varchar(100) NOT NULL DEFAULT '' COMMENT 'html路径',
  `html_file` varchar(100) NOT NULL DEFAULT '' COMMENT 'html文件',
  `intro` text COMMENT '简单描述',
  `content` mediumtext NOT NULL COMMENT '内容',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO KEYWORDS',
  `seo_description` text COMMENT 'SEO DESCRIPTION',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `attach_file` varchar(60) NOT NULL DEFAULT '' COMMENT '附件',
  `attach_thumb` varchar(60) NOT NULL DEFAULT '' COMMENT '附件小图',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='单页';

-- ----------------------------
-- Records of bage_page
-- ----------------------------
INSERT INTO `bage_page` VALUES ('1', '关于我们', '', 'about', '', '', '   上海石头电子科技有限公司是一家提供安防系统整体解决方案（Total Solution）的高科技产业集团。公司集安防系统硬件产品（Product）的研发生产、标准化和定制化安防行业解决方案（Solution）的提供于一身，是服务于安防渠道客户的标准化安防系统供应商，也是满足于广大工程客户的定制化需求的最佳安防行业解决方案云端技术服务（Service）提供商。', '<p>\r\n	BageCms是一款基于php5+mysql5开发的多功能开源的网站内容管理系统。使用高性能的PHP5的web应用程序开发框架YII构建，具有操作简单、稳定、安全、高效、跨平台等特点。采用MVC设计模式，模板定制方便灵活，内置小挂工具，方便制作各类功能和效果，BageCms可用于企业建站、个人博客、资讯门户、图片站等各类型站点。<br />\r\n<br />\r\n特点：<br />\r\n<br />\r\n1.开源免费<br />\r\n无论是个人还是企业展示型网站均可用本系统来完成<br />\r\n<br />\r\n2.数据调用方便快捷<br />\r\n自主研发的数据调用模块，能快速调用各类型数据，方便建站<br />\r\n<br />\r\n3.应用范围广<br />\r\n这套系统不是企业网站管理系统，也不是博客程序，更不是专业的图片管理系统，但它却具备大部分企业站、博客站、图片站的功能<br />\r\n<br />\r\n4.安全高性能<br />\r\n基于高性能的PHP5的web应用程序开发框架YII构建具有稳定、安全、高效、跨平台等特点<br />\r\n<br />\r\n5.URL自定义<br />\r\n系统支持自定义伪静态显示方式，良好的支持搜索引擎SEO。个性化设置每个栏目、内容的标题标签、描述标签、关键词标签<br />\r\n<br />\r\n6.自定义数据模型<br />\r\n系统可自定义数据模型满足各种表示形式和字段需求<br />\r\n<br />\r\n7.完善的后台权限控制<br />\r\n特有的管理员权限管理机制，可以灵活设置管理员的栏目管理权限、网站信息的添加、修改、删除权限等<br />\r\n<br />\r\n<br />\r\n系统运行环境：<br />\r\n数据库： mysql5+<br />\r\nPHP版本：php5.2.+<br />\r\n服务器：linux,unix,freebsd等<br />\r\n<br />\r\n官方网址：http://www.bagecms.com<br />\r\n下载地址：http://www.bagecms.com/download/bagecms<br />\r\n<br />\r\n演示地址：http://demo.bagecms.com<br />\r\n后台地址：http://demo.bagecms.com/admini<br />\r\n用户：bagecms<br />\r\n密码：bagecms\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '', 'uploads/201309/logo.jpg', 'uploads/201309/logo.jpg', '0', '0', 'Y', '1322999570');
INSERT INTO `bage_page` VALUES ('2', '联系我们', '', 'contact', '', '', '', '<p>\r\n	QQ:5565907\r\n</p>\r\n<p>\r\n	QQ群：139869141\r\n</p>\r\n<p>\r\n	BageCMS官方网站：<a href=\"http://www.bagecms.com\" target=\"_blank\">http://www.bagecms.com</a>\r\n</p>\r\n<p>\r\n	八哥软件官方网站：<a href=\"http://www.bagesoft.cn\" target=\"_blank\">http://www.bagesoft.cn</a>\r\n</p>', '', '', '', '', '', '', '0', '0', 'Y', '1322999588');
INSERT INTO `bage_page` VALUES ('3', '企业文化', '', 'cultural', '', '', '企业文化是企业为解决生存和发展的问题的而树立形成的，被组织成员认为有效而共享，并共同遵循的基本信念和认知。 企业文化集中体现了一个企业经营管理的核心主张，以及由此产生的组织行为。', '<div>\r\n	<div>\r\n		迪尔和肯尼迪把企业文化整个理论系统概述为5个要素，即企业环境、价值观、英雄人物、文化仪式和文化网络。\r\n	</div>\r\n	<div>\r\n		企业环境是指企业的性质、企业的经营方向、外部环境、企业的社会形象、与外界的联系等方面。它往往决定企业的行为。\r\n	</div>\r\n	<div>\r\n		价值观是指企业内成员对某个事件或某种行为好与坏、善与恶、正确与错误、是否值得仿效的一致认识。价值观是企业文化的核心，统一的价值观使企业内成员在判断自己行为时具有统一的标准，并以此来选择自己的行为。\r\n	</div>\r\n	<div>\r\n		英雄人物是指企业文化的核心人物或企业文化的人格化，其作用在于作为一种活的样板，给企业中其他员工提供可供仿效的榜样，对企业文化的形成和强化起着极为重要的作用。\r\n	</div>\r\n	<div>\r\n		文化仪式是指企业内的各种表彰、奖励活动、聚会以及文娱活动等，它可以把企业中发生的某些事情戏剧化和形象化，来生动的宣传和体现本企业的价值观，使人们通过这些生动活泼的活动来领会企业文化的内涵，使企业文化“寓教于乐”之中。\r\n	</div>\r\n	<div>\r\n		文化网络是指非正式的信息传递渠道，主要是传播文化信息。它是由某种非正式的组织和人群，以及某一特定场合所组成，它所传递出的信息往往能反映出职工的愿望和心态。\r\n	</div>\r\n	<h3>\r\n		产生\r\n	</h3>\r\n	<div>\r\n		企业领导者把文化的变化人的功能应用于企业，以解决现代企业管理中的问题，就有了企业文化。企业管理理论和企业文化管理理论都追求效益。但前者为追求效益而把人当作客体，后者为追求效益把文化概念自觉应用于企业，把具有丰富创造性的人作为管理理论的中心。这种指导思想反映到企业管理中去，就有了人们称之为企业文化的种种观念。\r\n	</div>\r\n	<h3>\r\n		认识\r\n	</h3>\r\n	<div>\r\n		从企业文化的现实出发，进行深入的调查研究，把握企业文化各种现象之间的本质联系。依据实践经验，从感认认识到理性认识，进行科学的概括、总结。\r\n	</div>\r\n	<h3>\r\n		意义\r\n	</h3>\r\n	<div>\r\n		一．企业文化能激发员工的使命感。不管是什么企业都有它的责任和使命，企业使命感是全体员工工作的目标和方向，是企业不断发展或前进的动力之源。\r\n	</div>\r\n	<div>\r\n		二．企业文化能凝聚员工的归属感。　企业文化的作用就是通过企业价值观的提炼和传播，让一群来自不同地方的人共同追求同一个梦想。\r\n	</div>\r\n	<div>\r\n		三．企业文化能加强员工的责任感。企业要通过大量的资料和文件宣传员工责任感的重要性，管理人员要给全体员工灌输责任意识，危机意识和团队意识，要让大家清楚地认识企业是全体员工共同的企业。\r\n	</div>\r\n	<div>\r\n		四．企业文化能赋予员工的荣誉感。每个人都要在自己的工作岗位，工作领域，多做贡献，多出成绩，多追求荣誉感。\r\n	</div>\r\n	<div>\r\n		五．企业文化能实现员工的成就感。一个企业的繁荣昌盛关系到每一个公司员工的生存，企业繁荣了，员工们就会引以为豪，会更积极努力的进取，荣耀越高，成就感就越大，越明显。\r\n	</div>\r\n</div>\r\n<div>\r\n</div>', '', '', '', '', '', '', '0', '0', 'Y', '1331877791');
INSERT INTO `bage_page` VALUES ('4', '管理团队', '', 'team', '', '', '团队是现代企业管理中战斗的核心，几乎没有一家企业不谈团队，好象团队就是企业做大做强的灵丹妙药，只要抓紧团队建设就能有锦锈前程了。团队是个好东西，但怎样的团队才算一个好团队，怎样才能运作好一个团队呢？却是许多企业管理者不甚了然的，于是在企业团队建设的过程中就出现了许多弊病，例如从理论著作中生搬硬套到团队运作里面，是很难产生好团队的。', '<div>\r\n	<div>\r\n		团队是现代企业管理中战斗的核心，几乎没有一家企业不谈团队，好象团队就是企业做大做强的灵丹妙药，只要抓紧团队建设就能有锦锈前程了。团队是个好东西，但怎样的团队才算一个好团队，怎样才能运作好一个团队呢？却是许多企业管理者不甚了然的，于是在企业团队建设的过程中就出现了许多弊病，例如从理论著作中生搬硬套到团队运作里面，是很难产生好团队的。任何理念都不能执着，执着生僵化，就会蜕变为形式主义，后果很糟糕。在如今企业管理者热火朝天进行的团队建设中就存在这个问题，将团队作为企业文化建设的至上准则是不恰当的，是不符合多元化的现实状况的。\r\n	</div>\r\n	<div>\r\n		一个优秀的企业管理者，应该怎样管理员工?道理也很简单，那就是要给员工创造一个充分利用自己的个性将工作干得最好的条件。不一定什么都要团队化，太死板了。虽然现在的企业也都提倡创新，但如果管理者过分强调团队精神，则员工的创新精神必然受到压抑。压抑个性就是压抑创新，没有个性哪来的创新?说得极端一点，企业管理者要谨防团队建设法西斯化。团队是需要的，企业管理者在团队建设的同时要遵循一个原则，不能压抑员工的个性。在团队内部，企业管理者要给员工充分的自由，少说几句少数服从多数，要知道，聪明的人在世界上还就占少数。\r\n	</div>\r\n	<div>\r\n		企业管理者应该解放思想，要有多元化的思维。不同的企业，团队的性质也不一样。要量体裁衣建设符合企业内在要求的团队，要灵活变化，别搞一刀切。如果该企业是劳动密集型企业，那你可以建设一支高度纪律性组织性的团队。如果该企业是知识密集型企业，那就要以自由主义来管理员工了，建立一支人尽其才的团队是最重要的，严格说算不上是团队，也没必要强调团队，更注重的应该是员工的个人创造力，千万别让团队束缚住员工的头脑，当然应该有的纪律和合作也是不可少的。如果企业既有创造型员工也有操作型员工，那可将团队建设重点放到操作型员工身上。需要注意的一点是，越聪明的人越倾向个人主义，这个情况，企业管理者要注意有的放矢。\r\n	</div>\r\n</div>\r\n<div>\r\n</div>', '', '', '', '', '', '', '0', '0', 'Y', '1379392484');

-- ----------------------------
-- Table structure for bage_post
-- ----------------------------
DROP TABLE IF EXISTS `bage_post`;
CREATE TABLE `bage_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '用户',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `author` varchar(100) NOT NULL DEFAULT '' COMMENT '作者',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `title_second` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_alias` char(50) NOT NULL DEFAULT '' COMMENT '别名 ',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式序列化',
  `html_path` varchar(100) NOT NULL DEFAULT '' COMMENT 'html路径',
  `html_file` varchar(100) NOT NULL DEFAULT '' COMMENT 'html文件名',
  `template` varchar(60) NOT NULL DEFAULT '' COMMENT '模板',
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `special_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '专题编号',
  `intro` text COMMENT '摘要',
  `image_list` text COMMENT '组图',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_description` text COMMENT 'SEO描述',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `content` mediumtext NOT NULL COMMENT '内容',
  `copy_from` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `copy_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源url',
  `redirect_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转URL',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT 'tags',
  `view_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '查看次数',
  `commend` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '推荐',
  `attach_status` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '是否上传附件',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `attach_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `favorite_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `attention_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注次数',
  `top_line` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '头条',
  `last_update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复次数',
  `reply_allow` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '允许评论',
  `sort_desc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `acl` varchar(100) NOT NULL DEFAULT 'Y' COMMENT '权限检测',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '新闻状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='内容管理';

-- ----------------------------
-- Records of bage_post
-- ----------------------------
INSERT INTO `bage_post` VALUES ('1', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '0', '', '', '', '', '', '【中奖号码计算方法】：开奖日前一天的“全国福利彩票新3D开奖号码”+“全国体育彩票排列5开奖号码”+“百度收盘股价小数点后两位” = 10位数（即3组数字合并，10位均按顺序排列，此10位数若首位为0则去掉）。<br />\r\n★ 以此10位数整除以活动截止日（xxx年x月xx日 23:59:59）的所有抽奖人数（每个抽奖号即为一个抽奖人数），得到的余数+1即为本次活动的获奖号码<br />\r\n① 若获奖号码不足7位，则再加上本次所有抽奖人数，直至加到不为空的抽奖号码为止，此号码为本次活动的中奖号码。<br />\r\n② 获奖号码满足7位，但中奖号码为空，则再减去本次抽奖人数之和，直至减不为空的抽奖号码为止，此号码为本次活动的中奖号码。<br />\r\n③ 如彩票开奖方开奖时间滞后,或股票交易所休市则本活动开奖日也将进行相应的顺延；<br />\r\n④如果当天需要开多个奖，则用此号码分别+011 +021 +031……得出当天其他获奖号码。如果开奖最后一天抽奖号码加值后超过了总参加人数，则将抽奖号码减去总参加人数得到新的抽奖号码。<br />\r\n<p>\r\n	若您的“抽奖号”与最终获奖号码完全一致，就可以获得本次活动的大奖啦！\r\n</p>\r\n<p>\r\n	<img src=\"/cms/uploads/201309/523a32fdf1f07.jpg\" alt=\"\" /> \r\n</p>\r\n★ 例如：<br />\r\n如2013年7月10日<br />\r\n新3D号码：4,8,7<br />\r\n排列5号码：8，2，9，0，5<br />\r\n百度股票收盘价：93.43 小数点后2位：4,3<br />\r\n将这3组数依序合并后得到4878290543<br />\r\n如果截止至7月15日23:59:59活动结束时的抽奖人数为28999<br />\r\n以4878290543整除以28999，商为168222，余数：20765&nbsp;<br />\r\n得到余数加1， 20765+1=20766。<br />\r\n不足7位数，则20766+28999+……+28999=1006732<br />\r\n：【兑奖流程】：1、我们的客服人员会与中奖者电话联系，并核实百度账号和手机号码等，确认获奖信息和使用规则。<br />\r\n2、中奖用户在体验特权前1天内，请电话联系团团。（4000-998-998）<br />\r\n3、若因信息错误或无效等造成的开奖后15个工作日内无法联系到中奖者，视为中奖者自动放弃该奖品，中奖号码+1顺延下一位。', '', '', '', '', '5', 'N', 'Y', 'uploads/201309/523a32e18f2c4.jpg', 'uploads/201309/thumb_523a32e18f2c4.jpg', '0', '0', 'N', '1379545939', '0', 'Y', '0', '', 'Y', '1379545825');
INSERT INTO `bage_post` VALUES ('20', '1', '', '', 'DFG-52 防雷摄像机', '', 'dfg52', '', '', '', '', '', '8', '0', null, null, '', null, '', 'fdsfdsfds', '', '', '', '', '1', 'N', 'Y', 'uploads/201411/f144e81a4bc73064780f79553a166b10.jpg', 'uploads/201411/thumb_f144e81a4bc73064780f79553a166b10.jpg', '0', '0', 'N', '0', '0', 'Y', '0', 'Y', 'Y', '0');
INSERT INTO `bage_post` VALUES ('2', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '2', '', '', '', '', '', '<h2>\r\n	套餐介绍\r\n</h2>\r\n<div>\r\n	- 单人观影票1张<br />\r\n&nbsp;&nbsp;3D通兑，不限影厅，不限时间，不限影片<br />\r\n- 3D眼镜无需押金<br />\r\n- 不涉及明星见面会及首映礼<br />\r\n- 2月22日上映的霍比特人需到电影院另付10元<br />\r\n</div>\r\n<h2>\r\n	购买须知\r\n</h2>\r\n<div>\r\n	1、糯米券有效期：2013年05月02日-2013年09月30日&nbsp;<br />\r\n2、春节期间（2013年2月9日-14日）不可使用&nbsp;<br />\r\n3、影院营业时间：10:00-22:00&nbsp;<br />\r\n4、无需预约，在影城现场可凭糯米券提前兑换影票，具体场次请咨询影院&nbsp;<br />\r\n5、影院咨询电话：0571-86506355&nbsp;<br />\r\n6、8月13日，18:00以后不能使用糯米券&nbsp;<br />\r\n7、1.1米（含）以下儿童免费，1.1-1.3米儿童收取半价（影院正价的一半），1.3米（含）以上儿童全价&nbsp;<br />\r\n8、具体影片放映安排以影院档期为准，建议尽量避开周二、周三观影高峰&nbsp;<br />\r\n9、糯米券不限购买，每张糯米券限1人使用&nbsp;<br />\r\n10、不与其他优惠同享&nbsp;\r\n</div>', '', '', '', '', '1', 'N', 'Y', 'uploads/201309/523a334c32afc.jpg', 'uploads/201309/thumb_523a334c32afc.jpg', '0', '0', 'N', '1379548554', '0', 'Y', '0', '', 'Y', '1379545932');
INSERT INTO `bage_post` VALUES ('21', '1', '', '', 'DFG-52 防雷摄像机', '', 'dfg52', '', '', '', '', '', '8', '0', null, null, '', null, '', 'fdsfdsfds', '', '', '', '', '2', 'N', 'Y', 'uploads/201411/f144e81a4bc73064780f79553a166b10.jpg', 'uploads/201411/thumb_f144e81a4bc73064780f79553a166b10.jpg', '0', '0', 'N', '0', '0', 'Y', '0', 'Y', 'Y', '0');
INSERT INTO `bage_post` VALUES ('3', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '1', '', '', '', '', '', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>\r\n				内容\r\n			</th>\r\n			<th>\r\n				单价\r\n			</th>\r\n			<th>\r\n				数量/规格\r\n			</th>\r\n			<th>\r\n				小计\r\n			</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				代金券\r\n			</td>\r\n			<td>\r\n				50元\r\n			</td>\r\n			<td>\r\n				1张\r\n			</td>\r\n			<td>\r\n				50元\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	价值：50元\r\n</p>\r\n<p>\r\n	美团价：39元\r\n</p>\r\n<ul>\r\n	<li>\r\n		适用范围：仅适用于菜品，全场通用\r\n	</li>\r\n	<li>\r\n		店内人均消费参考价格：40元\r\n	</li>\r\n	<li>\r\n		店内部分菜品价格参考：<br />\r\n吴哥红烧肉（42元/份）<br />\r\n开屏武鲳鱼（39元/份）<br />\r\n窝蛋肥牛（30元/份）<br />\r\n窜烤芋饺（20元/份）<br />\r\n香酱扒时蔬（18元/份）<br />\r\n糖醋里脊（18元/份）<br />\r\n金针菇沃豆腐（12元/份）<br />\r\n豉酱扇贝（6元/份）<br />\r\n水果红豆挞（3元/份）\r\n	</li>\r\n</ul>\r\n<div>\r\n	<h5>\r\n		购买须知\r\n	</h5>\r\n有效期：2013.8.21 至 2013.12.20（周末、法定节假日通用）使用时间：11:00-14:00预约提醒：无需预约，消费高峰可能需要等位使用规则：\r\n	<ul>\r\n		<li>\r\n			凭美团券到店消费不可同时享受店内其他优惠\r\n		</li>\r\n		<li>\r\n			代金券可自由叠加使用，不找零、不兑现\r\n		</li>\r\n		<li>\r\n			堂食外带均可，如需打包，请支付打包费1元/盒\r\n		</li>\r\n		<li>\r\n			仅限大厅用餐，不可使用包间\r\n		</li>\r\n		<li>\r\n			酒水、饮料等问题请致电商家咨询，以商家反馈为准\r\n		</li>\r\n	</ul>\r\n</div>', '', '', '', '', '1', 'N', 'Y', 'uploads/201309/523a33ba3f56d.jpg', 'uploads/201309/thumb_523a33ba3f56d.jpg', '0', '0', 'N', '1379548577', '0', 'Y', '0', '', 'Y', '1379546042');
INSERT INTO `bage_post` VALUES ('4', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '2', '\r\n\r\n金足阁养生（1次，约60分钟，价值198元）\r\n- 后肩、背、腿部按摩 \r\n- 背、肾、腰部精油指压 \r\n- 臀部热油提拉手法 \r\n- 胸腹部按摩 \r\n- 肾经保健 \r\n- 腿部放松 ', '', '', '', '', '<div>\r\n	凭大众点评网团购券可享受以下内容：<br />\r\n<br />\r\n	<p>\r\n		金足阁养生（1次，约60分钟，价值198元）<br />\r\n- 后肩、背、腿部按摩&nbsp;<br />\r\n- 背、肾、腰部精油指压&nbsp;<br />\r\n- 臀部热油提拉手法&nbsp;<br />\r\n- 胸腹部按摩&nbsp;<br />\r\n- 肾经保健&nbsp;<br />\r\n- 腿部放松&nbsp;<br />\r\n注：<br />\r\n到店加付38元可升级为<br />\r\n水晶之恋（1次，约60分钟，价值268元）<br />\r\n- 后肩、背、腿部按摩&nbsp;<br />\r\n- 背、肾、腰部精油指压&nbsp;<br />\r\n- 臀部热油提拉手法&nbsp;<br />\r\n- 全身冰火护理<br />\r\n- 肾经保健&nbsp;&nbsp;<br />\r\n- 腿部放松<br />\r\n到店加付88元可升级为<br />\r\n木桶泡澡（1次，约90分钟，价值298元）<br />\r\n- 养生木桶泡澡<br />\r\n- 按摩床全身搓背<br />\r\n- 后肩、背、腿部按摩&nbsp;<br />\r\n- 背、肾、腰部精油指压&nbsp;<br />\r\n- 臀部热油提拉手法&nbsp;<br />\r\n- 胸腹部按摩&nbsp;<br />\r\n- 肾经保健&nbsp;&nbsp;<br />\r\n- 腿部放松<br />\r\n- 赠送<br />\r\n&nbsp; 茶水<br />\r\n- 免费提供停车位\r\n	</p>\r\n<br />\r\n</div>\r\n<br />\r\n<div>\r\n	<h3>\r\n		特别提示\r\n	</h3>\r\n	<p>\r\n		有效期：2013-09-02 至 2014-03-01\r\n	</p>\r\n	<p>\r\n		本团购券可使用商户详见页面右侧/手机客户端“查看适用商户”\r\n	</p>\r\n	<p>\r\n		无需预约\r\n	</p>\r\n	<p>\r\n		本店承诺无任何变相附加费用\r\n	</p>\r\n	<p>\r\n		请进店先验证后消费\r\n	</p>\r\n	<p>\r\n		本团购券限1人使用\r\n	</p>\r\n	<p>\r\n		团购产品须一次性体验完\r\n	</p>\r\n	<p>\r\n		不可与其他优惠同享\r\n	</p>\r\n	<p>\r\n		友情提醒：如需团购券发票，请在消费时向商户提出\r\n	</p>\r\n</div>', '', '', '', '贵族养生,休闲放松', '2', 'N', 'Y', 'uploads/201309/523a33e4d9ca8.jpg', 'uploads/201309/thumb_523a33e4d9ca8.jpg', '0', '0', 'N', '1415157155', '0', 'Y', '0', '', 'Y', '1379546084');
INSERT INTO `bage_post` VALUES ('5', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '2', '', '', '', '', '', '<h2>\r\n	套餐介绍\r\n</h2>\r\n<div>\r\n	<p>\r\n		凭糯米券可享最高价值347元杭州海底捞餐饮有限公司4-6人火锅套餐，包含：\r\n	</p>\r\n- 海鲜：<br />\r\n&nbsp; 虾滑（1份，价值38元）<br />\r\n&nbsp; 鲍鱼条（1份，价值29元）<br />\r\n- 肉类：<br />\r\n&nbsp; 雪花肥牛（1份，价值68元）<br />\r\n&nbsp; 雪花肥羊（1份，价值38元）<br />\r\n&nbsp; 养生乌鸡卷（1份，价值38元）<br />\r\n&nbsp; 撒尿牛丸（1份，价值23元）<br />\r\n&nbsp; 牛百叶（1份，价值18元）<br />\r\n- 素菜：<br />\r\n&nbsp; 金针菇（1份，价值13元）<br />\r\n&nbsp; 生菜（1份，价值10元）<br />\r\n&nbsp; 木耳（1份，价值10元）<br />\r\n&nbsp; 粉条（1份，价值10元）<br />\r\n&nbsp; 油豆腐（1份，价值8元）<br />\r\n&nbsp; 油条（1份，价值6元）<br />\r\n- 以下火锅锅底3选1：<br />\r\n&nbsp; 清凉清汤锅（1份，价值38元）<br />\r\n&nbsp; 番茄鸳鸯锅（1份，价值38元）&nbsp;<br />\r\n&nbsp; 红汤鸳鸯锅（1份，价值28元）<br />\r\n- 餐具免费<br />\r\n- 到店另付5元/位，可享调料+酸梅汁，爆米花无限供应<br />\r\n</div>\r\n<h2>\r\n	购买须知\r\n</h2>\r\n<div>\r\n	1、糯米券有效期2012年09月29日至2013年11月29日&nbsp;<br />\r\n2、营业时间：11:00-22:00&nbsp;<br />\r\n3、消费请提前24小时预约，电话：0571-86981777；0571-86731717&nbsp;<br />\r\n4、糯米券可购多张，每桌限用1张糯米券，每张券不限使用人数，但建议4-6人享用&nbsp;<br />\r\n5、糯米券节假日通用&nbsp;<br />\r\n6、糯米券不可与其他优惠同享\r\n</div>', '', '', '', '', '3', 'N', 'Y', 'uploads/201309/523a34556cfae.jpg', 'uploads/201309/thumb_523a34556cfae.jpg', '0', '0', 'N', '1379547360', '0', 'Y', '0', '', 'Y', '1379546197');
INSERT INTO `bage_post` VALUES ('6', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '5', '2', '', '', '', '', '', '<h2>\r\n	购买须知\r\n</h2>\r\n<div>\r\n	·拉手券于2013年6月24日（周一）生效&nbsp;<br />\r\n·拉手券有效期截止至2013年10月30日，节假日通用&nbsp;<br />\r\n·营业时间：请见地址信息栏&nbsp;<br />\r\n·为了您更好的消费，请至少提前1天预约，商家于2013年6月24日开始接受预约，预约电话详见地址信息栏，预约时无需出示拉手券密码&nbsp;<br />\r\n·每人每次不限使用拉手券张数，迷你包2张起唱，小包4张起唱，中包6张起唱，中大包8张起唱，大包10张起唱&nbsp;<br />\r\n·商家根据实际人数提供包厢，详情请咨询商家&nbsp;<br />\r\n·本次团购内容需一次性消费完成，商家谢绝自带酒水食品入内，敬请谅解<br />\r\n·拉手券不与店内其他优惠同享&nbsp;<br />\r\n</div>\r\n<h2>\r\n	详情介绍\r\n</h2>\r\n<div>\r\n	<h4>\r\n		【本单详情】\r\n	</h4>\r\n	<p>\r\n		凭拉手券享受麦乐迪KTV欢唱券一张：仅限下午场（12:00-18:00）/午夜场（23:30-次日凌晨05:50），2选1使用，最多连续欢唱6小时，每人每次不限使用拉手券张数，迷你包2张起唱，小包4张起唱，中包6张起唱，中大包8张起唱，大包10张起唱！怎能错过每一个high歌的机会！市场价600元，现在团购仅售4.8元！\r\n	</p>\r\n	<p>\r\n		迷你包建议1-2人，小包建议3-4人，中包建议5-6人，中大包建议7-8人，大包建议8-12人\r\n	</p>\r\n	<h4>\r\n		【温馨提示】\r\n	</h4>\r\n	<ul>\r\n		<li>\r\n			拉手券于2013年6月24日（周一）生效\r\n		</li>\r\n		<li>\r\n			拉手券有效期截止至2013年10月30日，节假日通用\r\n		</li>\r\n		<li>\r\n			营业时间：请见地址信息栏\r\n		</li>\r\n		<li>\r\n			为了您更好的消费，请至少提前1天预约，商家于2013年6月24日开始接受预约，预约电话详见地址信息栏，预约时无需出示拉手券密码\r\n		</li>\r\n		<li>\r\n			每人每次不限使用拉手券张数，迷你包2张起唱，小包4张起唱，中包6张起唱，中大包8张起唱，大包10张起唱\r\n		</li>\r\n		<li>\r\n			商家根据实际人数提供包厢，详情请咨询商家\r\n		</li>\r\n		<li>\r\n			本次团购内容需一次性消费完成，商家谢绝自带酒水食品入内，敬请谅解\r\n		</li>\r\n	</ul>\r\n</div>', '', '', '', '麦乐迪,KTV', '5', 'N', 'Y', 'uploads/201309/523a34b4821e3.jpg', 'uploads/201309/thumb_523a34b4821e3.jpg', '0', '0', 'N', '1379547353', '0', 'Y', '0', '', 'Y', '1379546248');
INSERT INTO `bage_post` VALUES ('7', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	腾讯科技 金铎 9月19日报道\r\n</p>\r\n<p>\r\n	苹果周三正式面向普通用户开放了iOS 7更新，全新的iOS 7支持以下设备：iPhone 4/4S/5，iPhone 5c和iPhone 5s；iPad 2/3/4，iPad mini；iPod touch 5。\r\n</p>\r\n<p>\r\n	iOS 7是iOS系统自2007年iPhone发布以来最大一次升级，它 采用全新的图标界面设计，总计有上百项改动，其中包括控制中心 、通知中心、多任务处理能力等等。\r\n</p>\r\n<p>\r\n	为了适应iOS 7，Safari网络浏览器也作出了相应的调整和改进，首先就是外表更加的简洁，以顺应扁平化的核心设计理念。Safari的标签页面是最大的突破，因为采用了3D网页标签，而且每一个标签页都有自己的概览显示。\r\n</p>\r\n<p>\r\n	iOS 7新增了一个无线点对点分享工具AirDrop，让iPhone之间可以通过WiFi交换文件。AirDrop可以自动显示身边的联系人，选定联系人和内容就可以发送给对方，无需设置网络，而且有完整加密。\r\n</p>\r\n<p>\r\n	iOS 7对相机功能也有改进，最大的特色就是在不同模式之间转换比以往更加方便。还有一点需要指出的是，iOS 7下的相机安装了类似于Instagram的滤镜。\r\n</p>\r\n<p>\r\n	此外，iOS 7下全新的照片应用程序能够根据拍摄时间和地点自动生成相册，用户也可以通过iCloud、电子邮件、Facebook或者Twitter等和好友分享照片。\r\n</p>', '', '', '', 'iOS7,普通用户,全新图标设计', '2', 'N', 'Y', 'uploads/201309/523a36f528948.jpg', 'uploads/201309/thumb_523a36f528948.jpg', '0', '0', 'N', '1379547345', '0', 'Y', '0', '', 'Y', '1379546869');
INSERT INTO `bage_post` VALUES ('8', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '9月18日，阿里巴巴的两只小额贷款资产证券化产品在深交所挂牌上市。对阿里巴巴而言，此举盘活了存量资产，有效地解决了小贷公司因不能吸收存款而带来的发展难题，也让阿里巴巴在互联网企业的“金融战”中赢得了先机。\r\n这是阿里巴巴的一大步，也可能是整个中国金融产品大发展进程中的一大步。阿里巴巴成功将信贷资产证券化并在交易所挂牌交易，这对错失先机的传统银行业而言无疑是一个巨大的刺激——潜在竞争者已跑在前面；不过，银行业也尽可以为此事欢呼——既然阿里能够这样做，为何银行业不可？', '', '', '', '', '<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	9月18日，<a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/hk/ggcx/01688.htm\" target=\"_blank\">阿里巴巴</a>的两只小额贷款资产证券化产品在深交所挂牌上市。对阿里巴巴而言，此举盘活了存量资产，有效地解决了小贷公司因不能吸收存款而带来的发展难题，也让阿里巴巴在互联网企业的“金融战”中赢得了先机。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	这是阿里巴巴的一大步，也可能是整个中国金融产品大发展进程中的一大步。阿里巴巴成功将信贷资产证券化并在交易所挂牌交易，这对错失先机的传统银行业而言无疑是一个巨大的刺激——潜在竞争者已跑在前面；不过，银行业也尽可以为此事欢呼——既然阿里能够这样做，为何银行业不可？\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	自阿里巴巴架构调整后，阿里金融正在以加速度发展。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<img src=\"/cms/uploads/201309/523a374c27077.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	昨日东证资管-阿里巴巴1号、2号专项资产管理计划正式在深交所挂牌流通，这也是我国首只券商类信贷资产证券化产品。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	阿里巴巴相关人士在接受记者采访时透露，这一项目的整体规模大概在50亿元左右。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	业内人士分析，对阿里小贷而言，除了自身收益方面的考虑，涉足资产证券化更重要的意义在于提高流动性，一定程度上能够加速其小贷业务的发展。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong>小贷公司试水资产证券化</strong> \r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	“东证资管-阿里巴巴”不仅是首只券商设立的信贷资产证券化产品，也是首只小额贷款资产证券化产品。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	东方证券资产管理公司发布的公告显示，阿里巴巴1号计划从7月26日起向机构投资者进行推广，已于7月29日结束推广期，最终获得全额申购，成立规模为5亿元。到期日为2014年10月28日。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	资料显示，阿里巴巴1号中优先级的评级为AAA，预期年化收益率6.2%，成立规模为3.75亿元；次优级未评级，预期年化收益率为11%，成立规模为7500万元；次级成立规模5000万元。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	阿里巴巴2号的与之类似。“东证资管-阿里巴巴”专项资管共分为10期，每期发行额度为2亿元至5亿元。每期产品都进行三级分级，其中优先级和次优级为公开募集，次级则由阿里金融自己认购。这意味着后续三年内还将有8只同类产品面世，募资总规模还有16亿元～40亿元。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	此外，在交易结构上，东证资管-阿里巴巴专项计划采取了循环购买基础资产的方式，在项目的运营管理上，相较于之前获批的专项计划有了较大的突破。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	而在发行模式上，东证资管-阿里巴巴专项资管计划采取了统一结构、一次审批、分次发行的模式，以更好地满足电子商务平台上小微企业的资金需求节奏。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	据前述阿里巴巴相关人士介绍，在日常投资管理过程中，这项计划还引入了自动化的资产筛选系统和支付宝公司提供的资金归集和支付服务。“毕竟我们是一个互联网的平台，只有这样才能更好地适应阿里小贷基于大数据的业务模式。”\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	知名财经评论人士叶檀在接受记者采访时说：“证券资产化产品的推出，是阿里打通资金循环的一个很重要的环节。因为小贷公司的杠杆资金只有50%，没有吸纳存款的能力，只能向金融机构拿钱。所以，它此前的资金来源渠道是非常不畅通的，现在通过东方证券这个券商来发行产品，可以获得更多的资金来支持其小贷业务。”\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong>未寄望网络银行</strong> \r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	对阿里巴巴而言，吸纳更多的资金迫在眉睫，尤其是苏宁在金融领域的激进举措，也使得阿里小贷不得不去寻找新的资金来源。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	2012年12月，苏宁注资3亿元设立重庆苏宁小额贷款有限公司。今年8月，苏宁云商宣布设立苏宁银行，成为A股首家宣布试水民营银行的上市公司。9月12日，苏宁在设立民营银行的道路上又迈了一步，其申请的苏宁银行名称获得工商总局核准。而苏宁小贷公司也将在10月试运行。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	与此同时，也有消息称，阿里巴巴也正打算成立网络银行。但前述阿里相关人士依然对记者否认提交了申请。“这个事情还是很遥远的，即便是现在有企业获得了核准，但具体的推出时间还是一个未知数。”\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	尽管阿里巴巴依然否认将成立网络银行，但业界对其成立银行的呼声依然很高。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	“建议给阿里小贷和支付宝发放银行牌照，让银行间更充分竞争。”中国人民银行原副行长吴晓灵日前在某论坛上如此表示。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	吴晓灵认为，互联网金融有四种形式，包括阿里小贷这样的小额贷款机构、支付宝这样的第三方支付、余额宝这类基于支付账户的标准化金融产品销售，以及P2P平台。但是，目前这四种互联网金融形式都是单向的，不能吸收存款，也未形成银行那样的存放汇优势。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	在吴晓灵看来，现在鼓励民营资本创办民营银行，只有给阿里小贷、支付宝等发放银行牌照，让它们既能办理结算，又能吸收存款，发放贷款，细分客户市场，这才是可行的，才能办成互联网时代的特色银行。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	不过，也有业内人士并不认同这一观点。叶檀分析认为，阿里巴巴成立网络银行对传统金融业的冲击肯定非常大，且以阿里巴巴的业务形态来看也没有必要走传统银行老路。“从该产品设计来看，90%的资金可以向投资者发行，说明阿里已经解决了小贷资金来源的问题，且登陆深交所以后可以实现交易转让，也意味着有更多投资机构来共担风险。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	叶檀认为，阿里巴巴在银行成立之前找到了一条替代储蓄的路，所以是否成立网络银行，依然还是很遥远的事情。\r\n</p>', '', '', '', '', '9', 'N', 'Y', 'uploads/201309/523a3737db503.jpg', 'uploads/201309/thumb_523a3737db503.jpg', '0', '0', 'N', '1379547338', '0', 'Y', '0', '', 'Y', '1379546936');
INSERT INTO `bage_post` VALUES ('9', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '3', '1', '', '', '', '', '', '<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><img src=\"/cms/uploads/201309/523a3780beb37.jpg\" alt=\"\" /><br />\r\n</strong> \r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong>腾讯科技 金铎 9月19日编译</strong> \r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/ORCL.OQ.htm\" target=\"_blank\">甲骨文</a>公司（Oracle Corp. ）周三报告称，公司2014财年第一季度实现净利润21.9亿美元，同比增长7.9%，合每股收益47美分；去年同期业绩为净利润20.3亿美元，合每股收益41美分。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	期内公司营收由去年同期的81.8亿美元增长至83.7亿美元，增幅为2.3%。经过调整后的盈利为每股收益59美分。FactSet汇总的分析师平均预期为每股收益56美分（调整后），收入为84.8亿美元。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	第一财季，甲骨文软件营收为60.84亿美元，比去年同期增长6%；硬件系统营收为12.61亿美元，比去年同期下滑7%。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	甲骨文股价在当天常规交易中上涨1.83%，收于33.87没有。发布财报后，该股在盘后交易中，截至发稿，股价上涨近1%。\r\n</p>', '', '', '', '甲骨文,净利润', '4', 'N', 'Y', 'uploads/201309/523a379a5e8f5.jpg', 'uploads/201309/thumb_523a379a5e8f5.jpg', '0', '0', 'N', '1379547330', '0', 'Y', '0', '', 'Y', '1379547034');
INSERT INTO `bage_post` VALUES ('10', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '6', '1', '化妆造型：精美古装3套，造型3次（但不包括孙子大传系列、龙袍），免费提供化妆品、安瓶以及妆后的洗面奶、卸妆油、卸妆棉、护肤品，免除您的后顾之忧，按套系免费使用精美古装饰品，道具等物品\r\n古典至美纯外场景：长桥阔石板湿地公园', '', '', '', '', '<div>\r\n	- 古装写真（1套，价值1288元）<br />\r\n- 化妆造型：精美古装3套，造型3次（但不包括孙子大传系列、龙袍），免费提供化妆品、安瓶以及妆后的洗面奶、卸妆油、卸妆棉、护肤品，免除您的后顾之忧，按套系免费使用精美古装饰品，道具等物品<br />\r\n- 古典至美纯外场景：长桥阔石板湿地公园<br />\r\n- 照片提供：全程拍摄不少于60张，精修18张入册<br />\r\n- 专属相册：<br />\r\n&nbsp; 古典高档绢丝挂轴1副<br />\r\n&nbsp; 杂志册1本（8P，16张）<br />\r\n&nbsp; 8寸版画1幅<br />\r\n&nbsp; 16寸海报1张<br />\r\n&nbsp; 皮夹照2张<br />\r\n- 到店即送价值15元精美桃木梳1把<br />\r\n- 拍摄时间：4-8个小时<br />\r\n- 底片全部赠送，请自带2G以上U盘拷片<br />\r\n</div>\r\n<h2>\r\n	【消费提示】\r\n</h2>\r\n<div>\r\n	1、糯米券有效期为2013年07月19日-2013年10月19日&nbsp;<br />\r\n（每周一不可用）&nbsp;<br />\r\n2、糯米券使用时间：09:00-20:00&nbsp;<br />\r\n3、消费前请提前168小时致电预约，电话：0571-85350301&nbsp;<br />\r\n4、每人可购买多张糯米券，每人限使用1张糯米券&nbsp;<br />\r\n5、套餐内容不兑现，不找零，不与店内其他优惠同时享用&nbsp;<br />\r\n6、建议用户在糯米券有效期内完成拍摄并取得成品。如用户与商家另行约定的拍摄时间或取成品时间不在糯米券有效期内的而导致用户最终无法完成拍摄或取得成品的，糯米网不承担任何责任&nbsp;\r\n</div>', '', '', '', '', '3', 'N', 'Y', 'uploads/201309/523a5063ae6b3.jpg', 'uploads/201309/thumb_523a5063ae6b3.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379553379');
INSERT INTO `bage_post` VALUES ('11', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '2', '', '', '', '', '', '<p>\r\n	全球最大的互联网搜索引擎谷歌(微博)正在考虑对如何追踪用户上网浏览活动的方法做出重大调整，此举或许能够重塑年营收规模达1,200亿美元的数字广告市场的格局。\r\n</p>\r\n<p>\r\n	据《今日美国报》网站援引一位熟悉谷歌该计划的匿名人士透露的消息称，谷歌正在开发一种匿名广告标识符（AdID），用来替代广告商出于营销目的追踪用户网上浏览活动的第三方Cookie。谷歌目前在全球在线广告营收的占比约为三分之一。\r\n</p>\r\n<p>\r\n	这个AdID只会被转到此前同意遵守某些基本规范的广告商和广告网络，从而在控制网页浏览的方式上，赋予用户更大的自主权和更多的隐私。\r\n</p>\r\n<p>\r\n	据该匿名消息人士透露，只有在遵循AdID相关服务条款的广告商和广告网络才有权使用这一工具，而且该工具可以让用户对自己的隐私以及上网习惯等信息拥有更多的控制权。该消息人士拒绝具名，因为谷歌还没有正式对外宣布推出这一新工具的计划。但该公司计划在接下来的几周和几个月里与业内人士、政府机构和消费者组织进行沟通。\r\n</p>\r\n<p>\r\n	<img src=\"/cms/uploads/201309/523a53bd105ee.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	谷歌发言人罗布•辛尔金（Rob Shilkin）表示：“技术进步在提升用户安全的同时也能够确保互联网的经济性。谷歌和其他公司在这个领域有很多想法，不过这些想法都处在早期阶段。”他拒绝做进一步评论。\r\n</p>\r\n<p>\r\n	谷歌的一举一动都会受到广告行业的密切关注，因为该公司不仅是在线广告市场的领导者，而且该公司的Chrome浏览器已经在过去几年先后超越微软IE浏览器、Mozilla Firefox浏览器和苹果公司Safari浏览器，成为目前全球最流行的浏览器。\r\n</p>\r\n<p>\r\n	Cookie是带有识别标签的一小串文本字符，并被集成到浏览器中。多年以来Cookie始终是识别用户上网活动的主要方式。正常的Cookie会被网站运营商存储在用户电脑上，而第三方Cookie则来自于以收集用户浏览活动数据为目的的其他实体。\r\n</p>\r\n<p>\r\n	广告公司利用这种技术来了解用户的兴趣，然后通过网络向他们显示更具相关性的广告。然而，Cookie也引来了诸多争议，因为追踪技术已经发展得十分先进，并引发了隐私担忧。\r\n</p>\r\n<p>\r\n	自2003年推出以来，苹果Safari浏览器就封杀了第三方Cookie。去年苹果公司还针对iOS移动平台推出了自己的广告标识符。一些广告产业内部人士认为，如果谷歌真的推出AdID，那么可以让用户对自己的上网活动如何被追踪拥有更多的控制权。然而，这种措施同时也让苹果和谷歌这两大科技巨头可以更多地掌握用户浏览活动的数据。\r\n</p>\r\n<p>\r\n	广告技术公司Triggit的首席执行官扎克•科里奥斯（Zach Coelius）表示：“限制第三方Cookie不会让精准的广告投放消失，只能让大型科技公司掌握更多的控制权。”\r\n</p>\r\n<p>\r\n	美国数字广告行业组织交互式广告局（Interactive Advertising Bureau，以下简称IAB）的总法律顾问迈克•扎涅斯（Mike Zaneis）指出，IAB希望广告客户能使用某种形式的跟踪技术，比如第三方Cookie或其他技术。但是，让少数公司掌控跟踪技术不是一种理想的解决方案，他们可能会突然对用户ID进行限制，而且还会危及数十亿美元的网络广告支出。\r\n</p>\r\n<p>\r\n	谷歌推出匿名广告标示符的做法并不算特别激进，因为该公司开发的AdID只是作为广告商所使用追踪工具的一种选择而已。但据消息人士表示，AdID新工具可以让用户通过对浏览器设置，对广告商的追踪活动作出限制。\r\n</p>', '', '', '', '谷歌,追踪工具,AdID,洗牌', '1', 'N', 'Y', 'uploads/201309/523a53d233f15.jpg', 'uploads/201309/thumb_523a53d233f15.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554258');
INSERT INTO `bage_post` VALUES ('12', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '2', '', '', '', '', '', '<p>\r\n	微软周二正式公布了Windows 8.1操作系统的售价。在Windows 8用户将能够免费升级至Windows 8.1的同时，如果用户运行的是Windows XP、Vista或是Windows 7操作系统，想要升级至Windows 8.1基本版的价格为119.99美元，升级至Windows 8.1 Pro版的价格为199.99美元。\r\n</p>\r\n<p>\r\n	Windows 8.1的升级费用与此前用户升级至Windows 8操作系统的升级费用相同，不过这一次微软并未向去年用户升级至Windows 8操作系统时那样，提供任何的促销价格。\r\n</p>\r\n<p>\r\n	微软当前还计划对Windows 8.1的销售方式进行更改。此前，用户必须在线购买Windows 8操作系统的升级版本，或是前往零售店购买，微软从未提供完整版。用户将可以通过零售店购买Windows 8.1，或是通过下载选项购买微软所谓的“完整版软件”（full version software）。\r\n</p>\r\n<p>\r\n	此举旨在为希望在虚拟环境下运行Windows 8.1操作系统的用户做出回应。如果用户购买一套Windows 8.1，它将是完全版，而不是升级版本。\r\n</p>\r\n<p>\r\n	对Windows XP或是Windows Vista操作系统用户而言，如果想要从现有操作系统升级至Windows 8.1，此次将会有略微的调整。微软此前支持从Windows XP或是Windows Vista操作系统升级至Windows 8的基础升级路径，但是针对Windows 8.1则采用了完全不同的方式。\r\n</p>\r\n<p>\r\n	如果Windows XP或是Windows Vista操作系统用户想要直接升级至Windows 8.1，用户需要完全重新安装。微软就此表示，这是因为“Windows 8.1并不是为运行Windows XP或是Windows Vista操作系统的操作系统设计的。”Windows XP或是Windows Vista操作系统用户需要从零售店购买DVD光盘，而不能选在在线升级。\r\n</p>\r\n<p>\r\n	对Windows 7用户而言，在升级完成之后，他们必须重新安装台式应用程序，如Office等。微软的这种做法可能会令一些商业和企业用户感到极度不满。\r\n</p>\r\n<p>\r\n	随着搭载Windows 8.1操作系统的设备将从10月18日开始蜂拥进入市场，微软同时还提供了从基本版Windows 8.1升级至Windows 8.1 Pro版和Windows Media Center版的方式。\r\n</p>\r\n<p>\r\n	购买搭载基本版Windows 8.1操作系统的用户，升级至Windows 8.1 Pro需花费99.99美元；Windows 8.1 Pro用户可花费9.99美元升级至Windows Media Center。Windows 8.1将于10月17日在微软零售店开始销售，搭载Windows 8.1操作系统的设备和零售DVD将于10月18日开始销售。<span id=\"__kindeditor_bookmark_end_10__\"></span>\r\n</p>', '', '', '', '微软,Windows8.1,基本版售价', '1', 'N', 'Y', 'uploads/201309/523a540d7a921.jpg', 'uploads/201309/thumb_523a540d7a921.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554317');
INSERT INTO `bage_post` VALUES ('13', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	在本月早些时候的新品发布会上，三星如外界所料般率先出手，发布了旗下首款可穿戴计算设备Galaxy Gear智能手表。\r\n</p>\r\n<p>\r\n	Galaxy Gear采用金属拉丝表面，拥有六种采用橡胶材质的不同颜色表带。在具体配置方面，Galaxy Gear拥有一块1.63英寸Super AMOLED屏幕，分辨率为320x320，搭载了800MHz单核处理器，190万像素摄像头，512MB内存，4GB存储空间，315mAh不可拆卸电池，内置扬声器、蓝牙4.0、加速度计、陀螺仪和两个麦克风。\r\n</p>\r\n<p>\r\n	但是，日前据韩国媒体《数码时代》(Digital Times)的报道称，这一产品有可能成为史上最为短命的可穿戴式计算设备，因为三星目前已经开始研发其下一代产品。\r\n</p>\r\n<p>\r\n	事实上，自从Galaxy Gear于9月4日在柏林首次与外界接触以来，消费者对于这款产品的反映一直十分平静。不少批评者则抱怨称，Galaxy Gear 25个小时的电池续航时间太短，而能够同其配合使用的智能设备也实在太过有限。\r\n</p>\r\n<p>\r\n	目前，仅有三星Galaxy Note 3智能手机和Galaxy Note 10.1平板电脑能够同其进行连接。但三星方面表示，未来将有更多设备支持Galaxy Gear。\r\n</p>\r\n<p>\r\n	对于三星此次发布Galaxy Gear，外界的普遍看法是该公司为了赶在苹果发布传言已久的“iWatch智能手表”之前而匆匆发布了一款自己的可穿戴式计算设备以抢占市场先机。而且，在苹果在日本地区申请了“iWatch商标”，并在全新iPhone 5s中配置了一个专门管理设备上各类传感器和动作的“M7”协处理芯片后，外界对于iWatch的期待更是有增无减。\r\n</p>\r\n<p>\r\n	与此同时，知名市场调研机构IHS移动和通讯总监伊恩-弗格(Ian Fogg)曾评价道：\r\n</p>\r\n<p>\r\n	“三星的Galaxy Gear只是一个披着消费者电子产品外衣的原型机，正因为如此，该产品将很难在市场中取得成功。从目前来看，该设备拥有许多不足的地方，比如售价过高、电池续航能力不佳、必须配合智能手机使用的局限性等等。总的来说就是，这一产品恐怕很难取得成功，而三星则需要凭借一款设计更加精良的设备来再次向这一市场发起攻势。”\r\n</p>\r\n<p>\r\n	与此同时，其他一些测试者则表示，Galaxy Gear的操作存在着延迟的情况，系统菜单设计令人困惑，而其299美元的售价也有些过高。\r\n</p>\r\n<p>\r\n	据位于三星总部所在地的韩国门户网站Daum报道，第一款Galaxy Gear仅仅属于三星的一款“试水产品”而已，该公司希望通过这一产品收集市场反馈，然后在以此作为依据开发出第二代Galaxy Gear。Daum预计，三星有可能会在明年1月的国际消费电子展(Consumer Electronics Show)，或者在明年3月的移动世界大会(Mobile World Congress)上发布新一代Galaxy Gear 2智能手表。而且，第二代Galaxy Gear很有可以会基于内置的GPS定位芯片而推出一些基于地理位置的服务。\r\n</p>\r\n<p>\r\n	三星方面拒绝对此发表置评。\r\n</p>', '', '', '', '三星,智能手表,二代产品', '1', 'N', 'Y', 'uploads/201309/523a545da4d37.jpg', 'uploads/201309/thumb_523a545da4d37.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554397');
INSERT INTO `bage_post` VALUES ('14', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	（朱旭冬）9月18日晚间消息，移动智能市场数据平台App Annie 今日宣布完成一轮总金额为1500万美元的融资，由红杉资本的美国基金领投，现有投资者IDG资本、Greycroft 、e.Ventures 和 Infinity Venture 参与跟投。\r\n</p>\r\n<p>\r\n	红杉资本硅谷办事处合伙人 Tim Lee 与 uSamp 首席执行官 Alan Gould 将加入App Annie董事会。\r\n</p>\r\n<p>\r\n	App Annie 表示，此轮融得的资金将用于加速 App Annie 的产品开发、增长其销售额并壮大其设在旧金山的营销总部，并扩大其遍布亚洲和欧洲的办事处。\r\n</p>\r\n<p>\r\n	随着今年全球智能手机出货量将超过1 亿部的预期，应用软件和数字内容经济大幅增长。App Annie 在过去12个月内用户数扩大两倍，每月营收增长三倍。App Annie 首席执行官Bertrand Schmitt 表示，增长的用户群证明公司重塑企业分析和提取适合商业用途的有用洞察信息的方式是成功的。\r\n</p>\r\n<p>\r\n	红杉资本硅谷办事处合伙人 Tim Lee 认为， App Annie 在新数字经济分析领域处于极为有利的地位。“App Annie 的产品对从事移动通信行业的每位从业者来说都是必备的。在红杉资本，我们多年来一直使用他们的产品帮助我们找到有突破力的创业公司。 App Annie 在新数字经济分析领域处于极为有利的地位，并将成为黄金标准。”他说。\r\n</p>\r\n<p>\r\n	Bertrand Schmitt 则表示， “对我们来说，红杉资本不仅仅是投资者，同时也是合作伙伴和顾问，它将帮助我们加速我们扩大平台的计划，这样所有企业都可了解全球应用软件和数字内容生态系统。”\r\n</p>\r\n<p>\r\n	App Annie 的商业智能平台由 Analytics、Store Stats 和 Intelligence 组成。现今，收益排名前 100 位的 iOS 应用发行商中超过 90% 在使用App Annie 的产品，这其中包含 Google、微软和腾讯。\r\n</p>', '', '', '', 'App,Annie,美元投资,国际业务', '1', 'N', 'Y', 'uploads/201309/523a549bd42fe.jpg', 'uploads/201309/thumb_523a549bd42fe.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554460');
INSERT INTO `bage_post` VALUES ('15', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	据国外媒体报道，团购巨人Groupon今日宣布，公司已经收购了本地体验初创公司SideTour。后者是一个帮助人们发现、预订和参加本地活动的市场平台，Groupon没有透露这项收购交易的具体条款。\r\n</p>\r\n<p>\r\n	SideTour精选了一些独具特色且有人主持的聚会类活动，让客户们能够与相应领域的资深专家面对面地交流，从而更加了解自己所在的城市和他们关心的事。\r\n</p>\r\n<p>\r\n	GrouponLive业务总经理格雷格鲁丁（Greg Rudin）称：“SideTour精心策划的各种本地体验将进一步拓展Groupon的愿景，也就是将Groupon打造成消费者可以随时随地访问的平台。如果Groupon能够提供这些极具个性化的活动、旅游和值得铭记的聚会，我们就能够为我们的客户提供更多有趣的方法，帮助他们探索和发现最好的本地体验。”\r\n</p>\r\n<p>\r\n	那些活动大多为私人聚会，人数平均在12人左右，涵盖的行业包括视频、饮料、建筑、历史、艺术等等。SideTour目前提供的公开和私人聚会多达500多种，使用这个平台的聚会主持超过了400人。那些主持者包括厨师、艺术家、奥运金牌获得者、星探和品酒师等等。\r\n</p>\r\n<p>\r\n	SideTour的首席执行官韦平戈亚尔（Vipin Goyal）称：“我们很高兴有机会把我们独创的聚会服务提供给这么多热衷于本地体验的人。Groupon可以帮助我们发现更多的本地专家并为他们提供一个与更多客户沟通的平台。”\r\n</p>\r\n<p>\r\n	SideTour将继续独立经营一段时间，Groupon将通过其电子邮件、网页和移动渠道向它的4300万活跃用户推广SideTour的聚会服务。\r\n</p>\r\n<p>\r\n	SideTour创立于2011年，目前在芝加哥、纽约、费城和华盛顿特区设有办事机构。它计划在未来几个月里开辟更多的市场。\r\n</p>', '', '', '', '', '1', 'N', 'Y', 'uploads/201309/523a54c220262.jpg', 'uploads/201309/thumb_523a54c220262.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554498');
INSERT INTO `bage_post` VALUES ('16', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	在手机解锁上，美国消费者和运营商展开持久战，美国政府和白宫逐渐站在消费者一边。\r\n</p>\r\n<p>\r\n	近日美国电信和信息管理局（NTIA）正式向联邦通信委员会（FCC）发函，要求修改规定，未来移动运营商销售给用户的手机、平板等，均不能锁定于网络。\r\n</p>\r\n<p>\r\n	所谓“锁定”，指的是运营商通过技术手段，限制某一部手机和平板，只能使用自家的移动网络进行通信。\r\n</p>\r\n<p>\r\n	上述机构对FCC表示，消费者应该获得更多自由，选择不同的移动通信服务商，自由使用自己合法购买的移动设备，对相关规定进行修改之后，可以增强移动通信市场的竞争，增加消费者满意度。\r\n</p>\r\n<p>\r\n	目前还不清楚FCC是否会痛快答应修改规定的要求。众所周知的是，美国电信行业，也雇请了游说团体，捍卫对手机锁定的做法。\r\n</p>\r\n<p>\r\n	据报道，1990年代以前，美国电信运营商销售的手机，均未锁定于自家网络。此后，为了降低用户流失率，运营商开始锁定手机。不过，对于熟悉IT知识的民间高手来说，根据网络资源对手机进行解锁，难度并不大。\r\n</p>\r\n<p>\r\n	1998年，美国通过《千年数字版权法》，法律本意是要抑制盗版，但最后却禁止了用户对手机解锁。从2006年以来，支持消费者的美国议员们，也屡屡要求修改法律，允许用户自由解锁。\r\n</p>\r\n<p>\r\n	在移动运营商看来，他们对用户购买手机的价格进行了大额补贴，目的是通过用户在一年或两年的合同期限内，用花费流量费的消费，弥补运营商购机补贴。如果让用户自由解锁，将损害运营商的利益。\r\n</p>\r\n<p>\r\n	以苹果手机为例，运营商捆绑两年合约的补贴价格为199美元，但是其裸机零售价超过600美元，这400多美元其实由运营商买单。\r\n</p>\r\n<p>\r\n	上述机构NTIA还指出，只要是消费者承诺继续使用某种服务，或是针对提前结束合约支付了违约罚金等，美国的运营商就应该免费帮助用户进行解锁。\r\n</p>', '', '', '', '美国,,禁止运营商,锁定手机', '2', 'N', 'Y', 'uploads/201309/523a54f7d9591.jpg', 'uploads/201309/thumb_523a54f7d9591.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554552');
INSERT INTO `bage_post` VALUES ('17', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '1', '', '', '', '', '', '<p>\r\n	Facebook马上就要失去两个关键员工：视频广告产品经理贾斯汀·谢弗（Justin Shaffer）和企业沟通团队经理阿什利·詹迪(Ashley Zandy)。\r\n</p>\r\n<p>\r\n	Facebook已经证实了这两位高管即将离职的消息。作为一个仍在快速成长的高科技公司，Facebook近年来员工人数显著增加，这两位关键人物的突然离职令人意外。\r\n</p>\r\n<p>\r\n	据知情人士透露，谢弗没有正式宣布他的下一个去向，但已经明确表示将离开Facebook。今年，谢弗和产品营销总监吉姆·斯夸尔斯（Jim Squires）领导下的Facebook视频广告业务出现下滑，原因是一些广告主感到受挫。\r\n</p>\r\n<p>\r\n	据到Facebook 透露，谢弗在Faceboo将于下周三后正式离职。谢弗拒绝发表评论。\r\n</p>\r\n<p>\r\n	谢弗是Facebook的知名经理，曾经参与领导过该公司的多个项目——包括“Group”和签到工具“Places”——的开发。谢弗于2010年加盟Facebook，当时，他的初创公司Hot Potato被Facebook收购。在创办Hot Potato之前，他还曾在MLB(美国职棒大联盟)的数字部门MLB Advanced Media工作了数年时间，参与创建了MLB.com网。\r\n</p>\r\n<p>\r\n	知情人士还透露，谢弗正在考虑创办一个创投基金。\r\n</p>\r\n<p>\r\n	另一位即将离职的高管詹迪在Facebook工作超过两年，离职后将加盟阿里巴巴集团，出任该公司的国际企业事务副总监。詹迪将在硅谷办公，负责领导阿里巴巴公司在中国大陆以外地区的所有企业和财务沟通事物。在加入Facebook之前，詹迪曾在博然思维集团(Brunswick Group)工作5年多时间。\r\n</p>\r\n<p>\r\n	今年以来，Facebook依然在努力扩张，尤其是在移动业务领域。马克·扎克伯格（Mark Zuckerberg）多次表示，Facebook在2013年将继续在基础设施和团队扩张方面大举投资。\r\n</p>\r\n<p>\r\n	今年6月底，Facebook拥有5,299名员工，相比去年年底增长了15％ 。最近加盟Facebook的重要员工包括其第一任首席营销官格雷·布里吉斯(Gary Briggs)，格雷来自谷歌(微博)，在加入Facebook之前担任摩托罗拉移动公司的营销部门高级副总裁。\r\n</p>\r\n<p>\r\n	另一方面，Facebook最近也有几位重要人物离职。今年5月，Facebook首席法律顾问尤罗特(Ted Ullyot)离开。最近，Facebook的顶级广告经理戈库尔·拉贾兰（Gokul Rajaram）宣布离开，加入了数字支付公司Square。\r\n</p>', '', '', '', 'Facebook,高管,离职,投奔,阿里巴巴', '2', 'N', 'Y', 'uploads/201309/523a554c026c4.jpg', 'uploads/201309/thumb_523a554c026c4.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554636');
INSERT INTO `bage_post` VALUES ('18', '1', '', '', 'SIR-87K-8 红外防水摄像机', '', '', '', '', '', '', '', '2', '2', '', '', '', '', '', '<p>\r\n	不少人都在期待诺基亚Lumia1520的到来，但这款旗舰机型将会延迟发布的传闻令人非常失望。而现在，诺基亚官方在推特上消息则给人们：“从未停止创新，10月22日将揭晓。”此举在外界看来，或许意味着此前曝光的诺基亚Lumia1520和10.1英寸的Windows RT平板电脑届时将会正式发布。\r\n</p>\r\n<p>\r\n	10月22日发布新机\r\n</p>\r\n<p>\r\n	对于诺基亚这场发布会，人们可谓期待已久。此前网络上曾经传出诺基亚将于9月26日在纽约召开发布会，正式推出诺基亚Lumia1520和Windows RT平板电脑的消息。不过，随后又有爆料大神evleaks大神发布信息称，诺基亚已经将发布会日期推迟至10月22日。\r\n</p>\r\n<p>\r\n	而现在，传闻最终成真。诺基亚发布推文表示：“创新从未停止，10月22日将揭晓。”正式确认将在下月底举办发布会推出新款智能机型。至于诺基亚延迟发布会的主要原因，路透社给出的消息称，主要还是因为微软对诺基亚设备和服务部门的收购案影响所致。此外，爆料大神evleaks还最新曝光了本次诺基亚发布会的举办地点在阿联酋的阿布扎比。\r\n</p>\r\n<p>\r\n	诺基亚Lumia1520将是主角\r\n</p>\r\n<p>\r\n	尽管诺基亚并未透露本次发布会将推出怎样的新品，但此前频繁曝光的诺基亚Lumia1520到时候将作为主角登场已是毫无悬念。作为诺基亚未来的旗舰机型，诺基亚Lumia1520最大的特色是配有6英寸触控屏，并支持1080p全高清分辨率,搭载有WP8 GDR3系统版本和内置高通骁龙800处理器，拥有2GB的内存和32GB储存容量，并支持存储卡扩展。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	诺基亚Lumia1520还具备出色的拍照功能，内置2000万像素摄像头，能够同时拍摄一张500万像素照片用于分享；一张 1600万像素照片用于保存。而根据国外媒体披露的消息称，该机将于11月18日由美国运营商AT&amp;T发售，裸机价格为699美元（约合人民币4278元），将有红、黑、黄、白等四种色彩款式选择。\r\n</p>\r\n<p>\r\n	平板同步登场\r\n</p>\r\n<p>\r\n	除此之外，代号“Sirius”的诺基亚Windows RT平板电脑也可能会在本次发布会上同步推出。根据此前泄露的信息显示，诺基亚这款平板还会配备10.1英寸1080p分辨率触控屏，搭载Windows RT系统，并拥有高通骁龙800处理器，支持LTE网络和内置了670万像素摄像头，具备10小时的电池续航时间。\r\n</p>\r\n<p>\r\n	诺基亚还为这款Windows RT平板配备了2GB的RAM内存和支持存储卡扩展，拥有200万像素前置摄像头，支持Skype Calls、普通视频以及照片捕捉。并提供了Micro-HDMI 和 Micro-USB接口，与微软 Surface 平板非常相似。据悉，诺基亚这款平板的售价为为499美元起（约合人民币3053元左右）。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '诺基亚,宣布,Lumia1520', '4', 'N', 'Y', 'uploads/201309/523a558840c6d.jpg', 'uploads/201309/thumb_523a558840c6d.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1379554696');
INSERT INTO `bage_post` VALUES ('19', '1', '', '', 'SIR-87K-8 红外防水摄像机', 'SIR-87K-8 红外防水摄像机-副', 'SIR87K8', '', '', '', '', '', '8', '0', '', '', '', '', '', '<p>\r\n	650电视线，1/3″彩色高解Sony Effio\r\n8mm，12 mm，16 mm，25 mm可选镜头\r\n光隔离设计：避免漏光和起雾\r\n红外灯工作与彩转黑同步\r\n红外夜视有效距离：100米\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<ul>\r\n	<li class=\"txxx\" id=\"txx1\">\r\n		<p>\r\n			<img alt=\"\" src=\"http://www.zhsatow.com/img/2011117105630.jpg\" height=\"161\" width=\"600\" /> \r\n		</p>\r\n		<p>\r\n			&nbsp;\r\n		</p>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>全球首创智光红外夜视技术；\r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>电光转化效能<span>25%以上；</span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>单颗芯片亮度完全替代传统多颗<span>LED群/阵列；</span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>红外夜视有效距离：<span>100米；</span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>使用寿命是传统红外摄像机的<span>5-10倍；</span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>宽电压<span>9～14V设计，完美解决DC集中供电后端电压衰减问题；</span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>防水、防尘，符合<span>IP66防护等级； </span> \r\n		</div>\r\n		<div align=\"left\">\r\n			<span>•<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>DC12V供电≤<span>420mA（红外开启），加热启动时2400 mA。</span> \r\n		</div>\r\n	</li>\r\n</ul>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '', '8', 'N', 'Y', 'uploads/201411/f144e81a4bc73064780f79553a166b10.jpg', 'uploads/201411/thumb_f144e81a4bc73064780f79553a166b10.jpg', '0', '0', 'N', '0', '0', 'Y', '0', '', 'Y', '1415151507');

-- ----------------------------
-- Table structure for bage_post_2tags
-- ----------------------------
DROP TABLE IF EXISTS `bage_post_2tags`;
CREATE TABLE `bage_post_2tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标题ID',
  `tag_name` char(30) NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='内容关联标签';

-- ----------------------------
-- Records of bage_post_2tags
-- ----------------------------
INSERT INTO `bage_post_2tags` VALUES ('1', '4', '贵族养生');
INSERT INTO `bage_post_2tags` VALUES ('2', '4', '休闲放松');
INSERT INTO `bage_post_2tags` VALUES ('3', '6', '麦乐迪');
INSERT INTO `bage_post_2tags` VALUES ('4', '6', 'KTV');
INSERT INTO `bage_post_2tags` VALUES ('5', '7', 'iOS7');
INSERT INTO `bage_post_2tags` VALUES ('6', '7', '普通用户');
INSERT INTO `bage_post_2tags` VALUES ('7', '7', '全新图标设计');
INSERT INTO `bage_post_2tags` VALUES ('8', '9', '甲骨文');
INSERT INTO `bage_post_2tags` VALUES ('9', '9', '净利润');
INSERT INTO `bage_post_2tags` VALUES ('10', '11', '谷歌');
INSERT INTO `bage_post_2tags` VALUES ('11', '11', '追踪工具');
INSERT INTO `bage_post_2tags` VALUES ('12', '11', 'AdID');
INSERT INTO `bage_post_2tags` VALUES ('13', '11', '洗牌');
INSERT INTO `bage_post_2tags` VALUES ('14', '12', '微软');
INSERT INTO `bage_post_2tags` VALUES ('15', '12', 'Windows8.1');
INSERT INTO `bage_post_2tags` VALUES ('16', '12', '基本版售价');
INSERT INTO `bage_post_2tags` VALUES ('17', '13', '三星');
INSERT INTO `bage_post_2tags` VALUES ('18', '13', '智能手表');
INSERT INTO `bage_post_2tags` VALUES ('19', '13', '二代产品');
INSERT INTO `bage_post_2tags` VALUES ('20', '14', 'App');
INSERT INTO `bage_post_2tags` VALUES ('21', '14', 'Annie');
INSERT INTO `bage_post_2tags` VALUES ('22', '14', '美元投资');
INSERT INTO `bage_post_2tags` VALUES ('23', '14', '国际业务');
INSERT INTO `bage_post_2tags` VALUES ('24', '16', '美国');
INSERT INTO `bage_post_2tags` VALUES ('25', '16', '禁止运营商');
INSERT INTO `bage_post_2tags` VALUES ('26', '16', '锁定手机');
INSERT INTO `bage_post_2tags` VALUES ('27', '17', 'Facebook');
INSERT INTO `bage_post_2tags` VALUES ('28', '17', '高管');
INSERT INTO `bage_post_2tags` VALUES ('29', '17', '离职');
INSERT INTO `bage_post_2tags` VALUES ('30', '17', '投奔');
INSERT INTO `bage_post_2tags` VALUES ('31', '17', '阿里巴巴');
INSERT INTO `bage_post_2tags` VALUES ('32', '18', '诺基亚');
INSERT INTO `bage_post_2tags` VALUES ('33', '18', '宣布');
INSERT INTO `bage_post_2tags` VALUES ('34', '18', 'Lumia1520');

-- ----------------------------
-- Table structure for bage_post_album
-- ----------------------------
DROP TABLE IF EXISTS `bage_post_album`;
CREATE TABLE `bage_post_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户名',
  `content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容编号',
  `catalog` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `folder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名称',
  `file_name` char(100) NOT NULL DEFAULT '' COMMENT '带路径文件名',
  `thumb_name` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `save_path` varchar(100) NOT NULL DEFAULT '' COMMENT '保存路径',
  `save_name` varchar(100) NOT NULL DEFAULT '' COMMENT '保存文件名不带路径',
  `hash` char(32) NOT NULL DEFAULT '' COMMENT 'hash',
  `file_ext` char(5) NOT NULL DEFAULT 'jpg' COMMENT '扩展名称',
  `file_mime` varchar(50) NOT NULL DEFAULT '' COMMENT '文件头信息',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `down_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `access` varchar(255) NOT NULL DEFAULT '' COMMENT '权限控制',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `album` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片相册';

-- ----------------------------
-- Records of bage_post_album
-- ----------------------------

-- ----------------------------
-- Table structure for bage_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `bage_post_comment`;
CREATE TABLE `bage_post_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标题id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(60) NOT NULL DEFAULT 'guest' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `content` text NOT NULL COMMENT '评论内容',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `status_answer` enum('Y','N') NOT NULL DEFAULT 'N',
  `answer_content` text COMMENT '回复内容',
  `client_ip` char(5) NOT NULL DEFAULT '127' COMMENT '评论ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新闻评论';

-- ----------------------------
-- Records of bage_post_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bage_post_tags
-- ----------------------------
DROP TABLE IF EXISTS `bage_post_tags`;
CREATE TABLE `bage_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `tag_name` char(30) NOT NULL COMMENT 'tag名称',
  `data_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数据总数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='新闻标签';

-- ----------------------------
-- Records of bage_post_tags
-- ----------------------------
INSERT INTO `bage_post_tags` VALUES ('1', '5', '贵族养生', '1', '1379546108');
INSERT INTO `bage_post_tags` VALUES ('2', '5', '休闲放松', '1', '1379546108');
INSERT INTO `bage_post_tags` VALUES ('3', '5', '麦乐迪', '1', '1379546248');
INSERT INTO `bage_post_tags` VALUES ('4', '5', 'KTV', '1', '1379546248');
INSERT INTO `bage_post_tags` VALUES ('5', '2', 'iOS7', '1', '1379546869');
INSERT INTO `bage_post_tags` VALUES ('6', '2', '普通用户', '1', '1379546869');
INSERT INTO `bage_post_tags` VALUES ('7', '2', '全新图标设计', '1', '1379546869');
INSERT INTO `bage_post_tags` VALUES ('8', '3', '甲骨文', '1', '1379547034');
INSERT INTO `bage_post_tags` VALUES ('9', '3', '净利润', '1', '1379547034');
INSERT INTO `bage_post_tags` VALUES ('10', '2', '谷歌', '1', '1379554258');
INSERT INTO `bage_post_tags` VALUES ('11', '2', '追踪工具', '1', '1379554258');
INSERT INTO `bage_post_tags` VALUES ('12', '2', 'AdID', '1', '1379554258');
INSERT INTO `bage_post_tags` VALUES ('13', '2', '洗牌', '1', '1379554258');
INSERT INTO `bage_post_tags` VALUES ('14', '2', '微软', '1', '1379554317');
INSERT INTO `bage_post_tags` VALUES ('15', '2', 'Windows8.1', '1', '1379554317');
INSERT INTO `bage_post_tags` VALUES ('16', '2', '基本版售价', '1', '1379554317');
INSERT INTO `bage_post_tags` VALUES ('17', '2', '三星', '1', '1379554397');
INSERT INTO `bage_post_tags` VALUES ('18', '2', '智能手表', '1', '1379554397');
INSERT INTO `bage_post_tags` VALUES ('19', '2', '二代产品', '1', '1379554397');
INSERT INTO `bage_post_tags` VALUES ('20', '2', 'App', '1', '1379554460');
INSERT INTO `bage_post_tags` VALUES ('21', '2', 'Annie', '1', '1379554460');
INSERT INTO `bage_post_tags` VALUES ('22', '2', '美元投资', '1', '1379554460');
INSERT INTO `bage_post_tags` VALUES ('23', '2', '国际业务', '1', '1379554460');
INSERT INTO `bage_post_tags` VALUES ('24', '2', '美国', '1', '1379554552');
INSERT INTO `bage_post_tags` VALUES ('25', '2', '禁止运营商', '1', '1379554552');
INSERT INTO `bage_post_tags` VALUES ('26', '2', '锁定手机', '1', '1379554552');
INSERT INTO `bage_post_tags` VALUES ('27', '2', 'Facebook', '1', '1379554636');
INSERT INTO `bage_post_tags` VALUES ('28', '2', '高管', '1', '1379554636');
INSERT INTO `bage_post_tags` VALUES ('29', '2', '离职', '1', '1379554636');
INSERT INTO `bage_post_tags` VALUES ('30', '2', '投奔', '1', '1379554636');
INSERT INTO `bage_post_tags` VALUES ('31', '2', '阿里巴巴', '1', '1379554636');
INSERT INTO `bage_post_tags` VALUES ('32', '2', '诺基亚', '1', '1379554696');
INSERT INTO `bage_post_tags` VALUES ('33', '2', '宣布', '1', '1379554696');
INSERT INTO `bage_post_tags` VALUES ('34', '2', 'Lumia1520', '1', '1379554696');

-- ----------------------------
-- Table structure for bage_question
-- ----------------------------
DROP TABLE IF EXISTS `bage_question`;
CREATE TABLE `bage_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `scope` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `telephone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `question` text NOT NULL COMMENT '内容',
  `contact_other` varchar(100) NOT NULL DEFAULT '' COMMENT '其它联系方式',
  `answer_status` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '回复状态',
  `answer_content` text COMMENT '回复内容',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客服';

-- ----------------------------
-- Records of bage_question
-- ----------------------------
INSERT INTO `bage_question` VALUES ('1', '0', '0', '', '八哥软件', '5565907@qq.com', '', 'BageCms是一款基于php5+mysql5开发的多功能开源的网站内容管理系统。使用高性能的PHP5的web应用程序开发框架YII构建，具有操作简单、稳定、安全、高效、跨平台等特点。采用MVC设计模式，模板定制方便灵活，内置小挂工具，方便制作各类功能和效果，BageCms可用于企业建站、个人博客、资讯门户、图片站等各类型站点。', '', 'N', '如果您需要购买商业程序、项目外包订制、交流合作的，欢迎使用以下方式和我们联系\r\nhttp://www.bagecms.com\r\nhttp://www.bagesoft.cn', 'Y', '1379546643');

-- ----------------------------
-- Table structure for bage_special
-- ----------------------------
DROP TABLE IF EXISTS `bage_special`;
CREATE TABLE `bage_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `title_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '标题别名',
  `intro` text COMMENT '描述',
  `content` text COMMENT '详细介绍',
  `attach_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'seo描述',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专题';

-- ----------------------------
-- Records of bage_special
-- ----------------------------
INSERT INTO `bage_special` VALUES ('1', '特斯拉将在三年内推出自动驾驶汽车', 'test1', '美国特斯拉电动汽车公司（Tesla Motors）首席执行官艾伦•马斯克（Elon Musk）周二表示，该公司力争在未来三年里推出能够“自动驾驶”的汽车，从而正式加入到拥有谷歌(微博)和多家汽车厂商的无人驾驶汽车市场的争夺之中', '<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	美国特斯拉电动汽车公司（Tesla Motors）首席执行官艾伦•马斯克（Elon Musk）周二表示，该公司力争在未来三年里推出能够“自动驾驶”的汽车，从而正式加入到拥有<a class=\"a-tips-Article-QQ\" href=\"http://stockhtm.finance.qq.com/astock/ggcx/GOOG.OQ.htm\" target=\"_blank\">谷歌</a>(<a href=\"http://t.qq.com/googlechina#pref=qqcom.keyword\" target=\"_blank\">微博</a>)和多家汽车厂商的无人驾驶汽车市场的争夺之中。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	马斯克在接受英国《金融时报》的采访时表示，特斯拉自动驾驶汽车将会让司机把90%的驾驶权转交给汽车的电脑系统，而全自动无人驾驶汽车则需要更长的研发时间。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	马斯克指出，特斯拉的自动驾驶汽车将由该公司采用自有技术进行内部研发，并不会外包给其他公司。这一点也得到了该公司一位新闻发言人的证实。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	特斯拉官网近日发布了一个招聘“高级驾驶员辅助系统控制工程师”的启示，负责帮助“特斯拉成为自动驾驶汽车市场的领导者”。\r\n</p>', 'uploads/201309/thumb_523a37e62e9a8.jpg', 'uploads/201309/523a37e62e9a8.jpg', '', '', '', '', 'Y', '0', '4', '1379547110');
INSERT INTO `bage_special` VALUES ('2', '美国餐厅如何利用桌面服务系统扩大销售额？', 'test2', '', '<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	随着移动科技的不断发展，人们生活的方方面面都感受到了新科技所带来的巨大影响，餐饮领域自然也不例外。无论是在餐馆的餐桌上放置平板电脑、还是推出可互动的点菜、买单应用都是餐饮企业为进一步促进消费者来店消费所想出的妙招。其中，美国知名餐厅运营商Brinker International.Inc旗下Chili\'s Grill &amp; Bar最近做出的动作便是移动化大潮来袭下的一个最好示范。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	<img src=\"/cms/uploads/201309/523a380d1d4c0.jpg\" alt=\"\" />\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	目前，该公司已经在旗下部分餐厅中测试由Ziosk研发的桌面服务系统，该系统可以使消费者在无需服务员出现的情况完成点菜、买单等操作，甚至还可以利用该系统玩游戏。对此，Chili\'s Grill &amp; Bar品牌战略高级副总裁表示，“由于消费者更倾向于在配备了这类桌面系统的餐厅花费更多金钱，因此这一科技可以帮助公司有效提高销售额。”\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	事实上，由于桌面服务系统会时不时的显示一些甜品的图片，Chili\'s Grill &amp; Bar餐厅的甜品销量已经迎来了大约20%的提升。因此我们不难想象，如果Chili\'s Grill &amp; Bar未来将这一图片展示的范围扩大到酒精类饮品和其他拥有更大利润率的菜品时能够取得怎样的效果。\r\n</p>\r\n<p style=\"font-size:16px;color:#333333;font-family:微软雅黑, Tahoma, Verdana, 宋体;background-color:#FFFFFF;text-indent:2em;\">\r\n	与此同时，桌面服务设备中自带的那些看似不起眼的小游戏也有望为餐厅带来额外收入。比如，Chili\'s Grill &amp; Bar会向每位需要使用游戏服务的消费者收取0.99美元的费用，其中Chili\'s Grill &amp; Bar将可以拿到50%的分成，而另一半则由Ziosk收取。考虑到Chili\'s Grill &amp; Bar目前仅仅是从Ziosk处以租赁的形式拿到这些设备的这一事实，这样的分成比例还算比较公平。\r\n</p>', 'uploads/201309/thumb_523a381039dc7.jpg', 'uploads/201309/523a381039dc7.jpg', '', '', '', '', 'Y', '0', '25', '1379547152');

-- ----------------------------
-- Table structure for bage_upload
-- ----------------------------
DROP TABLE IF EXISTS `bage_upload`;
CREATE TABLE `bage_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户名',
  `scope` enum('content','image') NOT NULL DEFAULT 'content' COMMENT '范围',
  `folder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名称',
  `file_name` char(100) NOT NULL DEFAULT '' COMMENT '带路径文件名',
  `thumb_name` varbinary(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `save_path` varchar(100) NOT NULL DEFAULT '' COMMENT '保存路径',
  `save_name` varchar(100) NOT NULL DEFAULT '' COMMENT '保存文件名不带路径',
  `hash` char(32) NOT NULL DEFAULT '' COMMENT 'hash',
  `file_ext` char(5) NOT NULL DEFAULT 'jpg' COMMENT '扩展名称',
  `file_mime` varchar(50) NOT NULL DEFAULT '' COMMENT '文件头信息',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `down_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `access` varchar(255) NOT NULL DEFAULT '' COMMENT '权限控制',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of bage_upload
-- ----------------------------
INSERT INTO `bage_upload` VALUES ('1', '0', 'content', '0', '1f178a82b9014a90244a438dab773912b31bee8e.jpg', 'uploads/201309/523a32fdf1f07.jpg', '', 'uploads/201309/', '523a32fdf1f07.jpg', 'd0dcf27f87ec506ee9000740455782b3', 'jpg', 'image/jpeg', '399821', '0', '', '1379545854');
INSERT INTO `bage_upload` VALUES ('2', '0', 'content', '0', 'QQ截图20130919070700.jpg', 'uploads/201309/523a374c27077.jpg', '', 'uploads/201309/', '523a374c27077.jpg', '377780c977f89e6ef9b571eb0cc28925', 'jpg', 'image/jpeg', '45836', '0', '', '1379546956');
INSERT INTO `bage_upload` VALUES ('3', '0', 'content', '0', 'QQ截图20130919070700.jpg', 'uploads/201309/523a3780beb37.jpg', '', 'uploads/201309/', '523a3780beb37.jpg', '3ee5075e0b22e43c779138733c84da76', 'jpg', 'image/jpeg', '74073', '0', '', '1379547008');
INSERT INTO `bage_upload` VALUES ('4', '0', 'content', '0', 'QQ截图20130919070700.jpg', 'uploads/201309/523a380d1d4c0.jpg', '', 'uploads/201309/', '523a380d1d4c0.jpg', 'b5977602ec0d3f902ffec8520f88bbde', 'jpg', 'image/jpeg', '40911', '0', '', '1379547149');
INSERT INTO `bage_upload` VALUES ('5', '0', 'content', '0', 'QQ截图20130919070700.jpg', 'uploads/201309/523a53bd105ee.jpg', '', 'uploads/201309/', '523a53bd105ee.jpg', 'eff9746a7d60f290070df3e30f493d98', 'jpg', 'image/jpeg', '25761', '0', '', '1379554237');
