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
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `markdown` text NOT NULL,
  `html` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about`
--

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
INSERT INTO `about` VALUES (1,'2020-06-12 16:04:02','2020-06-12 16:04:03','# About','<h1>About</h1>');
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

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
  `slug` varchar(128) NOT NULL,
  `is_hidden` tinyint(4) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  `description` mediumtext NOT NULL,
  `series_slug` varchar(128) NOT NULL,
  PRIMARY KEY (`id`,`slug`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `uri` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (14,'2020-06-02 16:16:39','2020-06-02 16:16:41','Go 测试，go test 工具的具体指令 flag\n','the-command-flag-of-go-test',0,0,'接上篇文章 Go 单元测试，基准测试，http 测试。本篇文章介绍 Go 测试工具 go test，包括各种子命令、参数之类的内容。你可以通过 go test -h 查看帮助信息。','go-experience'),(15,'2020-06-02 16:17:55','2020-06-02 16:17:56','Go 单元测试，基准测试，http 测试','study-golang-test',0,0,'对我们程序员来说，如何提高代码质量一定是我们的重中之重。不仅需要你能够写得一手的业务代码，还需要做的是如何保证你的代码质量。测试用例便是一个非常好的用来提高我们代码质量的工具。通过测试，我们能够及时的发现我们程序的设计逻辑错误，并能够给接手项目的其它程序员同学理解函数有帮助。','go-experience'),(16,'2020-06-02 16:19:26','2020-06-02 16:19:27','Go 关键字 defer 的一些坑','how-to-use-defer-in-golang',0,0,'什么是 defer？如何理解 defer 关键字？Go 中使用 defer 的一些坑。defer 意为延迟，在 golang 中用于延迟执行一个函数。它可以帮助我们处理容易忽略的问题，如资源释放、连接关闭等。但在实际使用过程中，有一些需要注意的地方（坑），下面我们一一道来。','go-experience'),(17,'2020-06-02 16:20:21','2020-06-02 16:20:22','浅谈 Golang sync 包的相关使用方法','golang-sync-package-usage',0,0,'尽管 Golang 推荐通过 channel 进行通信和同步，但在实际开发中 sync 包用得也非常的多。另外 sync 下还有一个 atomic 包，提供了一些底层的原子操作（这里不做介绍）。本篇文章主要介绍该包下的锁的一些概念及使用方法。','go-experience'),(18,'2020-06-02 16:21:04','2020-06-02 16:21:06','Golang 博主走过的有关 error 的一些坑','why-nil-error-not-equal-nil',0,0,'本片文章用来记录我在 Golang 开发学习过程中遇到的有关 error 的一些坑。或许你也遇到，或许你能在这里找到答案。当然通过 error 的例子，你也应该联想到其它场景。','go-experience'),(19,'2020-06-02 16:21:58','2020-06-02 16:21:59','Glide命令，如何使用glide，glide.lock','glide-package-management-command',0,0,'初始化新工作区。除此之外，这会创建一个glide.yaml文件，同时试图猜测 package 和版本。例如，如果你的项目使用Godep，它将使用 Godep 指定的版本。Glide足够智能去扫描您的代码库，检测正在使用的 package，无论有没有指定其他的包管理器。','go-experience'),(20,'2020-06-02 16:22:42','2020-06-02 16:22:43','Golang包管理工具Glide，你值得拥有','glide-package-management-introduce',0,0,'“依赖地狱”是每个程序员在成长之路上都会面临的情况，首先我们通过语义化版本来控制软件的版本，然后在我们的项目里通过指定软件版本来达到控制依赖的目的。如：你的项目A依赖多个项目B1，B2，B3，而B1，B2，B3又依赖着其它项目C1，C2…。一个项目依赖这多个项目，当项目C1修复BUG版本发生变化，如果A依旧使用旧版本，势必引起未知的问题。所以，你需要意识到包依赖管理的重要性。在Go语言中，我比较推荐大家使用Glide作为包管理器。它能够自动识别Godeps的包管理，十足的很方便。本节介绍glide.yml的语义说明以及版本指定的格式。','go-experience'),(21,'2020-06-02 16:23:39','2016-06-02 16:23:42','DNS 一站到家之 CAA 记录','what-is-caa-record-in-dns',0,0,'自 2017.04 CAB 论坛通过投票决定：2017.09.08 起，所有 CA 机构颁发 SSL 证书前必须对颁发的域名进行 CAA 检测。CAA 就时不时出现在技术人员的眼前。那么 CAA 记录是什么？又有什么作用呢？如何添加 CAA 记录？','dns-explain'),(22,'2020-06-02 16:24:25','2016-06-02 16:24:27','DNS 一站到家之 DNS 消息协议','dns-rfc1035',0,0,'本篇文章让我们来分析下 DNS 消息协议的组成，当然我们也可以查看 RFC 1035。文章中所用的 byte 而不是 octet sequence，我认为更助于理解。好，首先我需要了解一些有关 DNS 相关的知识。','dns-explain'),(23,'2020-06-02 16:26:08','2016-06-02 16:26:12','DNS 一站到家之常用工具','dns-comman-tools',0,0,'使用这些工具之前，你可能需要安装一个工具包。它里面包含了之后需要介绍到的工具：','dns-explain'),(24,'2020-06-02 16:26:54','2016-06-02 16:26:54','DNS 一站到家之记录类型','dns-recording-type',0,0,'DNS 记录类型说明，若有遗漏的或者有误请指出，我将及时添加及改正。','dns-explain'),(25,'2020-06-02 16:27:32','2016-06-02 16:27:36','DNS 一站到家之历史由来','dns-history',0,0,'DNS，又名 Domain Name System，又名域名系统，是域名和IP地址相互映射的一个分布式数据库。今天我们说一说它的历史由来。','dns-explain'),(26,'2020-06-02 16:28:47','2017-06-02 16:28:47','mongodb 副本集（Replica Set）搭建','mongodb-replica-set',0,0,'本节介绍mongodb副本集的原理及搭建方法，MongoDB shell version: 3.2.1，ubuntu@14.04','database'),(27,'2020-06-02 16:29:34','2017-06-02 16:29:35','mognodb 副本集复制概念理解','mongodb-replica-set-concept',0,0,'mognodb 副本集复制概念理解','database'),(28,'2020-06-02 16:30:11','2020-06-02 16:30:12','docker volume 容器卷的那些事（二）','the-docker-volumes-permissions',0,0,'如果你读了docker volume 容器卷的那些事（一），我想应该不会遇到下面这些问题的，毕竟是具有指导意义的。本篇文章的内容依旧是有关 volume 的内容，主要讲诉的是如何解决非 root 用户下的文件映射问题。博主将自己常遇到的一些问题总结如下。','docker'),(29,'2020-06-02 16:30:52','2020-06-02 16:30:53','docker volume 容器卷的那些事（一）','the-docker-volumes-basic',0,0,'docker volume 容器卷的那些事（二）。接触 docker 的朋友都知道，docker 镜像是以 layer 概念存在的，一层一层的叠加，最终成为我们需要的镜像。但该镜像的每一层都是 ReadOnly 只读的。只有在我们运行容器的时候才会创建读写层。','docker'),(30,'2020-06-02 16:31:25','2020-06-02 16:31:26','如何写好Dockerfile，Dockerfile最佳实践','dockerfile-best-practices',0,0,'通过前面一篇 如何写Dockerfile，Dockerfile 参考文档，相信你已经了解了如何写 Dockerfile 文件。本篇文章主要介绍 Docker 公司和 Docker 社区推荐的最佳写法。so，在写 Dockerfile 文件的时候，你应该遵循这些做法。','docker'),(31,'2020-06-02 16:31:57','2020-06-02 16:31:58','如何执行docker run，docker run 命令参考文档','docker-run-reference',0,0,'当安装好了Docker之后，如何运行一个 docker 容器是个问题。本篇文章讲诉如何在命令行终端执行docker run命令，其主要内容来自官方文档Docker run reference。欢迎指出错误，万分感谢。','docker'),(32,'2020-06-02 16:33:14','2020-06-02 16:33:15','如何写Dockerfile，Dockerfile 参考文档','dockerfile-reference',0,0,'Dockerfile是由一系列命令和参数构成的脚本，一个Dockerfile里面包含了构建整个image的完整命令。Docker通过docker build执行Dockerfile中的一系列命令自动构建image。\n\nDockerfile其语法非常简单，此页面描述了您可以在Dockerfile中使用的命令。 阅读此页面后，你可以参阅Dockerfile最佳实践。','docker'),(33,'2020-06-02 16:33:56','2020-06-02 16:33:57','如何写docker-compose.yml，Docker compose file 参考文档','docker-compose-file',0,0,'Compose 文件是一个YAML文件，用于定义services、netword和volumes。 Compose 文件的默认路径为./docker-compose.yml(后缀为.yml和.yaml都可以)。一个service配置将会应用到容器的启动中，很像将命令行参数传递给docker run。 同样，network和volume定义类似于docker network create和docker volume create。 与Docker运行一样，默认情况下尊重Dockerfile中指定的选项（例如CMD，EXPOSE，VOLUME，ENV） - 您不需要在docker-compose.yml中再次指定他们。','docker'),(34,'2020-06-02 16:35:00','2020-06-02 16:35:01','远程连接docker daemon，Docker Remote API','dockerd-and-docker-remote-api',0,0,'不知道大家有没有遇到这样一种情形：每次构建好了镜像，push到私有仓库后。你还要ssh到服务器，进行pull，每次登录服务器的过程非常的痛苦。如果服务器ip没有映射域名，那记录ip也是一个痛苦的过程。博主，开始关注到docker remote api，它可以让你在本地就可以完成docker的所有操作，于是博主开发了基于etcd配置的docker管理工具，还蛮好用的。下面是我docker部分配置的一些经历，分享给大家，希望对大家有帮助。','docker'),(35,'2020-06-02 16:35:48','2020-06-02 16:35:49','搭建安全的docker private registry v2指南(Let\'s Encrypt)','secure-docker-registry',0,0,'获取安全证书有两个办法：互联网认证的CA处获取。自建CA自己给自己签名。','docker');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `article_slug` varchar(128) NOT NULL,
  `article_markdown` text NOT NULL,
  `article_html` text NOT NULL,
  PRIMARY KEY (`id`,`article_slug`),
  UNIQUE KEY `article_slug` (`article_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_content`
--

LOCK TABLES `article_content` WRITE;
/*!40000 ALTER TABLE `article_content` DISABLE KEYS */;
INSERT INTO `article_content` VALUES (3,'2020-06-02 16:37:26','2020-06-02 16:37:27','the-command-flag-of-go-test','接上篇文章 Go 单元测试，基准测试，http 测试。本篇文章介绍 Go 测试工具 go test，包括各种子命令、参数之类的内容。你可以通过 go test -h 查看帮助信息。','接上篇文章 Go 单元测试，基准测试，http 测试。本篇文章介绍 Go 测试工具 go test，包括各种子命令、参数之类的内容。你可以通过 go test -h 查看帮助信息。'),(4,'2020-06-02 16:37:51','2020-06-02 16:37:51','study-golang-test','对我们程序员来说，如何提高代码质量一定是我们的重中之重。不仅需要你能够写得一手的业务代码，还需要做的是如何保证你的代码质量。测试用例便是一个非常好的用来提高我们代码质量的工具。\n\n通过测试，我们能够及时的发现我们程序的设计逻辑错误，并能够给接手项目的其它程序员同学理解函数有帮助。\n\n本篇文章主要介绍 Go 语言中的 testing 包。它要求我们以 *_test.go 新建文件，并在文件中以 TestXxx 命名函数。然后再通过 go test [flags] [packages] 执行函数。','对我们程序员来说，如何提高代码质量一定是我们的重中之重。不仅需要你能够写得一手的业务代码，还需要做的是如何保证你的代码质量。测试用例便是一个非常好的用来提高我们代码质量的工具。\n\n通过测试，我们能够及时的发现我们程序的设计逻辑错误，并能够给接手项目的其它程序员同学理解函数有帮助。\n\n本篇文章主要介绍 Go 语言中的 testing 包。它要求我们以 *_test.go 新建文件，并在文件中以 TestXxx 命名函数。然后再通过 go test [flags] [packages] 执行函数。'),(5,'2020-06-02 16:38:24','2020-06-02 16:38:25','how-to-use-defer-in-golang','什么是 defer？如何理解 defer 关键字？Go 中使用 defer 的一些坑。\n\ndefer 意为延迟，在 golang 中用于延迟执行一个函数。它可以帮助我们处理容易忽略的问题，如资源释放、连接关闭等。但在实际使用过程中，有一些需要注意的地方（坑），下面我们一一道来。\n','什么是 defer？如何理解 defer 关键字？Go 中使用 defer 的一些坑。\n\ndefer 意为延迟，在 golang 中用于延迟执行一个函数。它可以帮助我们处理容易忽略的问题，如资源释放、连接关闭等。但在实际使用过程中，有一些需要注意的地方（坑），下面我们一一道来。'),(6,'2020-06-02 16:38:46','2020-06-02 16:38:46','golang-sync-package-usage','尽管 Golang 推荐通过 channel 进行通信和同步，但在实际开发中 sync 包用得也非常的多。另外 sync 下还有一个 atomic 包，提供了一些底层的原子操作（这里不做介绍）。本篇文章主要介绍该包下的锁的一些概念及使用方法。','尽管 Golang 推荐通过 channel 进行通信和同步，但在实际开发中 sync 包用得也非常的多。另外 sync 下还有一个 atomic 包，提供了一些底层的原子操作（这里不做介绍）。本篇文章主要介绍该包下的锁的一些概念及使用方法。'),(7,'2020-06-02 16:39:17','2020-06-02 16:39:19','why-nil-error-not-equal-nil','本片文章用来记录我在 Golang 开发学习过程中遇到的有关 error 的一些坑。或许你也遇到，或许你能在这里找到答案。当然通过 error 的例子，你也应该联想到其它场景。','本片文章用来记录我在 Golang 开发学习过程中遇到的有关 error 的一些坑。或许你也遇到，或许你能在这里找到答案。当然通过 error 的例子，你也应该联想到其它场景。'),(8,'2020-06-02 16:39:43','2020-06-02 16:39:44','glide-package-management-command','以下是Glide命令，其中大部分命令是帮助您管理工作区。\n\nglide create (别名 init)\n初始化新工作区。除此之外，这会创建一个glide.yaml文件，同时试图猜测 package 和版本。例如，如果你的项目使用Godep，它将使用 Godep 指定的版本。Glide足够智能去扫描您的代码库，检测正在使用的 package，无论有没有指定其他的包管理器。','以下是Glide命令，其中大部分命令是帮助您管理工作区。\n\nglide create (别名 init)\n初始化新工作区。除此之外，这会创建一个glide.yaml文件，同时试图猜测 package 和版本。例如，如果你的项目使用Godep，它将使用 Godep 指定的版本。Glide足够智能去扫描您的代码库，检测正在使用的 package，无论有没有指定其他的包管理器。'),(9,'2020-06-02 16:40:12','2020-06-02 16:40:13','glide-package-management-introduce','“依赖地狱”是每个程序员在成长之路上都会面临的情况，首先我们通过语义化版本来控制软件的版本，然后在我们的项目里通过指定软件版本来达到控制依赖的目的。\n\n如：你的项目A依赖多个项目B1，B2，B3，而B1，B2，B3又依赖着其它项目C1，C2…。一个项目依赖这多个项目，当项目C1修复BUG版本发生变化，如果A依旧使用旧版本，势必引起未知的问题。所以，你需要意识到包依赖管理的重要性。\n\n在Go语言中，我比较推荐大家使用Glide作为包管理器。它能够自动识别Godeps的包管理，十足的很方便。本节介绍glide.yml的语义说明以及版本指定的格式。','“依赖地狱”是每个程序员在成长之路上都会面临的情况，首先我们通过语义化版本来控制软件的版本，然后在我们的项目里通过指定软件版本来达到控制依赖的目的。\n\n如：你的项目A依赖多个项目B1，B2，B3，而B1，B2，B3又依赖着其它项目C1，C2…。一个项目依赖这多个项目，当项目C1修复BUG版本发生变化，如果A依旧使用旧版本，势必引起未知的问题。所以，你需要意识到包依赖管理的重要性。\n\n在Go语言中，我比较推荐大家使用Glide作为包管理器。它能够自动识别Godeps的包管理，十足的很方便。本节介绍glide.yml的语义说明以及版本指定的格式。'),(10,'2020-06-02 16:40:35','2020-06-02 16:40:35','what-is-caa-record-in-dns','自 2017.04 CAB 论坛通过投票决定：2017.09.08 起，所有 CA 机构颁发 SSL 证书前必须对颁发的域名进行 CAA 检测。CAA 就时不时出现在技术人员的眼前。那么 CAA 记录是什么？又有什么作用呢？如何添加 CAA 记录？\n\n什么是 CAA\nCAA（Certification Authority Authorization）是一种 DNS 记录，它被定义在 RFC6844，其目的是用来指定域名允许哪个证书颁发机构（CA）为其颁发证书。防止钓鱼攻击者使用该域名申请 SSL 证书。\n\n它们还提供了一种方法来指示通知规则，以防有人从未经授权的 CA 颁发证书。在没有 CAA 记录的情况下，所有 CA 均可为该域名颁发证书。当然如果存在 CAA 记录，CA 必须遵守规则，只能是在记录列表中的 CA 才被允许。\n\nCAA记录可以为整个域或特定主机名设置策略。CAA 记录也被子域继承，因此 CAA 记录集 example.com 也将适用于任何子域，例如 subdomain.example.com（除非被覆盖）。CAA 记录可以控制发行单域名证书，通配符证书或同时。','自 2017.04 CAB 论坛通过投票决定：2017.09.08 起，所有 CA 机构颁发 SSL 证书前必须对颁发的域名进行 CAA 检测。CAA 就时不时出现在技术人员的眼前。那么 CAA 记录是什么？又有什么作用呢？如何添加 CAA 记录？\n\n什么是 CAA\nCAA（Certification Authority Authorization）是一种 DNS 记录，它被定义在 RFC6844，其目的是用来指定域名允许哪个证书颁发机构（CA）为其颁发证书。防止钓鱼攻击者使用该域名申请 SSL 证书。\n\n它们还提供了一种方法来指示通知规则，以防有人从未经授权的 CA 颁发证书。在没有 CAA 记录的情况下，所有 CA 均可为该域名颁发证书。当然如果存在 CAA 记录，CA 必须遵守规则，只能是在记录列表中的 CA 才被允许。\n\nCAA记录可以为整个域或特定主机名设置策略。CAA 记录也被子域继承，因此 CAA 记录集 example.com 也将适用于任何子域，例如 subdomain.example.com（除非被覆盖）。CAA 记录可以控制发行单域名证书，通配符证书或同时。'),(11,'2020-06-02 16:40:59','2020-06-02 16:40:59','dns-rfc1035','本篇文章让我们来分析下 DNS 消息协议的组成，当然我们也可以查看 RFC 1035。\n\n文章中所用的 byte 而不是 octet sequence，我认为更助于理解。好，首先我需要了解一些有关 DNS 相关的知识。\n\n相关术语\n相关的记录类型都已经收录在 DNS 一站到家之记录类型。\n\nRR（resource record），资源记录，用来描述该条资源。\nTTL（time to live），生命周期，一般用来描述某条资源的有效缓存时间等。\nTYPE，资源类型，如A、AAAA、CNAME等。\nQTYPE，查询类型，是 TYPE 的超集，增加的有：AXFR、MAILB、MAILA、*。\nCLASS，查询类，如IN、HS等，查看如上。\nQCLASS。是 CLASS 的超集，增加的有 *。\nZONE，你可能需要阅读 DNS 一站到家之历史由来。\nLABEL，消息中的域名均以标签序列表示\n每个标签代表了一个 byte 的长度字段 + 多个其他 byte。\n每个表示长度的 byte，高的 2bit 必须为 0，剩余 6bit 表示该标签的长度，故最大为 63.\n由于每个域名都以 root 节点的 null 标签结尾，故一个域名总是以一个值为 0 的 byte 结尾。\n为了简化实现，域名的总长度（标签字节 + 标签长度字节）限制为 255 以内。','本篇文章让我们来分析下 DNS 消息协议的组成，当然我们也可以查看 RFC 1035。\n\n文章中所用的 byte 而不是 octet sequence，我认为更助于理解。好，首先我需要了解一些有关 DNS 相关的知识。\n\n相关术语\n相关的记录类型都已经收录在 DNS 一站到家之记录类型。\n\nRR（resource record），资源记录，用来描述该条资源。\nTTL（time to live），生命周期，一般用来描述某条资源的有效缓存时间等。\nTYPE，资源类型，如A、AAAA、CNAME等。\nQTYPE，查询类型，是 TYPE 的超集，增加的有：AXFR、MAILB、MAILA、*。\nCLASS，查询类，如IN、HS等，查看如上。\nQCLASS。是 CLASS 的超集，增加的有 *。\nZONE，你可能需要阅读 DNS 一站到家之历史由来。\nLABEL，消息中的域名均以标签序列表示\n每个标签代表了一个 byte 的长度字段 + 多个其他 byte。\n每个表示长度的 byte，高的 2bit 必须为 0，剩余 6bit 表示该标签的长度，故最大为 63.\n由于每个域名都以 root 节点的 null 标签结尾，故一个域名总是以一个值为 0 的 byte 结尾。\n为了简化实现，域名的总长度（标签字节 + 标签长度字节）限制为 255 以内。'),(12,'2020-06-02 16:41:33','2020-06-02 16:41:33','dns-comman-tools','使用这些工具之前，你可能需要安装一个工具包。它里面包含了之后需要介绍到的工具：\n\nUbuntu\n\n$ sudo apt-get update\n$ sudo apt-get install dnsutils\nDebian\n\n$ sudo apt-get update\n$ sudo apt-get install dnsutils\nFedora/Centos\n\n$ sudo yum update\n$ sudo yum install bind-utils','使用这些工具之前，你可能需要安装一个工具包。它里面包含了之后需要介绍到的工具：\n\nUbuntu\n\n$ sudo apt-get update\n$ sudo apt-get install dnsutils\nDebian\n\n$ sudo apt-get update\n$ sudo apt-get install dnsutils\nFedora/Centos\n\n$ sudo yum update\n$ sudo yum install bind-utils'),(13,'2020-06-02 16:41:55','2020-06-02 16:41:55','dns-recording-type','DNS 记录类型说明，若有遗漏的或者有误请指出，我将及时添加及改正。\n\n记录类型\nA (1)，什么是 A 记录？RFC 1035\n\nA （Address），用来指定主机名（或域名）对应的IP地址记录。当你浏览一个网站的时候都是解析 A 或 AAAA 记录。\n\n可能有些朋友在域名服务商添加记录时不知道 @ 的作用：\n\n@       IN      A       192.168.1.100\na       IN      A       192.168.1.101\n这里的 @ 符号表示与你添加的域名域来源相同。如我添加的 a.bind.deepzz.com 就不与来源 bind.deepzz.com 相同，直白的说你正在为 bind.deepzz.com 添加 A 记录。','DNS 记录类型说明，若有遗漏的或者有误请指出，我将及时添加及改正。\n\n记录类型\nA (1)，什么是 A 记录？RFC 1035\n\nA （Address），用来指定主机名（或域名）对应的IP地址记录。当你浏览一个网站的时候都是解析 A 或 AAAA 记录。\n\n可能有些朋友在域名服务商添加记录时不知道 @ 的作用：\n\n@       IN      A       192.168.1.100\na       IN      A       192.168.1.101\n这里的 @ 符号表示与你添加的域名域来源相同。如我添加的 a.bind.deepzz.com 就不与来源 bind.deepzz.com 相同，直白的说你正在为 bind.deepzz.com 添加 A 记录。'),(14,'2020-06-02 16:42:19','2020-06-02 16:42:21','dns-history','DNS，又名 Domain Name System，又名域名系统，是域名和IP地址相互映射的一个分布式数据库。今天我们说一说它的历史由来。\n\nInternet 简史\n首先，先说一说 Internet 的起源。\n\n雏形阶段：从某种意义上，Internet可以说是美苏冷战的产物。这样一个庞大的网络，它的由来，可以追溯到 1962 年。当时，美国国防部为了保证美国本土防卫力量和海外防御武装在受到前苏联第一次核打击以后仍然具有一定的生存和反击能力，认为有必要设计出一种分散的指挥系统：它由一个个分散的指挥点组成，当部分指挥点被摧毁后，其它点仍能正常工作，并且这些点之间，能够绕过那些已被摧毁的指挥点而继续保持联系。为了对这一构思进行验证，1969 年，美国国防部国防高级研究计划署（DoD/DARPA）资助建立了一个名为 ARPAnet（即―阿帕网‖）的网络，这个网络把位于洛杉矶的加利福尼亚大学、位于圣芭芭拉的加利福尼亚大学、斯坦福大学，以及位于盐湖城的犹它州州立大学的计算机主机联接起来，位于各个结点的大型计算机采用分组交换技术，通过专门的通信交换机（IMP）和专门的通信线路相互连接。这个阿帕网就是Internet最早的雏形。','DNS，又名 Domain Name System，又名域名系统，是域名和IP地址相互映射的一个分布式数据库。今天我们说一说它的历史由来。\n\nInternet 简史\n首先，先说一说 Internet 的起源。\n\n雏形阶段：从某种意义上，Internet可以说是美苏冷战的产物。这样一个庞大的网络，它的由来，可以追溯到 1962 年。当时，美国国防部为了保证美国本土防卫力量和海外防御武装在受到前苏联第一次核打击以后仍然具有一定的生存和反击能力，认为有必要设计出一种分散的指挥系统：它由一个个分散的指挥点组成，当部分指挥点被摧毁后，其它点仍能正常工作，并且这些点之间，能够绕过那些已被摧毁的指挥点而继续保持联系。为了对这一构思进行验证，1969 年，美国国防部国防高级研究计划署（DoD/DARPA）资助建立了一个名为 ARPAnet（即―阿帕网‖）的网络，这个网络把位于洛杉矶的加利福尼亚大学、位于圣芭芭拉的加利福尼亚大学、斯坦福大学，以及位于盐湖城的犹它州州立大学的计算机主机联接起来，位于各个结点的大型计算机采用分组交换技术，通过专门的通信交换机（IMP）和专门的通信线路相互连接。这个阿帕网就是Internet最早的雏形。'),(15,'2020-06-02 16:42:44','2020-06-02 16:42:45','mongodb-replica-set','在读这篇文章之前，可能你需要阅读上一篇文章：mognodb 副本集复制概念理解。\nmongodb副本集是有故障恢复功能的主从集群，由一个primary节点和一个或多个secondary节点组成。\n同步过程： Primary节点写入数据，Secondary通过读取Primary的oplog得到复制信息，开始复制数据并且将复制信息写入到自己的oplog。如果某个操作失败，则备份节点停止从当前数据源复制数据。如果某个备份节点由于某些原因挂掉了，当重新启动后，就会自动从oplog的最后一个操作开始同步，同步完成后，将信息写入自己的oplog，由于复制操作是先复制数据，复制完成后再写入oplog，有可能相同的操作会同步两份，不过MongoDB在设计之初就考虑到这个问题，将oplog的同一个操作执行多次，与执行一次的效果是一样的。\n简单的说就是：当Primary节点完成数据操作后，Secondary会做出一系列的动作保证数据的同步\n\n1、检查自己local库的oplog.rs集合，找出最近的时间戳。\n2、检查Primary节点local库oplog.rs集合，找出大于此时间戳的记录。\n3、将找到的记录插入到自己的oplog.rs集合中，并执行这些操作。','在读这篇文章之前，可能你需要阅读上一篇文章：mognodb 副本集复制概念理解。\nmongodb副本集是有故障恢复功能的主从集群，由一个primary节点和一个或多个secondary节点组成。\n同步过程： Primary节点写入数据，Secondary通过读取Primary的oplog得到复制信息，开始复制数据并且将复制信息写入到自己的oplog。如果某个操作失败，则备份节点停止从当前数据源复制数据。如果某个备份节点由于某些原因挂掉了，当重新启动后，就会自动从oplog的最后一个操作开始同步，同步完成后，将信息写入自己的oplog，由于复制操作是先复制数据，复制完成后再写入oplog，有可能相同的操作会同步两份，不过MongoDB在设计之初就考虑到这个问题，将oplog的同一个操作执行多次，与执行一次的效果是一样的。\n简单的说就是：当Primary节点完成数据操作后，Secondary会做出一系列的动作保证数据的同步\n\n1、检查自己local库的oplog.rs集合，找出最近的时间戳。\n2、检查Primary节点local库oplog.rs集合，找出大于此时间戳的记录。\n3、将找到的记录插入到自己的oplog.rs集合中，并执行这些操作。'),(16,'2020-06-02 16:43:07','2020-06-02 16:43:07','mongodb-replica-set-concept','复制副本集概念\n复制是跨多个服务器数据同步的过程。\n\n复制的特点\n保障数据的安全性\n数据高可用性\n灾难恢复\n无需停机维护(如备份，重建索引，压缩)\n分布式读取数据(提高读取能力)\nmongodb支持副本集和主从复制，主从复制官方已不再推荐（不支持自动故障切换）。','复制副本集概念\n复制是跨多个服务器数据同步的过程。\n\n复制的特点\n保障数据的安全性\n数据高可用性\n灾难恢复\n无需停机维护(如备份，重建索引，压缩)\n分布式读取数据(提高读取能力)\nmongodb支持副本集和主从复制，主从复制官方已不再推荐（不支持自动故障切换）。'),(17,'2020-06-02 16:43:29','2020-06-02 16:43:29','the-docker-volumes-permissions','如果你读了docker volume 容器卷的那些事（一），我想应该不会遇到下面这些问题的，毕竟是具有指导意义的。本篇文章的内容依旧是有关 volume 的内容，主要讲诉的是如何解决非 root 用户下的文件映射问题。博主将自己常遇到的一些问题总结如下。','如果你读了docker volume 容器卷的那些事（一），我想应该不会遇到下面这些问题的，毕竟是具有指导意义的。本篇文章的内容依旧是有关 volume 的内容，主要讲诉的是如何解决非 root 用户下的文件映射问题。博主将自己常遇到的一些问题总结如下。'),(18,'2020-06-02 16:44:02','2020-06-02 16:44:03','the-docker-volumes-basic','docker volume 容器卷的那些事（二）。接触 docker 的朋友都知道，docker 镜像是以 layer 概念存在的，一层一层的叠加，最终成为我们需要的镜像。但该镜像的每一层都是 ReadOnly 只读的。只有在我们运行容器的时候才会创建读写层。文件系统的隔离使得：\n\n容器不再运行时，数据将不会持续存在，数据很难从容器中取出。\n无法在不同主机之间很好的进行数据迁移。\n数据写入容器的读写层需要内核提供联合文件系统，这会额外的降低性能。\ndocker 为我们提供了三种不同的方式将数据挂载到容器中：volume、bind mount、tmpfs。','docker volume 容器卷的那些事（二）。接触 docker 的朋友都知道，docker 镜像是以 layer 概念存在的，一层一层的叠加，最终成为我们需要的镜像。但该镜像的每一层都是 ReadOnly 只读的。只有在我们运行容器的时候才会创建读写层。文件系统的隔离使得：\n\n容器不再运行时，数据将不会持续存在，数据很难从容器中取出。\n无法在不同主机之间很好的进行数据迁移。\n数据写入容器的读写层需要内核提供联合文件系统，这会额外的降低性能。\ndocker 为我们提供了三种不同的方式将数据挂载到容器中：volume、bind mount、tmpfs。'),(19,'2020-06-02 16:44:19','2020-06-02 16:44:20','dockerfile-best-practices','通过前面一篇 如何写Dockerfile，Dockerfile 参考文档，相信你已经了解了如何写 Dockerfile 文件。本篇文章主要介绍 Docker 公司和 Docker 社区推荐的最佳写法。so，在写 Dockerfile 文件的时候，你应该遵循这些做法。\n\n准则和建议\nDocker 官方提供了一些建议和准则，在大多数情况下建议遵守。\n\n1、容器是短暂的，也就是说，你需要可以容易的创建、销毁、配置你的容器。\n2、多数情况，构建镜像的时候是将 Dockerfile 和所需文件放在同一文件夹下。但为了构建性能，我们可以采用 .dockerignore 文件来排除文件和目录。\n3、避免安装不必要的包，构建镜像应该尽可能减少复杂性、依赖关系、构建时间及镜像大小。\n4、最小化层数。\n5、排序多行参数，通过字母将参数排序来缓解以后的变化，这将帮你避免重复的包、使列表更容易更新，如：','通过前面一篇 如何写Dockerfile，Dockerfile 参考文档，相信你已经了解了如何写 Dockerfile 文件。本篇文章主要介绍 Docker 公司和 Docker 社区推荐的最佳写法。so，在写 Dockerfile 文件的时候，你应该遵循这些做法。\n\n准则和建议\nDocker 官方提供了一些建议和准则，在大多数情况下建议遵守。\n\n1、容器是短暂的，也就是说，你需要可以容易的创建、销毁、配置你的容器。\n2、多数情况，构建镜像的时候是将 Dockerfile 和所需文件放在同一文件夹下。但为了构建性能，我们可以采用 .dockerignore 文件来排除文件和目录。\n3、避免安装不必要的包，构建镜像应该尽可能减少复杂性、依赖关系、构建时间及镜像大小。\n4、最小化层数。\n5、排序多行参数，通过字母将参数排序来缓解以后的变化，这将帮你避免重复的包、使列表更容易更新，如：'),(20,'2020-06-02 16:44:51','2020-06-02 16:44:50','docker-run-reference','当安装好了Docker之后，如何运行一个 docker 容器是个问题。本篇文章讲诉如何在命令行终端执行docker run命令，其主要内容来自官方文档Docker run reference。欢迎指出错误，万分感谢。 docker run的基本格式是：\n\n$ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]\n简单说下，IMAGE[:TAG|@DIGEST]是镜像名称，在这之前的[OPTIONS]是 docker 配置，如：-d、-p 8080:8080等，之后[COMMAND] [ARG...]是在容器启动时执行的命令（容器内执行），如：echo hello world。\n\n注意，在执行docker run命令时，或许需要加上sudo。\n\n  $ sudo groupadd docker                       #创建docker组，免sudo执行docker命令\n  $ sudo usermod -aG docker ${username}        #将用户username添加到docker组，重启docker服务，注销，登录\n好的，下面我们一一学习docker run的各个配置项。','当安装好了Docker之后，如何运行一个 docker 容器是个问题。本篇文章讲诉如何在命令行终端执行docker run命令，其主要内容来自官方文档Docker run reference。欢迎指出错误，万分感谢。 docker run的基本格式是：\n\n$ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]\n简单说下，IMAGE[:TAG|@DIGEST]是镜像名称，在这之前的[OPTIONS]是 docker 配置，如：-d、-p 8080:8080等，之后[COMMAND] [ARG...]是在容器启动时执行的命令（容器内执行），如：echo hello world。\n\n注意，在执行docker run命令时，或许需要加上sudo。\n\n  $ sudo groupadd docker                       #创建docker组，免sudo执行docker命令\n  $ sudo usermod -aG docker ${username}        #将用户username添加到docker组，重启docker服务，注销，登录\n好的，下面我们一一学习docker run的各个配置项。'),(21,'2020-06-02 16:45:12','2020-06-02 16:45:13','dockerfile-reference','Dockerfile\nDockerfile是由一系列命令和参数构成的脚本，一个Dockerfile里面包含了构建整个image的完整命令。Docker通过docker build执行Dockerfile中的一系列命令自动构建image。\n\nDockerfile其语法非常简单，此页面描述了您可以在Dockerfile中使用的命令。 阅读此页面后，你可以参阅Dockerfile最佳实践。\n\nUsage\ndocker build命令从Dockerfile和context构建image。context是PATH或URL处的文件。PATH本地文件目录。 URL是Git repository的位置。\n\ncontext以递归方式处理。因此，PATH包括任何子目录，URL包括repository及submodules。一个使用当前目录作为context的简单构建命令：\n\n$ docker build .\nSending build context to Docker daemon  6.51 MB\n...\n构建由Docker守护程序运行，而不是由CLI运行。构建过程所做的第一件事是将整个context（递归地）发送给守护进程。大多数情况下，最好是将Dockerfile和所需文件复制到一个空的目录，再到这个目录进行构建。','Dockerfile\nDockerfile是由一系列命令和参数构成的脚本，一个Dockerfile里面包含了构建整个image的完整命令。Docker通过docker build执行Dockerfile中的一系列命令自动构建image。\n\nDockerfile其语法非常简单，此页面描述了您可以在Dockerfile中使用的命令。 阅读此页面后，你可以参阅Dockerfile最佳实践。\n\nUsage\ndocker build命令从Dockerfile和context构建image。context是PATH或URL处的文件。PATH本地文件目录。 URL是Git repository的位置。\n\ncontext以递归方式处理。因此，PATH包括任何子目录，URL包括repository及submodules。一个使用当前目录作为context的简单构建命令：\n\n$ docker build .\nSending build context to Docker daemon  6.51 MB\n...\n构建由Docker守护程序运行，而不是由CLI运行。构建过程所做的第一件事是将整个context（递归地）发送给守护进程。大多数情况下，最好是将Dockerfile和所需文件复制到一个空的目录，再到这个目录进行构建。'),(22,'2020-06-02 16:45:39','2020-06-02 16:45:40','docker-compose-file','Compose 文件是一个YAML文件，用于定义services、netword和volumes。 Compose 文件的默认路径为./docker-compose.yml(后缀为.yml和.yaml都可以)。\n\n一个service配置将会应用到容器的启动中，很像将命令行参数传递给docker run。 同样，network和volume定义类似于docker network create和docker volume create。 与Docker运行一样，默认情况下尊重Dockerfile中指定的选项（例如CMD，EXPOSE，VOLUME，ENV） - 您不需要在docker-compose.yml中再次指定它们。\n\n您可以在配置中使用具有类似Bash的${VARIABLE}语法使用环境变量 - 有关详细信息，请参阅Variable substitution。','Compose 文件是一个YAML文件，用于定义services、netword和volumes。 Compose 文件的默认路径为./docker-compose.yml(后缀为.yml和.yaml都可以)。\n\n一个service配置将会应用到容器的启动中，很像将命令行参数传递给docker run。 同样，network和volume定义类似于docker network create和docker volume create。 与Docker运行一样，默认情况下尊重Dockerfile中指定的选项（例如CMD，EXPOSE，VOLUME，ENV） - 您不需要在docker-compose.yml中再次指定它们。\n\n您可以在配置中使用具有类似Bash的${VARIABLE}语法使用环境变量 - 有关详细信息，请参阅Variable substitution。'),(23,'2020-06-02 16:46:04','2020-06-02 16:46:04','dockerd-and-docker-remote-api','不知道大家有没有遇到这样一种情形：每次构建好了镜像，push到私有仓库后。你还要ssh到服务器，进行pull，每次登录服务器的过程非常的痛苦。如果服务器ip没有映射域名，那记录ip也是一个痛苦的过程。博主，开始关注到docker remote api，它可以让你在本地就可以完成docker的所有操作，于是博主开发了基于etcd配置的docker管理工具，还蛮好用的。下面是我docker部分配置的一些经历，分享给大家，希望对大家有帮助。\n\n更新列表：\n\n2017/04/27：添加 /etc/docker/daemon.json 文件配置过程（version 在 1.12 之后可用），文档地址。','不知道大家有没有遇到这样一种情形：每次构建好了镜像，push到私有仓库后。你还要ssh到服务器，进行pull，每次登录服务器的过程非常的痛苦。如果服务器ip没有映射域名，那记录ip也是一个痛苦的过程。博主，开始关注到docker remote api，它可以让你在本地就可以完成docker的所有操作，于是博主开发了基于etcd配置的docker管理工具，还蛮好用的。下面是我docker部分配置的一些经历，分享给大家，希望对大家有帮助。\n\n更新列表：\n\n2017/04/27：添加 /etc/docker/daemon.json 文件配置过程（version 在 1.12 之后可用），文档地址。'),(24,'2020-06-02 16:46:24','2020-06-02 16:46:24','secure-docker-registry','权威Registry\n获取安全证书有两个办法：互联网认证的CA处获取。自建CA自己给自己签名。\n\n1、从认证CA处获取签名证书，大多数是需要付出一定费用的，近些年也有认证CA提供免费证书，例如Let’s Encrypt(被大多数浏览器信任)。下文使用Let’s Encrypt的例子您将清楚地看到这个步骤。\n2、自建CA并签名证书的方式所带来的问题是CA本身的维护以及客户端方面的维护。要保证自建CA的安全需要有比较扎实的基础安全知识，维护它的运转需要有对签名流程进行干预的控制能力，或自动、或手工。客户端方面，同样需要对所有客户端按照其CA安装机制来进行额外安装。若将自建CA维护到与认证CA同等的安全性和便利性，所付出的代价将超过付费证书。因此这种方式主要用于试验性环境。','权威Registry\n获取安全证书有两个办法：互联网认证的CA处获取。自建CA自己给自己签名。\n\n1、从认证CA处获取签名证书，大多数是需要付出一定费用的，近些年也有认证CA提供免费证书，例如Let’s Encrypt(被大多数浏览器信任)。下文使用Let’s Encrypt的例子您将清楚地看到这个步骤。\n2、自建CA并签名证书的方式所带来的问题是CA本身的维护以及客户端方面的维护。要保证自建CA的安全需要有比较扎实的基础安全知识，维护它的运转需要有对签名流程进行干预的控制能力，或自动、或手工。客户端方面，同样需要对所有客户端按照其CA安装机制来进行额外安装。若将自建CA维护到与认证CA同等的安全性和便利性，所付出的代价将超过付费证书。因此这种方式主要用于试验性环境。');
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
  `slug` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`,`name`,`slug`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uri` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (2,'2020-06-02 16:13:16','2020-06-02 16:13:18','Go 踩坑系列','go-experience','作为一名不及格的 gopher，咱还是日常整理一些有关 Go 的文章。这些坑。。。说不定你也踩过哦。'),(3,'2020-06-02 16:13:50','2020-06-02 16:13:51','DNS 一站到家','dns-explain','一名合格的互联网从业者，对 DNS 一定要有所了解，这里会记录一些 DNS 相关的学习资料和经验总结。'),(4,'2020-06-02 16:14:23','2020-06-02 16:14:25','Database 相关技术','database','不管是新手，还是大牛，数据库开发是程序开发中的重中之重。面对什么样的数据选择什么样的数据库是一个值得思考的问题。数据库的高可用、高并发，数据库调优，以及数据库容灾是成为大牛之前必备技能。同志，请继续努力！'),(5,'2020-06-02 16:14:50','2020-06-02 16:14:54','Docker 相关技术','docker','微服务架构的兴起，带动了容器化技术快速发展。docker作为微服务不可缺少的重要一员，凭借着其开源、易部署、可移植、更安全等特点，迅速的在IT届火了起来。学习它、掌握它、了解它。');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
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

-- Dump completed on 2020-06-15 22:58:38
