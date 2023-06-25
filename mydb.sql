/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 24/06/2023 20:58:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` int NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'admin1', 123);

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 0) NOT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES (1, 'https://example.com/image1.pn', 'Pro', 'This is p', 2000, 'Category 1', '2023-06-24 16:28:33');
INSERT INTO `list` VALUES (2, 'https://example.com/image2.png', 'Product 2', 'This is product 2', 30, 'Category 2', '2023-06-20 13:56:18');
INSERT INTO `list` VALUES (3, 'https://example.com/image3.png', 'Product 3', 'This is product 3', 40, 'Category 1', '2023-06-20 13:56:18');
INSERT INTO `list` VALUES (4, 'https://example.com/image4.png', 'Product 4', 'This is product 4', 50, 'Category 2', '2023-06-20 13:56:18');
INSERT INTO `list` VALUES (5, 'https://example.com/image5.png', 'Product 5', 'This is product 5', 60, 'Category 1', '2023-06-20 13:56:18');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10, 0) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 'User 1', 'https://example.com/image3.png', 'Product 3', 'This is product 3', 'Category 1', 3, 40, '2023-06-20 14:02:09');
INSERT INTO `orders` VALUES (4, 'User 2', 'https://example.com/image4.png', 'Product 4', 'This is product 4', 'Category 2', 2, 50, '2023-06-20 14:02:09');
INSERT INTO `orders` VALUES (5, 'User 1', 'https://example.com/image5.png', 'Product 5', 'This is product 5', 'Category 1', 1, 60, '2023-06-20 14:02:09');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES (1, 'User 1', '13800138000', 'This is a good product', 5, '2023-06-24 18:24:10');
INSERT INTO `pinglun` VALUES (2, 'User 2', '13900139000', 'I love this product so much!', 5, '2023-06-20 14:12:11');
INSERT INTO `pinglun` VALUES (3, 'User 1', '13800138000', 'The quality of the product is not good', 5, '2023-06-24 18:23:56');
INSERT INTO `pinglun` VALUES (4, 'User 3', '13700137000', 'The delivery speed is very fast', 5, '2023-06-24 18:24:04');
INSERT INTO `pinglun` VALUES (5, 'User 2', '13900139000', 'The product looks better than I expected', 5, '2023-06-20 14:12:11');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_nickname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES (1, '7777777777', 'ddakwdk');

-- ----------------------------
-- Table structure for wx_home
-- ----------------------------
DROP TABLE IF EXISTS `wx_home`;
CREATE TABLE `wx_home`  (
  `slide_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `advertising_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `company_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `company_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `company_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_home
-- ----------------------------
INSERT INTO `wx_home` VALUES ('https://userblink.csdnimg.cn/a3789c714b394a6cbf78a47896a28128.jpeg', 'https://userblink.csdnimg.cn/a3789c714b394a6cbf78a47896a28128.jpeg', 'https://img1.baidu.com/it/u=1326968600,1939369385&fm=253&fmt=auto&app=138&f=JPEG?https://userblink.csdnimg.cn/a19eef31951e429c928510f8b48d5bfa.jpeg', '比亚迪', '比亚迪创立于1995年2月，总部位于广东省深圳市，旗下产业包括电子、汽车、新能源和轨道交通。');
INSERT INTO `wx_home` VALUES ('https://userblink.csdnimg.cn/b910560e59a64048abc74cb8953bd380.jpeg', 'https://userblink.csdnimg.cn/b910560e59a64048abc74cb8953bd380.jpeg', 'https://userblink.csdnimg.cn/cf567fc7b3ec47d9867f9fa04c95a3b4.jpeg', '宁德时代', '宁德时代新能源科技股份有限公司是全球领先的锂离子电池研发制造公司,公司专注于新能源汽车动力电池系统、储能系统的研发、生产和销售,致力于为全球新能源应用提供一流解决方案。');
INSERT INTO `wx_home` VALUES ('https://userblink.csdnimg.cn/5691cbdd84e14f5a8ae03fb0ea981c3f.jpeg', 'https://userblink.csdnimg.cn/5691cbdd84e14f5a8ae03fb0ea981c3f.jpeg', 'https://userblink.csdnimg.cn/8e1292ce261845c2a1369b640b12baa4.jpeg', '海尔', '海尔作为实体经济的代表,持续聚焦实业,布局智慧住居和产业互联网两大赛道,建设高端品牌、场景品牌与生态品牌,以科技创新为全球用户定制个性化智慧生活,助推企业实现数字化转型,助力经济社会高质量');
INSERT INTO `wx_home` VALUES ('https://userblink.csdnimg.cn/13121a3a8f824619989052519fbc3bfb.jpeg', 'https://userblink.csdnimg.cn/13121a3a8f824619989052519fbc3bfb.jpeg', 'https://userblink.csdnimg.cn/06b8a1d520384bf98f72dbe5621ad80f.jpeg', '华能集团', '华能集团一般指中国华能集团有限公司。 中国华能集团有限公司（CHINA HUANENG简称中国华能）是经国务院批准成立的国有重要骨干企业。创立于1985年，因改革开放而生，伴随着改革开放不断成长壮大，是我国电力工业的一面旗帜，持续引领发电行业进步。');
INSERT INTO `wx_home` VALUES (NULL, NULL, 'https://userblink.csdnimg.cn/410fad11e63c4cd9ae0509fa2ddd0a45.jpeg', '李锦记健康产品集团', '李锦记健康产品集团由李锦记家族于1992年创立，总部位于中国香港。集团经营多元化业务，包括中草药健康产品、中药材种植与销售、物业投资，以及为初创企业提供风险投资');
INSERT INTO `wx_home` VALUES (NULL, NULL, 'https://userblink.csdnimg.cn/a66d355db4a4479c9f5e510389a11f1d.jpeg', 'TCL集团', 'TCL集团一般指TCL科技集团股份有限公司。 TCL科技集团股份有限公司成立于1982年，总部位于广东惠州，主营业务是半导体、电子产品及通讯设备、新型光电、液晶显示器件，货物或技术进出口');

-- ----------------------------
-- Table structure for wxpay
-- ----------------------------
DROP TABLE IF EXISTS `wxpay`;
CREATE TABLE `wxpay`  (
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay` decimal(10, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wxpay
-- ----------------------------
INSERT INTO `wxpay` VALUES ('zs', 1960.00);
INSERT INTO `wxpay` VALUES ('微信用户', 1012.00);
INSERT INTO `wxpay` VALUES ('微信用户', 1012.00);

SET FOREIGN_KEY_CHECKS = 1;
