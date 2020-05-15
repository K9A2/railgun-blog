-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(128) NOT NULL,
  `uri` varchar(128) NOT NULL,
  `is_hidden` tinyint(4) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`,`uri`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2018-01-01 00:00:01','2018-01-01 00:00:02','fuck title','fuck uri',0,1,'本篇文章主要介绍nginxserver虚拟服务器如何配置。其中包括的一些例子我会已保存到nginx。尽可能的想要整理一份比较完整的配置说明，避免找寻资料的麻烦。博主也尽可能的保证本篇文章的准确性，如有失误，请告知'),(2,'2019-08-18 00:00:00','2019-08-18 00:00:00','nginx server 如何写，如何写 nginx 配置','how-to-write-nginx-server',0,0,'本篇文章主要介绍nginxserver虚拟服务器如何配置。其中包括的一些例子我会已保存到nginx。尽可能的想要整理一份比较完整的配置说明，避免找寻资料的麻烦。博主也尽可能的保证本篇文章的准确性，如有失误，请告知'),(3,'2019-03-06 00:00:00','2019-03-06 00:00:00','她和他的第一次出国自由行 - 巴厘岛','we-are-traveled-in-bali',0,0,'前一篇文章：她和他的第一次出国自由行-出行模版。她姓陈，他也姓陈，她和他走到了一起，于是他们的旅程开始了。她是个活泼开朗的人，喜欢所有美好的东西，向往自由。她做事直接，雷厉风行却也做事细心，知书达理。'),(4,'2019-03-03 00:00:00','2019-03-03 00:00:00','她和他的第一次出国自由行 - 出行模版','our-travel-template',0,0,'第一次出国自由行，心里难免有些慌张，哈。希望在这里记录下本次出行的经验，做一个模版供下次出行参考。三要素和写小说一样，地点，人物、时间是我认为最重要的三个要素。'),(5,'2018-05-20 00:00:00','2018-05-20 00:00:00','Go 测试，go test 工具的具体指令 flag','the-command-flag-of-go-test',0,0,'接上篇文章Go单元测试，基准测试，http测试。本篇文章介绍Go测试工具gotest，包括各种子命令、参数之类的内容。你可以通过gotest-h查看帮助信息。'),(6,'2018-05-09 00:00:00','2018-05-09 00:00:00','Go 单元测试，基准测试，http 测试','study-golang-test',0,0,'对我们程序员来说，如何提高代码质量一定是我们的重中之重。不仅需要你能够写得一手的业务代码，还需要做的是如何保证你的代码质量。测试用例便是一个非常好的用来提高我们代码质量的工具。'),(7,'2018-03-08 00:00:00','2018-03-08 00:00:00','10 分钟理解什么是 OAuth 2.0 协议','what-is-oauth2-protocol',0,0,'什么是OAuth2.0OAuth2.0是一个行业的标准授权协议。OAuth2.0专注于简化客户端开发人员，同时为Web应用程序，桌面应用程序，手机和客厅设备提供特定的授权流程。'),(8,'2018-02-04 00:00:00','2018-02-04 00:00:00','DNS 一站到家之 CAA 记录','what-is-caa-record-in-dns',0,0,'自2017.04CAB论坛通过投票决定：2017.09.08起，所有CA机构颁发SSL证书前必须对颁发的域名进行CAA检测。CAA就时不时出现在技术人员的眼前。那么CAA记录是什么？又有什么作用呢？如何添加CAA记录？'),(11,'2018-01-07 00:00:00','2018-01-07 00:00:00','docker volume 容器卷的那些事（二）','the-docker-volumes-permissions',0,0,'如果你读了dockervolume容器卷的那些事（一），我想应该不会遇到下面这些问题的，毕竟是具有指导意义的。本篇文章的内容依旧是有关volume的内容，主要讲诉的是如何解决非root用户下的文件映射问题。博主将自己常遇到的一些问题总结如下。'),(12,'2018-01-07 00:00:00','2018-01-07 00:00:00','记一次树莓派搭建git服务器及内网穿透过程','raspberrypi-setup-git-repo-and-intranet-penetration',0,0,'前段时间一直想找点有意思的东西折腾折腾，一时兴起就买了个树莓派。买回来之后我就迷茫了，这个东西能干啥（折腾各种软硬件）？问题是我能用它干啥？放在那里积灰吧。'),(13,'2017-12-31 00:00:00','2017-12-31 00:00:00','docker volume 容器卷的那些事（一）','the-docker-volumes-basic',0,0,'dockervolume容器卷的那些事（二）。接触docker的朋友都知道，docker镜像是以layer概念存在的，一层一层的叠加，最终成为我们需要的镜像。但该镜像的每一层都是ReadOnly只读的。只有在我们运行容器的时候才会创建读写层。文件系统的隔离使得：');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_content`
--

DROP TABLE IF EXISTS `article_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `article_uri` varchar(128) NOT NULL,
  `article_markdown` text NOT NULL,
  `article_html` text NOT NULL,
  PRIMARY KEY (`id`,`article_uri`),
  UNIQUE KEY `article_uri` (`article_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_content`
--

LOCK TABLES `article_content` WRITE;
/*!40000 ALTER TABLE `article_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  `uri` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`,`name`,`uri`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_article`
--

DROP TABLE IF EXISTS `series_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `series_name` varchar(128) NOT NULL,
  `article_uri` varchar(128) NOT NULL,
  PRIMARY KEY (`id`,`series_name`,`article_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_article`
--

LOCK TABLES `series_article` WRITE;
/*!40000 ALTER TABLE `series_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  `reference` int(11) NOT NULL,
  PRIMARY KEY (`id`,`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_article`
--

DROP TABLE IF EXISTS `tag_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `article_uri` varchar(128) NOT NULL,
  `tag_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`,`article_uri`,`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_article`
--

LOCK TABLES `tag_article` WRITE;
/*!40000 ALTER TABLE `tag_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 12:28:40
