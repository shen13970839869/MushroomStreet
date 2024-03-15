/*
Navicat MySQL Data Transfer

Source Server         : MyDatabase
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : mogujie

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2022-02-17 20:30:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uname` varchar(100) NOT NULL,
  `upassword` varchar(32) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `alreadybuy`
-- ----------------------------
DROP TABLE IF EXISTS `alreadybuy`;
CREATE TABLE `alreadybuy` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alreadybuy
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '上衣');
INSERT INTO `category` VALUES ('2', '裙子');
INSERT INTO `category` VALUES ('3', '裤子');
INSERT INTO `category` VALUES ('4', '女鞋');
INSERT INTO `category` VALUES ('5', '包包');
INSERT INTO `category` VALUES ('6', '男友');
INSERT INTO `category` VALUES ('7', '家居');
INSERT INTO `category` VALUES ('8', '内衣');
INSERT INTO `category` VALUES ('9', '母婴');

-- ----------------------------
-- Table structure for `favorite`
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('32', '8', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('33', '15', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('34', '2', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('35', '1', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('37', '4', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('40', '3', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('41', '9', 'shenzhiyong');
INSERT INTO `favorite` VALUES ('69', '2', '陌上花开');

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `gphoto` varchar(255) NOT NULL,
  `price` double(10,0) NOT NULL,
  `cid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `favorite` int(11) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `GoodCid` (`cid`),
  KEY `GoodTid` (`tid`),
  CONSTRAINT `GoodCid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`),
  CONSTRAINT `GoodTid` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '新款加绒加厚卫衣女休闲百搭秋冬潮韩版学生宽松长袖上衣帽衫外套', '15', 'img/goods/1_1/1_1_1.jpg&img/goods/1_1/1_1_2.jpg&img/goods/1_1/1_1_3.jpg&img/goods/1_1/1_1_4.jpg', '54', '1', '3', '1');
INSERT INTO `good` VALUES ('2', '60两件春秋圆环拉链上衣高领显瘦修身长袖打底衫T恤女针织毛衣', '29', 'img/goods/1_2/1_2_1.jpg&img/goods/1_2/1_2_2.jpg&img/goods/1_2/1_2_3.jpg&img/goods/1_2/1_2_4.jpg', '45', '1', '1', '21');
INSERT INTO `good` VALUES ('3', '加厚加绒卫衣女春秋新款韩版宽松中长款上衣连帽超火外套ins潮', '-3', 'img/goods/1_3/1_3_1.jpg&img/goods/1_3/1_3_2.jpg&img/goods/1_3/1_3_3.jpg&img/goods/1_3/1_3_4.jpg', '42', '1', '3', '20');
INSERT INTO `good` VALUES ('4', '2020秋冬新款韩版连帽针织衫开衫女中长款可爱宽松毛衣外套厚', '81', 'img/goods/1_4/1_4_1.jpg&img/goods/1_4/1_4_2.jpg&img/goods/1_4/1_4_3.jpg&img/goods/1_4/1_4_4.jpg', '42', '1', '2', '30');
INSERT INTO `good` VALUES ('5', '蜜妃儿中长款半身裙女a字百褶裙高腰针织毛线裙子秋冬学生一步裙', '85', 'img/goods/2_1/2_1_1.jpg&img/goods/2_1/2_1_2.jpg&img/goods/2_1/2_1_3.jpg&img/goods/2_1/2_1_4.jpg', '42', '2', '5', '30');
INSERT INTO `good` VALUES ('6', '2020春季新款高冷御姐风连衣裙女气质收腰显瘦赫本风小黑裙子', '87', 'img/goods/2_2/2_2_1.jpg&img/goods/2_2/2_2_2.jpg&img/goods/2_2/2_2_3.jpg&img/goods/2_2/2_2_4.jpg', '76', '2', '4', '20');
INSERT INTO `good` VALUES ('7', '蜜妃儿裙子春秋2020新款复古气质高腰百褶一步裙A字半身裙女', '95', 'img/goods/2_3/2_3_1.jpg&img/goods/2_3/2_3_2.jpg&\r\nimg/goods/2_3/2_3_3.jpg&img/goods/2_3/2_3_4.jpg', '78', '2', '5', '40');
INSERT INTO `good` VALUES ('8', '法式复古秋冬娃娃领针织连衣裙女气质名媛修身收腰A字长袖打底裙\r\n', '96', 'img/goods/2_4/2_4_1.jpg&img/goods/2_4/2_4_2.jpg&\r\nimg/goods/2_4/2_4_3.jpg&img/goods/2_4/2_4_4.jpg', '89', '2', '4', '2');
INSERT INTO `good` VALUES ('9', '小众设计感泫雅风拖地长裤女春秋新款韩版宽松显瘦高腰牛仔裤直筒', '96', 'img/goods/3_1/3_1_1.jpg&img/goods/3_1/3_1_2.jpg&\r\nimg/goods/3_1/3_1_3.jpg&img/goods/3_1/3_1_4.jpg', '49', '3', '7', '20');
INSERT INTO `good` VALUES ('10', '港风哈伦裤女宽松高腰牛仔裤女新款显瘦学生bf百搭女老爹裤女', '100', 'img/goods/3_2/3_2_1.jpg&img/goods/3_2/3_2_2.jpg&img/goods/3_2/3_2_3.jpg&img/goods/3_2/3_2_4.jpg', '49', '3', '7', '20');
INSERT INTO `good` VALUES ('11', '2020新款牛仔裤女直筒裤萝卜裤宽松阔腿裤老爹秋冬九分小个子', '91', 'img/goods/3_3/3_3_1.jpg&img/goods/3_3/3_3_2.jpg&img/goods/3_3/3_3_3.jpg&img/goods/3_3/3_3_4.jpg', '45', '3', '7', '20');
INSERT INTO `good` VALUES ('12', '黑白格子裤子女宽松显瘦直筒休闲拖地春秋季高腰垂感阔腿长裤', '96', 'img/goods/3_4/3_4_1.jpg&img/goods/3_4/3_4_2.jpg&\r\nimg/goods/3_4/3_4_3.jpg&img/goods/3_4/3_4_4.jpg', '41', '3', '8', '20');
INSERT INTO `good` VALUES ('13', '秋冬超火老爹鞋加绒休闲鞋百搭小白鞋女鞋厚底运动鞋学生二棉鞋', '100', 'img/goods/4_1/4_1_1.jpg&img/goods/4_1/4_1_2.jpg&\r\nimg/goods/4_1/4_1_3.jpg&img/goods/4_1/4_1_4.jpg', '41', '4', '12', '20');
INSERT INTO `good` VALUES ('14', '英伦风小个子厚底马丁女靴冬季2020新款靴子女短筒切尔西短靴', '92', 'img/goods/4_2/4_2_1.jpg&img/goods/4_2/4_2_2.jpg&\r\nimg/goods/4_2/4_2_3.jpg&img/goods/4_2/4_2_4.jpg', '61', '4', '10', '20');
INSERT INTO `good` VALUES ('15', '2020春季原宿ulzzang开口笑帆布鞋女百搭板鞋小白鞋潮', '93', 'img/goods/4_3/4_3_1.jpg&img/goods/4_3/4_3_2.jpg&\r\nimg/goods/4_3/4_3_3.jpg&img/goods/4_3/4_3_4.jpg', '61', '4', '11', '20');
INSERT INTO `good` VALUES ('16', '2020秋冬季新款百搭韩版透气网红运动白鞋高帮鞋女小白女鞋秋', '100', 'img/goods/4_4/4_4_1.jpg&img/goods/4_4/4_4_2.jpg&\r\nimg/goods/4_4/4_4_3.jpg&img/goods/4_4/4_4_4.jpg', '71', '4', '12', '20');
INSERT INTO `good` VALUES ('17', '包包女包韩版百搭宽带斜挎包2020新款小香风菱格大容量小方包', '100', 'img/goods/5_1/5_1_1.jpg&img/goods/5_1/5_1_2.jpg&\r\nimg/goods/5_1/5_1_3.jpg&img/goods/5_1/5_1_4.jpg', '171', '5', '15', '20');
INSERT INTO `good` VALUES ('18', '包包百搭斜挎包大容量手提包2020新款子母包托特包学生单肩包', '69', 'img/goods/5_2/5_2_1.jpg&img/goods/5_2/5_2_2.jpg&\r\nimg/goods/5_2/5_2_3.jpg&img/goods/5_2/5_2_4.jpg', '171', '5', '15', '20');
INSERT INTO `good` VALUES ('19', '复古圆桶包包2020新款潮韩版时尚女包百搭圆筒包女单肩斜挎包', '86', 'img/goods/5_3/5_3_1.jpg&img/goods/5_3/5_3_2.jpg&\r\nimg/goods/5_3/5_3_3.jpg&img/goods/5_3/5_3_4.jpg', '179', '5', '15', '10');
INSERT INTO `good` VALUES ('20', '包包女2020秋冬新款mini剑桥包撞色小方包百搭单肩斜挎包', '100', 'img/goods/5_4/5_4_1.jpg&img/goods/5_4/5_4_2.jpg&\r\nimg/goods/5_4/5_4_3.jpg&img/goods/5_4/5_4_4.jpg', '179', '5', '15', '10');
INSERT INTO `good` VALUES ('21', '男裤子宽松九分运动休闲裤韩版潮流9分裤秋冬工装潮牌长裤束脚裤', '100', 'img/goods/6_1/6_1_1.jpg&img/goods/6_1/6_1_2.jpg&\r\nimg/goods/6_1/6_1_3.jpg&img/goods/6_1/6_1_4.jpg', '179', '6', '17', '10');
INSERT INTO `good` VALUES ('22', '情侣装小众设计感秋装潮流羊羔毛棉衣冬季男士羊羔绒加厚棉服外套', '88', 'img/goods/6_2/6_2_1.jpg&img/goods/6_2/6_2_2.jpg&\r\nimg/goods/6_2/6_2_3.jpg&img/goods/6_2/6_2_4.jpg', '279', '6', '16', '10');
INSERT INTO `good` VALUES ('23', '港风情侣毛呢外套冬季新款宽松中长款加厚呢大衣男士潮流呢子风衣', '95', 'img/goods/6_3/6_3_1.jpg&img/goods/6_3/6_3_2.jpg&\r\nimg/goods/6_3/6_3_3.jpg&img/goods/6_3/6_3_4.jpg', '279', '6', '16', '10');
INSERT INTO `good` VALUES ('24', '男士棉衣冬季新款韩版羽绒棉服男加厚百搭情侣棉袄宽松连帽外套男', '100', 'img/goods/6_4/6_4_1.jpg&img/goods/6_4/6_4_2.jpg&\r\nimg/goods/6_4/6_4_3.jpg&img/goods/6_4/6_4_4.jpg', '279', '6', '16', '10');
INSERT INTO `good` VALUES ('25', '袋鼠妈妈 孕妇护肤品茶树净颜调理4件套 补水修护清爽化妆品发送到反倒是第三方的说法都是范德萨范德萨第三方第三方士大夫士大夫胜多负少', '91', 'img/goods/7_1/7_1_1.jpg&img/goods/7_1/7_1_2.jpg&\r\nimg/goods/7_1/7_1_3.jpg&img/goods/7_1/7_1_4.jpg', '279', '7', '21', '10');
INSERT INTO `good` VALUES ('26', '新生儿夏春纯棉哈衣宝宝夹棉保暖爬服婴儿冬装加厚连体衣服N78', '100', 'img/goods/7_2/7_2_1.jpg&img/goods/7_2/7_2_2.jpg&\r\nimg/goods/7_2/7_2_3.jpg&img/goods/7_2/7_2_4.jpg', '179', '9', '24', '109');
INSERT INTO `good` VALUES ('27', '网红婴儿服冬宝宝包脚连体衣秋冬外穿可爱新生儿衣服卡通冬季加厚', '100', 'img/goods/7_3/7_3_1.jpg&img/goods/7_3/7_3_2.jpg&\r\nimg/goods/7_3/7_3_3.jpg&img/goods/7_3/7_3_4.jpg', '379', '9', '24', '10');
INSERT INTO `good` VALUES ('28', '婴幼儿2020冬款加厚年服满月披肩中国风爬服棉服宝宝连体衣潮', '91', 'img/goods/7_4/7_4_1.jpg&img/goods/7_4/7_4_2.jpg&\r\nimg/goods/7_4/7_4_3.jpg&img/goods/7_4/7_4_4.jpg', '138', '9', '24', '10');
INSERT INTO `good` VALUES ('29', '亲肤宜家四件套床上用品网红公主风学生宿舍被套床单三校园家纺', '93', 'img/goods/8_1/8_1_1.jpg&img/goods/8_1/8_1_2.jpg&\r\nimg/goods/8_1/8_1_3.jpg&img/goods/8_1/8_1_4.jpg', '118', '7', '19', '10');
INSERT INTO `good` VALUES ('30', '窗帘网红款免打孔安装魔术贴粘贴式遮阳卧室飘窗出租屋简易遮光布', '97', 'img/goods/8_2/8_2_1.jpg&img/goods/8_2/8_2_2.jpg&\r\nimg/goods/8_2/8_2_3.jpg&img/goods/8_2/8_2_4.jpg', '58', '7', '19', '19');
INSERT INTO `good` VALUES ('31', '泡沫地垫拼图拼接榻榻米儿童爬爬垫海绵地板家用卧室加厚', '100', 'img/goods/8_3/8_3_1.jpg&img/goods/8_3/8_3_2.jpg&\r\nimg/goods/8_3/8_3_3.jpg&img/goods/8_3/8_3_4.jpg', '68', '7', '19', '10');
INSERT INTO `good` VALUES ('32', '送枕套决明子枕头枕芯一对成人颈椎枕头芯彩色单人学生护颈枕磁石', '99', 'img/goods/8_4/8_4_1.jpg&img/goods/8_4/8_4_2.jpg&\r\nimg/goods/8_4/8_4_3.jpg&img/goods/8_4/8_4_4.jpg', '268', '7', '19', '19');
INSERT INTO `good` VALUES ('43', '法式小晚礼服裙平时可穿宴会黑色赫本风高贵气质收腰名媛a字裙女', '999', 'img/goods/2_5_1.jpg&img/goods/2_5_2.jpg&img/goods/2_5_3.jpg&img/goods/2_5_4.jpg', '67', '2', '4', '0');
INSERT INTO `good` VALUES ('44', '锁骨心机显瘦上衣衬衣超仙女小众泡泡袖设计感短袖V领白衬衫', '999', 'img/goods/1_5_1.jpg&img/goods/1_5_2.jpg&img/goods/1_5_3.jpg&img/goods/1_5_4.jpg', '100', '1', '2', '0');
INSERT INTO `good` VALUES ('45', '锁骨心机显瘦上衣衬衣超仙女小众泡泡袖设计感短袖V领白衬衫', '999', 'img/goods/1_6_1.jpg&img/goods/1_6_2.jpg&img/goods/1_6_3.jpg&img/goods/1_6_4.jpg', '100', '1', '2', '0');
INSERT INTO `good` VALUES ('46', '锁骨心机显瘦上衣衬衣超仙女小众泡泡袖设计感短袖V领白衬衫', '999', 'img/goods/1_7_1.jpg&img/goods/1_7_2.jpg&img/goods/1_7_3.jpg&img/goods/1_7_4.jpg', '100', '1', '2', '0');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `gid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `gid` (`gid`),
  CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `good` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('51', 'shenzhiyong', '15', '1', '2020-12-19 11:10:34', '申志勇', 'xxxxxx', '13970839869', '0');
INSERT INTO `order` VALUES ('68', 'shenzhiyong', '25', '9', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('69', 'shenzhiyong', '32', '1', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('70', 'shenzhiyong', '22', '11', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('71', 'shenzhiyong', '2', '11', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('72', 'shenzhiyong', '3', '21', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('73', 'shenzhiyong', '19', '10', '2020-12-19 11:10:35', '申志勇', 'xxxxxx', '13970839869', '1');
INSERT INTO `order` VALUES ('75', 'shenzhiyong', '3', '40', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('76', 'shenzhiyong', '15', '2', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('77', 'shenzhiyong', '8', '2', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('78', 'shenzhiyong', '2', '9', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('79', 'shenzhiyong', '18', '5', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('80', 'shenzhiyong', '22', '1', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('81', 'shenzhiyong', '1', '18', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('82', 'shenzhiyong', '4', '4', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('83', 'shenzhiyong', '11', '1', '2020-12-23 20:49:13', '申志勇', '九江市濂溪区九江学院', '13970839869', '1');
INSERT INTO `order` VALUES ('84', 'shenzhiyong', '3', '1', '2020-12-23 20:50:17', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('85', 'shenzhiyong', '3', '4', '2020-12-23 20:53:52', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('86', 'shenzhiyong', '15', '1', '2020-12-23 21:04:22', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('87', 'shenzhiyong', '1', '8', '2020-12-23 21:10:21', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('88', 'shenzhiyong', '3', '6', '2020-12-23 21:14:33', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('89', 'shenzhiyong', '15', '2', '2020-12-23 21:15:38', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('90', 'shenzhiyong', '1', '2', '2021-05-31 14:22:46', '志勇 shen', '误', '13970839869', '1');
INSERT INTO `order` VALUES ('91', 'shenzhiyong', '2', '1', '2021-05-31 14:22:46', '志勇 shen', '误', '13970839869', '1');

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `gid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `selected` varchar(255) CHARACTER SET cp1250 NOT NULL DEFAULT '0',
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('150', 'shenzhiyong', '15', '3', '1', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('151', 'shenzhiyong', '19', '2', '0', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('152', 'shenzhiyong', '13', '4', '1', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('153', 'shenzhiyong', '16', '1', '0', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('154', '陌上花开', '11', '1', '0', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('156', '陌上花开', '2', '2', '0', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('157', '追风车的人', '3', '1', '1', '白色', 'S');
INSERT INTO `shoppingcart` VALUES ('158', '追风车的人', '4', '1', '1', '白色', '黑色');
INSERT INTO `shoppingcart` VALUES ('159', '追风车的人', '1', '1', '1', '黑色', '黑色');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'T恤', '1');
INSERT INTO `type` VALUES ('2', '时尚套装', '1');
INSERT INTO `type` VALUES ('3', '卫衣', '1');
INSERT INTO `type` VALUES ('4', '连衣裙', '2');
INSERT INTO `type` VALUES ('5', '半身裙', '2');
INSERT INTO `type` VALUES ('6', '美裙套装', '2');
INSERT INTO `type` VALUES ('7', '牛仔裤', '3');
INSERT INTO `type` VALUES ('8', '休闲裤', '3');
INSERT INTO `type` VALUES ('9', '运动裤', '3');
INSERT INTO `type` VALUES ('10', '靴子', '4');
INSERT INTO `type` VALUES ('11', '单鞋', '4');
INSERT INTO `type` VALUES ('12', '休闲运动', '4');
INSERT INTO `type` VALUES ('13', '双肩包', '5');
INSERT INTO `type` VALUES ('14', '拉杆箱', '5');
INSERT INTO `type` VALUES ('15', '斜挎包', '5');
INSERT INTO `type` VALUES ('16', 'T恤', '6');
INSERT INTO `type` VALUES ('17', '休闲裤', '6');
INSERT INTO `type` VALUES ('18', '休闲鞋', '6');
INSERT INTO `type` VALUES ('19', '床上用品', '7');
INSERT INTO `type` VALUES ('20', '收纳整理', '7');
INSERT INTO `type` VALUES ('21', '纸品清洁', '7');
INSERT INTO `type` VALUES ('22', '睡衣', '8');
INSERT INTO `type` VALUES ('23', '内裤', '8');
INSERT INTO `type` VALUES ('24', '萌宝套装', '9');
INSERT INTO `type` VALUES ('25', '孕妇装', '9');
INSERT INTO `type` VALUES ('26', '萌宝童鞋', '9');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `upassword` varchar(32) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', 'shenzhiyong', '1234567', '1125345188@qq.com');

-- ----------------------------
-- View structure for `a`
-- ----------------------------
DROP VIEW IF EXISTS `a`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `a` AS select `good`.`gid` AS `gid`,`good`.`gname` AS `gname`,`good`.`number` AS `number`,`good`.`gphoto` AS `gphoto`,`good`.`price` AS `price`,`good`.`cid` AS `cid`,`good`.`tid` AS `tid`,`good`.`favorite` AS `favorite` from `good` where (`good`.`gid` < 21) ;

-- ----------------------------
-- View structure for `b`
-- ----------------------------
DROP VIEW IF EXISTS `b`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b` AS select `order`.`oid` AS `oid`,`good`.`gname` AS `gname`,`order`.`uname` AS `uname`,((`order`.`number` * `good`.`price`) + 8) AS `price`,`order`.`date` AS `date`,`order`.`status` AS `status`,`order`.`address` AS `address` from (`order` join `good`) where (`order`.`gid` = `good`.`gid`) ;

-- ----------------------------
-- View structure for `goodview`
-- ----------------------------
DROP VIEW IF EXISTS `goodview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goodview` AS select `good`.`gid` AS `gid`,`good`.`gname` AS `gname`,`good`.`number` AS `number`,`good`.`gphoto` AS `gphoto`,`good`.`price` AS `price`,`category`.`cname` AS `cname`,`type`.`tname` AS `tname` from ((`good` join `category`) join `type`) where ((`good`.`cid` = `category`.`cid`) and (`good`.`tid` = `type`.`tid`)) ;
DROP TRIGGER IF EXISTS `update`;
DELIMITER ;;
CREATE TRIGGER `update` AFTER UPDATE ON `order` FOR EACH ROW begin
   update good set number = number+new.number where new.gid = gid;
end
;;
DELIMITER ;
