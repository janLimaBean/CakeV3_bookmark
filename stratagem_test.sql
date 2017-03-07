/*
Navicat MySQL Data Transfer

Source Server         : Athena
Source Server Version : 100114
Source Host           : 192.168.1.2:3306
Source Database       : stratagem_test

Target Server Type    : MYSQL
Target Server Version : 100114
File Encoding         : 65001

Date: 2017-03-07 08:26:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookmarks
-- ----------------------------
DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `url` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_key` (`user_id`),
  CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bookmarks
-- ----------------------------
INSERT INTO `bookmarks` VALUES ('1', '1', 'Facebook', 'social media', 'https://www.facebook.com', '2017-03-06 05:54:48', '2017-03-06 05:54:48');
INSERT INTO `bookmarks` VALUES ('2', '1', 'MyPage', 'Social Media', 'www.myface.co.za', '2017-03-06 05:55:34', '2017-03-06 05:55:34');
INSERT INTO `bookmarks` VALUES ('3', '1', 'Google', 'Search Engine 1', 'https://www.google.co.za', '2017-03-06 05:55:58', '2017-03-06 05:55:58');
INSERT INTO `bookmarks` VALUES ('4', '1', 'yahoo', 'Search Engine 2', 'https://yahoo.com', '2017-03-06 05:56:20', '2017-03-06 05:56:20');

-- ----------------------------
-- Table structure for bookmarks_tags
-- ----------------------------
DROP TABLE IF EXISTS `bookmarks_tags`;
CREATE TABLE `bookmarks_tags` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`bookmark_id`,`tag_id`),
  KEY `tag_key` (`tag_id`),
  CONSTRAINT `bookmarks_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `bookmarks_tags_ibfk_2` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bookmarks_tags
-- ----------------------------
INSERT INTO `bookmarks_tags` VALUES ('1', '1');
INSERT INTO `bookmarks_tags` VALUES ('2', '1');
INSERT INTO `bookmarks_tags` VALUES ('3', '2');
INSERT INTO `bookmarks_tags` VALUES ('4', '2');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'Social', '2017-03-06 05:54:24', '2017-03-06 05:54:24');
INSERT INTO `tags` VALUES ('2', 'Search Engine', '2017-03-06 05:55:08', '2017-03-06 05:55:08');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'jan@limabean.co.za', '$2y$10$5YIyPvaPgWSE4kAiHZ1ceub5Sr9D/u7XaObUkJoFObhn/2dwsEwaa', '2017-03-06 05:53:44', '2017-03-06 05:53:44');
SET FOREIGN_KEY_CHECKS=1;
