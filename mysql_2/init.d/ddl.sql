CREATE DATABASE /*!32312 IF NOT EXISTS*/ `uos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `uos`;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `uos`.`test`  (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` VALUES (3, '3333');
INSERT INTO `test` VALUES (4, '4444');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;