/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100132
 Source Host           : localhost:3306
 Source Schema         : credit_process

 Target Server Type    : MySQL
 Target Server Version : 100132
 File Encoding         : 65001

 Date: 13/06/2018 20:56:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ci_peoples
-- ----------------------------
DROP TABLE IF EXISTS `ci_peoples`;
CREATE TABLE `ci_peoples`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `peopleId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peopleId`(`peopleId`) USING BTREE,
  CONSTRAINT `ci_peoples_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ci_peoples
-- ----------------------------
INSERT INTO `ci_peoples` VALUES (1, 2);
INSERT INTO `ci_peoples` VALUES (2, 5);

-- ----------------------------
-- Table structure for cm_peoples
-- ----------------------------
DROP TABLE IF EXISTS `cm_peoples`;
CREATE TABLE `cm_peoples`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `peopleId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peopleId`(`peopleId`) USING BTREE,
  CONSTRAINT `cm_peoples_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cm_peoples
-- ----------------------------
INSERT INTO `cm_peoples` VALUES (1, 3);
INSERT INTO `cm_peoples` VALUES (2, 6);

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of levels
-- ----------------------------
INSERT INTO `levels` VALUES (1, '4 глаза ГОСБ');
INSERT INTO `levels` VALUES (2, '4 глаза ТБ');
INSERT INTO `levels` VALUES (3, '4 глаза ЦА');
INSERT INTO `levels` VALUES (4, '6 глаз ГОСБ');
INSERT INTO `levels` VALUES (5, '6 глаз ТБ');
INSERT INTO `levels` VALUES (6, '6 глаз ЦА');
INSERT INTO `levels` VALUES (7, 'КПКИ ГОСБ');
INSERT INTO `levels` VALUES (8, 'КПКИ ТБ');
INSERT INTO `levels` VALUES (9, 'КПКИ ЦА');

-- ----------------------------
-- Table structure for manager_peoples
-- ----------------------------
DROP TABLE IF EXISTS `manager_peoples`;
CREATE TABLE `manager_peoples`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `peopleId` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `peopleId`(`peopleId`) USING BTREE,
  CONSTRAINT `manager_peoples_ibfk_1` FOREIGN KEY (`peopleId`) REFERENCES `peoples` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manager_peoples
-- ----------------------------
INSERT INTO `manager_peoples` VALUES (1, 4);
INSERT INTO `manager_peoples` VALUES (2, 7);

-- ----------------------------
-- Table structure for peoples
-- ----------------------------
DROP TABLE IF EXISTS `peoples`;
CREATE TABLE `peoples`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(11) UNSIGNED NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `peoples_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of peoples
-- ----------------------------
INSERT INTO `peoples` VALUES (2, 1, 'Кудашов', 'Денис', 'Валерьевич');
INSERT INTO `peoples` VALUES (3, 2, 'Делов', 'Павел', 'Андреевич');
INSERT INTO `peoples` VALUES (4, 3, 'Иванов', 'Иван', 'Иванович');
INSERT INTO `peoples` VALUES (5, 4, 'Петров', 'Петр', 'Петрович');
INSERT INTO `peoples` VALUES (6, 5, 'Эрнест', 'Эрнест', 'Эрнестович');
INSERT INTO `peoples` VALUES (7, 6, 'Освобожденный', 'Джанго', 'Джангович');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (1, 'Кредитный мэнеджер');
INSERT INTO `rules` VALUES (2, 'Кредитный инспектор');
INSERT INTO `rules` VALUES (3, 'Руководитель');

-- ----------------------------
-- Table structure for segements
-- ----------------------------
DROP TABLE IF EXISTS `segements`;
CREATE TABLE `segements`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `segement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of segements
-- ----------------------------
INSERT INTO `segements` VALUES (1, 'Малый');
INSERT INTO `segements` VALUES (2, 'Средний');
INSERT INTO `segements` VALUES (3, 'Крупный');

-- ----------------------------
-- Table structure for step_names
-- ----------------------------
DROP TABLE IF EXISTS `step_names`;
CREATE TABLE `step_names`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `step` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of step_names
-- ----------------------------
INSERT INTO `step_names` VALUES (1, 'Получение пакета документов от КМ');
INSERT INTO `step_names` VALUES (2, 'Полчучение заключения службы безопасности');
INSERT INTO `step_names` VALUES (3, 'Согласование нестандартности');
INSERT INTO `step_names` VALUES (4, 'Получение заключения юридического подразделения');
INSERT INTO `step_names` VALUES (5, 'Получение залогового заключения');
INSERT INTO `step_names` VALUES (6, 'Получение строительного заключения');
INSERT INTO `step_names` VALUES (7, 'Передача заявки и пакета документов андеррайтеру в официальном порядке');
INSERT INTO `step_names` VALUES (8, 'Получение окончательного официального решения от андеррайтера');
INSERT INTO `step_names` VALUES (9, 'Дата заседания Кредитного комитета');
INSERT INTO `step_names` VALUES (10, 'Подписание кредитной документации');
INSERT INTO `step_names` VALUES (11, 'Выдача кредита');

-- ----------------------------
-- Table structure for steps
-- ----------------------------
DROP TABLE IF EXISTS `steps`;
CREATE TABLE `steps`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketId` int(10) UNSIGNED NOT NULL,
  `stepNameId` int(10) UNSIGNED NULL DEFAULT NULL,
  `planDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `factDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticketId`(`ticketId`) USING BTREE,
  INDEX `stepId`(`stepNameId`) USING BTREE,
  CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `steps_ibfk_2` FOREIGN KEY (`stepNameId`) REFERENCES `step_names` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of steps
-- ----------------------------
INSERT INTO `steps` VALUES (1, 3, 2, '2018-05-30 22:37:05', '2018-05-30 22:37:02');
INSERT INTO `steps` VALUES (2, 3, 3, '2018-05-30 12:30:53', '2018-05-29 12:30:56');
INSERT INTO `steps` VALUES (3, 3, 4, '2018-05-29 12:31:08', '2018-05-31 12:31:06');
INSERT INTO `steps` VALUES (4, 3, 5, NULL, NULL);
INSERT INTO `steps` VALUES (5, 3, 6, NULL, NULL);
INSERT INTO `steps` VALUES (6, 3, 7, NULL, NULL);
INSERT INTO `steps` VALUES (7, 3, 8, NULL, NULL);
INSERT INTO `steps` VALUES (8, 3, 9, NULL, NULL);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `active` int(1) NULL DEFAULT NULL,
  `segementId` int(11) UNSIGNED NOT NULL,
  `levelId` int(11) UNSIGNED NOT NULL,
  `borrower` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` decimal(10, 2) NOT NULL,
  `amount` decimal(10, 3) NOT NULL,
  `manager` int(11) UNSIGNED NULL DEFAULT NULL,
  `ci` int(11) UNSIGNED NULL DEFAULT NULL,
  `cm` int(11) UNSIGNED NULL DEFAULT NULL,
  `createdAt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updatedAt` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `segementId`(`segementId`) USING BTREE,
  INDEX `levelId`(`levelId`) USING BTREE,
  INDEX `ci`(`ci`) USING BTREE,
  INDEX `cm`(`cm`) USING BTREE,
  INDEX `manager`(`manager`) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`segementId`) REFERENCES `segements` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`manager`) REFERENCES `manager_peoples` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`ci`) REFERENCES `ci_peoples` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`cm`) REFERENCES `cm_peoples` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (3, 1, 2, 5, 'АО Ресторатор', 9.60, 70.656, 1, 1, 1, '2018-06-08 22:19:48', '2018-06-08 22:19:48');
INSERT INTO `tickets` VALUES (5, 1, 3, 3, 'ОАО СКИФ', 7.80, 9.999, 1, 1, 1, '2018-06-08 22:33:26', '2018-06-08 22:33:26');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ruleId` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ruleId`(`ruleId`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ruleId`) REFERENCES `rules` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 3, 'kudashov_dv', '123456789');
INSERT INTO `users` VALUES (2, 2, 'delov', '123456789');
INSERT INTO `users` VALUES (3, 1, 'fdstgggfd', '123456789');
INSERT INTO `users` VALUES (4, 3, 'rewfsdf', 'oijhiojk;ol');
INSERT INTO `users` VALUES (5, 2, 'dfelpgokfdogp', 'dfsgfdgfdg');
INSERT INTO `users` VALUES (6, 1, 'dfdsfsdf', 'hhngnbg');

SET FOREIGN_KEY_CHECKS = 1;
