/*
 Navicat Premium Dump SQL

 Source Server         : exam
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 22/12/2024 22:30:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `t_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '˭?????',
  `e_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '???Կ?Ŀ',
  `e_starttime` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '??ʼʱ?',
  `e_stoptime` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `e_autostart` tinyint NULL DEFAULT NULL,
  `e_status` tinyint NULL DEFAULT NULL COMMENT 'nothing\r\n\r\n',
  `q_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `q_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`e_id`) USING BTREE,
  INDEX `FK_t_e_fk`(`t_id` ASC) USING BTREE,
  CONSTRAINT `FK_t_e_fk` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '????ʵ?' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (2, '002', '毛泽东思想', '2024-12-21T09:00', '2024-12-22T21:30', 1, 0, '/file/2/毛泽东思想.docx', '毛泽东思想.docx');
INSERT INTO `exam` VALUES (3, '003', '高等数学', '2024-12-21T09:00', '2024-12-22T22:00', 1, 0, '/file/3/高等数学.docx', '高等数学.docx');
INSERT INTO `exam` VALUES (4, '004', '机器学习与数据挖掘', '2024-12-21T09:00', '2024-12-22T22:00', 1, 0, '/file/4/机器学习与数据挖掘.docx', '机器学习与数据挖掘.docx');
INSERT INTO `exam` VALUES (5, '005', '操作系统', '2024-12-21T09:30', '2024-12-22T22:30', 1, 0, '/file/5/操作系统.docx', '操作系统.docx');
INSERT INTO `exam` VALUES (6, '006', '计算机网络', '2024-12-21T09:30', '2024-12-22T22:30', 1, 0, '/file/6/计算机网络.docx', '计算机网络.docx');
INSERT INTO `exam` VALUES (7, '007', '大数据平台分析技术', '2024-12-21T09:30', '2024-12-22T22:30', 1, 0, '/file/7/大数据平台技术.docx', '大数据平台技术.docx');
INSERT INTO `exam` VALUES (8, '001', '中国近代史', '2024-12-21T15:36', '2024-12-22T15:36', 1, NULL, '/file/8/中国近代史.docx', '中国近代史.docx');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `f_id` int NOT NULL AUTO_INCREMENT COMMENT '???',
  `s_id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `f_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `f_path` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `f_size` int NULL DEFAULT NULL,
  `f_time` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '?ļ??????еģ????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (22, '20220010', '操作系统.docx', '/file/20220010/8E22CCD06FEC4639AF58957A0C237CF9.docx', NULL, '2024/12/21 16:42');
INSERT INTO `file` VALUES (23, '20220001', '高等数学.docx', '/file/20220001/612B1A0704594439AB481CE8AFAC34DD.docx', NULL, '2024/12/21 16:43');

-- ----------------------------
-- Table structure for global
-- ----------------------------
DROP TABLE IF EXISTS `global`;
CREATE TABLE `global`  (
  `g_id` int NOT NULL,
  `task_interval` int NULL DEFAULT NULL,
  `record_number` int NULL DEFAULT NULL,
  `max_advance_time` int NULL DEFAULT NULL,
  `min_file_size` int NULL DEFAULT NULL,
  `max_file_size` int NULL DEFAULT NULL,
  `teacher_can_clean` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'ϵͳʵ???洢ȫ????????Ϣ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of global
-- ----------------------------
INSERT INTO `global` VALUES (1, 22, 13, 11, 4, 200, 1);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `n_id` int NOT NULL AUTO_INCREMENT,
  `e_id` int NULL DEFAULT NULL,
  `n_text` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `n_time` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`n_id`) USING BTREE,
  INDEX `FK_e_n_fk`(`e_id` ASC) USING BTREE,
  CONSTRAINT `FK_e_n_fk` FOREIGN KEY (`e_id`) REFERENCES `exam` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'ʵʱ??Ϣʵ?' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `s_i` int NOT NULL AUTO_INCREMENT,
  `e_id` int NULL DEFAULT NULL,
  `s_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_class` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_ipaddress` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_online` tinyint NULL DEFAULT NULL,
  `s_score` int NULL DEFAULT NULL,
  `s_comment` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_fpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `s_fname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_i`) USING BTREE,
  INDEX `FK_s_f_fk2`(`e_id` ASC) USING BTREE,
  CONSTRAINT `FK_s_f_fk2` FOREIGN KEY (`e_id`) REFERENCES `exam` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 942 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (706, 8, '20220001', '李雷    ', '22-1班', NULL, NULL, 86, '优秀', '/file/8/7D3007207E8C458D80F2E642C5CB265E.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (707, 8, '20220002', '马子乐', '22-1班', NULL, NULL, 78, '良好', '/file/8/A30ECF5D9C064FA5873DF177C1AD9AA3.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (708, 8, '20220003', '王雷', '22-1班', NULL, NULL, 92, '极好', '/file/8/83CC15A6FD254D4A9B9E7DD141A2978A.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (709, 8, '20220004', '张峰', '22-3班', NULL, NULL, 63, '还需努力', '/file/8/C4407C8A7B664D6B9A85630B2191ACD7.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (710, 8, '20220005', '袁伟民', '22-2班', NULL, NULL, 78, '良好', '/file/8/FB7ECB9728ED49D3BF8314247B453A37.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (711, 8, '20220006', '王子恒', '22-3班', NULL, NULL, 92, '极好', '/file/8/8D647F3DF10042FB9347CEC2261D64A7.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (712, 8, '20220007', '陈华林', '22-1班', NULL, NULL, 82, '优秀', '/file/8/6DB736E04B9049F5ADCA6B7DBCA302AF.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (713, 8, '20220008', '杨辉', '22-2班', NULL, NULL, 76, '良好', '/file/8/31012C9B3D1E4D9988CF3BE0D71BA73F.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (714, 8, '20220009', '张广丰', '22-2班', NULL, NULL, 87, '优秀', '/file/8/2047802C92A243FEB2E151541CDF0234.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (715, 8, '20220010', '诸葛瞻', '22-3班', NULL, NULL, 63, '还需努力', '/file/8/D769636F0F5548A096BACBE52652989A.docx', '中国近代史.docx');
INSERT INTO `student` VALUES (716, 8, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (717, 8, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (718, 8, '20220013', '丁里', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (719, 8, '20220014', '贺靖', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (720, 8, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (721, 8, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (722, 8, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (723, 8, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (724, 8, '20220019', '管斌', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (725, 8, '20220020', '吕木', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (726, 8, '20220021', '蒋干', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (727, 8, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (728, 8, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (729, 8, '20220024', '吴柳分', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (730, 8, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (731, 8, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (732, 8, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (733, 8, '20220028', '乐云其', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (734, 8, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (735, 8, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (736, 2, '20220001', '李雷    ', '22-1班', NULL, NULL, 80, '优秀', '/file/2/FC8D85A0696F41FFBFAB56B83AF8BFAF.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (737, 2, '20220002', '马子乐', '22-1班', NULL, NULL, 80, '优秀', '/file/2/1B1BC712B2C447BEB6612E7178C17ABC.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (738, 2, '20220003', '王雷', '22-1班', NULL, NULL, 83, '优秀', '/file/2/A5AB2962BD5D4FC7A2766FD1DF0A1531.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (739, 2, '20220004', '张峰', '22-3班', NULL, NULL, 92, '极好', '/file/2/2F89445DD437442E8A3859E622D5ADBF.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (740, 2, '20220005', '袁伟民', '22-2班', NULL, NULL, 67, '还需努力', '/file/2/6AD0125779E24C658A09310DF465A5C9.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (741, 2, '20220006', '王子恒', '22-3班', NULL, NULL, 71, '良好', '/file/2/6363DC4CEF56463191A25C495F0000A4.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (742, 2, '20220007', '陈华林', '22-1班', NULL, NULL, 82, '优秀', '/file/2/6ABB95A7E06241EAA3BB97E41842C47A.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (743, 2, '20220008', '杨辉', '22-2班', NULL, NULL, 92, '极好', '/file/2/B2B97DC696154BCCA480E895A4960D8E.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (744, 2, '20220009', '张广丰', '22-2班', NULL, NULL, 82, '优秀', '/file/2/C47D2673B97644A1B4C87BBEFA4C4B96.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (745, 2, '20220010', '诸葛瞻', '22-3班', NULL, NULL, 59, '补考', '/file/2/159D2033883C4337A44BD9D76E100F7A.docx', '毛泽东思想.docx');
INSERT INTO `student` VALUES (746, 2, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (747, 2, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (748, 2, '20220013', '丁里', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (749, 2, '20220014', '贺靖', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (750, 2, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (751, 2, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (752, 2, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (753, 2, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (754, 2, '20220019', '管斌', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (755, 2, '20220020', '吕木', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (756, 2, '20220021', '蒋干', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (757, 2, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (758, 2, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (759, 2, '20220024', '吴柳分', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (760, 2, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (761, 2, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (762, 2, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (763, 2, '20220028', '乐云其', '22-3班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (764, 2, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (765, 2, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (766, 3, '20220001', '李雷    ', '22-1班', NULL, NULL, 87, '优秀', '/file/3/3EDD626D0245440083993C141604511B.docx', '高等数学.docx');
INSERT INTO `student` VALUES (767, 3, '20220002', '马子乐', '22-1班', NULL, NULL, 97, '极好', '/file/3/F7BD188BEEC04209BAED0A76E87A5DE9.docx', '高等数学.docx');
INSERT INTO `student` VALUES (768, 3, '20220003', '王雷', '22-1班', NULL, NULL, 66, '还需努力', '/file/3/46351110F45C4D41AA41C6B0D7BD1369.docx', '高等数学.docx');
INSERT INTO `student` VALUES (769, 3, '20220007', '陈华林', '22-1班', NULL, NULL, 53, '补考', '/file/3/AE51ACBBF234469C8D8CDAA7BE8A87DE.docx', '高等数学.docx');
INSERT INTO `student` VALUES (770, 3, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (771, 3, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (772, 3, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (773, 3, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (774, 3, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (775, 3, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (776, 3, '20220031', '王悦', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (777, 3, '20220032', '高明阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (778, 3, '20220033', '王硕', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (779, 3, '20220034', '李目', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (780, 3, '20220035', '张望类', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (781, 3, '20220036', '张广丰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (782, 3, '20220037', '李举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (783, 3, '20220038', '王文举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (784, 3, '20220039', '闫成龙', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (785, 3, '20220040', '毛阿敏', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (786, 3, '20220041', '刘阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (787, 3, '20220042', '刘国豪', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (788, 4, '20220001', '李雷    ', '22-1班', NULL, NULL, 89, '优秀', '/file/4/77F46914838043148D9FF3E305C9E475.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (789, 4, '20220002', '马子乐', '22-1班', NULL, NULL, 92, '极好', '/file/4/CDC0282287C74394922C90A81B0F0F3C.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (790, 4, '20220003', '王雷', '22-1班', NULL, NULL, 87, '优秀', '/file/4/FB86BC1BED124F79AB6057C0241F2B57.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (791, 4, '20220007', '陈华林', '22-1班', NULL, NULL, 38, '重修', '/file/4/FA3904AE63884C8D926B8016A6F1D9D4.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (792, 4, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (793, 4, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (794, 4, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (795, 4, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (796, 4, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (797, 4, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (798, 4, '20220031', '王悦', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (799, 4, '20220032', '高明阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (800, 4, '20220033', '王硕', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (801, 4, '20220034', '李目', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (802, 4, '20220035', '张望类', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (803, 4, '20220036', '张广丰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (804, 4, '20220037', '李举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (805, 4, '20220038', '王文举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (806, 4, '20220039', '闫成龙', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (807, 4, '20220040', '毛阿敏', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (808, 4, '20220041', '刘阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (809, 4, '20220042', '刘国豪', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (810, 4, '20220005', '袁伟民', '22-2班', NULL, NULL, NULL, NULL, '/file/4/8715DD00AF03413B9DF2111B2745143D.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (811, 4, '20220008', '杨辉', '22-2班', NULL, NULL, NULL, NULL, '/file/4/68457463DB52498ABE5F43A37D1A8400.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (812, 4, '20220009', '张广丰', '22-2班', NULL, NULL, NULL, NULL, '/file/4/621D4FE6D265476CB81BEE43F283A45D.docx', '机器学习与数据挖掘.docx');
INSERT INTO `student` VALUES (813, 4, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (814, 4, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (815, 4, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (816, 4, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (817, 4, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (818, 4, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (819, 4, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (820, 4, '20220043', '李婉', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (821, 4, '20220044', '李赢', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (822, 4, '20220045', '赵留洋', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (823, 4, '20220046', '赵湾', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (824, 4, '20220047', '王丽', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (825, 4, '20220048', '陈义', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (826, 4, '20220049', '王哲', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (827, 4, '20220050', '立三', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (828, 4, '20220051', '孙立人', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (829, 4, '20220052', '白起', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (830, 4, '20220053', '关宇', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (831, 4, '20220054', '张飞', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (832, 5, '20220001', '李雷    ', '22-1班', NULL, NULL, 89, '优秀', '/file/5/2273472DC15F4FC3B1172B9CEC03A55A.docx', '操作系统.docx');
INSERT INTO `student` VALUES (833, 5, '20220002', '马子乐', '22-1班', NULL, NULL, 93, '极好', '/file/5/D5E64EEF32EB446EB19760059197610E.docx', '操作系统.docx');
INSERT INTO `student` VALUES (834, 5, '20220003', '王雷', '22-1班', NULL, NULL, 76, '良好', '/file/5/AD85A473A0A54BE89C27109C3C2C7C72.docx', '操作系统.docx');
INSERT INTO `student` VALUES (835, 5, '20220007', '陈华林', '22-1班', NULL, NULL, 82, '优秀', '/file/5/656BBEBF9434425B96179400FB605673.docx', '操作系统.docx');
INSERT INTO `student` VALUES (836, 5, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (837, 5, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (838, 5, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (839, 5, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (840, 5, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (841, 5, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (842, 5, '20220031', '王悦', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (843, 5, '20220032', '高明阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (844, 5, '20220033', '王硕', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (845, 5, '20220034', '李目', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (846, 5, '20220035', '张望类', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (847, 5, '20220036', '张广丰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (848, 5, '20220037', '李举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (849, 5, '20220038', '王文举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (850, 5, '20220039', '闫成龙', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (851, 5, '20220040', '毛阿敏', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (852, 5, '20220041', '刘阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (853, 5, '20220042', '刘国豪', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (854, 5, '20220005', '袁伟民', '22-2班', NULL, NULL, NULL, NULL, '/file/5/4861B57282E2473EA933A1CCFB3B3D6C.docx', '操作系统.docx');
INSERT INTO `student` VALUES (855, 5, '20220008', '杨辉', '22-2班', NULL, NULL, NULL, NULL, '/file/5/D3F86490EB11487A999836F7401B9245.docx', '操作系统.docx');
INSERT INTO `student` VALUES (856, 5, '20220009', '张广丰', '22-2班', NULL, NULL, NULL, NULL, '/file/5/6128C7F068104B9BA63D97B07B473F00.docx', '操作系统.docx');
INSERT INTO `student` VALUES (857, 5, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (858, 5, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (859, 5, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (860, 5, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (861, 5, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (862, 5, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (863, 5, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (864, 5, '20220043', '李婉', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (865, 5, '20220044', '李赢', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (866, 5, '20220045', '赵留洋', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (867, 5, '20220046', '赵湾', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (868, 5, '20220047', '王丽', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (869, 5, '20220048', '陈义', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (870, 5, '20220049', '王哲', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (871, 5, '20220050', '立三', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (872, 5, '20220051', '孙立人', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (873, 5, '20220052', '白起', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (874, 5, '20220053', '关宇', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (875, 5, '20220054', '张飞', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (876, 6, '20220001', '李雷    ', '22-1班', NULL, NULL, 92, '极好', '/file/6/084CA702CD634000AD7D5D7C4AECA439.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (877, 6, '20220002', '马子乐', '22-1班', NULL, NULL, 82, '优秀', '/file/6/6EA06E9F23C94B049251CEE84D11512D.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (878, 6, '20220003', '王雷', '22-1班', NULL, NULL, 75, '良好', '/file/6/36E86CC269F945A08100B8BD3FD59437.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (879, 6, '20220007', '陈华林', '22-1班', NULL, NULL, 67, '还需努力', '/file/6/C4F0E6441D74405BB2D4F1741AE774F7.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (880, 6, '20220011', '张大宝', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (881, 6, '20220017', '陈亚峰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (882, 6, '20220018', '方新宇', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (883, 6, '20220025', '王刘洋', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (884, 6, '20220026', '张模样', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (885, 6, '20220030', '王桃', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (886, 6, '20220031', '王悦', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (887, 6, '20220032', '高明阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (888, 6, '20220033', '王硕', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (889, 6, '20220034', '李目', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (890, 6, '20220035', '张望类', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (891, 6, '20220036', '张广丰', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (892, 6, '20220037', '李举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (893, 6, '20220038', '王文举', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (894, 6, '20220039', '闫成龙', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (895, 6, '20220040', '毛阿敏', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (896, 6, '20220041', '刘阳', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (897, 6, '20220042', '刘国豪', '22-1班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (898, 6, '20220005', '袁伟民', '22-2班', NULL, NULL, NULL, NULL, '/file/6/7369CAB26A554AFA8E05A2B4471974B5.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (899, 6, '20220008', '杨辉', '22-2班', NULL, NULL, NULL, NULL, '/file/6/0A1A39F003AF419FB67980D865143B97.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (900, 6, '20220009', '张广丰', '22-2班', NULL, NULL, NULL, NULL, '/file/6/DEA9530300E048EBB3B599E1635EA3DD.docx', '计算机网络.docx');
INSERT INTO `student` VALUES (901, 6, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (902, 6, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (903, 6, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (904, 6, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (905, 6, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (906, 6, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (907, 6, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (908, 6, '20220043', '李婉', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (909, 6, '20220044', '李赢', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (910, 6, '20220045', '赵留洋', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (911, 6, '20220046', '赵湾', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (912, 6, '20220047', '王丽', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (913, 6, '20220048', '陈义', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (914, 6, '20220049', '王哲', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (915, 6, '20220050', '立三', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (916, 6, '20220051', '孙立人', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (917, 6, '20220052', '白起', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (918, 6, '20220053', '关宇', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (919, 6, '20220054', '张飞', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (920, 7, '20220005', '袁伟民', '22-2班', NULL, NULL, 98, '极好', '/file/7/21ECA811A9F94D34B08B14018B760BEB.docx', '大数据平台技术.docx');
INSERT INTO `student` VALUES (921, 7, '20220008', '杨辉', '22-2班', NULL, NULL, 83, '优秀', '/file/7/E6189C8EF35E44E2B0873F91C51506AD.docx', '大数据平台技术.docx');
INSERT INTO `student` VALUES (922, 7, '20220009', '张广丰', '22-2班', NULL, NULL, 97, '极好', '/file/7/39DA3A2F6271403BB3F0FC6C21D00EFE.docx', '大数据平台技术.docx');
INSERT INTO `student` VALUES (923, 7, '20220012', '王宇航', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (924, 7, '20220015', '王杰', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (925, 7, '20220016', '韩培森', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (926, 7, '20220022', '荀洵', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (927, 7, '20220023', '科字', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (928, 7, '20220027', '李师木', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (929, 7, '20220029', '徐琨', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (930, 7, '20220043', '李婉', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (931, 7, '20220044', '李赢', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (932, 7, '20220045', '赵留洋', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (933, 7, '20220046', '赵湾', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (934, 7, '20220047', '王丽', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (935, 7, '20220048', '陈义', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (936, 7, '20220049', '王哲', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (937, 7, '20220050', '立三', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (938, 7, '20220051', '孙立人', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (939, 7, '20220052', '白起', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (940, 7, '20220053', '关宇', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `student` VALUES (941, 7, '20220054', '张飞', '22-2班', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `t_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '˭?????',
  `t_pwd` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '??ʦ???',
  `t_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '??ʦ??ʵ????',
  `t_isadmin` tinyint NOT NULL COMMENT '?Ƿ?Ϊ????Ա',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '?û?????ģ????ʦ??????Աʵ?' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('001', '0adc3949ba59abbe56e057f20f883e', '丁从化', 1);
INSERT INTO `teacher` VALUES ('002', '0adc3949ba59abbe56e057f20f883e', '夏晓琪', 0);
INSERT INTO `teacher` VALUES ('003', '0adc3949ba59abbe56e057f20f883e', '曾博远', 1);
INSERT INTO `teacher` VALUES ('004', '0adc3949ba59abbe56e057f20f883e', '韩松', 0);
INSERT INTO `teacher` VALUES ('005', '0adc3949ba59abbe56e057f20f883e', '孙蝶飞', 1);
INSERT INTO `teacher` VALUES ('006', '0adc3949ba59abbe56e057f20f883e', '江浩华', 0);
INSERT INTO `teacher` VALUES ('007', '0adc3949ba59abbe56e057f20f883e', '田雨旺', 1);

SET FOREIGN_KEY_CHECKS = 1;
