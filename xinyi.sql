/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : xinyi

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 23/12/2022 01:20:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('123', 'CZC', '123');
INSERT INTO `person` VALUES ('147', 'aab', '123');
INSERT INTO `person` VALUES ('241', 'dac', '123');
INSERT INTO `person` VALUES ('258', 'xd', '123');
INSERT INTO `person` VALUES ('321', 'fk', '123');
INSERT INTO `person` VALUES ('369', 'late', '123');
INSERT INTO `person` VALUES ('456', 'xda', '123');
INSERT INTO `person` VALUES ('654', 'gg', '123');
INSERT INTO `person` VALUES ('741', 'li', '123');
INSERT INTO `person` VALUES ('789', 'vsc', '123');
INSERT INTO `person` VALUES ('852', 'ak', '123');
INSERT INTO `person` VALUES ('963', 'u', '123');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `information` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (2, '123456', '复式家庭房-新店尊享特惠|会展中心|城市职业学院、瑞景商业广场|可住3人【北欧ins】考场周边', 'room2', '2022-12-25 00:00:00');
INSERT INTO `reservation` VALUES (4, '123456', '复式家庭房-新店尊享特惠|会展中心|城市职业学院、瑞景商业广场|可住3人【北欧ins】考场周边', 'room3', '2022-12-24 00:00:00');
INSERT INTO `reservation` VALUES (5, 'zc', '(一禾)小资一居轻奢城市景观房可月租年租/近呼家楼地铁站　/复星国际中心/朝外soho/世贸天阶', 'cz', '2022-12-22 00:00:00');
INSERT INTO `reservation` VALUES (16, '123', 'das', 'cs', '2022-12-22 00:11:44');
INSERT INTO `reservation` VALUES (23, '1', 'dsadad', 'xx', '2022-12-23 00:21:25');
INSERT INTO `reservation` VALUES (24, '1', 'dsadad', 'xx', '2022-12-23 00:21:27');
INSERT INTO `reservation` VALUES (25, '1', 'dsadad', 'xx', '2022-12-23 00:21:27');
INSERT INTO `reservation` VALUES (26, '1', 'dsadad', 'xx', '2022-12-23 00:21:28');
INSERT INTO `reservation` VALUES (27, '1', 'dsadad', 'xx', '2022-12-23 00:21:30');
INSERT INTO `reservation` VALUES (28, '1', 'dsadad', 'xx', '2022-12-23 00:21:29');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `information` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(0) NOT NULL,
  `quantity` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '宝龙一城复式挑高大三房', '宝龙一城复式挑高大三房·近国际会展中心·高崎机场·环岛路曾厝垵·楼下宝龙商城·可做饭', 564, 5);
INSERT INTO `room` VALUES (2, '复式家庭房', '复式家庭房-新店尊享特惠|会展中心|城市职业学院、瑞景商业广场|可住3人【北欧ins】考场周边', 495, 3);
INSERT INTO `room` VALUES (3, '馨心相居会展店', '馨心相居会展店 【标准双人间2】双床 近会展中心、环岛路、香山国际游艇会码头 交通便利', 456, 5);
INSERT INTO `room` VALUES (4, '思明观音山海景男生公寓', '思明观音山海景合住男生公寓，两人合住', 546, 5);
INSERT INTO `room` VALUES (5, '【夏·朵拉】高端公寓', '【夏·朵拉】高端公寓 宝龙一城商圈地铁口 会展中心 软件园二期 观音山梦幻海边沙滩', 654, 5);
INSERT INTO `room` VALUES (6, '舒适大床房', '舒适大床房 | 近会展中心环岛路曾厝垵鼓浪屿可步行至海边', 532, 5);
INSERT INTO `room` VALUES (7, '【厦·贰丛】厦门十居室', '【厦·贰丛】厦门十居室~单居价/KTV/独立棋牌室/客厅小影院/桌游棋牌/承接公司团建轰趴', 156, 5);
INSERT INTO `room` VALUES (8, '『乐·栖』环岛路旁', '『乐·栖』环岛路旁整层四房四卫一厅、顶楼花园露台、可聚会、近会展-曾厝垵-厦大-中山路步行街', 596, 5);
INSERT INTO `room` VALUES (9, '环岛路旁海景超大套房', '环岛路旁、两室两厅海景超大套房、步行五分钟到黄厝沙滩、可洗衣做饭可住8人、近曾厝垵', 689, 5);
INSERT INTO `room` VALUES (10, '(一禾)小资一居', '(一禾)小资一居轻奢城市景观房可月租年租/近呼家楼地铁站　/复星国际中心/朝外soho/世贸天阶', 624, 4);
INSERT INTO `room` VALUES (11, '亚运村大床房', '亚运村/外经贸/安贞/惠新/中日友好/国家会议中心/TV特惠大床', 621, 5);
INSERT INTO `room` VALUES (12, '望京SOHO店舒适大床房', '望京SOHO店/方恒国际/地铁14号线直达北京南/舒适大床房', 495, 5);
INSERT INTO `room` VALUES (13, '宜家风', '宜家风｜双人大床房/月租长租优惠 清华/北大/矿大/地大/北航/中科院/五道口地铁站/购物中心商圈房源', 594, 5);
INSERT INTO `room` VALUES (15, 'aab', 'jzjzjzjjzjz', 15, 12);
INSERT INTO `room` VALUES (16, 'aab', 'jzjzjzjjzjz', 15, 12);
INSERT INTO `room` VALUES (17, '鮀江街道大学路243号汕头大学', '双人房/单人房/电竞房', 598, 14);

SET FOREIGN_KEY_CHECKS = 1;
