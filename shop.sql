/*
 Navicat Premium Data Transfer

 Source Server         : 测试亚马逊数据
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 112.213.116.162:3306
 Source Schema         : shop4

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 18/12/2025 23:50:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父分类ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类URL',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：0禁用，1启用',
  `created_at` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (297, 0, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?i=electronics-intl-ship', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (298, 0, 'Computers', NULL, NULL, 'https://www.amazon.com/s?i=computers-intl-ship', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (299, 0, 'Home & Kitchen', NULL, NULL, 'https://www.amazon.com/s?i=garden-intl-ship', 2, 1, 1766063972);
INSERT INTO `product_category` VALUES (300, 0, 'Clothing, Shoes & Jewelry', NULL, NULL, 'https://www.amazon.com/s?i=fashion-intl-ship', 3, 1, 1766063972);
INSERT INTO `product_category` VALUES (301, 0, 'Toys & Games', NULL, NULL, 'https://www.amazon.com/s?i=toys-and-games-intl-ship', 4, 1, 1766063972);
INSERT INTO `product_category` VALUES (302, 0, 'Sports & Outdoors', NULL, NULL, 'https://www.amazon.com/s?i=sporting-intl-ship', 5, 1, 1766063972);
INSERT INTO `product_category` VALUES (303, 0, 'Beauty & Personal Care', NULL, NULL, 'https://www.amazon.com/s?i=beauty-intl-ship', 6, 1, 1766063972);
INSERT INTO `product_category` VALUES (304, 0, 'Health & Household', NULL, NULL, 'https://www.amazon.com/s?i=hpc-intl-ship', 7, 1, 1766063972);
INSERT INTO `product_category` VALUES (305, 0, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?i=automotive-intl-ship', 8, 1, 1766063972);
INSERT INTO `product_category` VALUES (306, 0, 'Pet Supplies', NULL, NULL, 'https://www.amazon.com/s?i=pets-intl-ship', 9, 1, 1766063972);
INSERT INTO `product_category` VALUES (307, 0, 'Baby', NULL, NULL, 'https://www.amazon.com/s?i=baby-products-intl-ship', 10, 1, 1766063972);
INSERT INTO `product_category` VALUES (308, 0, 'Industrial & Scientific', NULL, NULL, 'https://www.amazon.com/s?i=industrial-intl-ship', 11, 1, 1766063972);
INSERT INTO `product_category` VALUES (309, 0, 'Office Products', NULL, NULL, 'https://www.amazon.com/s?i=office-products-intl-ship', 12, 1, 1766063972);
INSERT INTO `product_category` VALUES (310, 0, 'Tools & Home Improvement', NULL, NULL, 'https://www.amazon.com/s?i=tools-intl-ship', 13, 1, 1766063972);
INSERT INTO `product_category` VALUES (311, 0, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?i=arts-crafts-intl-ship', 14, 1, 1766063972);
INSERT INTO `product_category` VALUES (312, 0, 'Cell Phones & Accessories', NULL, NULL, 'https://www.amazon.com/s?i=mobile-intl-ship', 15, 1, 1766063972);
INSERT INTO `product_category` VALUES (313, 0, 'Grocery & Gourmet Food', NULL, NULL, 'https://www.amazon.com/s?i=grocery-intl-ship', 16, 1, 1766063972);
INSERT INTO `product_category` VALUES (314, 0, 'Patio, Lawn & Garden', NULL, NULL, 'https://www.amazon.com/s?i=lawngarden-intl-ship', 17, 1, 1766063972);
INSERT INTO `product_category` VALUES (315, 0, 'Musical Instruments', NULL, NULL, 'https://www.amazon.com/s?i=mi-intl-ship', 18, 1, 1766063972);
INSERT INTO `product_category` VALUES (316, 0, 'Appliances', NULL, NULL, 'https://www.amazon.com/s?i=appliances-intl-ship', 19, 1, 1766063972);
INSERT INTO `product_category` VALUES (317, 297, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?bbn=16225009011&rh=n%3A16225009011%2Cn%3A172282&dc&qid=1766063940&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (318, 301, 'Toys & Games', NULL, NULL, 'https://www.amazon.com/s?bbn=16225015011&rh=n%3A165793011&dc&qid=1766063944&rnid=2941120011&ref=sr_nr_n_0', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (319, 301, 'Sports & Outdoor Play', NULL, NULL, 'https://www.amazon.com/s?bbn=16225015011&rh=n%3A165793011%2Cn%3A16225015011%2Cn%3A166420011&dc&qid=1766063944&rnid=2941120011&ref=sr_nr_n_2', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (320, 304, 'Appliances', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A2619525011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (321, 304, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A2617941011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_2', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (322, 304, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A15684181&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_3', 2, 1, 1766063972);
INSERT INTO `product_category` VALUES (323, 304, 'Baby Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A165796011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_4', 3, 1, 1766063972);
INSERT INTO `product_category` VALUES (324, 304, 'Beauty & Personal Care', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A3760911&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_5', 4, 1, 1766063972);
INSERT INTO `product_category` VALUES (325, 304, 'Books', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A283155&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_6', 5, 1, 1766063972);
INSERT INTO `product_category` VALUES (326, 304, 'CDs & Vinyl', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A5174&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_7', 6, 1, 1766063972);
INSERT INTO `product_category` VALUES (327, 304, 'Cell Phones & Accessories', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A2335752011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_8', 7, 1, 1766063972);
INSERT INTO `product_category` VALUES (328, 304, 'Clothing, Shoes & Jewelry', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A7141123011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_9', 8, 1, 1766063972);
INSERT INTO `product_category` VALUES (329, 304, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A172282&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_10', 9, 1, 1766063972);
INSERT INTO `product_category` VALUES (330, 304, 'Everything Else', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A10272111&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_11', 10, 1, 1766063972);
INSERT INTO `product_category` VALUES (331, 304, 'Grocery & Gourmet Food', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A16310101&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_12', 11, 1, 1766063972);
INSERT INTO `product_category` VALUES (332, 304, 'Health & Household', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A3760901&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_13', 12, 1, 1766063972);
INSERT INTO `product_category` VALUES (333, 304, 'Home & Business Services', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A8098158011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_14', 13, 1, 1766063972);
INSERT INTO `product_category` VALUES (334, 304, 'Home & Kitchen', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A1055398&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_15', 14, 1, 1766063972);
INSERT INTO `product_category` VALUES (335, 304, 'Industrial & Scientific', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A16310091&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_16', 15, 1, 1766063972);
INSERT INTO `product_category` VALUES (336, 304, 'Movies & TV', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A2625373011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_17', 16, 1, 1766063972);
INSERT INTO `product_category` VALUES (337, 304, 'Musical Instruments', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A11091801&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_18', 17, 1, 1766063972);
INSERT INTO `product_category` VALUES (338, 304, 'Office Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A1064954&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_19', 18, 1, 1766063972);
INSERT INTO `product_category` VALUES (339, 304, 'Patio, Lawn & Garden', NULL, NULL, 'https://www.amazon.com/s?bbn=16225010011&rh=n%3A16225010011%2Cn%3A2972638011&dc&qid=1766063945&rnid=2941120011&ref=sr_nr_n_20', 19, 1, 1766063972);
INSERT INTO `product_category` VALUES (340, 307, 'Appliances', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A2619525011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (341, 307, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A2617941011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_2', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (342, 307, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A15684181&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_3', 2, 1, 1766063972);
INSERT INTO `product_category` VALUES (343, 307, 'Baby Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A165796011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_4', 3, 1, 1766063972);
INSERT INTO `product_category` VALUES (344, 307, 'Beauty & Personal Care', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A3760911&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_5', 4, 1, 1766063972);
INSERT INTO `product_category` VALUES (345, 307, 'CDs & Vinyl', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A5174&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_6', 5, 1, 1766063972);
INSERT INTO `product_category` VALUES (346, 307, 'Clothing, Shoes & Jewelry', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A7141123011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_7', 6, 1, 1766063972);
INSERT INTO `product_category` VALUES (347, 307, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A172282&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_8', 7, 1, 1766063972);
INSERT INTO `product_category` VALUES (348, 307, 'Everything Else', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A10272111&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_9', 8, 1, 1766063972);
INSERT INTO `product_category` VALUES (349, 307, 'Grocery & Gourmet Food', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A16310101&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_10', 9, 1, 1766063972);
INSERT INTO `product_category` VALUES (350, 307, 'Health & Household', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A3760901&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_11', 10, 1, 1766063972);
INSERT INTO `product_category` VALUES (351, 307, 'Home & Kitchen', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A1055398&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_12', 11, 1, 1766063972);
INSERT INTO `product_category` VALUES (352, 307, 'Industrial & Scientific', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A16310091&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_13', 12, 1, 1766063972);
INSERT INTO `product_category` VALUES (353, 307, 'Musical Instruments', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A11091801&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_14', 13, 1, 1766063972);
INSERT INTO `product_category` VALUES (354, 307, 'Office Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A1064954&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_15', 14, 1, 1766063972);
INSERT INTO `product_category` VALUES (355, 307, 'Patio, Lawn & Garden', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A2972638011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_16', 15, 1, 1766063972);
INSERT INTO `product_category` VALUES (356, 307, 'Pet Supplies', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A2619533011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_17', 16, 1, 1766063972);
INSERT INTO `product_category` VALUES (357, 307, 'Sports & Outdoors', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A3375251&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_18', 17, 1, 1766063972);
INSERT INTO `product_category` VALUES (358, 307, 'Tools & Home Improvement', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A228013&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_19', 18, 1, 1766063972);
INSERT INTO `product_category` VALUES (359, 307, 'Toys & Games', NULL, NULL, 'https://www.amazon.com/s?bbn=16225005011&rh=n%3A16225005011%2Cn%3A165793011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_20', 19, 1, 1766063972);
INSERT INTO `product_category` VALUES (360, 305, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?bbn=2562090011&rh=n%3A2562090011%2Cn%3A15684181&dc&qid=1766063946&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (361, 306, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A2617941011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (362, 306, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A15684181&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_2', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (363, 306, 'Baby Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A165796011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_3', 2, 1, 1766063972);
INSERT INTO `product_category` VALUES (364, 306, 'Beauty & Personal Care', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A3760911&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_4', 3, 1, 1766063972);
INSERT INTO `product_category` VALUES (365, 306, 'Books', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A283155&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_5', 4, 1, 1766063972);
INSERT INTO `product_category` VALUES (366, 306, 'Clothing, Shoes & Jewelry', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A7141123011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_6', 5, 1, 1766063972);
INSERT INTO `product_category` VALUES (367, 306, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A172282&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_7', 6, 1, 1766063972);
INSERT INTO `product_category` VALUES (368, 306, 'Everything Else', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A10272111&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_8', 7, 1, 1766063972);
INSERT INTO `product_category` VALUES (369, 306, 'Grocery & Gourmet Food', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A16310101&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_9', 8, 1, 1766063972);
INSERT INTO `product_category` VALUES (370, 306, 'Health & Household', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A3760901&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_10', 9, 1, 1766063972);
INSERT INTO `product_category` VALUES (371, 306, 'Home & Kitchen', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A1055398&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_11', 10, 1, 1766063972);
INSERT INTO `product_category` VALUES (372, 306, 'Industrial & Scientific', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A16310091&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_12', 11, 1, 1766063972);
INSERT INTO `product_category` VALUES (373, 306, 'Office Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A1064954&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_13', 12, 1, 1766063972);
INSERT INTO `product_category` VALUES (374, 306, 'Patio, Lawn & Garden', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A2972638011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_14', 13, 1, 1766063972);
INSERT INTO `product_category` VALUES (375, 306, 'Pet Supplies', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A2619533011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_15', 14, 1, 1766063972);
INSERT INTO `product_category` VALUES (376, 306, 'Sports & Outdoors', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A3375251&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_16', 15, 1, 1766063972);
INSERT INTO `product_category` VALUES (377, 306, 'Tools & Home Improvement', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A228013&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_17', 16, 1, 1766063972);
INSERT INTO `product_category` VALUES (378, 306, 'Toys & Games', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A165793011&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_18', 17, 1, 1766063972);
INSERT INTO `product_category` VALUES (379, 306, 'Video Games', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cn%3A468642&dc&qid=1766063947&rnid=2941120011&ref=sr_nr_n_19', 18, 1, 1766063972);
INSERT INTO `product_category` VALUES (380, 306, 'New', NULL, NULL, 'https://www.amazon.com/s?bbn=16225013011&rh=n%3A16225013011%2Cp_n_condition-type%3A6461716011&dc&qid=1766063947&rnid=6461714011&ref=sr_nr_p_n_condition-type_0', 19, 1, 1766063972);
INSERT INTO `product_category` VALUES (381, 311, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?bbn=4954955011&rh=n%3A4954955011%2Cn%3A2617941011&dc&qid=1766063949&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (382, 308, 'Appliances', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A2619525011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_1', 0, 1, 1766063972);
INSERT INTO `product_category` VALUES (383, 308, 'Arts, Crafts & Sewing', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A2617941011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_2', 1, 1, 1766063972);
INSERT INTO `product_category` VALUES (384, 308, 'Automotive', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A15684181&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_3', 2, 1, 1766063972);
INSERT INTO `product_category` VALUES (385, 308, 'Baby Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A165796011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_4', 3, 1, 1766063972);
INSERT INTO `product_category` VALUES (386, 308, 'Beauty & Personal Care', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A3760911&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_5', 4, 1, 1766063972);
INSERT INTO `product_category` VALUES (387, 308, 'Books', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A283155&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_6', 5, 1, 1766063972);
INSERT INTO `product_category` VALUES (388, 308, 'Cell Phones & Accessories', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A2335752011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_7', 6, 1, 1766063972);
INSERT INTO `product_category` VALUES (389, 308, 'Clothing, Shoes & Jewelry', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A7141123011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_8', 7, 1, 1766063972);
INSERT INTO `product_category` VALUES (390, 308, 'Electronics', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A172282&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_9', 8, 1, 1766063972);
INSERT INTO `product_category` VALUES (391, 308, 'Everything Else', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A10272111&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_10', 9, 1, 1766063972);
INSERT INTO `product_category` VALUES (392, 308, 'Grocery & Gourmet Food', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A16310101&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_11', 10, 1, 1766063972);
INSERT INTO `product_category` VALUES (393, 308, 'Health & Household', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A3760901&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_12', 11, 1, 1766063972);
INSERT INTO `product_category` VALUES (394, 308, 'Home & Kitchen', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A1055398&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_13', 12, 1, 1766063972);
INSERT INTO `product_category` VALUES (395, 308, 'Industrial & Scientific', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A16310091&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_14', 13, 1, 1766063972);
INSERT INTO `product_category` VALUES (396, 308, 'Musical Instruments', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A11091801&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_15', 14, 1, 1766063972);
INSERT INTO `product_category` VALUES (397, 308, 'Office Products', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A1064954&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_16', 15, 1, 1766063972);
INSERT INTO `product_category` VALUES (398, 308, 'Patio, Lawn & Garden', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A2972638011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_17', 16, 1, 1766063972);
INSERT INTO `product_category` VALUES (399, 308, 'Pet Supplies', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A2619533011&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_18', 17, 1, 1766063972);
INSERT INTO `product_category` VALUES (400, 308, 'Sports & Outdoors', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A3375251&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_19', 18, 1, 1766063972);
INSERT INTO `product_category` VALUES (401, 308, 'Tools & Home Improvement', NULL, NULL, 'https://www.amazon.com/s?bbn=16225012011&rh=n%3A16225012011%2Cn%3A228013&dc&qid=1766063948&rnid=2941120011&ref=sr_nr_n_20', 19, 1, 1766063972);

-- ----------------------------
-- Table structure for product_review
-- ----------------------------
DROP TABLE IF EXISTS `product_review`;
CREATE TABLE `product_review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_item_id` int(11) NOT NULL COMMENT '订单商品ID',
  `amazon_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '亚马逊商品ID',
  `wholesale_id` int(11) NOT NULL COMMENT '批发商品ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `user_id` int(11) NOT NULL COMMENT '评价用户ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户网名',
  `is_virtual` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否虚拟评价：0否，1是',
  `rating` tinyint(4) NOT NULL DEFAULT 5 COMMENT '评分(1-5)',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价图片1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价图片2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价图片3',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT 0 COMMENT '匿名：0否，1是',
  `reply_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复',
  `reply_time` int(11) NULL DEFAULT NULL COMMENT '回复时间',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：0隐藏，1显示',
  `created_at` int(11) NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_amazon_id`(`amazon_id`) USING BTREE,
  INDEX `idx_shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_review
-- ----------------------------

-- ----------------------------
-- Table structure for wholesale_product
-- ----------------------------
DROP TABLE IF EXISTS `wholesale_product`;
CREATE TABLE `wholesale_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amazon_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '亚马逊商品ID(ASIN)',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en' COMMENT '语言：en/zh_CN/zh_TW/ja/ko等',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品描述(富文本)',
  `main_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图/缩略图',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内页图1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内页图2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内页图3',
  `cost_price` decimal(20, 2) NOT NULL COMMENT '成本价',
  `sell_price` decimal(20, 2) NOT NULL COMMENT '售价',
  `stock` int(11) NOT NULL DEFAULT 999999 COMMENT '库存',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '件' COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '重量(kg)',
  `sales_count` int(11) NOT NULL DEFAULT 0 COMMENT '销量',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_hot` tinyint(4) NOT NULL DEFAULT 0 COMMENT '热门：0否，1是',
  `is_new` tinyint(4) NOT NULL DEFAULT 0 COMMENT '新品：0否，1是',
  `is_recommend` tinyint(4) NOT NULL DEFAULT 0 COMMENT '推荐：0否，1是',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：0下架，1上架',
  `created_at` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_amazon_id`(`amazon_id`) USING BTREE,
  INDEX `idx_lang`(`lang`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '批发中心商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wholesale_product
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
