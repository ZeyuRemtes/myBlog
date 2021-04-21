/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 21/04/2021 11:24:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` blob NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `views` int NULL DEFAULT NULL,
  `type_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tag_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, b'1', b'1', b'1', 0x68656C6C6F, '2020-10-18 22:30:13.000000', 'https://unsplash.it/800/450?image=1005', 'testflag', b'1', b'1', 'testTitle', '2020-11-09 14:26:17.577000', 96, 1, 1, 'testDescription', '1');
INSERT INTO `t_blog` VALUES (3, b'1', b'0', b'1', 0x3C703EE8BF99E6B3A2E5BC95E6B581E698AF3C62722F3E0D0AE593B2E5AE9DE79A84E5A4A7E8839CE588A93C62722F3E0D0AE69599E7A88BE5A682E4B88BEFBC9A3C62722F3E0D0A3C6120687265663D22687474703A2F2F33392E3130372E32362E383A33393030302F232F61727469636C653F69643D343126616D703B617574686F723D536861726B657922207469746C653D22E99988E593B2E79A84E58D9AE5AEA222207461726765743D225F626C616E6B223EE99988E593B2E79A84E58D9AE5AEA23C2F613E3C2F703E0D0A, '2020-11-09 14:32:49.496000', 'https://unsplash.it/800/450?image=1004', '转载', b'1', b'1', '[加油投票平台]每日自动打卡机', '2020-11-10 13:41:51.347000', 0, 4, 1, '体温打卡', '9');
INSERT INTO `t_blog` VALUES (4, b'0', b'0', b'0', 0xE68F90E4BE9BE5ADA6E995BFE5AE9EE9AA8CE68AA5E5918AE4BB85E4BE9BE58F82E88083E69FA5E99885EFBC8CE58887E58BBFE68A84E8A2ADEFBC9A3C2F62723E0D0AE993BEE68EA53A2068747470733A2F2F70616E2E62616964752E636F6D2F732F31556F305F612D754A443244676749314D3343436E704120E68F90E58F96E7A0813A20396B746620E5A48DE588B6E8BF99E6AEB5E58685E5AEB9E5908EE68993E5BC80E799BEE5BAA6E7BD91E79B98E6898BE69CBA417070EFBC8CE6938DE4BD9CE69BB4E696B9E4BEBFE593A6200D0A2D2DE69DA5E887AAE799BEE5BAA6E7BD91E79B98E8B685E7BAA7E4BC9AE591987635E79A84E58886E4BAAB0D0A0D0A, '2020-11-09 15:06:27.597000', 'https://unsplash.it/800/450?image=1003', '原创', b'1', b'0', '操作系统课程实验一', '2020-11-09 15:06:27.597000', 3, 3, 1, '操作系统课程设计Webservice', '7,8');

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blog_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tag_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (1, 1, 1);
INSERT INTO `t_blog_tags` VALUES (3, 9, 9);
INSERT INTO `t_blog_tags` VALUES (3, 9, 11);
INSERT INTO `t_blog_tags` VALUES (4, 7, 12);
INSERT INTO `t_blog_tags` VALUES (4, 8, 13);
INSERT INTO `t_blog_tags` VALUES (3, 9, 14);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  `parent_comment_id` bigint NULL DEFAULT NULL,
  `adminComment` bit(1) NULL DEFAULT NULL,
  `childcomment` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, '/images/avatar.jpg', 'testComment', '2020-11-07 20:18:37.979000', 'testEmail@Email.com', 'testName', 1, -1, b'0', b'0');
INSERT INTO `t_comment` VALUES (25, '/images/avatar.jpg', 'testComment1', '2020-11-28 13:05:14.490000', 'zeyuremtes@aliyun.com', 'testName1', 1, -1, b'0', b'0');
INSERT INTO `t_comment` VALUES (26, '/images/avatar.jpg', 'testComment2', '2020-11-28 13:05:37.831000', 'zeyuremtes@aliyun.com', 'testName2', 1, -1, b'0', b'1');
INSERT INTO `t_comment` VALUES (27, '/images/avatar.jpg', 'testChildComment', '2020-11-28 13:05:56.923000', 'zeyuremtes@aliyun.com', 'testName3', 1, 26, b'0', b'0');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, 'testTag');
INSERT INTO `t_tag` VALUES (7, '操作系统');
INSERT INTO `t_tag` VALUES (8, '课程设计');
INSERT INTO `t_tag` VALUES (9, '体温打卡');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, 'testType');
INSERT INTO `t_type` VALUES (3, '原创');
INSERT INTO `t_type` VALUES (4, '转载');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://picsum.photos/100/100', '2020-10-17 14:33:36.000000', 'zeyuremtes@aliyun.com', 'Misaka', '202cb962ac59075b964b07152d234b70', '2020-10-17 14:33:55.000000', 'Misaka');
INSERT INTO `t_user` VALUES (2, 'https://picsum.photos/100/100', '2020-11-16 21:05:06.462000', '1328775385@qq.com', 'Remtes~QAQ', '202cb962ac59075b964b07152d234b70', '2020-11-16 21:05:06.462000', 'Remtes');
INSERT INTO `t_user` VALUES (4, 'https://picsum.photos/100/100', '2020-11-18 13:44:58.673000', '1481697301@qq.com', 'plasy', '250cf8b51c773f3f8dc8b4be867a9a02', '2020-11-18 13:44:58.673000', 'Plassssssy');

SET FOREIGN_KEY_CHECKS = 1;
