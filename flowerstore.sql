/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : flowerstore

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2017-09-22 20:16:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` varchar(32) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2899555D2D8E4C3D9EFC8FF2FE207113', '中国', '陕西省', '兰州市', '6799418', '15102963428', '南窑头村', '3FEB6194586B457A9C442A3FB3E48E6D');
INSERT INTO `address` VALUES ('405B71280A414165B0EB1C53D34F9F07', '中国', '山西省', '吕梁市', '', '13679635964', '柳林', 'A5F5B69CE9BA4C8284076EC84B552B62');

-- ----------------------------
-- Table structure for flower
-- ----------------------------
DROP TABLE IF EXISTS `flower`;
CREATE TABLE `flower` (
  `flowerid` varchar(35) NOT NULL,
  `flowertype` varchar(20) DEFAULT NULL,
  `flowername` varchar(35) DEFAULT NULL,
  `sellpoint` varchar(250) DEFAULT NULL,
  `market_price` double(15,2) DEFAULT NULL,
  `shop_price` double(15,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `flowerMaterial` varchar(250) DEFAULT NULL,
  `flowerimage` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`flowerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flower
-- ----------------------------
INSERT INTO `flower` VALUES ('1', '爱情鲜花', '玫瑰', '\r\n无论天涯何处都要记住我在想你深深的祝福你', '499.00', '460.00', '15', '33只精品粉玫瑰，绿叶围绕 满天星点缀', 'img/TB2kQycoMJkpuFjSszcXXXfsFXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('10', '爱情鲜花', '月光童话', '风铃花，多头玫，郁金香，尤加利叶，排草混搭类韩式花束初夏清新风特别推荐', '300.00', '230.00', '10', '19枝红玫瑰，桔梗、黄莺穿插点缀', 'img/TB2CPdCnFXXXXXAXXXXXXXXXXXX_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('2', '生日鲜花', '你的笑容', '天长地久不足以衡量我对你的爱', '247.00', '165.00', '18', '11朵红玫瑰，搭配桔梗，相思梅', 'img/TB2299xbyERMeJjSspiXXbZLFXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('3', '生日鲜花', '永葆青春', '将快乐的音符，作为礼物送给你，愿你拥有365个美丽的日子，衷心地祝福你', '189.00', '99.00', '8', '11朵戴安娜玫瑰，搭配洋桔梗点缀', 'img/TB240VuXd9HJuJjSZFzXXaH6pXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('4', '生日鲜花', '永葆青春', '爱情是一种奥妙，能从两颗心里穿过', '189.00', '99.00', '8', '18朵蓝色妖姬，15朵白玫瑰，搭配相思梅、叶上花点缀 ', 'img/TB24rO1dvkmyKJjSZFmXXX1EFXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('5', '生日鲜花', '最美的时光', '有你在身边，是我此生经历的最美时光！你就是无可取代 ', '168.00', '145.00', '10', '11朵顶级白玫瑰，搭配勿忘我外围点缀', 'img/TB28cv6dHlmpuFjSZFlXXbdQXXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('6', '生日鲜花', '最美的时光', '有你在身边，是我此生经历的最美时光！你就是无可取代 ', '168.00', '145.00', '10', '11朵顶级白玫瑰，搭配勿忘我外围点缀', 'img/TB2a47xna8lpuFjy0FpXXaGrpXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('7', '生日鲜花', '温馨邂逅', '有你在身边，是我此生经历的最美时光！你就是无可取代 ', '168.00', '145.00', '10', '11朵玛利亚粉玫瑰，1枝白色绣球，搭配白色桔梗、尤加利叶 ', 'img/TB2ArGZX4WGJuJjSZFMXXauRFXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('8', '生日鲜花', '给你幸福', '给你所有的幸福，我会好好呵护', '168.00', '145.00', '10', '19枝红玫瑰，桔梗、黄莺穿插点缀', 'img/TB2bcaDcblmpuFjSZFlXXbdQXXa_!!0-saturn_solar.jpg_220x220.jpg');
INSERT INTO `flower` VALUES ('9', '生日鲜花', '给你幸福', '给你所有的幸福，我会好好呵护', '168.00', '145.00', '10', '19枝红玫瑰，桔梗、黄莺穿插点缀', 'img/TB2BvHWd4sIL1JjSZFqXXceCpXa_!!0-saturn_solar.jpg_220x220.jpg');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `flowerid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('37399CFD6E5E417DB00B0151AEFF355E', '1', '165', '2', 'E000400F2BEB49F887B003BFEB5EBCC3');
INSERT INTO `orderitem` VALUES ('AC9F087A71FE417AB4A57D2109945D1A', '2', '330', '2', 'E7EA75A6B21C4D0184BB2F3423B2E4B6');
INSERT INTO `orderitem` VALUES ('19E04AD6024C4132B8A5596057D86251', '3', '495', '2', '2ECFABBB50BC46DFAD5F8A24A0BED00A');
INSERT INTO `orderitem` VALUES ('231E0F148B07455391EA49220AA2CA1A', '1', '165', '2', 'CD17E3D177684258AFE52FE22930450D');
INSERT INTO `orderitem` VALUES ('B6EF4D0918A443BBA0D257985DEC9C4D', '1', '145', '7', 'CD17E3D177684258AFE52FE22930450D');
INSERT INTO `orderitem` VALUES ('80DF6BCBB8CF41268ECD7FCDE90F53D4', '1', '165', '2', 'EDF6AAE5409645108049715C85E11DDD');
INSERT INTO `orderitem` VALUES ('9C65900F594E44DE8E464F63133DBEF1', '1', '99', '3', '3F1702EF24F04747A93360243D185828');
INSERT INTO `orderitem` VALUES ('0E0996E965894B8CA8EFA005A8269C81', '1', '165', '2', 'A8714D0A06A147C9A9A856919C4FED9E');
INSERT INTO `orderitem` VALUES ('C3724B152E70405BB39EF1E8E769B971', '1', '99', '3', 'A8714D0A06A147C9A9A856919C4FED9E');
INSERT INTO `orderitem` VALUES ('8E897302FB864FA0B1710B9B323E8B2D', '1', '165', '2', '146CD26403E043CFAC25B4F44F3791E8');
INSERT INTO `orderitem` VALUES ('FE97DF03EEB4483AA57CA4C3835F867F', '1', '99', '3', '146CD26403E043CFAC25B4F44F3791E8');
INSERT INTO `orderitem` VALUES ('B164250A06B34949A3A6AFB4B99A09C5', '1', '99', '3', '9D16A455486D4197BE38DC38D65C3F21');
INSERT INTO `orderitem` VALUES ('09E606E2BCEB4BDF9396D2A285A8D857', '1', '145', '9', 'A9C747E9979C424BAC89DEB65C4F694F');
INSERT INTO `orderitem` VALUES ('4E3A6AFF6F48483C96D9E7C1213FEC3C', '1', '165', '2', '28E47E29C5134E30BCF5F4EF89514465');
INSERT INTO `orderitem` VALUES ('56C7625639A24C34B41AACA12637B33A', '1', '145', '8', '60F635881AB84710805E10DAEB96ED0C');
INSERT INTO `orderitem` VALUES ('435CBB5FBE1E48268F7FA1CA6E63D6B3', '3', '495', '2', '454AE74DFCC64A269A8E9522D0D5FA27');
INSERT INTO `orderitem` VALUES ('C750385929AA4FD89F82E6EB5CD05021', '1', '165', '2', '0C0B6E04974343CB8EDD46A75E0AEEC9');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('E7EA75A6B21C4D0184BB2F3423B2E4B6', '2017-09-20 00:00:00', '330', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('2ECFABBB50BC46DFAD5F8A24A0BED00A', '2017-09-20 00:00:00', '495', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('CD17E3D177684258AFE52FE22930450D', '2017-09-20 00:00:00', '310', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('EDF6AAE5409645108049715C85E11DDD', '2017-09-20 00:00:00', '165', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('3F1702EF24F04747A93360243D185828', '2017-09-20 00:00:00', '99', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('A8714D0A06A147C9A9A856919C4FED9E', '2017-09-20 00:00:00', '264', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('146CD26403E043CFAC25B4F44F3791E8', '2017-09-21 00:00:00', '264', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('9D16A455486D4197BE38DC38D65C3F21', '2017-09-22 00:00:00', '99', '0', null, '付建国', null, '3FEB6194586B457A9C442A3FB3E48E6D');
INSERT INTO `orders` VALUES ('A9C747E9979C424BAC89DEB65C4F694F', '2017-09-22 00:00:00', '145', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('28E47E29C5134E30BCF5F4EF89514465', '2017-09-22 00:00:00', '165', '0', null, '邸斌斌', null, 'E65F5FDA56C847D09C23B61BB4B14FD8');
INSERT INTO `orders` VALUES ('60F635881AB84710805E10DAEB96ED0C', '2017-09-22 00:00:00', '145', '0', null, '付建国', null, '3FEB6194586B457A9C442A3FB3E48E6D');
INSERT INTO `orders` VALUES ('454AE74DFCC64A269A8E9522D0D5FA27', '2017-09-22 00:00:00', '495', '0', null, '付建国', null, '3FEB6194586B457A9C442A3FB3E48E6D');
INSERT INTO `orders` VALUES ('0C0B6E04974343CB8EDD46A75E0AEEC9', '2017-09-22 00:00:00', '165', '0', null, '一页书', null, 'A5F5B69CE9BA4C8284076EC84B552B62');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` varchar(32) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `email` varchar(35) NOT NULL,
  `code` varchar(35) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('045C6388D16D4E988B141400CC5F67E2', 'ghghgh', 'HAHAHA', '123456', '2017-09-22 00:00:00', '1269975091@qq.com', '2D9838984C5247A7A98303FC7D9115E6', '0');
INSERT INTO `userinfo` VALUES ('3437A37621254D30AA685236925A99A5', 'ghghgh', 'kkkll', '123456', '2017-09-22 00:00:00', 'adam_paul@163.com', '04EC389CA7D1447BAC11EA9DBDB6C1A2', '0');
INSERT INTO `userinfo` VALUES ('3FEB6194586B457A9C442A3FB3E48E6D', '付建国', '素还真', '123', '1970-01-01 00:00:00', 'adam123@sohu.com', null, '1');
INSERT INTO `userinfo` VALUES ('657AA425FEAF4785B21211D00C042EBE', 'huiiinn', 'yigjdaja', '123456', '2017-09-22 00:00:00', 'adam_paul@163.com', 'F13641C53B82404CA16FC3E5E3CD537D', '1');
INSERT INTO `userinfo` VALUES ('6E8051D26A13453F9F700AEDB2313731', '赵薇', '我最萌', '123456', '2017-09-22 00:00:00', '123@sina.cn', null, '1');
INSERT INTO `userinfo` VALUES ('7112EDFA2E3C4F05B51762E30DC613A1', 'hhuuhu', 'tom', '123', '2017-09-22 00:00:00', '1269975091@qq.com', 'E54AC5332FF04DAC934C8C73F335B927', '0');
INSERT INTO `userinfo` VALUES ('96751BBBBB5344608C27DFB5A96A3AF7', '底板', '谭武宇', '123', '2017-09-22 00:00:00', 'adam_paul@163.com', 'DC0C9B87A4814E669197C78719CBC7DA', '1');
INSERT INTO `userinfo` VALUES ('A5F5B69CE9BA4C8284076EC84B552B62', '一页书', 'paul', '123456', '1970-01-01 00:00:00', 'paul@126.com', null, '1');
INSERT INTO `userinfo` VALUES ('A6F8E9941B144456A42BDA0CD1AA5250', '邸斌斌', '生命练习生', '1269975091', '1970-01-01 00:00:00', '1269975091@qq.com', null, '1');
INSERT INTO `userinfo` VALUES ('C8BE7A29D5AA4CFDB8F0990A4BFB6A0F', '阿甘', '无名者', '123456789', '2017-09-22 00:00:00', 'adam_paul@163.com', '14EE568692414D27AD9D2D20AD62F9C9', '0');
INSERT INTO `userinfo` VALUES ('E65F5FDA56C847D09C23B61BB4B14FD8', '邸斌斌', 'adam', '1269975091', '1970-01-01 00:00:00', '1269975091@qq.com', null, '1');
INSERT INTO `userinfo` VALUES ('ED179F1C69A74CEA8D0DB03C289921EC', '斌仔', '阿甘', '123', '2017-09-22 00:00:00', '1269975091@qq.com', '1918E454D0C245229B8838782B0FF421', '0');
