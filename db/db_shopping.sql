/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_shopping

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/05/2022 19:49:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址实体的唯一主键列',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户实体的主键属性',
  `a_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址的收件人',
  `a_phone` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `a_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人详细地址',
  `a_state` int(11) NULL DEFAULT NULL COMMENT '是否是默认地址 0 不是 1是默认地址',
  PRIMARY KEY (`a_id`) USING BTREE,
  INDEX `FK_u_a_fk`(`u_id`) USING BTREE,
  CONSTRAINT `FK_u_a_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户个人中心的地址实体，用于存储地址信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '王五', '12688882598', '浙江省杭州市萧山区宁围街道8888号', 0);
INSERT INTO `address` VALUES (2, 3, '张三', '136966663578', '安徽省徐州市经济技术开发区', 0);
INSERT INTO `address` VALUES (3, 3, '赵六', '19685349874', '上海市紫砖公路258号34号803', 1);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车的唯一标识',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户实体的主键属性',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '商品的唯一主键',
  `c_count` decimal(12, 2) NULL DEFAULT NULL COMMENT '购物车小计',
  `c_num` int(11) NULL DEFAULT NULL COMMENT '购物车商品数量',
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `FK_p_c_fk`(`p_id`) USING BTREE,
  INDEX `FK_u_c_fk`(`u_id`) USING BTREE,
  CONSTRAINT `FK_p_c_fk` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_u_c_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车实体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项的唯一标识',
  `o_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号是字符串类型但是也是唯一标识',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '商品的唯一主键',
  `i_count` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单项的小计',
  `i_num` int(11) NULL DEFAULT NULL COMMENT '订单项的数量',
  PRIMARY KEY (`i_id`) USING BTREE,
  INDEX `FK_o_i_fk`(`o_id`) USING BTREE,
  INDEX `FK_p_i_fk`(`p_id`) USING BTREE,
  CONSTRAINT `FK_o_i_fk` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_p_i_fk` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单内部的具体商品展示项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, '20220518001610670', 1, 59.90, 1);
INSERT INTO `item` VALUES (2, '20220518013042567', 3, 99.80, 2);
INSERT INTO `item` VALUES (3, '20220518015122345', 3, 49.90, 1);
INSERT INTO `item` VALUES (4, '20220518020042620', 3, 49.90, 1);
INSERT INTO `item` VALUES (5, '20220518020335287', 3, 49.90, 1);
INSERT INTO `item` VALUES (6, '20220518023930551', 1, 59.90, 1);
INSERT INTO `item` VALUES (7, '20220518024204805', 1, 59.90, 1);
INSERT INTO `item` VALUES (8, '20220518030114569', 1, 59.90, 1);
INSERT INTO `item` VALUES (9, '20220518092907516', 1, 119.80, 2);
INSERT INTO `item` VALUES (10, '20220518093038755', 1, 59.90, 1);
INSERT INTO `item` VALUES (11, '20220518093057488', 2, 49.90, 1);
INSERT INTO `item` VALUES (12, '20220518093541600', 2, 49.90, 1);
INSERT INTO `item` VALUES (13, '20220518144401878', 3, 49.90, 1);
INSERT INTO `item` VALUES (14, '20220518163706583', 2, 49.90, 1);
INSERT INTO `item` VALUES (15, '20220518163706583', 7, 59.90, 1);
INSERT INTO `item` VALUES (16, '20220518165911154', 4, 59.50, 1);
INSERT INTO `item` VALUES (17, '20220519014902597', 5, 39.90, 1);
INSERT INTO `item` VALUES (18, '20220519073932368', 1, 59.90, 1);
INSERT INTO `item` VALUES (19, '20220519074935198', 5, 39.90, 1);
INSERT INTO `item` VALUES (20, '20220519075141793', 4, 59.50, 1);
INSERT INTO `item` VALUES (21, '20220519093511811', 3, 49.90, 1);
INSERT INTO `item` VALUES (22, '20220519093511811', 1, 59.90, 1);
INSERT INTO `item` VALUES (23, '20220522121251949', 1, 59.90, 1);
INSERT INTO `item` VALUES (24, '20220522121251949', 2, 49.90, 1);
INSERT INTO `item` VALUES (25, '20220522121251949', 3, 49.90, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `o_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号是字符串类型但是也是唯一标识',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户实体的主键属性',
  `a_id` int(11) NULL DEFAULT NULL COMMENT '地址实体的唯一主键列',
  `o_count` decimal(12, 2) NULL DEFAULT NULL COMMENT '订单的总金额',
  `o_time` datetime(0) NULL DEFAULT NULL COMMENT '订单的详细时间',
  `o_state` int(11) NULL DEFAULT NULL COMMENT '订单状态 0 未付款，1已经付款未发货 2发货待收货 3 收货待评价 4订单完成 5 退货状态',
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `FK_a_o_fk`(`a_id`) USING BTREE,
  INDEX `FK_u_o_fk`(`u_id`) USING BTREE,
  CONSTRAINT `FK_a_o_fk` FOREIGN KEY (`a_id`) REFERENCES `address` (`a_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_u_o_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单模块的订单实体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('20220518001610670', 1, 1, 59.90, '2022-05-17 16:16:11', 2);
INSERT INTO `orders` VALUES ('20220518013042567', 1, 1, 99.80, '2022-05-17 17:30:43', 2);
INSERT INTO `orders` VALUES ('20220518015122345', 1, 1, 49.90, '2022-05-17 17:51:22', 1);
INSERT INTO `orders` VALUES ('20220518020042620', 1, 1, 49.90, '2022-05-17 18:00:43', 2);
INSERT INTO `orders` VALUES ('20220518020335287', 1, 1, 49.90, '2022-05-17 18:03:35', 1);
INSERT INTO `orders` VALUES ('20220518023930551', 1, 1, 59.90, '2022-05-17 18:39:31', 1);
INSERT INTO `orders` VALUES ('20220518024204805', 1, 1, 59.90, '2022-05-17 18:42:05', 1);
INSERT INTO `orders` VALUES ('20220518030114569', 1, 1, 59.90, '2022-05-17 19:01:15', 1);
INSERT INTO `orders` VALUES ('20220518092907516', 3, 2, 119.80, '2022-05-18 01:29:08', 2);
INSERT INTO `orders` VALUES ('20220518093038755', 3, 2, 59.90, '2022-05-18 01:30:39', 1);
INSERT INTO `orders` VALUES ('20220518093057488', 3, 2, 49.90, '2022-05-18 01:30:57', 1);
INSERT INTO `orders` VALUES ('20220518093541600', 3, 2, 49.90, '2022-05-18 01:35:42', 2);
INSERT INTO `orders` VALUES ('20220518144401878', 3, 2, 49.90, '2022-05-18 06:44:02', 1);
INSERT INTO `orders` VALUES ('20220518163706583', 3, 2, 109.80, '2022-05-18 08:37:07', 1);
INSERT INTO `orders` VALUES ('20220518165911154', 3, 2, 59.50, '2022-05-18 08:59:11', 1);
INSERT INTO `orders` VALUES ('20220519014902597', 3, 2, 39.90, '2022-05-18 17:49:03', 1);
INSERT INTO `orders` VALUES ('20220519073932368', 3, 3, 59.90, '2022-05-18 23:39:32', 1);
INSERT INTO `orders` VALUES ('20220519074935198', 3, 3, 39.90, '2022-05-18 23:49:35', 1);
INSERT INTO `orders` VALUES ('20220519075141793', 3, 3, 59.50, '2022-05-18 23:51:42', 1);
INSERT INTO `orders` VALUES ('20220519093511811', 1, 1, 109.80, '2022-05-19 01:35:12', 1);
INSERT INTO `orders` VALUES ('20220522121251949', 1, 1, 159.70, '2022-05-22 04:12:52', 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品的唯一主键',
  `t_id` int(11) NULL DEFAULT NULL COMMENT '类别的主键id',
  `p_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的名称',
  `p_time` date NULL DEFAULT NULL COMMENT '商品的上市时间',
  `p_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片的路径',
  `p_price` decimal(12, 2) NULL DEFAULT NULL COMMENT '商品的价格',
  `p_state` int(11) NULL DEFAULT NULL COMMENT '商品的热门指数',
  `p_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的描述',
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `FK_t_p_fk`(`t_id`) USING BTREE,
  CONSTRAINT `FK_t_p_fk` FOREIGN KEY (`t_id`) REFERENCES `type` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品模块的商品实体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '洋玫瑰花', '2022-03-01', 'image/flower-4.png', 59.90, 4, '粉红色的洋玫瑰花~');
INSERT INTO `product` VALUES (2, 2, '尤加利叶', '2022-03-08', 'image/dried-1.jpg', 49.90, 5, '假尤加利叶居家装饰品');
INSERT INTO `product` VALUES (3, 3, '白犀牛', '2022-03-09', 'image/green-1.png', 49.90, 3, '绿植白犀牛美观进化空气');
INSERT INTO `product` VALUES (4, 1, '红玫瑰', '2022-04-13', 'image/flower-5.png', 59.50, 5, '经典复古红色');
INSERT INTO `product` VALUES (5, 1, '向日葵', '2022-05-11', 'image/sunflower.png', 39.90, 4, '永远向阳而生');
INSERT INTO `product` VALUES (7, 1, '牡丹', '2022-05-11', 'image/jugeng.jpg', 59.90, 5, '富贵繁荣');
INSERT INTO `product` VALUES (8, 2, '灯笼草', '2022-05-11', 'image/denglong.jpg', 49.90, 3, '豆沙色灯笼草');
INSERT INTO `product` VALUES (9, 2, '干花组合', '2022-05-10', 'image/dried-3.png', 69.90, 4, '艺术的组合');
INSERT INTO `product` VALUES (10, 3, '富贵草', '2022-05-11', 'image/green-2.png', 29.90, 3, '净化空气');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别的主键id',
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别的名称',
  `t_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别的描述',
  PRIMARY KEY (`t_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品模块的类别实体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '鲜花', '新鲜盛迷人芬芳');
INSERT INTO `type` VALUES (2, '干花', '永不凋谢的花朵');
INSERT INTO `type` VALUES (3, '绿植', '繁荣绿盛的植物');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户实体的主键属性',
  `u_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `u_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `u_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的邮箱！用于激活使用！',
  `u_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别！',
  `u_status` int(11) NULL DEFAULT NULL COMMENT '用户的激活状态 0 未激活 1 激活',
  `u_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件激活码',
  `u_role` int(11) NULL DEFAULT NULL COMMENT '用户 0 管理员 1',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户模块的用户实体' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'lihua', '123456', '1360287213@qq.com', '男', 1, 'sdvsd51464', 0);
INSERT INTO `user` VALUES (2, 'guohua', '123456', '1360287213@qq.com', '女', 1, 'dfadfasd65646', 1);
INSERT INTO `user` VALUES (3, 'zhang', '123456', '1360287213@qq.com', '男', 1, '20220518091758315326', 0);
INSERT INTO `user` VALUES (7, '范冰冰', '123456', '1360287213@qq.com', '男', 1, '2022051901505829217f', 0);
INSERT INTO `user` VALUES (8, 'kan', 'e10adc3949ba59abbe56e057f20f883e', '1360287213@qq.com', '男', 1, '202205190857133601d1', 0);
INSERT INTO `user` VALUES (9, 'quo', 'e11adc3949ba59abbe56e057f20f669b', '1360287213@qq.com', '男', 1, '202205190906392491bf', 0);

SET FOREIGN_KEY_CHECKS = 1;
