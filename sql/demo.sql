/*
 Navicat Premium Data Transfer

 Source Server         : BigJ
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 19/03/2020 13:50:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (28, '2020-02-21 07:06:16', '1970-12-31 00:00:00', '0', 'VUE、简单理解：到底什么时候用watch监听属性变化合适呢？', '<p>什么时候用比较合适呢？</p><p>比如当data数据从父组件传递给子组件，子组件接受，<strong>然后这个值再次在父组件发生变化的时候</strong>，<strong>dom元素重新渲染页面</strong>，就要用watch在子组件监听这个变化。</p><p>&nbsp;</p><p>我们都知道，VUE是双向数据绑定都，其内层就涉及watch，但是像这种跨页面的组件数据传递的情况，就需要我们手动去监听一下。</p><p>&nbsp;</p><p>eg:</p><p><strong>props接收listData，但是listData会在父组件再次变化</strong>：（而子组件又没有一个点击事件去传递这个变化，那就搞个监听事件）</p>');
INSERT INTO `blog` VALUES (30, '2020-02-21 08:36:24', '1970-12-31 00:00:00', '0', '详解vue 路由跳转四种方式 (带参数)', '<p><strong class=\"ql-size-huge\" style=\"color: rgb(255, 0, 0);\">1.&nbsp;router-link</strong></p><p><img src=\"http://blog:8085//pic/20200221/21add216-be12-436c-802a-782ed30e5175.png\"></p><p><strong class=\"ql-size-huge\" style=\"color: rgb(255, 0, 0);\">2.&nbsp;this.$router.push() (函数里面调用)</strong></p><p><img src=\"http://blog//pic/20200221/f4d87fa2-65fa-4aac-8e8d-230e38f00c2e.png\"></p><p><span class=\"ql-size-huge\" style=\"color: rgb(34, 34, 34);\">3.&nbsp;this.$router.replace() (用法同上,push)</span></p><p><span style=\"color: rgb(34, 34, 34);\">向前或者向后跳转n个页面，n可为正整数或负整数</span></p><p><span class=\"ql-size-huge\" style=\"color: rgb(34, 34, 34);\">4.&nbsp;this.$router.go(n) ()</span></p><p><br></p><p><strong class=\"ql-size-huge\" style=\"color: rgb(255, 0, 0);\">ps : 区别</strong></p><p><code style=\"background-color: rgb(249, 242, 244); color: rgb(199, 37, 78);\">this.$router.push</code></p><p>跳转到指定url路径，并想history栈中添加一个记录，点击后退会返回到上一个页面</p><p><code style=\"background-color: rgb(249, 242, 244); color: rgb(199, 37, 78);\">this.$router.replace</code></p><p>跳转到指定url路径，但是history栈中不会有记录，点击返回会跳转到上上个页面 (就是直接替换了当前页面)</p><p><code style=\"background-color: rgb(249, 242, 244); color: rgb(199, 37, 78);\">this.$router.go(n)</code></p><p>向前或者向后跳转n个页面，n可为正整数或负整数</p>');
INSERT INTO `blog` VALUES (38, '2020-03-12 02:09:52', '2020-02-21 10:42:47', '0', '111', '<p>wqwdqwd<img src=\"http://192.168.1.107:8085//pic/20200222/8d1272f1-6a13-492f-a320-bebd850260f9.PNG\"><img src=\"api//pic/20200312/b2b4be38-20ec-4623-935f-db9e973d4181.png\"></p>');
INSERT INTO `blog` VALUES (39, '2020-03-02 07:42:50', '1970-12-31 00:00:00', '0', 'echarts点击子级地图重复执行性', '<pre class=\"ql-syntax\" spellcheck=\"false\">_this.myChart = echarts.init(this.$refs.myEchart) //获得容器所在位置\n_this.myChart._$handlers.click //获取地图点击，点击之后可以得到一个数组\nz在点击之后将_this.myChart._$handlers.click.length=0即可\n</pre>');
INSERT INTO `blog` VALUES (40, '2020-03-02 10:05:07', '1970-12-31 00:00:00', '0', 'js将中文转换为拼音', '<p>1.cnpm install js-pinyin //下载依赖</p><p><br></p><p>2.console.log(pinyin.getFullChars(\'管理员\')) //GuanLiYuan;</p><p>	console.log(pinyin.getCamelChars(\'管理员\')) //GLY;</p><p>	console.log(pinyin.getCamelChars(\'1234\')) //1234;</p><p>	console.log(pinyin.getCamelChars(\'杨\'))&nbsp;//Y;</p><p>tolawcase()转为小写</p><p><br></p>');
INSERT INTO `blog` VALUES (41, '2020-03-13 06:10:47', '1970-12-31 00:00:00', '0', '阿里云centos 7安装nginx ', '<h2><span style=\"color: rgb(0, 0, 0);\">安装所需插件</span></h2><h3><br></h3><h3><span style=\"color: rgb(0, 0, 0);\">1、安装gcc</span></h3><p>	<span style=\"color: rgb(0, 0, 0);\">gcc是</span><span style=\"color: rgb(51, 51, 51);\">linux下的编译器(跟着下就完事了)</span></p><p>	<span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">查看gcc版本 ： gcc -v</span></p><p><img src=\"api/pic/20200313/1dd1534b-4566-4dd0-b024-a0b16899eace.png\" width=\"588\" style=\"\"></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">一般阿里云的centOS7里面是都有的，没有安装的话会提示命令找不到，</span></p><p><span style=\"color: rgb(51, 51, 51);\">安装命令:</span></p><p><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">yum -y </span><span style=\"color: rgb(198, 120, 221);\" class=\"hljs-keyword\">install</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\"> gcc</span></p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">2、pcre、pcre-devel安装</span></h3><p><span style=\"color: rgb(0, 0, 0);\">pcre是一个perl库，包括perl兼容的正则表达式库，nginx的http模块使用pcre来解析正则表达式，所以需要安装pcre库。</span></p><p><span style=\"color: rgb(0, 0, 0);\">安装命令：</span></p><p><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">yum </span><span style=\"color: rgb(198, 120, 221);\" class=\"hljs-keyword\">install</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\"> -y pcre pcre-devel</span></p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">3、zlib安装</span></h3><p><span style=\"color: rgb(0, 0, 0);\">zlib库提供了很多种压缩和解压缩方式nginx使用zlib对http包的内容进行gzip，所以需要安装</span></p><p><span style=\"color: rgb(0, 0, 0);\">安装命令：</span></p><p><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">yum </span><span style=\"color: rgb(198, 120, 221);\" class=\"hljs-keyword\">install</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\"> -y zlib zlib-devel</span></p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">4、安装</span><span style=\"color: rgb(79, 79, 79);\">openssl</span></h3><p><span style=\"color: rgb(47, 47, 47);\">openssl是web安全通信的基石，没有openssl，可以说我们的信息都是在裸奔。。。。。。</span></p><p><span style=\"color: rgb(47, 47, 47);\">安装命令：</span></p><p><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">yum </span><span style=\"color: rgb(198, 120, 221);\" class=\"hljs-keyword\">install</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\"> -y openssl openssl-devel</span></p><p><br></p><h2><span style=\"color: rgb(0, 0, 0);\">安装nginx</span></h2><h3><span style=\"color: rgb(0, 0, 0);\">1、下载nginx安装包</span></h3><p><span style=\"background-color: rgb(40, 44, 52); color: rgb(171, 178, 191);\">wget http:</span><em class=\"hljs-comment\" style=\"color: rgb(92, 99, 112);\">//nginx.org/download/nginx-1.9.9.tar.gz   （我是自己在windows上下载传到服务器上的，下载地址：</em><a href=\"https://nginx.org/en/download.html\" rel=\"noopener noreferrer\" target=\"_blank\">https://nginx.org/en/download.html</a><em class=\"hljs-comment\" style=\"color: rgb(92, 99, 112);\">）</em></p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">2、把压缩包解压到usr/local/java</span></h3><p><span style=\"color: rgb(224, 108, 117);\">tar</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\"> </span><span style=\"color: rgb(224, 108, 117);\">-zxvf</span><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">  </span><span style=\"color: rgb(224, 108, 117);\">nginx-1</span><span style=\"color: rgb(209, 154, 102);\">.9.9.tar.gz  （虽然不知道为什么要解压到这里）</span></p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">3、切换到cd /usr/local/java/nginx-1.x.x/下面</span></h3><p><span style=\"color: rgb(0, 0, 0);\">执行三个命令：</span></p><p><br></p><p>./configure</p><p><span class=\"hljs-built_in\" style=\"color: rgb(230, 192, 123);\">make</span></p><p><span class=\"hljs-built_in\" style=\"color: rgb(230, 192, 123);\">make</span> install</p><p><br></p><h3><span style=\"color: rgb(0, 0, 0);\">4、切换到/usr/local/nginx安装目录</span></h3><h3><span style=\"color: rgb(0, 0, 0);\">5、配置nginx的配置文件nginx.conf文件，主要也就是端口</span></h3><p><span style=\"color: rgb(0, 0, 0);\">切换目录到/usr/local/nginx/conf下面有一个nginx.conf的文件</span></p><p><span style=\"background-color: rgb(40, 44, 52); color: rgb(171, 178, 191);\">vi nginx.conf</span></p><h3><span style=\"color: rgb(0, 0, 0);\">6、启动nginx服务</span></h3><p><span style=\"color: rgb(0, 0, 0);\">切换目录到/usr/local/nginx/sbin下面</span></p><p><span style=\"color: rgb(0, 0, 0);\">启动nginx命令：</span></p><p><span style=\"color: rgb(171, 178, 191); background-color: rgb(40, 44, 52);\">./nginx</span></p><p><br></p><p><br></p><p><br></p><p><br></p>');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `del_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `origin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, '0', '2020-02-18 11:44:29', NULL, NULL, 'jpg', '47a9c0d3-2795-430d-a616-d17063026fb5', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (2, '0', '2020-02-18 11:46:01', NULL, 'timg.jpg', 'jpg', 'a238c8ed-2100-466a-af67-0c5d40d8a763', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (3, '0', '2020-02-18 11:48:15', NULL, 'timg.jpg', 'jpg', '5e1f2e2a-1f50-4ac2-85c6-4cf8a003e50d', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (4, '0', '2020-02-18 11:48:59', NULL, 'timg.jpg', 'jpg', '7ec7e582-faf5-4a53-a78b-3a4c6c633f90', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (5, '0', '2020-02-18 11:49:56', NULL, 'timg.jpg', 'jpg', '2b8015c0-82a6-4477-afa7-2e22eb921cc1', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (6, '0', '2020-02-18 11:51:06', NULL, 'timg.jpg', 'jpg', '42087df3-f361-4206-927d-c11709cea872.jpg', 'F:/pic/20200218/');
INSERT INTO `file` VALUES (7, '0', '2020-02-19 09:58:04', NULL, 'timg.jpg', 'jpg', 'dae6c565-d4b4-451a-a981-e9d558065256.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (8, '0', '2020-02-19 10:06:05', NULL, 'timg.jpg', 'jpg', '1d3187b7-ab3f-4fcc-bbb7-2fb7b5088a72.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (9, '0', '2020-02-19 10:06:15', NULL, 'timg.jpg', 'jpg', '2b81e5f4-1e8f-43f5-9e5e-2238a9e3b724.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (10, '0', '2020-02-19 10:11:38', NULL, 'timg.jpg', 'jpg', '1c6a8f93-2fe8-4342-ad7a-88975b702483.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (11, '0', '2020-02-19 10:12:11', NULL, 'timg.jpg', 'jpg', '585eec05-9c8b-4c1e-bfe0-a0434b32973e.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (12, '0', '2020-02-19 10:12:45', NULL, 'timg.jpg', 'jpg', '51b55445-d527-4c66-8a05-2db97260b005.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (13, '0', '2020-02-19 10:14:20', NULL, 'timg.jpg', 'jpg', '5717d391-67cf-4784-a329-e6f6f9e6a04e.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (14, '0', '2020-02-19 10:15:45', NULL, 'timg.jpg', 'jpg', '04aa1de0-d241-406c-a00c-f08a7037078e.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (15, '0', '2020-02-19 10:16:18', NULL, 'timg.jpg', 'jpg', 'a8ca741f-5445-4c4f-9452-3734cef5139f.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (16, '0', '2020-02-19 10:21:23', NULL, 'timg.jpg', 'jpg', 'e0bef468-65e6-43c0-bddb-b2ffa0536142.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (17, '0', '2020-02-19 10:22:48', NULL, 'timg.jpg', 'jpg', '4fea1336-2433-4ca3-8775-41a68d50bad6.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (18, '0', '2020-02-19 10:25:25', NULL, 'timg.jpg', 'jpg', '1fedc161-f5d5-466e-b404-5bbbb3d7f226.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (19, '0', '2020-02-19 10:38:44', NULL, 'timg.jpg', 'jpg', '8c829b45-6272-4f68-903e-124929dbc66d.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (20, '0', '2020-02-19 11:06:58', NULL, 'timg.jpg', 'jpg', '359fc8e4-1203-4d9d-938d-b603b3e3fbef.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (21, '0', '2020-02-19 11:08:31', NULL, 'timg.jpg', 'jpg', '04f0c057-5caf-4624-960d-d0eee00bec1c.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (22, '0', '2020-02-19 11:15:19', NULL, 'timg.jpg', 'jpg', 'd52f20dd-1bbf-49e3-bb53-077237d040fb.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (23, '0', '2020-02-19 12:12:46', NULL, 'timg.jpg', 'jpg', 'd1f2efb4-5722-434c-a63f-28de001cd8c7.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (24, '0', '2020-02-19 12:19:24', NULL, 'timg.jpg', 'jpg', 'e5527b1d-3964-4758-8de1-0975f001430a.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (25, '0', '2020-02-19 12:21:52', NULL, 'timg.jpg', 'jpg', '1416113f-fda2-4258-b071-51bd3e863820.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (26, '0', '2020-02-19 12:25:03', NULL, 'timg.jpg', 'jpg', '526367b5-583b-4aa0-8ea0-1da161f665c1.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (27, '0', '2020-02-19 12:25:35', NULL, 'timg.jpg', 'jpg', 'f5e4c300-a7aa-491f-b9af-549d1166cf93.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (28, '0', '2020-02-19 12:26:37', NULL, 'timg.jpg', 'jpg', '35357a2c-277a-4783-9909-c24b472136ae.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (29, '0', '2020-02-19 12:27:20', NULL, 'timg.jpg', 'jpg', '8f768c9a-2655-4c69-920d-32e15d0bf2ec.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (30, '0', '2020-02-19 12:27:56', NULL, 'timg.jpg', 'jpg', 'ed0dc75a-198e-4b13-8eb5-e088ec62eb9c.jpg', 'F:/pic/20200219/');
INSERT INTO `file` VALUES (31, '0', '2020-02-21 08:12:37', NULL, '$7Y55}2RI23H)$MFA${Y8GN.png', 'png', '21add216-be12-436c-802a-782ed30e5175.png', 'F:/pic/20200221/');
INSERT INTO `file` VALUES (32, '0', '2020-02-21 08:13:54', NULL, 'T%GO3[N07SB~F2VPD_ZSK)W.png', 'png', 'f4d87fa2-65fa-4aac-8e8d-230e38f00c2e.png', 'F:/pic/20200221/');
INSERT INTO `file` VALUES (33, '0', '2020-02-22 05:23:00', NULL, '捕获.PNG', 'PNG', '8d1272f1-6a13-492f-a320-bebd850260f9.PNG', 'F:/pic/20200222/');
INSERT INTO `file` VALUES (34, '0', '2020-03-12 02:08:31', NULL, '捕获.PNG', 'PNG', '36636210-ae1c-40f6-af7d-c6d5455077e3.PNG', 'F:/pic/20200312/');
INSERT INTO `file` VALUES (35, '0', '2020-03-12 02:09:50', NULL, 'T%GO3[N07SB~F2VPD_ZSK)W.png', 'png', 'b2b4be38-20ec-4623-935f-db9e973d4181.png', 'F:/pic/20200312/');
INSERT INTO `file` VALUES (36, '0', '2020-03-13 06:01:44', NULL, '20190509145141495.png', 'png', '1dd1534b-4566-4dd0-b024-a0b16899eace.png', 'F:/pic/20200313/');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权链接',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父节点id',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '2019-11-13 10:32:13', '2019-11-13 10:32:13', NULL, 'ROLE_HOME', 'home', '/', NULL, NULL);
INSERT INTO `sys_permission` VALUES (2, '2019-11-13 10:32:13', '2019-11-13 10:32:13', NULL, 'ROLE_ADMIN', 'user', '/admin', NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_role`;
CREATE TABLE `sys_permission_role`  (
  `sys_role_id` int(11) NOT NULL,
  `sys_permission_id` int(11) NOT NULL,
  PRIMARY KEY (`sys_role_id`, `sys_permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_role
-- ----------------------------
INSERT INTO `sys_permission_role` VALUES (1, 1);
INSERT INTO `sys_permission_role` VALUES (1, 2);
INSERT INTO `sys_permission_role` VALUES (2, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '2019-11-13 10:32:14', '2019-11-13 10:32:14', NULL, 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '2019-11-13 10:32:14', '2019-11-13 10:32:14', NULL, 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `sys_role_id` int(11) NOT NULL,
  `sys_user_id` int(11) NOT NULL,
  PRIMARY KEY (`sys_role_id`, `sys_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色用户关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `del_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '2019-11-13 10:32:14', '2019-11-13 10:32:14', NULL, 'admin', '6d789d4353c72e4f625d21c6b7ac2982');
INSERT INTO `sys_user` VALUES (2, '2019-11-13 10:32:14', '2019-11-13 10:32:14', NULL, 'user', 'user');
INSERT INTO `sys_user` VALUES (3, '2019-11-13 03:32:51', '1970-12-31 00:00:00', '0', 'ljj', 'a3caed36f0fe5a01e5f144db8927235e');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-12-31 00:00:00',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '2020-01-02 06:48:40', '1970-12-31 00:00:00', '0', '测试');
INSERT INTO `test` VALUES (2, '2020-01-02 08:06:38', '1970-12-31 00:00:00', '0', '测试');
INSERT INTO `test` VALUES (3, '2020-01-02 08:09:53', '1970-12-31 00:00:00', '0', '测试');
INSERT INTO `test` VALUES (4, '2020-01-02 12:25:28', '1970-12-31 00:00:00', '0', '测试');
INSERT INTO `test` VALUES (5, '2020-01-02 12:26:00', '1970-12-31 00:00:00', '0', '测试');

SET FOREIGN_KEY_CHECKS = 1;
