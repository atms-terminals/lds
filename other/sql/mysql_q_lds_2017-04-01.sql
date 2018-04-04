-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: q_lds
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(50) NOT NULL,
  `sql_function` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Возможные действия пользователя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'Вход','sessions_add'),(2,'Выход','sessions_del'),(6,'Удаление пользователя','users_delete'),(7,'Добавление пользователя','users_add'),(8,'Изменение пользователя','users_edit'),(9,'Изменение статуса пользователя','users_change_status'),(10,'Изменение пароля пользователя','users_change_password'),(13,'Продажа. Подготовка','payments_prepare'),(14,'Продажа. Подтверждение','payment'),(15,'Инкассация','collection'),(16,'Изменение аванса','prepayments_change'),(17,'Изменение статуса услуги из прайса','pricelist_change_status'),(18,'Изменение названия услуги из прайса','pricelist_change_clients_desc'),(19,'Удаление услуги из прайса','pricelist_delete'),(20,'Добавление услуги в прайс','pricelist_add'),(21,'Изменение цвета кнопки','pricelist_change_color'),(22,'Добавление контрагента','contragent_add'),(23,'Изменение цены услуги из прайса','pricelist_change_price'),(24,'Изменение типа НДС для услуги из прайса','pricelist_change_nds'),(25,'Изменение типа дня для услуги из прайса','pricelist_change_dayoff'),(26,'Изменение времени','pricelist_set_time'),(27,'Изменение комментария к экрану','pricelist_set_comment'),(28,'Изменение типа чека','pricelist_change_bill');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baskets`
--

DROP TABLE IF EXISTS `baskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baskets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baskets`
--

LOCK TABLES `baskets` WRITE;
/*!40000 ALTER TABLE `baskets` DISABLE KEYS */;
/*!40000 ALTER TABLE `baskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baskets_items`
--

DROP TABLE IF EXISTS `baskets_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baskets_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_basket` int(11) DEFAULT NULL,
  `id_service` int(11) DEFAULT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_baskets_items_baskets` (`id_basket`),
  CONSTRAINT `FK_baskets_items_baskets` FOREIGN KEY (`id_basket`) REFERENCES `baskets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baskets_items`
--

LOCK TABLES `baskets_items` WRITE;
/*!40000 ALTER TABLE `baskets_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `baskets_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_collections_users` (`id_user`),
  CONSTRAINT `FK_collections_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (2,52,'2017-10-25 22:14:10'),(3,52,'2017-10-25 22:24:51');
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_price_lds`
--

DROP TABLE IF EXISTS `custom_price_lds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_price_lds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md5` char(32) DEFAULT NULL,
  `id_parent` int(11) NOT NULL DEFAULT '0',
  `desc` varchar(512) NOT NULL,
  `clients_desc` varchar(512) DEFAULT NULL,
  `day_type` int(11) NOT NULL DEFAULT '2',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nds` varchar(4) NOT NULL DEFAULT '0000' COMMENT '0000 - нет ,1000 - НДС 18%, 2000 - НДС 10%, 3000 - НДС 0%, 4000 - Без налога',
  `bill` int(11) NOT NULL DEFAULT '0' COMMENT '0 - отдельные чеки, 1 - один чек на все',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `color` varchar(50) NOT NULL DEFAULT 'primary',
  `order` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `screen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_price_lds`
--

LOCK TABLES `custom_price_lds` WRITE;
/*!40000 ALTER TABLE `custom_price_lds` DISABLE KEYS */;
INSERT INTO `custom_price_lds` VALUES (1,'b6e2b527122eed857c10ccf10e9dde3c',0,'Проведение занятий по физической культуре и спорту',NULL,2,0.00,'0000',0,1,'primary',0,NULL,13),(2,'c11b9ce6b4e33b438e629f1571d754c8',0,'Проведение спортивно-зрелищных мероприятий',NULL,2,0.00,'0000',0,1,'primary',0,NULL,13),(3,'706eeb99c8ffad1e0c8a6fc95eea918a',0,'Предоставление объектов физической культуры и спорта',NULL,2,0.00,'0000',0,1,'primary',0,NULL,13),(4,'75424e37d5c46dd871e800db8720c823',1,'Занятия по хоккею с шайбой (дети от 6 до 14 лет)',NULL,2,200.00,'0000',0,1,'primary',0,NULL,13),(5,'97568d15b1f08a7007ca3f85fea8dde5',1,'Занятия по хоккею с шайбой (взрослые)',NULL,2,300.00,'0000',0,1,'primary',0,NULL,13),(6,'f6fe302ce4acb3e494b1df8578f6e9f2',1,'Занятия по фигурному катанию на коньках (дети от 6 до 14 лет)',NULL,2,150.00,'0000',0,1,'primary',0,NULL,13),(7,'aeef68f34c63a58804c0abbd46e5c3e7',1,'Занятия по фигурному катанию на коньках (взрослые)',NULL,2,250.00,'0000',0,1,'primary',0,NULL,13),(8,'2aab233052445ce01a6b5a9931091c0b',1,'Занятия по кёрлингу (дети от 6 до 14 лет)',NULL,2,200.00,'0000',0,1,'primary',0,NULL,13),(9,'a8cc6dd6ca56bebbbcd634367cee8397',1,'Занятия по кёрлингу (взрослые)',NULL,2,350.00,'0000',0,1,'primary',0,NULL,13),(10,'210a81735baedd5a4d6db5efd70a0a35',1,'Занятия в группах здоровье (взрослые) - 1 занятие',NULL,2,120.00,'0000',0,1,'primary',0,NULL,13),(11,'16df8298c1483fde42a33a4f7690ce47',1,'Занятия в группах здоровье (взрослые) - абонемент (12 занятий)',NULL,2,1200.00,'0000',0,1,'primary',0,NULL,13),(12,'725de469deeaad03e0e20205ff82aae6',1,'Занятия в группах общей физической подготовки для взрослых - 1 занятие',NULL,2,150.00,'0000',0,1,'primary',0,NULL,13),(13,'61be4c515d83ceeb57308f5d43611f01',1,'Занятия в группах общей физической подготовки для взрослых - абонемент (12 занятий)',NULL,2,1500.00,'0000',0,1,'primary',0,NULL,13),(14,'6718edeb55a9d9048c1d42a809a1a81a',1,'Занятия в группах общей физической подготовки для детей от 6 до 14 лет - 1 занятие',NULL,2,100.00,'0000',0,1,'primary',0,NULL,13),(15,'197df8e28bd3afba0a2d6166dbf44645',1,'Занятия в группах общей физической подготовки для детей от 6 до 14 лет - абонемент (12 занятий)',NULL,2,800.00,'0000',0,1,'primary',0,NULL,13),(16,'f061b715a90b4e4c2385fce9d3b533af',2,'Проведение спортивных и оздоровительных мероприятий',NULL,2,3000.00,'0000',0,1,'primary',0,NULL,13),(17,'796c7dfea5ef4325de4976610adbbcc3',2,'Музыкальное сопровождение спортивных и оздоровительных мероприятий',NULL,2,800.00,'0000',0,1,'primary',0,NULL,13),(18,'1501551f7e4cd934bda54303cfceb821',2,'Звуковое поздравление',NULL,2,100.00,'0000',0,1,'primary',0,NULL,13),(19,'fe6938655ce26d59a69bf5d919034aaf',3,'Предоставление тренажерного зала',NULL,2,1500.00,'0000',0,1,'primary',0,NULL,13),(20,'7d9f14e1f59f18eda54296265e376c56',3,'Предоставление в пользование спортивных тренажеров',NULL,2,160.00,'0000',0,1,'primary',0,NULL,13),(21,'499f6f1e722f4f34c6638f48a74718ea',3,'Предоставление в пользование спортивных тренажеров - абонемент (12 занятий)',NULL,2,1500.00,'0000',0,1,'primary',0,NULL,13),(22,'66fd0b0a497bb97a863c0d84434063cc',3,'Предоставление в пользование ледовых коньков',NULL,2,80.00,'0000',0,1,'primary',0,NULL,14),(23,'621770b54677420a21665ba1a9fe2426',3,'Предоставление в пользование настольного тенниса (1 стол)',NULL,2,80.00,'0000',0,1,'primary',0,NULL,13),(24,'d67aa6d657e913197656b4ef2558c99d',3,'Предоставление в пользование аэрохоккея',NULL,2,30.00,'0000',0,1,'primary',0,NULL,13),(25,'38c53e2b501b752be52bef63f49a912c',3,'Предоставление спортивного зала',NULL,2,500.00,'0000',0,1,'primary',0,NULL,13),(26,'0f2d23298671d70a3356e0678b135c6a',3,'Предоставление ледовой арены (катка) по кёрлингу',NULL,2,2500.00,'0000',0,1,'primary',0,NULL,13),(27,'20ee6f008baccbf58ab2cad9f214c43c',3,'Предоставление ледовой арены (катка) детских команд',NULL,2,2500.00,'0000',0,1,'primary',0,NULL,13),(28,'51bf00d487b556250e1b82053444d473',3,'Предоставление ледовой арены (катка) в ночное время (с 24 до 6 часов)',NULL,2,4000.00,'0000',0,1,'primary',0,NULL,13),(29,'c36753fca30eb3495d731f00a1c82832',3,'Предоставление ледовой арены (катка) юношеских команд',NULL,2,4500.00,'0000',0,1,'primary',0,NULL,13),(30,'a13cffd0e5300c954523f7e7bcf0c9e2',3,'Предоставление ледовой арены (катка) - каток для двоих',NULL,2,5000.00,'0000',0,1,'primary',0,NULL,13),(31,'844c658c3548f8307486b59c52f81eba',3,'Предоставление ледовой арены (катка) любительской хоккейной лиги',NULL,2,6000.00,'0000',0,1,'primary',0,NULL,13),(32,'2b5a82590bf52d70b9317c0a34eab0fe',3,'Предоставление ледовой арены (катка) взрослых команд',NULL,2,7000.00,'0000',0,1,'primary',0,NULL,13),(33,'03ca9c74d912c6a8363f0f0af072159d',3,'Предоставление ледовой арены (катка) - корпоративного катания на коньках',NULL,2,8000.00,'0000',0,1,'primary',0,NULL,13),(34,'5506611634399022220751b71e810fc3',3,'Предоставление ледового катка на улице - катание на коньках (взрослые), 1 посещение',NULL,2,70.00,'0000',0,1,'primary',0,NULL,13),(35,'58b65b30eee67198ea6d85e61f477421',3,'Предоставление ледового катка на улице  - катание на коньках (дети от 6 до 14 лет) 1 посещение',NULL,2,50.00,'0000',0,1,'primary',0,NULL,13),(36,'1b023b7756a20d6675b99e2e876a1946',3,'Предоставление ледового катка на улице - катание на коньках (дети до 6 лет), 1 посещение',NULL,2,30.00,'0000',0,1,'primary',0,NULL,13),(37,'c1d420337328b058f8cf7ce84d241db5',3,'Предоставление большого футбольного поля на улице',NULL,2,600.00,'0000',0,1,'primary',0,NULL,13),(38,'667f6571673c64791d731727c93fafce',3,'Предоставление малого футбольного поля на улице',NULL,2,250.00,'0000',0,1,'primary',0,NULL,13),(39,'12e20a6718733f2ed314a013217288bf',3,'Предоставление открытой спортивной площадки',NULL,2,400.00,'0000',0,1,'primary',0,NULL,13),(40,'c674cb1ef224d66747da4614628507da',0,'Прочие спортивные услуги',NULL,2,0.00,'0000',0,1,'primary',0,NULL,13),(41,'563beac265d2d20ae2744d418a79cbee',40,'Прием на хранение вещей потребителей услуг',NULL,2,50.00,'0000',0,1,'primary',0,NULL,13),(42,'397cfb4928893623a65c1660bab394f2',40,'Размещение информации на бортах ледовой арены, стенах помещений спортивного комплекса',NULL,2,500.00,'0000',0,1,'primary',0,NULL,13),(43,'4cd1ebb33a5eafaedaed61600e5a9391',40,'Предоставление выставочных мест для пропаганды спортивных мероприятий',NULL,2,35.00,'0000',0,1,'primary',0,NULL,13),(44,'fdcd897020bbbfb5f0e93ebf0bf14cdd',40,'Предоставление дополнительной раздевалки',NULL,2,500.00,'0000',0,1,'primary',0,NULL,13),(45,'dc4ef0f82a659a0a760fc70b4fa5b7a7',40,'Организация проживания участников спортивных сборов и соревнований - одноместный и двухместный номер с отдельным санузлом',NULL,2,600.00,'0000',0,1,'primary',0,NULL,13),(46,'883528f68d7feb8003fb542bb92d8d3d',40,'Организация проживания участников спортивных сборов и соревнований - четырехместный и шестиместный номер',NULL,2,350.00,'0000',0,1,'primary',0,NULL,13),(47,'c9dd29819cb4b58bd21b8eb06fea1563',40,'Заточка коньков',NULL,2,100.00,'0000',0,1,'primary',0,NULL,13),(48,'e1a546a6576854aa68c04c6f54ea7668',40,'Заточка новых коньков',NULL,2,150.00,'0000',0,1,'primary',0,NULL,13),(49,'67bf686afa6ee489b1947c2e69efe8ad',40,'Заточка площадки лезвий хоккейных коньков',NULL,2,150.00,'0000',0,1,'primary',0,NULL,13),(50,'82c343e2eb1e058f1f205622acdeb3de',40,'Замена лезвий коньков',NULL,2,50.00,'0000',0,1,'primary',0,NULL,13),(51,'7e397aea81d03b493ec2ea9c6f473103',40,'Замена стаканов (рамки) коньков',NULL,2,200.00,'0000',0,1,'primary',0,NULL,13),(52,'995a2187b1ef4cf25b8a0388e4f43f14',40,'Замена крюка клюшки - с отрезанием крюка клюшки',NULL,2,100.00,'0000',0,1,'primary',0,NULL,13),(53,'dbd286228883a068bfe0d4ca8376a68a',40,'Замена крюка клюшки - без отрезания крюка клюшки',NULL,2,50.00,'0000',0,1,'primary',0,NULL,13),(54,'5eb7b3a824e3212677f10cd910d39b2e',40,'Укорачивание клюшки - деревянная клюшка',NULL,2,20.00,'0000',0,1,'primary',0,NULL,13),(55,'0ca005da579f04922226f2057aeb35fe',40,'Укорачивание клюшки - пластиковая клюшка',NULL,2,50.00,'0000',0,1,'primary',0,NULL,13),(56,'6cf1a9beffad852d00285eeddb49e440',40,'Устранение люфта лезвий',NULL,2,25.00,'0000',0,1,'primary',0,NULL,13),(57,'106a31e2f4dca9187f4ddf82ed3445eb',40,'Замена клепок на коньках - стальная клепка',NULL,2,15.00,'0000',0,1,'primary',0,NULL,13),(58,'13894b5cc6caac6df29ce044d80e0692',40,'Замена клепок на коньках - медная клепка',NULL,2,20.00,'0000',0,1,'primary',0,NULL,13),(59,'af23d66571fd6c0dc89d8cf84e0ef6ef',40,'Стачивание носка и пятки лезвий коньков',NULL,2,300.00,'0000',0,1,'primary',0,NULL,13),(60,'7f81a5a27433edb5099bbbffae3ef325',40,'Стачивание зубцов фигурного лезвия коньков',NULL,2,10.00,'0000',0,1,'primary',0,NULL,13),(61,'b6e2b527122eed857c10ccf10e9dde3c',0,'Проведение занятий по физической культуре и спорту',NULL,1,0.00,'0000',0,1,'primary',0,NULL,13),(62,'c11b9ce6b4e33b438e629f1571d754c8',0,'Проведение спортивно-зрелищных мероприятий',NULL,1,0.00,'0000',0,1,'primary',0,NULL,13),(63,'706eeb99c8ffad1e0c8a6fc95eea918a',0,'Предоставление объектов физической культуры и спорта',NULL,1,0.00,'0000',0,1,'primary',0,NULL,13),(64,'ae30fca757d961e472f739dc34abc179',61,'Занятия по хоккею с шайбой (дети от 6 до 14 лет)',NULL,1,200.00,'0000',0,1,'primary',0,NULL,13),(65,'391f361f0c77645485755ba0da5edb65',61,'Занятия по хоккею с шайбой (взрослые)',NULL,1,300.00,'0000',0,1,'primary',0,NULL,13),(66,'2b86cf9f4c18d8feb2db60d0bcbab0ec',61,'Занятия по фигурному катанию на коньках (дети от 6 до 14 лет)',NULL,1,150.00,'0000',0,1,'primary',0,NULL,13),(67,'84243d85b5f3e999eada8519531d6497',61,'Занятия по фигурному катанию на коньках (взрослые)',NULL,1,250.00,'0000',0,1,'primary',0,NULL,13),(68,'ef76f30707daa233cf1f139e47662142',61,'Занятия по кёрлингу (дети от 6 до 14 лет)',NULL,1,200.00,'0000',0,1,'primary',0,NULL,13),(69,'8b95915f904ac8612a0aa66c3f8ea7fd',61,'Занятия по кёрлингу (взрослые)',NULL,1,350.00,'0000',0,1,'primary',0,NULL,13),(70,'ec65a1527bb3acd62c4c6e63df415d90',61,'Занятия в группах здоровье (взрослые) - 1 занятие',NULL,1,120.00,'0000',0,1,'primary',0,NULL,13),(71,'c3ff012bf2fd00e3ddbf48ef88e708b5',61,'Занятия в группах здоровье (взрослые) - абонемент (12 занятий)',NULL,1,1200.00,'0000',0,1,'primary',0,NULL,13),(72,'43c9bcd9a2f3099e381c0503dbd171b0',61,'Занятия в группах общей физической подготовки для взрослых - 1 занятие',NULL,1,150.00,'0000',0,1,'primary',0,NULL,13),(73,'b5044f94a55c85fe9fb9852603f646cc',61,'Занятия в группах общей физической подготовки для взрослых - абонемент (12 занятий)',NULL,1,1500.00,'0000',0,1,'primary',0,NULL,13),(74,'132b79bb431458f6f26178c7e1a3af43',61,'Занятия в группах общей физической подготовки для детей от 6 до 14 лет - 1 занятие',NULL,1,100.00,'0000',0,1,'primary',0,NULL,13),(75,'c3f3a26b3a4cd9dfd80da5b7d0fea1ae',61,'Занятия в группах общей физической подготовки для детей от 6 до 14 лет - абонемент (12 занятий)',NULL,1,800.00,'0000',0,1,'primary',0,NULL,13),(76,'f0e9744307986f0f03217ff140a82c9c',62,'Проведение спортивных и оздоровительных мероприятий',NULL,1,3000.00,'0000',0,1,'primary',0,NULL,13),(77,'fbfc6da3e4f14ea93ea762f9329bb714',62,'Музыкальное сопровождение спортивных и оздоровительных мероприятий',NULL,1,800.00,'0000',0,1,'primary',0,NULL,13),(78,'b2257e1a1f971902d781332410d25605',62,'Звуковое поздравление',NULL,1,100.00,'0000',0,1,'primary',0,NULL,13),(79,'2467cb087b25a64374167927af4ef62e',63,'Предоставление тренажерного зала',NULL,1,1500.00,'0000',0,1,'primary',0,NULL,13),(80,'3a2bbd8205a970a59af1e6dc6e55c26d',63,'Предоставление в пользование спортивных тренажеров',NULL,1,160.00,'0000',0,1,'primary',0,NULL,13),(81,'a30722f21d3e5789d9a841988766a091',63,'Предоставление в пользование спортивных тренажеров - абонемент (12 занятий)',NULL,1,1500.00,'0000',0,1,'primary',0,NULL,13),(82,'03beca38ef7c38f0946356a1775cc091',63,'Предоставление в пользование ледовых коньков',NULL,1,80.00,'0000',0,1,'primary',0,NULL,14),(83,'9877df8968d21f05611f3c6c5e49497d',63,'Предоставление в пользование настольного тенниса (1 стол)',NULL,1,80.00,'0000',0,1,'primary',0,NULL,13),(84,'fd41481e6f1ad49c8a77f3b85faf6be2',63,'Предоставление в пользование аэрохоккея',NULL,1,30.00,'0000',0,1,'primary',0,NULL,13),(85,'ae442e46c713ebe2ddf988f7b4183d22',63,'Предоставление спортивного зала',NULL,1,500.00,'0000',0,1,'primary',0,NULL,13),(86,'28c65d039fd65eb92cf5a0d04d9f6da0',63,'Предоставление ледовой арены (катка) по кёрлингу',NULL,1,2500.00,'0000',0,1,'primary',0,NULL,13),(87,'5aab59e77b9a676709fa5b867f2b026a',63,'Предоставление ледовой арены (катка) детских команд',NULL,1,2500.00,'0000',0,1,'primary',0,NULL,13),(88,'8f77dc992d4d65949cb861f8496d1016',63,'Предоставление ледовой арены (катка) в ночное время (с 24 до 6 часов)',NULL,1,4000.00,'0000',0,1,'primary',0,NULL,13),(89,'a32ea7d8322f509191340f61726db0ba',63,'Предоставление ледовой арены (катка) юношеских команд',NULL,1,4500.00,'0000',0,1,'primary',0,NULL,13),(90,'32ea7061b3c15097a327139930624091',63,'Предоставление ледовой арены (катка) - каток для двоих',NULL,1,5000.00,'0000',0,1,'primary',0,NULL,13),(91,'220bf299b4c9fc3bd6e915bb26d2ac7b',63,'Предоставление ледовой арены (катка) любительской хоккейной лиги',NULL,1,6000.00,'0000',0,1,'primary',0,NULL,13),(92,'c39986f50770f832ce0e41e97f0cebe3',63,'Предоставление ледовой арены (катка) взрослых команд',NULL,1,7000.00,'0000',0,1,'primary',0,NULL,13),(93,'a41391baf0226e5649cdbbe830a532d8',63,'Предоставление ледовой арены (катка) - корпоративного катания на коньках',NULL,1,8000.00,'0000',0,1,'primary',0,NULL,13),(94,'bf5ee3894a632a5c5e173a957e695765',63,'Предоставление ледового катка на улице - катание на коньках (взрослые), 1 посещение',NULL,1,70.00,'0000',0,1,'primary',0,NULL,13),(95,'0b7f584cb84c5435c9c1d9c5ad68bd85',63,'Предоставление ледового катка на улице  - катание на коньках (дети от 6 до 14 лет) 1 посещение',NULL,1,50.00,'0000',0,1,'primary',0,NULL,13),(96,'13e450758d01608d55b8bf4f7d8a68bf',63,'Предоставление ледового катка на улице - катание на коньках (дети до 6 лет), 1 посещение',NULL,1,30.00,'0000',0,1,'primary',0,NULL,13),(97,'2d0bd67ee51772c3efa3987646c6b7a5',63,'Предоставление большого футбольного поля на улице',NULL,1,600.00,'0000',0,1,'primary',0,NULL,13),(98,'54bb662d0247b99c9f256b1d8f18b3b6',63,'Предоставление малого футбольного поля на улице',NULL,1,250.00,'0000',0,1,'primary',0,NULL,13),(99,'ee652f9a110b10a9cd7a4ac67cf0126d',63,'Предоставление открытой спортивной площадки',NULL,1,400.00,'0000',0,1,'primary',0,NULL,13),(100,'c674cb1ef224d66747da4614628507da',0,'Прочие спортивные услуги',NULL,1,0.00,'0000',0,1,'primary',0,NULL,13),(101,'d71f5b6fb27724581ad6f2f7d36b5212',100,'Прием на хранение вещей потребителей услуг',NULL,1,50.00,'0000',0,1,'primary',0,NULL,13),(102,'0380df7b520a248ab2fa6b8233e8d537',100,'Размещение информации на бортах ледовой арены, стенах помещений спортивного комплекса',NULL,1,500.00,'0000',0,1,'primary',0,NULL,13),(103,'e65c3bc7b8c18a017cf7bc2023ac13d2',100,'Предоставление выставочных мест для пропаганды спортивных мероприятий',NULL,1,35.00,'0000',0,1,'primary',0,NULL,13),(104,'e09fba44a7e82f6b72518a3f3c05602b',100,'Предоставление дополнительной раздевалки',NULL,1,500.00,'0000',0,1,'primary',0,NULL,13),(105,'a38eba235560367af05d8f78d51b00b1',100,'Организация проживания участников спортивных сборов и соревнований - одноместный и двухместный номер с отдельным санузлом',NULL,1,600.00,'0000',0,1,'primary',0,NULL,13),(106,'eb3eacd52a586b026f7f129ae4f4e32e',100,'Организация проживания участников спортивных сборов и соревнований - четырехместный и шестиместный номер',NULL,1,350.00,'0000',0,1,'primary',0,NULL,13),(107,'2b295a7697629d9a4ea1d801c70d3841',100,'Заточка коньков',NULL,1,100.00,'0000',0,1,'primary',0,NULL,13),(108,'c24c8e5f376cf57d05b2e1c510aaa93f',100,'Заточка новых коньков',NULL,1,150.00,'0000',0,1,'primary',0,NULL,13),(109,'c28048bf8fe011daa459ef012d749983',100,'Заточка площадки лезвий хоккейных коньков',NULL,1,150.00,'0000',0,1,'primary',0,NULL,13),(110,'5d029b003187721b3209e6a3835820b3',100,'Замена лезвий коньков',NULL,1,50.00,'0000',0,1,'primary',0,NULL,13),(111,'7fe79ea94d058481a5ceceb02b393f38',100,'Замена стаканов (рамки) коньков',NULL,1,200.00,'0000',0,1,'primary',0,NULL,13),(112,'00227383ae5f4c8fc7f8e355aa9e3501',100,'Замена крюка клюшки - с отрезанием крюка клюшки',NULL,1,100.00,'0000',0,1,'primary',0,NULL,13),(113,'61715c310f8cf46f13cb2f4e3296b8f8',100,'Замена крюка клюшки - без отрезания крюка клюшки',NULL,1,50.00,'0000',0,1,'primary',0,NULL,13),(114,'f2e9de4ce952e5e34a1f6e0ddd7a2265',100,'Укорачивание клюшки - деревянная клюшка',NULL,1,20.00,'0000',0,1,'primary',0,NULL,13),(115,'064acfc9c3d3cfc5129168090646b9fa',100,'Укорачивание клюшки - пластиковая клюшка',NULL,1,50.00,'0000',0,1,'primary',0,NULL,13),(116,'a8adcd6b75f9f9436ec93eafeac40397',100,'Устранение люфта лезвий',NULL,1,25.00,'0000',0,1,'primary',0,NULL,13),(117,'1090b88754ed6fd13a60046c45180451',100,'Замена клепок на коньках - стальная клепка',NULL,1,15.00,'0000',0,1,'primary',0,NULL,13),(118,'f83afb848b0767a23e4f25fd8b450613',100,'Замена клепок на коньках - медная клепка',NULL,1,20.00,'0000',0,1,'primary',0,NULL,13),(119,'8d8a38e84cf619643a114deae3e73249',100,'Стачивание носка и пятки лезвий коньков',NULL,1,300.00,'0000',0,1,'primary',0,NULL,13),(120,'3a7cc0a5bd78aa76dfc29df3265ff884',100,'Стачивание зубцов фигурного лезвия коньков',NULL,1,10.00,'0000',0,1,'primary',0,NULL,13);
/*!40000 ALTER TABLE `custom_price_lds` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `custom_price_lds_bi` BEFORE INSERT ON `custom_price_lds` FOR EACH ROW BEGIN
   set new.md5 = md5(concat(new.id_parent, new.desc));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `custom_price_lds_bu` BEFORE UPDATE ON `custom_price_lds` FOR EACH ROW BEGIN
   set new.md5 = md5(concat(new.id_parent, new.desc));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `custom_price_lds_dayoff`
--

DROP TABLE IF EXISTS `custom_price_lds_dayoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_price_lds_dayoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_day` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_item` (`id_item`,`id_day`),
  CONSTRAINT `FK_custom_price_lds_dayoff_custom_price_lds` FOREIGN KEY (`id_item`) REFERENCES `custom_price_lds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_price_lds_dayoff`
--

LOCK TABLES `custom_price_lds_dayoff` WRITE;
/*!40000 ALTER TABLE `custom_price_lds_dayoff` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_price_lds_dayoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_price_lds_time`
--

DROP TABLE IF EXISTS `custom_price_lds_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_price_lds_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_day` int(11) DEFAULT NULL,
  `start` time DEFAULT NULL,
  `finish` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_item` (`id_item`,`id_day`),
  CONSTRAINT `FK_custom_price_lds_time_custom_price_lds` FOREIGN KEY (`id_item`) REFERENCES `custom_price_lds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_price_lds_time`
--

LOCK TABLES `custom_price_lds_time` WRITE;
/*!40000 ALTER TABLE `custom_price_lds_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_price_lds_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_days`
--

DROP TABLE IF EXISTS `extra_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL,
  `dt_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dt` (`dt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_days`
--

LOCK TABLES `extra_days` WRITE;
/*!40000 ALTER TABLE `extra_days` DISABLE KEYS */;
INSERT INTO `extra_days` VALUES (2,'2018-01-02',1);
/*!40000 ALTER TABLE `extra_days` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `extra_days_bi` BEFORE INSERT ON `extra_days` FOR EACH ROW BEGIN
   call year_schedule_fill(new.dt, new.dt);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `extra_days_bu` BEFORE UPDATE ON `extra_days` FOR EACH ROW BEGIN
   call year_schedule_fill(new.dt, new.dt);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `extra_days_bd` BEFORE DELETE ON `extra_days` FOR EACH ROW BEGIN
   call year_schedule_fill(old.dt, old.dt);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `general_settings`
--

DROP TABLE IF EXISTS `general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_timeout` int(11) NOT NULL DEFAULT '30',
  `params_xml` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_settings`
--

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;
INSERT INTO `general_settings` VALUES (1,33,'<!-- Этот файл сценария не рабочий, создан для удобства редактирования.\r\n    рабочий сценарий лежит в mySql -->\r\n<states>\r\n    <s1>\r\n        <desc>Терминал. Основной экран терминала</desc>\r\n        <screen>1</screen>\r\n        <check>\r\n            <hw>0</hw>\r\n        </check>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>30</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s1>\r\n\r\n    <s2>\r\n        <desc>Терминал. Прием денег</desc>\r\n        <check>\r\n            <hw>0</hw>\r\n        </check>\r\n        <screen>2</screen>\r\n        <cash>1</cash>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeoutNoMoney>100</timeoutNoMoney>\r\n            <timeoutPay>5</timeoutPay>\r\n            <timeout>400</timeout>\r\n            <action>pay</action>\r\n        </timer>\r\n    </s2>\r\n\r\n    <s3>\r\n        <desc>Терминал. Платеж</desc>\r\n        <screen>3</screen>\r\n        <print>\r\n            <top>4</top>\r\n            <elements>5</elements>\r\n            <bottom>6</bottom>\r\n            <rest>7</rest>\r\n        </print>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>5</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s3>\r\n\r\n    <s4></s4>\r\n    <s5></s5>\r\n    <s6></s6>\r\n    <s7></s7>\r\n\r\n    <s8>\r\n        <desc>Терминал. Ошибка работы с оборудованием</desc>\r\n        <screen>8</screen>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>10</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s8>\r\n\r\n    <s9>\r\n        <desc>Терминал. Инкассация</desc>\r\n        <screen>9</screen>\r\n    </s9>\r\n\r\n    <s10></s10>\r\n    <s11></s11>\r\n\r\n    <s12>\r\n        <desc>Терминал. Временно не работает</desc>\r\n        <screen>12</screen>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>10</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s12>\r\n\r\n    <s13>\r\n        <desc>Терминал. Ввод количества услуг</desc>\r\n        <screen>13</screen>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>100</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s13>\r\n\r\n    <s14>\r\n        <desc>Терминал. Ввод количества услуг</desc>\r\n        <screen>14</screen>\r\n        <timer>\r\n            <screen>1</screen>\r\n            <timeout>120</timeout>\r\n            <action>getServiceList</action>\r\n            <top>22</top>\r\n        </timer>\r\n    </s14>\r\n    \r\n    <s15></s15>\r\n\r\n    <s16>\r\n        <desc>Терминал. Ввод количества услуг</desc>\r\n        <screen>16</screen>\r\n        <timer>\r\n            <screen>14</screen>\r\n            <timeout>30</timeout>\r\n            <action>getServiceList</action>\r\n        </timer>\r\n    </s16>\r\n</states>');
/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hws_status`
--

DROP TABLE IF EXISTS `hws_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hws_status` (
  `id_user` int(11) NOT NULL,
  `type` varchar(12) NOT NULL,
  `dt` datetime DEFAULT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`type`,`id_user`),
  KEY `FK_hws_status_users` (`id_user`),
  CONSTRAINT `FK_hws_status_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hws_status`
--

LOCK TABLES `hws_status` WRITE;
/*!40000 ALTER TABLE `hws_status` DISABLE KEYS */;
INSERT INTO `hws_status` VALUES (52,'cash','2017-12-20 15:37:54',0,'банкнота принята 1000'),(52,'webSocket','2018-04-01 11:44:10',1,'ошибка');
/*!40000 ALTER TABLE `hws_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hws_status_bu` BEFORE UPDATE ON `hws_status` FOR EACH ROW BEGIN
    if (new.message != old.message) then
        insert into hws_status_history (id_user, `type`, dt, message, is_error)
        values (old.id_user, old.type, old.dt, old.message, old.is_error);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hws_status_history`
--

DROP TABLE IF EXISTS `hws_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hws_status_history` (
  `id_user` int(11) NOT NULL,
  `type` varchar(12) NOT NULL,
  `dt` datetime DEFAULT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT NULL,
  KEY `id_user` (`id_user`),
  KEY `dt` (`dt`),
  KEY `type` (`type`),
  CONSTRAINT `FK_hws_status_history_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hws_status_history`
--

LOCK TABLES `hws_status_history` WRITE;
/*!40000 ALTER TABLE `hws_status_history` DISABLE KEYS */;
INSERT INTO `hws_status_history` VALUES (52,'webSocket','2017-09-13 15:14:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:14:53',1,'ошибка'),(52,'webSocket','2017-09-13 15:14:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:15:21',1,'ошибка'),(52,'webSocket','2017-09-13 15:16:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:16:38',1,'ошибка'),(52,'webSocket','2017-09-13 15:16:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:16:40',1,'ошибка'),(52,'webSocket','2017-09-13 15:20:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:20:42',1,'ошибка'),(52,'webSocket','2017-09-13 15:24:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:24:03',1,'ошибка'),(52,'webSocket','2017-09-13 15:25:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:25:08',1,'ошибка'),(52,'webSocket','2017-09-13 15:27:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:27:39',1,'ошибка'),(52,'webSocket','2017-09-13 15:28:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 15:28:27',1,'ошибка'),(52,'webSocket','2017-09-13 16:47:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 16:47:20',1,'ошибка'),(52,'webSocket','2017-09-13 16:49:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 16:49:47',1,'ошибка'),(52,'webSocket','2017-09-13 16:52:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 16:52:50',1,'ошибка'),(52,'webSocket','2017-09-13 16:53:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 16:53:52',1,'ошибка'),(52,'webSocket','2017-09-13 17:00:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:00:59',1,'ошибка'),(52,'webSocket','2017-09-13 17:02:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:02:27',1,'ошибка'),(52,'webSocket','2017-09-13 17:10:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:10:55',1,'ошибка'),(52,'webSocket','2017-09-13 17:11:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:11:10',1,'ошибка'),(52,'webSocket','2017-09-13 17:12:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:12:32',1,'ошибка'),(52,'webSocket','2017-09-13 17:13:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:13:46',1,'ошибка'),(52,'webSocket','2017-09-13 17:14:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:14:02',1,'ошибка'),(52,'webSocket','2017-09-13 17:16:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:16:55',1,'ошибка'),(52,'webSocket','2017-09-13 17:19:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:19:22',1,'ошибка'),(52,'webSocket','2017-09-13 17:23:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:23:51',1,'ошибка'),(52,'webSocket','2017-09-13 17:27:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 17:27:28',1,'ошибка'),(52,'webSocket','2017-09-13 19:39:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 19:39:50',1,'ошибка'),(52,'webSocket','2017-09-13 19:39:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 19:39:53',1,'ошибка'),(52,'webSocket','2017-09-13 19:40:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-13 19:40:06',1,'ошибка'),(52,'webSocket','2017-09-14 10:41:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-14 10:41:49',1,'ошибка'),(52,'webSocket','2017-09-14 10:42:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-14 10:42:36',1,'ошибка'),(52,'webSocket','2017-09-14 10:42:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-14 10:42:38',1,'ошибка'),(52,'webSocket','2017-09-15 14:11:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-15 14:11:48',1,'ошибка'),(52,'webSocket','2017-09-19 14:45:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 14:45:04',1,'ошибка'),(52,'webSocket','2017-09-19 15:00:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:00:30',1,'ошибка'),(52,'webSocket','2017-09-19 15:00:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:00:46',1,'ошибка'),(52,'webSocket','2017-09-19 15:03:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:03:01',1,'ошибка'),(52,'webSocket','2017-09-19 15:06:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:06:19',1,'ошибка'),(52,'webSocket','2017-09-19 15:08:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:08:11',1,'ошибка'),(52,'webSocket','2017-09-19 15:08:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:08:16',1,'ошибка'),(52,'webSocket','2017-09-19 15:11:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:11:33',1,'ошибка'),(52,'webSocket','2017-09-19 15:12:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:12:07',1,'ошибка'),(52,'webSocket','2017-09-19 15:12:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:12:46',1,'ошибка'),(52,'webSocket','2017-09-19 15:13:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:13:08',1,'ошибка'),(52,'webSocket','2017-09-19 15:13:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:13:12',1,'ошибка'),(52,'webSocket','2017-09-19 15:14:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:14:34',1,'ошибка'),(52,'webSocket','2017-09-19 15:16:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:16:25',1,'ошибка'),(52,'webSocket','2017-09-19 15:16:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:16:43',1,'ошибка'),(52,'webSocket','2017-09-19 15:17:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:17:17',1,'ошибка'),(52,'webSocket','2017-09-19 15:17:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:17:33',1,'ошибка'),(52,'webSocket','2017-09-19 15:21:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:21:00',1,'ошибка'),(52,'webSocket','2017-09-19 15:21:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:21:05',1,'ошибка'),(52,'webSocket','2017-09-19 15:23:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:23:03',1,'ошибка'),(52,'webSocket','2017-09-19 15:23:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:23:51',1,'ошибка'),(52,'webSocket','2017-09-19 15:24:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:24:30',1,'ошибка'),(52,'webSocket','2017-09-19 15:25:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:25:33',1,'ошибка'),(52,'webSocket','2017-09-19 15:25:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:25:49',1,'ошибка'),(52,'webSocket','2017-09-19 15:25:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:25:51',1,'ошибка'),(52,'webSocket','2017-09-19 15:26:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:26:49',1,'ошибка'),(52,'webSocket','2017-09-19 15:27:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:27:11',1,'ошибка'),(52,'webSocket','2017-09-19 15:27:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 15:27:53',1,'ошибка'),(52,'webSocket','2017-09-19 16:07:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:07:57',1,'ошибка'),(52,'webSocket','2017-09-19 16:10:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:10:42',1,'ошибка'),(52,'webSocket','2017-09-19 16:11:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:11:29',1,'ошибка'),(52,'webSocket','2017-09-19 16:11:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:11:54',1,'ошибка'),(52,'webSocket','2017-09-19 16:12:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:12:27',1,'ошибка'),(52,'webSocket','2017-09-19 16:13:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:13:02',1,'ошибка'),(52,'webSocket','2017-09-19 16:13:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:13:26',1,'ошибка'),(52,'webSocket','2017-09-19 16:13:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:13:39',1,'ошибка'),(52,'webSocket','2017-09-19 16:14:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:14:35',1,'ошибка'),(52,'webSocket','2017-09-19 16:15:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-19 16:15:18',1,'ошибка'),(52,'webSocket','2017-09-20 19:34:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:34:10',1,'ошибка'),(52,'webSocket','2017-09-20 19:38:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:38:42',1,'ошибка'),(52,'webSocket','2017-09-20 19:38:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:38:56',1,'ошибка'),(52,'webSocket','2017-09-20 19:39:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:39:30',1,'ошибка'),(52,'webSocket','2017-09-20 19:41:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:41:39',1,'ошибка'),(52,'webSocket','2017-09-20 19:42:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:42:08',1,'ошибка'),(52,'webSocket','2017-09-20 19:42:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:42:59',1,'ошибка'),(52,'webSocket','2017-09-20 19:43:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:43:45',1,'ошибка'),(52,'webSocket','2017-09-20 19:47:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:47:47',1,'ошибка'),(52,'webSocket','2017-09-20 19:49:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:49:40',1,'ошибка'),(52,'webSocket','2017-09-20 19:51:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:51:15',1,'ошибка'),(52,'webSocket','2017-09-20 19:51:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:51:39',1,'ошибка'),(52,'webSocket','2017-09-20 19:53:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:53:42',1,'ошибка'),(52,'webSocket','2017-09-20 19:54:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:54:43',1,'ошибка'),(52,'webSocket','2017-09-20 19:55:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:55:33',1,'ошибка'),(52,'webSocket','2017-09-20 19:56:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 19:56:29',1,'ошибка'),(52,'webSocket','2017-09-20 20:02:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 20:02:42',1,'ошибка'),(52,'webSocket','2017-09-20 20:08:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-20 20:08:06',1,'ошибка'),(52,'webSocket','2017-09-21 22:48:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-21 22:48:54',1,'ошибка'),(52,'webSocket','2017-09-26 12:45:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-26 12:45:10',1,'ошибка'),(52,'webSocket','2017-09-26 12:46:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-26 12:46:54',1,'ошибка'),(52,'webSocket','2017-09-26 13:04:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-26 13:04:36',1,'ошибка'),(52,'webSocket','2017-09-26 13:05:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-09-26 13:05:17',1,'ошибка'),(52,'webSocket','2017-10-25 15:16:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-25 15:16:44',1,'ошибка'),(52,'webSocket','2017-10-25 18:22:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-25 18:22:25',1,'ошибка'),(52,'webSocket','2017-10-27 17:23:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:23:49',1,'ошибка'),(52,'webSocket','2017-10-27 17:24:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:24:18',1,'ошибка'),(52,'webSocket','2017-10-27 17:29:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:29:26',1,'ошибка'),(52,'webSocket','2017-10-27 17:39:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:39:58',1,'ошибка'),(52,'webSocket','2017-10-27 17:40:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:40:44',1,'ошибка'),(52,'webSocket','2017-10-27 17:41:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:41:19',1,'ошибка'),(52,'webSocket','2017-10-27 17:52:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-27 17:52:32',1,'ошибка'),(52,'webSocket','2017-10-29 01:41:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-29 01:41:22',1,'ошибка'),(52,'webSocket','2017-10-30 14:45:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-10-30 14:45:11',1,'ошибка'),(52,'webSocket','2017-11-17 13:46:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-17 13:46:04',1,'ошибка'),(52,'webSocket','2017-11-17 13:48:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-17 13:48:04',1,'ошибка'),(52,'webSocket','2017-11-17 13:50:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-17 13:50:21',1,'ошибка'),(52,'webSocket','2017-11-17 13:51:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-17 13:51:29',1,'ошибка'),(52,'webSocket','2017-11-17 13:52:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-17 13:52:58',1,'ошибка'),(52,'webSocket','2017-11-19 18:34:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-19 18:34:01',1,'ошибка'),(52,'webSocket','2017-11-19 18:38:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-19 18:38:01',1,'ошибка'),(52,'webSocket','2017-11-19 18:40:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-19 18:40:01',1,'ошибка'),(52,'webSocket','2017-11-21 10:51:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 10:51:06',1,'ошибка'),(52,'webSocket','2017-11-21 10:53:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 10:53:57',1,'ошибка'),(52,'webSocket','2017-11-21 14:14:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 14:14:49',1,'ошибка'),(52,'webSocket','2017-11-21 14:38:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 14:38:00',1,'ошибка'),(52,'webSocket','2017-11-21 15:33:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 15:33:59',1,'ошибка'),(52,'webSocket','2017-11-21 16:23:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-21 16:23:32',1,'ошибка'),(52,'webSocket','2017-11-29 12:50:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 12:50:00',1,'ошибка'),(52,'webSocket','2017-11-29 12:51:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 12:51:52',1,'ошибка'),(52,'webSocket','2017-11-29 14:28:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 14:28:17',1,'ошибка'),(52,'webSocket','2017-11-29 14:55:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 14:55:23',1,'ошибка'),(52,'webSocket','2017-11-29 14:56:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 14:56:50',1,'ошибка'),(52,'webSocket','2017-11-29 14:57:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 14:57:52',1,'ошибка'),(52,'webSocket','2017-11-29 16:30:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 16:30:08',1,'ошибка'),(52,'webSocket','2017-11-29 16:46:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 16:46:38',1,'ошибка'),(52,'webSocket','2017-11-29 22:38:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-29 22:38:29',1,'ошибка'),(52,'webSocket','2017-11-30 10:45:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 10:45:50',1,'ошибка'),(52,'webSocket','2017-11-30 12:13:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 12:13:02',1,'ошибка'),(52,'webSocket','2017-11-30 12:19:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 12:19:49',1,'ошибка'),(52,'webSocket','2017-11-30 14:46:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:46:06',1,'ошибка'),(52,'webSocket','2017-11-30 14:47:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:47:15',1,'ошибка'),(52,'webSocket','2017-11-30 14:51:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:51:40',1,'ошибка'),(52,'webSocket','2017-11-30 14:52:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:52:24',1,'ошибка'),(52,'webSocket','2017-11-30 14:53:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:53:11',1,'ошибка'),(52,'webSocket','2017-11-30 14:57:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:57:09',1,'ошибка'),(52,'webSocket','2017-11-30 14:59:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 14:59:19',1,'ошибка'),(52,'webSocket','2017-11-30 15:02:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 15:02:37',1,'ошибка'),(52,'webSocket','2017-11-30 15:03:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 15:03:36',1,'ошибка'),(52,'webSocket','2017-11-30 15:05:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 15:05:41',1,'ошибка'),(52,'webSocket','2017-11-30 15:06:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 15:06:33',1,'ошибка'),(52,'webSocket','2017-11-30 15:33:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 15:33:23',1,'ошибка'),(52,'webSocket','2017-11-30 15:38:31',1,'Нет соединения с оборудованием'),(52,'cash','2017-11-30 15:33:47',0,'банкнота принята 100'),(52,'cash','2017-11-30 15:38:58',0,'банкнота принята 1'),(52,'webSocket','2017-11-30 15:38:31',1,'ошибка'),(52,'webSocket','2017-11-30 16:05:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 16:05:40',1,'ошибка'),(52,'webSocket','2017-11-30 16:16:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 16:16:44',1,'ошибка'),(52,'webSocket','2017-11-30 16:18:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 16:18:15',1,'ошибка'),(52,'webSocket','2017-11-30 17:12:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 17:12:00',1,'ошибка'),(52,'webSocket','2017-11-30 18:14:34',1,'Нет соединения с оборудованием'),(52,'cash','2017-11-30 19:08:25',0,'банкнота принята 100'),(52,'cash','2017-11-30 19:09:02',0,'банкнота принята 10'),(52,'cash','2017-11-30 19:09:37',0,'банкнота принята 50'),(52,'webSocket','2017-11-30 18:14:34',1,'ошибка'),(52,'webSocket','2017-11-30 19:36:09',1,'Нет соединения с оборудованием'),(52,'cash','2017-11-30 19:37:11',0,'банкнота принята 100'),(52,'cash','2017-11-30 19:37:59',0,'банкнота принята 50'),(52,'webSocket','2017-11-30 19:36:09',1,'ошибка'),(52,'webSocket','2017-11-30 20:30:12',1,'Нет соединения с оборудованием'),(52,'cash','2017-11-30 19:38:23',0,'банкнота принята 10'),(52,'webSocket','2017-11-30 20:30:12',1,'ошибка'),(52,'webSocket','2017-11-30 20:31:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:31:58',1,'ошибка'),(52,'webSocket','2017-11-30 20:32:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:32:46',1,'ошибка'),(52,'webSocket','2017-11-30 20:37:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:37:46',1,'ошибка'),(52,'webSocket','2017-11-30 20:39:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:39:00',1,'ошибка'),(52,'webSocket','2017-11-30 20:39:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:39:26',1,'ошибка'),(52,'webSocket','2017-11-30 20:40:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:40:01',1,'ошибка'),(52,'webSocket','2017-11-30 20:40:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:40:31',1,'ошибка'),(52,'webSocket','2017-11-30 20:43:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:43:30',1,'ошибка'),(52,'webSocket','2017-11-30 20:45:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:45:20',1,'ошибка'),(52,'webSocket','2017-11-30 20:45:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:45:24',1,'ошибка'),(52,'webSocket','2017-11-30 20:46:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:46:33',1,'ошибка'),(52,'webSocket','2017-11-30 20:47:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:47:47',1,'ошибка'),(52,'webSocket','2017-11-30 20:48:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:48:28',1,'ошибка'),(52,'webSocket','2017-11-30 20:50:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:50:12',1,'ошибка'),(52,'webSocket','2017-11-30 20:52:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:52:04',1,'ошибка'),(52,'webSocket','2017-11-30 20:52:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:52:16',1,'ошибка'),(52,'webSocket','2017-11-30 20:52:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:52:48',1,'ошибка'),(52,'webSocket','2017-11-30 20:53:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:53:56',1,'ошибка'),(52,'webSocket','2017-11-30 20:54:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:54:05',1,'ошибка'),(52,'webSocket','2017-11-30 20:57:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:57:19',1,'ошибка'),(52,'webSocket','2017-11-30 20:58:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-11-30 20:58:31',1,'ошибка'),(52,'webSocket','2017-12-02 09:07:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:07:10',1,'ошибка'),(52,'webSocket','2017-12-02 09:16:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:16:53',1,'ошибка'),(52,'webSocket','2017-12-02 09:21:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:21:39',1,'ошибка'),(52,'webSocket','2017-12-02 09:27:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:27:33',1,'ошибка'),(52,'webSocket','2017-12-02 09:28:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:28:54',1,'ошибка'),(52,'webSocket','2017-12-02 09:30:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:30:51',1,'ошибка'),(52,'webSocket','2017-12-02 09:31:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:31:53',1,'ошибка'),(52,'webSocket','2017-12-02 09:33:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:33:27',1,'ошибка'),(52,'webSocket','2017-12-02 09:36:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-02 09:36:19',1,'ошибка'),(52,'webSocket','2017-12-02 09:39:03',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-02 09:39:41',0,'банкнота принята 100'),(52,'webSocket','2017-12-02 09:39:03',1,'ошибка'),(52,'webSocket','2017-12-03 23:06:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:06:33',1,'ошибка'),(52,'webSocket','2017-12-03 23:07:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:07:42',1,'ошибка'),(52,'webSocket','2017-12-03 23:11:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:11:25',1,'ошибка'),(52,'webSocket','2017-12-03 23:20:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:20:01',1,'ошибка'),(52,'webSocket','2017-12-03 23:22:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:22:20',1,'ошибка'),(52,'webSocket','2017-12-03 23:22:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-03 23:22:24',1,'ошибка'),(52,'webSocket','2017-12-04 11:18:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:18:13',1,'ошибка'),(52,'webSocket','2017-12-04 11:22:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:22:38',1,'ошибка'),(52,'webSocket','2017-12-04 11:26:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:26:33',1,'ошибка'),(52,'webSocket','2017-12-04 11:30:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:30:43',1,'ошибка'),(52,'webSocket','2017-12-04 11:32:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:32:00',1,'ошибка'),(52,'webSocket','2017-12-04 11:35:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:35:35',1,'ошибка'),(52,'webSocket','2017-12-04 11:39:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:39:05',1,'ошибка'),(52,'webSocket','2017-12-04 11:40:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:40:32',1,'ошибка'),(52,'webSocket','2017-12-04 11:40:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:40:58',1,'ошибка'),(52,'webSocket','2017-12-04 11:48:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:48:21',1,'ошибка'),(52,'webSocket','2017-12-04 11:50:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:50:49',1,'ошибка'),(52,'webSocket','2017-12-04 11:53:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:53:15',1,'ошибка'),(52,'webSocket','2017-12-04 11:53:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 11:53:55',1,'ошибка'),(52,'webSocket','2017-12-04 12:03:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:03:25',1,'ошибка'),(52,'webSocket','2017-12-04 12:04:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:04:00',1,'ошибка'),(52,'webSocket','2017-12-04 12:04:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:04:44',1,'ошибка'),(52,'webSocket','2017-12-04 12:06:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:06:02',1,'ошибка'),(52,'webSocket','2017-12-04 12:08:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:08:26',1,'ошибка'),(52,'webSocket','2017-12-04 12:08:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:08:29',1,'ошибка'),(52,'webSocket','2017-12-04 12:10:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:10:15',1,'ошибка'),(52,'webSocket','2017-12-04 12:11:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:11:43',1,'ошибка'),(52,'webSocket','2017-12-04 12:27:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:27:37',1,'ошибка'),(52,'webSocket','2017-12-04 12:29:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:29:24',1,'ошибка'),(52,'webSocket','2017-12-04 12:30:35',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-03 23:07:36',0,'банкнота принята 1000'),(52,'cash','2017-12-04 12:35:41',0,'банкнота принята 100'),(52,'webSocket','2017-12-04 12:30:35',1,'ошибка'),(52,'webSocket','2017-12-04 12:39:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:39:13',1,'ошибка'),(52,'webSocket','2017-12-04 12:40:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:40:32',1,'ошибка'),(52,'webSocket','2017-12-04 12:41:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 12:41:49',1,'ошибка'),(52,'webSocket','2017-12-04 13:34:37',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-04 13:34:59',0,'банкнота принята 1000'),(52,'cash','2017-12-04 13:40:43',0,'банкнота принята 500'),(52,'webSocket','2017-12-04 13:34:37',1,'ошибка'),(52,'webSocket','2017-12-04 14:24:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:24:26',1,'ошибка'),(52,'webSocket','2017-12-04 14:29:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:29:45',1,'ошибка'),(52,'webSocket','2017-12-04 14:30:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:30:47',1,'ошибка'),(52,'webSocket','2017-12-04 14:34:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:34:21',1,'ошибка'),(52,'webSocket','2017-12-04 14:46:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:46:21',1,'ошибка'),(52,'webSocket','2017-12-04 14:50:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:50:35',1,'ошибка'),(52,'webSocket','2017-12-04 14:52:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:52:51',1,'ошибка'),(52,'webSocket','2017-12-04 14:55:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:55:02',1,'ошибка'),(52,'webSocket','2017-12-04 14:55:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:55:09',1,'ошибка'),(52,'webSocket','2017-12-04 14:57:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:57:55',1,'ошибка'),(52,'webSocket','2017-12-04 14:59:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 14:59:21',1,'ошибка'),(52,'webSocket','2017-12-04 15:06:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:06:57',1,'ошибка'),(52,'webSocket','2017-12-04 15:20:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:20:53',1,'ошибка'),(52,'webSocket','2017-12-04 15:21:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:21:56',1,'ошибка'),(52,'webSocket','2017-12-04 15:22:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:22:45',1,'ошибка'),(52,'webSocket','2017-12-04 15:23:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:23:46',1,'ошибка'),(52,'webSocket','2017-12-04 15:26:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:38:35',1,'ошибка'),(52,'webSocket','2017-12-04 15:45:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:45:49',1,'ошибка'),(52,'webSocket','2017-12-04 15:52:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:52:50',1,'ошибка'),(52,'webSocket','2017-12-04 15:59:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 15:59:20',1,'ошибка'),(52,'webSocket','2017-12-04 16:07:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:07:17',1,'ошибка'),(52,'webSocket','2017-12-04 16:08:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:08:36',1,'ошибка'),(52,'webSocket','2017-12-04 16:14:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:14:50',1,'ошибка'),(52,'webSocket','2017-12-04 16:17:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:17:48',1,'ошибка'),(52,'webSocket','2017-12-04 16:17:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:17:55',1,'ошибка'),(52,'webSocket','2017-12-04 16:24:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:24:53',1,'ошибка'),(52,'webSocket','2017-12-04 16:30:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 16:30:22',1,'ошибка'),(52,'webSocket','2017-12-04 19:33:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-04 19:33:50',1,'ошибка'),(52,'webSocket','2017-12-05 08:58:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-05 08:58:36',1,'ошибка'),(52,'webSocket','2017-12-05 12:59:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-05 12:59:33',1,'ошибка'),(52,'webSocket','2017-12-05 15:19:26',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-04 16:26:41',0,'банкнота принята 100'),(52,'webSocket','2017-12-05 15:19:26',1,'ошибка'),(52,'webSocket','2017-12-05 17:18:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-05 17:18:16',1,'ошибка'),(52,'webSocket','2017-12-08 11:51:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 11:51:39',1,'ошибка'),(52,'webSocket','2017-12-08 11:54:49',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-05 15:29:28',0,'банкнота принята 1000'),(52,'webSocket','2017-12-08 11:54:49',1,'ошибка'),(52,'webSocket','2017-12-08 13:46:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 13:46:45',1,'ошибка'),(52,'webSocket','2017-12-08 13:47:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 13:47:10',1,'ошибка'),(52,'webSocket','2017-12-08 13:51:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 13:51:08',1,'ошибка'),(52,'webSocket','2017-12-08 13:56:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 13:56:02',1,'ошибка'),(52,'webSocket','2017-12-08 13:58:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 13:58:49',1,'ошибка'),(52,'webSocket','2017-12-08 14:00:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-08 14:00:16',1,'ошибка'),(52,'webSocket','2017-12-19 11:22:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-19 11:22:04',1,'ошибка'),(52,'webSocket','2017-12-19 11:49:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-19 11:49:46',1,'ошибка'),(52,'webSocket','2017-12-19 11:57:30',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-08 14:00:51',0,'банкнота принята 100'),(52,'webSocket','2017-12-19 11:57:30',1,'ошибка'),(52,'webSocket','2017-12-19 21:17:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-19 21:17:43',1,'ошибка'),(52,'webSocket','2017-12-20 15:02:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-20 15:02:37',1,'ошибка'),(52,'webSocket','2017-12-20 15:09:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-20 15:09:07',1,'ошибка'),(52,'webSocket','2017-12-20 15:12:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2017-12-20 15:12:58',1,'ошибка'),(52,'webSocket','2017-12-20 15:13:33',1,'Нет соединения с оборудованием'),(52,'cash','2017-12-19 12:46:48',0,'банкнота принята 1000'),(52,'cash','2017-12-20 15:30:05',0,'банкнота принята 500'),(52,'webSocket','2017-12-20 15:13:33',1,'ошибка'),(52,'webSocket','2018-03-03 18:30:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-03 18:30:00',1,'ошибка'),(52,'webSocket','2018-03-03 18:33:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-03 18:33:15',1,'ошибка'),(52,'webSocket','2018-03-03 18:33:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 10:17:46',1,'ошибка'),(52,'webSocket','2018-03-04 10:42:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 10:42:20',1,'ошибка'),(52,'webSocket','2018-03-04 10:42:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 10:42:22',1,'ошибка'),(52,'webSocket','2018-03-04 11:17:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:17:24',1,'ошибка'),(52,'webSocket','2018-03-04 11:19:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:19:34',1,'ошибка'),(52,'webSocket','2018-03-04 11:20:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:20:46',1,'ошибка'),(52,'webSocket','2018-03-04 11:25:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:25:55',1,'ошибка'),(52,'webSocket','2018-03-04 11:25:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:25:56',1,'ошибка'),(52,'webSocket','2018-03-04 11:25:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:25:58',1,'ошибка'),(52,'webSocket','2018-03-04 11:26:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:26:57',1,'ошибка'),(52,'webSocket','2018-03-04 11:35:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 11:35:08',1,'ошибка'),(52,'webSocket','2018-03-04 12:03:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:03:09',1,'ошибка'),(52,'webSocket','2018-03-04 12:03:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:03:12',1,'ошибка'),(52,'webSocket','2018-03-04 12:05:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:05:24',1,'ошибка'),(52,'webSocket','2018-03-04 12:13:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:13:51',1,'ошибка'),(52,'webSocket','2018-03-04 12:14:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:14:40',1,'ошибка'),(52,'webSocket','2018-03-04 12:14:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:14:51',1,'ошибка'),(52,'webSocket','2018-03-04 12:17:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:17:09',1,'ошибка'),(52,'webSocket','2018-03-04 12:17:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:17:52',1,'ошибка'),(52,'webSocket','2018-03-04 12:18:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:18:33',1,'ошибка'),(52,'webSocket','2018-03-04 12:19:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:19:48',1,'ошибка'),(52,'webSocket','2018-03-04 12:22:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:22:17',1,'ошибка'),(52,'webSocket','2018-03-04 12:27:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 12:27:13',1,'ошибка'),(52,'webSocket','2018-03-04 13:13:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:13:34',1,'ошибка'),(52,'webSocket','2018-03-04 13:14:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:14:05',1,'ошибка'),(52,'webSocket','2018-03-04 13:19:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:19:12',1,'ошибка'),(52,'webSocket','2018-03-04 13:20:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:20:07',1,'ошибка'),(52,'webSocket','2018-03-04 13:22:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:22:14',1,'ошибка'),(52,'webSocket','2018-03-04 13:23:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:23:11',1,'ошибка'),(52,'webSocket','2018-03-04 13:24:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:24:43',1,'ошибка'),(52,'webSocket','2018-03-04 13:25:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:25:08',1,'ошибка'),(52,'webSocket','2018-03-04 13:25:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:25:52',1,'ошибка'),(52,'webSocket','2018-03-04 13:26:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:26:38',1,'ошибка'),(52,'webSocket','2018-03-04 13:30:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:30:39',1,'ошибка'),(52,'webSocket','2018-03-04 13:32:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:32:58',1,'ошибка'),(52,'webSocket','2018-03-04 13:33:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:33:01',1,'ошибка'),(52,'webSocket','2018-03-04 13:33:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:33:28',1,'ошибка'),(52,'webSocket','2018-03-04 13:36:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:36:41',1,'ошибка'),(52,'webSocket','2018-03-04 13:37:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:37:32',1,'ошибка'),(52,'webSocket','2018-03-04 13:39:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:39:25',1,'ошибка'),(52,'webSocket','2018-03-04 13:42:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:42:26',1,'ошибка'),(52,'webSocket','2018-03-04 13:42:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-04 13:42:28',1,'ошибка'),(52,'webSocket','2018-03-04 13:47:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 10:30:40',1,'ошибка'),(52,'webSocket','2018-03-08 11:01:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:01:58',1,'ошибка'),(52,'webSocket','2018-03-08 11:03:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:03:47',1,'ошибка'),(52,'webSocket','2018-03-08 11:12:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:12:03',1,'ошибка'),(52,'webSocket','2018-03-08 11:21:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:21:17',1,'ошибка'),(52,'webSocket','2018-03-08 11:22:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:22:20',1,'ошибка'),(52,'webSocket','2018-03-08 11:22:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:22:57',1,'ошибка'),(52,'webSocket','2018-03-08 11:24:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:24:34',1,'ошибка'),(52,'webSocket','2018-03-08 11:25:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:25:07',1,'ошибка'),(52,'webSocket','2018-03-08 11:26:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:26:44',1,'ошибка'),(52,'webSocket','2018-03-08 11:27:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:27:28',1,'ошибка'),(52,'webSocket','2018-03-08 11:28:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:28:03',1,'ошибка'),(52,'webSocket','2018-03-08 11:28:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:28:26',1,'ошибка'),(52,'webSocket','2018-03-08 11:29:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:29:30',1,'ошибка'),(52,'webSocket','2018-03-08 11:35:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:35:42',1,'ошибка'),(52,'webSocket','2018-03-08 11:36:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:36:21',1,'ошибка'),(52,'webSocket','2018-03-08 11:38:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:38:20',1,'ошибка'),(52,'webSocket','2018-03-08 11:41:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:41:48',1,'ошибка'),(52,'webSocket','2018-03-08 11:46:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:46:52',1,'ошибка'),(52,'webSocket','2018-03-08 11:50:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:50:05',1,'ошибка'),(52,'webSocket','2018-03-08 11:53:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 11:53:03',1,'ошибка'),(52,'webSocket','2018-03-08 13:22:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:22:51',1,'ошибка'),(52,'webSocket','2018-03-08 13:23:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:23:16',1,'ошибка'),(52,'webSocket','2018-03-08 13:23:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:23:46',1,'ошибка'),(52,'webSocket','2018-03-08 13:24:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:24:15',1,'ошибка'),(52,'webSocket','2018-03-08 13:24:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:24:46',1,'ошибка'),(52,'webSocket','2018-03-08 13:28:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:28:41',1,'ошибка'),(52,'webSocket','2018-03-08 13:30:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:30:31',1,'ошибка'),(52,'webSocket','2018-03-08 13:33:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:33:44',1,'ошибка'),(52,'webSocket','2018-03-08 13:51:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 13:51:28',1,'ошибка'),(52,'webSocket','2018-03-08 16:03:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:03:06',1,'ошибка'),(52,'webSocket','2018-03-08 16:20:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:20:12',1,'ошибка'),(52,'webSocket','2018-03-08 16:37:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:37:10',1,'ошибка'),(52,'webSocket','2018-03-08 16:43:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:43:56',1,'ошибка'),(52,'webSocket','2018-03-08 16:45:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:45:45',1,'ошибка'),(52,'webSocket','2018-03-08 16:47:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:47:28',1,'ошибка'),(52,'webSocket','2018-03-08 16:51:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:51:16',1,'ошибка'),(52,'webSocket','2018-03-08 16:54:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:54:00',1,'ошибка'),(52,'webSocket','2018-03-08 16:56:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 16:56:18',1,'ошибка'),(52,'webSocket','2018-03-08 17:01:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 17:01:39',1,'ошибка'),(52,'webSocket','2018-03-08 17:02:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 17:02:40',1,'ошибка'),(52,'webSocket','2018-03-08 18:38:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 18:38:05',1,'ошибка'),(52,'webSocket','2018-03-08 18:53:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 18:53:07',1,'ошибка'),(52,'webSocket','2018-03-08 18:54:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 18:54:41',1,'ошибка'),(52,'webSocket','2018-03-08 18:59:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 18:59:51',1,'ошибка'),(52,'webSocket','2018-03-08 19:01:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-08 19:01:41',1,'ошибка'),(52,'webSocket','2018-03-08 19:04:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 01:48:48',1,'ошибка'),(52,'webSocket','2018-03-09 10:35:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 10:35:09',1,'ошибка'),(52,'webSocket','2018-03-09 10:52:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 10:52:58',1,'ошибка'),(52,'webSocket','2018-03-09 11:19:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 11:19:37',1,'ошибка'),(52,'webSocket','2018-03-09 11:42:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 11:42:19',1,'ошибка'),(52,'webSocket','2018-03-09 12:01:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 12:01:47',1,'ошибка'),(52,'webSocket','2018-03-09 13:41:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 13:41:57',1,'ошибка'),(52,'webSocket','2018-03-09 16:32:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 16:32:33',1,'ошибка'),(52,'webSocket','2018-03-09 16:33:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 16:33:32',1,'ошибка'),(52,'webSocket','2018-03-09 16:59:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 16:59:25',1,'ошибка'),(52,'webSocket','2018-03-09 18:59:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 18:59:49',1,'ошибка'),(52,'webSocket','2018-03-09 19:07:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 19:07:43',1,'ошибка'),(52,'webSocket','2018-03-09 19:09:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 19:09:22',1,'ошибка'),(52,'webSocket','2018-03-09 20:30:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:30:22',1,'ошибка'),(52,'webSocket','2018-03-09 20:31:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:31:23',1,'ошибка'),(52,'webSocket','2018-03-09 20:33:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:33:36',1,'ошибка'),(52,'webSocket','2018-03-09 20:35:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:35:10',1,'ошибка'),(52,'webSocket','2018-03-09 20:51:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:51:02',1,'ошибка'),(52,'webSocket','2018-03-09 20:54:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:54:52',1,'ошибка'),(52,'webSocket','2018-03-09 20:54:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:54:59',1,'ошибка'),(52,'webSocket','2018-03-09 20:56:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 20:56:25',1,'ошибка'),(52,'webSocket','2018-03-09 21:07:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:07:12',1,'ошибка'),(52,'webSocket','2018-03-09 21:08:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:08:35',1,'ошибка'),(52,'webSocket','2018-03-09 21:12:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:12:41',1,'ошибка'),(52,'webSocket','2018-03-09 21:18:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:18:43',1,'ошибка'),(52,'webSocket','2018-03-09 21:20:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:20:01',1,'ошибка'),(52,'webSocket','2018-03-09 21:21:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:21:35',1,'ошибка'),(52,'webSocket','2018-03-09 21:29:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:29:13',1,'ошибка'),(52,'webSocket','2018-03-09 21:29:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:29:43',1,'ошибка'),(52,'webSocket','2018-03-09 21:32:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:32:21',1,'ошибка'),(52,'webSocket','2018-03-09 21:33:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:33:51',1,'ошибка'),(52,'webSocket','2018-03-09 21:35:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:35:27',1,'ошибка'),(52,'webSocket','2018-03-09 21:38:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:38:47',1,'ошибка'),(52,'webSocket','2018-03-09 21:40:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:40:25',1,'ошибка'),(52,'webSocket','2018-03-09 21:55:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:55:54',1,'ошибка'),(52,'webSocket','2018-03-09 21:58:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 21:58:56',1,'ошибка'),(52,'webSocket','2018-03-09 22:07:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 22:07:20',1,'ошибка'),(52,'webSocket','2018-03-09 22:10:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 22:10:21',1,'ошибка'),(52,'webSocket','2018-03-09 22:16:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-09 22:16:44',1,'ошибка'),(52,'webSocket','2018-03-10 09:22:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 09:22:35',1,'ошибка'),(52,'webSocket','2018-03-10 14:55:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 14:55:52',1,'ошибка'),(52,'webSocket','2018-03-10 14:57:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 14:57:39',1,'ошибка'),(52,'webSocket','2018-03-10 14:58:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 14:58:10',1,'ошибка'),(52,'webSocket','2018-03-10 14:58:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 14:58:53',1,'ошибка'),(52,'webSocket','2018-03-10 14:59:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 14:59:58',1,'ошибка'),(52,'webSocket','2018-03-10 15:00:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 15:00:23',1,'ошибка'),(52,'webSocket','2018-03-10 15:01:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 15:01:11',1,'ошибка'),(52,'webSocket','2018-03-10 16:41:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 16:41:20',1,'ошибка'),(52,'webSocket','2018-03-10 16:47:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 16:47:02',1,'ошибка'),(52,'webSocket','2018-03-10 16:48:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 16:48:41',1,'ошибка'),(52,'webSocket','2018-03-10 16:55:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 16:55:55',1,'ошибка'),(52,'webSocket','2018-03-10 17:05:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:05:52',1,'ошибка'),(52,'webSocket','2018-03-10 17:10:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:10:33',1,'ошибка'),(52,'webSocket','2018-03-10 17:17:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:17:56',1,'ошибка'),(52,'webSocket','2018-03-10 17:34:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:34:00',1,'ошибка'),(52,'webSocket','2018-03-10 17:35:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:35:35',1,'ошибка'),(52,'webSocket','2018-03-10 17:37:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:37:51',1,'ошибка'),(52,'webSocket','2018-03-10 17:40:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:40:55',1,'ошибка'),(52,'webSocket','2018-03-10 17:44:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:44:38',1,'ошибка'),(52,'webSocket','2018-03-10 17:49:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:49:55',1,'ошибка'),(52,'webSocket','2018-03-10 17:50:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:50:35',1,'ошибка'),(52,'webSocket','2018-03-10 17:51:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:51:21',1,'ошибка'),(52,'webSocket','2018-03-10 17:52:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:52:03',1,'ошибка'),(52,'webSocket','2018-03-10 17:52:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:52:05',1,'ошибка'),(52,'webSocket','2018-03-10 17:52:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:52:07',1,'ошибка'),(52,'webSocket','2018-03-10 17:52:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 17:52:30',1,'ошибка'),(52,'webSocket','2018-03-10 18:04:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:04:07',1,'ошибка'),(52,'webSocket','2018-03-10 18:08:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:08:34',1,'ошибка'),(52,'webSocket','2018-03-10 18:09:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:09:41',1,'ошибка'),(52,'webSocket','2018-03-10 18:14:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:14:07',1,'ошибка'),(52,'webSocket','2018-03-10 18:15:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:15:12',1,'ошибка'),(52,'webSocket','2018-03-10 18:16:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:16:07',1,'ошибка'),(52,'webSocket','2018-03-10 18:18:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:18:47',1,'ошибка'),(52,'webSocket','2018-03-10 18:41:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:41:03',1,'ошибка'),(52,'webSocket','2018-03-10 18:47:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:47:07',1,'ошибка'),(52,'webSocket','2018-03-10 18:48:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:48:08',1,'ошибка'),(52,'webSocket','2018-03-10 18:49:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:49:51',1,'ошибка'),(52,'webSocket','2018-03-10 18:50:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:50:52',1,'ошибка'),(52,'webSocket','2018-03-10 18:54:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:54:10',1,'ошибка'),(52,'webSocket','2018-03-10 18:55:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 18:55:38',1,'ошибка'),(52,'webSocket','2018-03-10 19:15:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:15:15',1,'ошибка'),(52,'webSocket','2018-03-10 19:16:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:16:45',1,'ошибка'),(52,'webSocket','2018-03-10 19:17:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:17:32',1,'ошибка'),(52,'webSocket','2018-03-10 19:24:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:24:13',1,'ошибка'),(52,'webSocket','2018-03-10 19:26:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:26:26',1,'ошибка'),(52,'webSocket','2018-03-10 19:27:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:27:46',1,'ошибка'),(52,'webSocket','2018-03-10 19:30:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:30:37',1,'ошибка'),(52,'webSocket','2018-03-10 19:33:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:33:04',1,'ошибка'),(52,'webSocket','2018-03-10 19:34:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:34:25',1,'ошибка'),(52,'webSocket','2018-03-10 19:40:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:40:47',1,'ошибка'),(52,'webSocket','2018-03-10 19:42:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:42:11',1,'ошибка'),(52,'webSocket','2018-03-10 19:43:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:43:58',1,'ошибка'),(52,'webSocket','2018-03-10 19:51:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:51:27',1,'ошибка'),(52,'webSocket','2018-03-10 19:51:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:51:29',1,'ошибка'),(52,'webSocket','2018-03-10 19:52:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:52:07',1,'ошибка'),(52,'webSocket','2018-03-10 19:52:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:52:32',1,'ошибка'),(52,'webSocket','2018-03-10 19:55:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:55:25',1,'ошибка'),(52,'webSocket','2018-03-10 19:58:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 19:58:43',1,'ошибка'),(52,'webSocket','2018-03-10 20:03:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:03:06',1,'ошибка'),(52,'webSocket','2018-03-10 20:04:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:04:56',1,'ошибка'),(52,'webSocket','2018-03-10 20:06:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:06:57',1,'ошибка'),(52,'webSocket','2018-03-10 20:07:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:07:42',1,'ошибка'),(52,'webSocket','2018-03-10 20:08:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:08:33',1,'ошибка'),(52,'webSocket','2018-03-10 20:10:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:10:14',1,'ошибка'),(52,'webSocket','2018-03-10 20:15:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:15:08',1,'ошибка'),(52,'webSocket','2018-03-10 20:23:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-10 20:23:59',1,'ошибка'),(52,'webSocket','2018-03-20 21:43:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-20 21:43:22',1,'ошибка'),(52,'webSocket','2018-03-20 22:02:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-20 22:02:34',1,'ошибка'),(52,'webSocket','2018-03-21 18:46:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 18:46:11',1,'ошибка'),(52,'webSocket','2018-03-21 18:46:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 18:46:38',1,'ошибка'),(52,'webSocket','2018-03-21 18:53:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 18:53:33',1,'ошибка'),(52,'webSocket','2018-03-21 18:57:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 18:57:40',1,'ошибка'),(52,'webSocket','2018-03-21 18:59:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 18:59:32',1,'ошибка'),(52,'webSocket','2018-03-21 19:00:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:00:21',1,'ошибка'),(52,'webSocket','2018-03-21 19:08:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:08:14',1,'ошибка'),(52,'webSocket','2018-03-21 19:41:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:41:01',1,'ошибка'),(52,'webSocket','2018-03-21 19:59:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:59:23',1,'ошибка'),(52,'webSocket','2018-03-21 19:59:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:59:30',1,'ошибка'),(52,'webSocket','2018-03-21 19:59:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 19:59:31',1,'ошибка'),(52,'webSocket','2018-03-21 20:00:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:00:20',1,'ошибка'),(52,'webSocket','2018-03-21 20:01:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:01:14',1,'ошибка'),(52,'webSocket','2018-03-21 20:01:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:01:15',1,'ошибка'),(52,'webSocket','2018-03-21 20:01:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:01:16',1,'ошибка'),(52,'webSocket','2018-03-21 20:01:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:01:17',1,'ошибка'),(52,'webSocket','2018-03-21 20:01:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:01:26',1,'ошибка'),(52,'webSocket','2018-03-21 20:02:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:02:24',1,'ошибка'),(52,'webSocket','2018-03-21 20:05:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:05:07',1,'ошибка'),(52,'webSocket','2018-03-21 20:06:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:06:52',1,'ошибка'),(52,'webSocket','2018-03-21 20:08:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:08:26',1,'ошибка'),(52,'webSocket','2018-03-21 20:21:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:21:56',1,'ошибка'),(52,'webSocket','2018-03-21 20:23:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:23:29',1,'ошибка'),(52,'webSocket','2018-03-21 20:30:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 20:30:40',1,'ошибка'),(52,'webSocket','2018-03-21 21:38:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:38:13',1,'ошибка'),(52,'webSocket','2018-03-21 21:51:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:51:44',1,'ошибка'),(52,'webSocket','2018-03-21 21:55:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:55:29',1,'ошибка'),(52,'webSocket','2018-03-21 21:55:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:55:51',1,'ошибка'),(52,'webSocket','2018-03-21 21:56:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:56:12',1,'ошибка'),(52,'webSocket','2018-03-21 21:57:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 21:57:11',1,'ошибка'),(52,'webSocket','2018-03-21 22:09:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:09:42',1,'ошибка'),(52,'webSocket','2018-03-21 22:11:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:11:01',1,'ошибка'),(52,'webSocket','2018-03-21 22:14:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:14:46',1,'ошибка'),(52,'webSocket','2018-03-21 22:17:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:17:37',1,'ошибка'),(52,'webSocket','2018-03-21 22:20:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:20:17',1,'ошибка'),(52,'webSocket','2018-03-21 22:24:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:24:28',1,'ошибка'),(52,'webSocket','2018-03-21 22:26:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:26:31',1,'ошибка'),(52,'webSocket','2018-03-21 22:28:24',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:28:24',1,'ошибка'),(52,'webSocket','2018-03-21 22:30:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:30:19',1,'ошибка'),(52,'webSocket','2018-03-21 22:35:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:35:14',1,'ошибка'),(52,'webSocket','2018-03-21 22:38:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:38:34',1,'ошибка'),(52,'webSocket','2018-03-21 22:39:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:39:29',1,'ошибка'),(52,'webSocket','2018-03-21 22:41:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:41:18',1,'ошибка'),(52,'webSocket','2018-03-21 22:43:40',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:43:40',1,'ошибка'),(52,'webSocket','2018-03-21 22:44:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:44:50',1,'ошибка'),(52,'webSocket','2018-03-21 22:47:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:47:21',1,'ошибка'),(52,'webSocket','2018-03-21 22:48:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:48:34',1,'ошибка'),(52,'webSocket','2018-03-21 22:50:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:50:02',1,'ошибка'),(52,'webSocket','2018-03-21 22:53:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:53:33',1,'ошибка'),(52,'webSocket','2018-03-21 22:54:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 22:54:41',1,'ошибка'),(52,'webSocket','2018-03-21 23:03:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:03:02',1,'ошибка'),(52,'webSocket','2018-03-21 23:05:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:05:12',1,'ошибка'),(52,'webSocket','2018-03-21 23:07:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:07:37',1,'ошибка'),(52,'webSocket','2018-03-21 23:12:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:12:39',1,'ошибка'),(52,'webSocket','2018-03-21 23:16:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:16:43',1,'ошибка'),(52,'webSocket','2018-03-21 23:17:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:17:19',1,'ошибка'),(52,'webSocket','2018-03-21 23:20:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:20:36',1,'ошибка'),(52,'webSocket','2018-03-21 23:21:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:21:08',1,'ошибка'),(52,'webSocket','2018-03-21 23:23:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:23:43',1,'ошибка'),(52,'webSocket','2018-03-21 23:25:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:25:08',1,'ошибка'),(52,'webSocket','2018-03-21 23:31:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:31:30',1,'ошибка'),(52,'webSocket','2018-03-21 23:32:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:32:05',1,'ошибка'),(52,'webSocket','2018-03-21 23:32:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:32:45',1,'ошибка'),(52,'webSocket','2018-03-21 23:34:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-21 23:34:24',1,'ошибка'),(52,'webSocket','2018-03-22 00:20:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:20:31',1,'ошибка'),(52,'webSocket','2018-03-22 00:28:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:28:00',1,'ошибка'),(52,'webSocket','2018-03-22 00:31:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:31:48',1,'ошибка'),(52,'webSocket','2018-03-22 00:36:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:36:47',1,'ошибка'),(52,'webSocket','2018-03-22 00:39:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:39:45',1,'ошибка'),(52,'webSocket','2018-03-22 00:41:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 00:41:27',1,'ошибка'),(52,'webSocket','2018-03-22 07:43:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 07:43:58',1,'ошибка'),(52,'webSocket','2018-03-22 07:48:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 07:48:00',1,'ошибка'),(52,'webSocket','2018-03-22 07:50:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 07:50:18',1,'ошибка'),(52,'webSocket','2018-03-22 20:45:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:45:51',1,'ошибка'),(52,'webSocket','2018-03-22 20:46:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:46:56',1,'ошибка'),(52,'webSocket','2018-03-22 20:47:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:47:26',1,'ошибка'),(52,'webSocket','2018-03-22 20:54:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:54:28',1,'ошибка'),(52,'webSocket','2018-03-22 20:58:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:58:13',1,'ошибка'),(52,'webSocket','2018-03-22 20:58:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 20:58:41',1,'ошибка'),(52,'webSocket','2018-03-22 21:00:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:00:01',1,'ошибка'),(52,'webSocket','2018-03-22 21:07:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:07:37',1,'ошибка'),(52,'webSocket','2018-03-22 21:17:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:17:46',1,'ошибка'),(52,'webSocket','2018-03-22 21:18:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:18:37',1,'ошибка'),(52,'webSocket','2018-03-22 21:19:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:19:37',1,'ошибка'),(52,'webSocket','2018-03-22 21:27:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:27:46',1,'ошибка'),(52,'webSocket','2018-03-22 21:29:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:29:50',1,'ошибка'),(52,'webSocket','2018-03-22 21:33:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:33:09',1,'ошибка'),(52,'webSocket','2018-03-22 21:34:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:34:42',1,'ошибка'),(52,'webSocket','2018-03-22 21:34:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:34:54',1,'ошибка'),(52,'webSocket','2018-03-22 21:37:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:37:17',1,'ошибка'),(52,'webSocket','2018-03-22 21:38:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:38:35',1,'ошибка'),(52,'webSocket','2018-03-22 21:39:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:39:10',1,'ошибка'),(52,'webSocket','2018-03-22 21:39:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:39:27',1,'ошибка'),(52,'webSocket','2018-03-22 21:43:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:43:31',1,'ошибка'),(52,'webSocket','2018-03-22 21:48:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:48:01',1,'ошибка'),(52,'webSocket','2018-03-22 21:49:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:49:18',1,'ошибка'),(52,'webSocket','2018-03-22 21:49:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:49:49',1,'ошибка'),(52,'webSocket','2018-03-22 21:50:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:50:25',1,'ошибка'),(52,'webSocket','2018-03-22 21:51:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:51:29',1,'ошибка'),(52,'webSocket','2018-03-22 21:52:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:52:02',1,'ошибка'),(52,'webSocket','2018-03-22 21:57:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:57:55',1,'ошибка'),(52,'webSocket','2018-03-22 21:58:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 21:58:54',1,'ошибка'),(52,'webSocket','2018-03-22 22:08:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:08:31',1,'ошибка'),(52,'webSocket','2018-03-22 22:09:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:09:58',1,'ошибка'),(52,'webSocket','2018-03-22 22:13:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:13:08',1,'ошибка'),(52,'webSocket','2018-03-22 22:13:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:13:39',1,'ошибка'),(52,'webSocket','2018-03-22 22:16:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:16:55',1,'ошибка'),(52,'webSocket','2018-03-22 22:18:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:18:00',1,'ошибка'),(52,'webSocket','2018-03-22 22:19:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:19:43',1,'ошибка'),(52,'webSocket','2018-03-22 22:23:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:23:13',1,'ошибка'),(52,'webSocket','2018-03-22 22:25:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:25:31',1,'ошибка'),(52,'webSocket','2018-03-22 22:26:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:26:21',1,'ошибка'),(52,'webSocket','2018-03-22 22:27:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:27:30',1,'ошибка'),(52,'webSocket','2018-03-22 22:28:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:28:58',1,'ошибка'),(52,'webSocket','2018-03-22 22:29:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:29:57',1,'ошибка'),(52,'webSocket','2018-03-22 22:40:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:40:01',1,'ошибка'),(52,'webSocket','2018-03-22 22:42:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:42:41',1,'ошибка'),(52,'webSocket','2018-03-22 22:43:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:43:04',1,'ошибка'),(52,'webSocket','2018-03-22 22:43:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:43:48',1,'ошибка'),(52,'webSocket','2018-03-22 22:45:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:45:57',1,'ошибка'),(52,'webSocket','2018-03-22 22:47:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:47:11',1,'ошибка'),(52,'webSocket','2018-03-22 22:49:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:49:08',1,'ошибка'),(52,'webSocket','2018-03-22 22:50:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:50:20',1,'ошибка'),(52,'webSocket','2018-03-22 22:52:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:52:33',1,'ошибка'),(52,'webSocket','2018-03-22 22:53:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:53:03',1,'ошибка'),(52,'webSocket','2018-03-22 22:53:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 22:53:38',1,'ошибка'),(52,'webSocket','2018-03-22 23:00:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:00:12',1,'ошибка'),(52,'webSocket','2018-03-22 23:01:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:01:44',1,'ошибка'),(52,'webSocket','2018-03-22 23:02:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:02:39',1,'ошибка'),(52,'webSocket','2018-03-22 23:03:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:03:39',1,'ошибка'),(52,'webSocket','2018-03-22 23:04:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:04:09',1,'ошибка'),(52,'webSocket','2018-03-22 23:05:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:05:00',1,'ошибка'),(52,'webSocket','2018-03-22 23:05:26',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:05:26',1,'ошибка'),(52,'webSocket','2018-03-22 23:06:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:06:12',1,'ошибка'),(52,'webSocket','2018-03-22 23:08:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:08:04',1,'ошибка'),(52,'webSocket','2018-03-22 23:10:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:10:25',1,'ошибка'),(52,'webSocket','2018-03-22 23:11:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-22 23:11:56',1,'ошибка'),(52,'webSocket','2018-03-23 00:01:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 00:01:48',1,'ошибка'),(52,'webSocket','2018-03-23 00:41:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 00:41:15',1,'ошибка'),(52,'webSocket','2018-03-23 00:50:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 00:50:14',1,'ошибка'),(52,'webSocket','2018-03-23 00:56:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 00:56:38',1,'ошибка'),(52,'webSocket','2018-03-23 01:02:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:02:57',1,'ошибка'),(52,'webSocket','2018-03-23 01:06:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:06:29',1,'ошибка'),(52,'webSocket','2018-03-23 01:12:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:12:58',1,'ошибка'),(52,'webSocket','2018-03-23 01:15:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:15:37',1,'ошибка'),(52,'webSocket','2018-03-23 01:16:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:16:38',1,'ошибка'),(52,'webSocket','2018-03-23 01:23:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:23:25',1,'ошибка'),(52,'webSocket','2018-03-23 01:25:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 01:25:42',1,'ошибка'),(52,'webSocket','2018-03-23 01:42:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:01:04',1,'ошибка'),(52,'webSocket','2018-03-23 11:02:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:02:45',1,'ошибка'),(52,'webSocket','2018-03-23 11:05:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:05:50',1,'ошибка'),(52,'webSocket','2018-03-23 11:06:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:06:18',1,'ошибка'),(52,'webSocket','2018-03-23 11:07:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:07:09',1,'ошибка'),(52,'webSocket','2018-03-23 11:07:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:07:58',1,'ошибка'),(52,'webSocket','2018-03-23 11:09:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:09:29',1,'ошибка'),(52,'webSocket','2018-03-23 11:11:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:11:45',1,'ошибка'),(52,'webSocket','2018-03-23 11:13:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:13:04',1,'ошибка'),(52,'webSocket','2018-03-23 11:13:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:13:52',1,'ошибка'),(52,'webSocket','2018-03-23 11:15:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:15:25',1,'ошибка'),(52,'webSocket','2018-03-23 11:17:22',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:17:22',1,'ошибка'),(52,'webSocket','2018-03-23 11:20:20',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:20:20',1,'ошибка'),(52,'webSocket','2018-03-23 11:21:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:21:06',1,'ошибка'),(52,'webSocket','2018-03-23 11:22:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 11:22:50',1,'ошибка'),(52,'webSocket','2018-03-23 13:13:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:13:37',1,'ошибка'),(52,'webSocket','2018-03-23 13:16:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:16:56',1,'ошибка'),(52,'webSocket','2018-03-23 13:21:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:21:27',1,'ошибка'),(52,'webSocket','2018-03-23 13:30:16',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:30:16',1,'ошибка'),(52,'webSocket','2018-03-23 13:31:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:31:18',1,'ошибка'),(52,'webSocket','2018-03-23 13:31:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:31:55',1,'ошибка'),(52,'webSocket','2018-03-23 13:32:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:32:37',1,'ошибка'),(52,'webSocket','2018-03-23 13:34:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-23 13:34:36',1,'ошибка'),(52,'webSocket','2018-03-24 10:01:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 10:01:55',1,'ошибка'),(52,'webSocket','2018-03-24 10:02:57',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 10:02:57',1,'ошибка'),(52,'webSocket','2018-03-24 10:22:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 10:22:12',1,'ошибка'),(52,'webSocket','2018-03-24 10:23:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 10:23:04',1,'ошибка'),(52,'webSocket','2018-03-24 13:33:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:33:34',1,'ошибка'),(52,'webSocket','2018-03-24 13:34:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:34:01',1,'ошибка'),(52,'webSocket','2018-03-24 13:34:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:34:15',1,'ошибка'),(52,'webSocket','2018-03-24 13:40:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:40:12',1,'ошибка'),(52,'webSocket','2018-03-24 13:40:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:40:55',1,'ошибка'),(52,'webSocket','2018-03-24 13:42:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:42:05',1,'ошибка'),(52,'webSocket','2018-03-24 13:43:55',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:43:55',1,'ошибка'),(52,'webSocket','2018-03-24 13:52:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:52:13',1,'ошибка'),(52,'webSocket','2018-03-24 13:54:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:54:05',1,'ошибка'),(52,'webSocket','2018-03-24 13:57:54',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:57:54',1,'ошибка'),(52,'webSocket','2018-03-24 13:59:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 13:59:49',1,'ошибка'),(52,'webSocket','2018-03-24 14:16:19',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:16:19',1,'ошибка'),(52,'webSocket','2018-03-24 14:18:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:18:14',1,'ошибка'),(52,'webSocket','2018-03-24 14:19:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:19:12',1,'ошибка'),(52,'webSocket','2018-03-24 14:27:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:27:04',1,'ошибка'),(52,'webSocket','2018-03-24 14:34:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:34:56',1,'ошибка'),(52,'webSocket','2018-03-24 14:48:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:48:47',1,'ошибка'),(52,'webSocket','2018-03-24 14:50:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:50:58',1,'ошибка'),(52,'webSocket','2018-03-24 14:53:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:53:56',1,'ошибка'),(52,'webSocket','2018-03-24 14:57:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 14:57:17',1,'ошибка'),(52,'webSocket','2018-03-24 15:03:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:03:09',1,'ошибка'),(52,'webSocket','2018-03-24 15:08:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:08:08',1,'ошибка'),(52,'webSocket','2018-03-24 15:11:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:11:10',1,'ошибка'),(52,'webSocket','2018-03-24 15:12:07',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:12:07',1,'ошибка'),(52,'webSocket','2018-03-24 15:20:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:20:42',1,'ошибка'),(52,'webSocket','2018-03-24 15:21:29',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:21:29',1,'ошибка'),(52,'webSocket','2018-03-24 15:21:36',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:21:36',1,'ошибка'),(52,'webSocket','2018-03-24 15:23:00',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:23:00',1,'ошибка'),(52,'webSocket','2018-03-24 15:34:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:34:31',1,'ошибка'),(52,'webSocket','2018-03-24 15:38:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:38:32',1,'ошибка'),(52,'webSocket','2018-03-24 15:40:33',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:40:33',1,'ошибка'),(52,'webSocket','2018-03-24 15:42:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:42:21',1,'ошибка'),(52,'webSocket','2018-03-24 15:43:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:43:48',1,'ошибка'),(52,'webSocket','2018-03-24 15:51:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 15:51:49',1,'ошибка'),(52,'webSocket','2018-03-24 17:45:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 17:45:15',1,'ошибка'),(52,'webSocket','2018-03-24 18:09:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:09:39',1,'ошибка'),(52,'webSocket','2018-03-24 18:10:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:10:42',1,'ошибка'),(52,'webSocket','2018-03-24 18:12:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:12:06',1,'ошибка'),(52,'webSocket','2018-03-24 18:14:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:14:52',1,'ошибка'),(52,'webSocket','2018-03-24 18:15:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:15:18',1,'ошибка'),(52,'webSocket','2018-03-24 18:17:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:17:25',1,'ошибка'),(52,'webSocket','2018-03-24 18:27:21',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:27:21',1,'ошибка'),(52,'webSocket','2018-03-24 18:29:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:29:15',1,'ошибка'),(52,'webSocket','2018-03-24 18:31:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 18:31:38',1,'ошибка'),(52,'webSocket','2018-03-24 19:00:35',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:00:35',1,'ошибка'),(52,'webSocket','2018-03-24 19:05:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:05:56',1,'ошибка'),(52,'webSocket','2018-03-24 19:12:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:12:45',1,'ошибка'),(52,'webSocket','2018-03-24 19:17:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:17:23',1,'ошибка'),(52,'webSocket','2018-03-24 19:18:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:18:02',1,'ошибка'),(52,'webSocket','2018-03-24 19:18:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:18:58',1,'ошибка'),(52,'webSocket','2018-03-24 19:19:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:19:41',1,'ошибка'),(52,'webSocket','2018-03-24 19:20:11',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:20:11',1,'ошибка'),(52,'webSocket','2018-03-24 19:23:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:23:46',1,'ошибка'),(52,'webSocket','2018-03-24 19:24:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:24:25',1,'ошибка'),(52,'webSocket','2018-03-24 19:24:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:24:49',1,'ошибка'),(52,'webSocket','2018-03-24 19:25:13',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:25:13',1,'ошибка'),(52,'webSocket','2018-03-24 19:33:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:33:51',1,'ошибка'),(52,'webSocket','2018-03-24 19:38:41',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:38:41',1,'ошибка'),(52,'webSocket','2018-03-24 19:40:28',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:40:28',1,'ошибка'),(52,'webSocket','2018-03-24 19:42:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:42:51',1,'ошибка'),(52,'webSocket','2018-03-24 19:45:14',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:45:14',1,'ошибка'),(52,'webSocket','2018-03-24 19:49:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:49:52',1,'ошибка'),(52,'webSocket','2018-03-24 19:52:08',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:52:08',1,'ошибка'),(52,'webSocket','2018-03-24 19:53:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-24 19:53:50',1,'ошибка'),(52,'webSocket','2018-03-25 10:15:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 10:15:43',1,'ошибка'),(52,'webSocket','2018-03-25 10:33:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 10:33:42',1,'ошибка'),(52,'webSocket','2018-03-25 10:34:59',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 10:34:59',1,'ошибка'),(52,'webSocket','2018-03-25 10:48:37',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 10:48:37',1,'ошибка'),(52,'webSocket','2018-03-25 10:49:18',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 10:49:18',1,'ошибка'),(52,'webSocket','2018-03-25 13:08:49',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:08:49',1,'ошибка'),(52,'webSocket','2018-03-25 13:10:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:10:25',1,'ошибка'),(52,'webSocket','2018-03-25 13:16:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:16:47',1,'ошибка'),(52,'webSocket','2018-03-25 13:21:51',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:21:51',1,'ошибка'),(52,'webSocket','2018-03-25 13:23:04',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:23:04',1,'ошибка'),(52,'webSocket','2018-03-25 13:41:50',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 13:41:50',1,'ошибка'),(52,'webSocket','2018-03-25 15:05:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 15:05:10',1,'ошибка'),(52,'webSocket','2018-03-25 15:10:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 15:10:42',1,'ошибка'),(52,'webSocket','2018-03-25 15:15:30',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 15:15:30',1,'ошибка'),(52,'webSocket','2018-03-25 15:46:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 15:46:23',1,'ошибка'),(52,'webSocket','2018-03-25 16:12:52',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-25 16:12:52',1,'ошибка'),(52,'webSocket','2018-03-27 18:10:10',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 18:10:10',1,'ошибка'),(52,'webSocket','2018-03-27 18:27:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 18:27:02',1,'ошибка'),(52,'webSocket','2018-03-27 18:30:01',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 18:30:01',1,'ошибка'),(52,'webSocket','2018-03-27 18:54:43',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 18:54:43',1,'ошибка'),(52,'webSocket','2018-03-27 18:59:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 18:59:06',1,'ошибка'),(52,'webSocket','2018-03-27 19:17:56',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 19:17:56',1,'ошибка'),(52,'webSocket','2018-03-27 21:14:09',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 21:14:09',1,'ошибка'),(52,'webSocket','2018-03-27 21:33:02',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 21:33:02',1,'ошибка'),(52,'webSocket','2018-03-27 21:45:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 21:45:27',1,'ошибка'),(52,'webSocket','2018-03-27 22:38:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 22:38:34',1,'ошибка'),(52,'webSocket','2018-03-27 23:04:47',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 23:04:47',1,'ошибка'),(52,'webSocket','2018-03-27 23:08:05',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 23:08:05',1,'ошибка'),(52,'webSocket','2018-03-27 23:18:32',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-27 23:18:32',1,'ошибка'),(52,'webSocket','2018-03-28 08:06:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 08:06:12',1,'ошибка'),(52,'webSocket','2018-03-28 10:24:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 10:24:06',1,'ошибка'),(52,'webSocket','2018-03-28 18:26:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 18:26:27',1,'ошибка'),(52,'webSocket','2018-03-28 18:52:27',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 18:52:27',1,'ошибка'),(52,'webSocket','2018-03-28 19:03:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 19:03:06',1,'ошибка'),(52,'webSocket','2018-03-28 21:54:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 21:54:12',1,'ошибка'),(52,'webSocket','2018-03-28 21:54:42',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 21:54:42',1,'ошибка'),(52,'webSocket','2018-03-28 21:55:38',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 21:55:38',1,'ошибка'),(52,'webSocket','2018-03-28 21:56:06',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 21:56:06',1,'ошибка'),(52,'webSocket','2018-03-28 21:58:25',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 21:58:25',1,'ошибка'),(52,'webSocket','2018-03-28 22:01:23',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 22:01:23',1,'ошибка'),(52,'webSocket','2018-03-28 22:04:45',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 22:04:45',1,'ошибка'),(52,'webSocket','2018-03-28 22:26:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 22:26:34',1,'ошибка'),(52,'webSocket','2018-03-28 23:54:58',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 23:54:58',1,'ошибка'),(52,'webSocket','2018-03-28 23:55:34',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-28 23:55:34',1,'ошибка'),(52,'webSocket','2018-03-29 00:03:39',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:03:39',1,'ошибка'),(52,'webSocket','2018-03-29 00:04:31',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:04:31',1,'ошибка'),(52,'webSocket','2018-03-29 00:16:17',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:16:17',1,'ошибка'),(52,'webSocket','2018-03-29 00:19:03',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:19:03',1,'ошибка'),(52,'webSocket','2018-03-29 00:28:12',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:28:13',1,'ошибка'),(52,'webSocket','2018-03-29 00:29:46',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:29:46',1,'ошибка'),(52,'webSocket','2018-03-29 00:31:48',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:31:48',1,'ошибка'),(52,'webSocket','2018-03-29 00:58:53',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:58:53',1,'ошибка'),(52,'webSocket','2018-03-29 00:59:44',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 00:59:44',1,'ошибка'),(52,'webSocket','2018-03-29 01:09:15',1,'Нет соединения с оборудованием'),(52,'webSocket','2018-03-29 01:09:15',1,'ошибка'),(52,'webSocket','2018-04-01 11:44:10',1,'Нет соединения с оборудованием');
/*!40000 ALTER TABLE `hws_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_service` int(11) NOT NULL,
  `dt_insert` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `collected` tinyint(2) NOT NULL DEFAULT '0',
  `id_collection` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `nds` decimal(10,2) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`),
  KEY `card` (`id_service`),
  KEY `dt_insert` (`dt_insert`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,52,9,'2017-10-25 20:35:07',120.00,1,2,NULL,NULL,'1/6 часть поля'),(2,52,9,'2017-10-25 20:53:39',120.00,1,2,NULL,NULL,'1/6 часть поля'),(3,52,9,'2017-10-25 20:58:38',120.00,1,2,NULL,NULL,'1/6 часть поля'),(4,52,9,'2017-10-25 21:00:55',120.00,1,2,NULL,NULL,'1/6 часть поля'),(5,52,9,'2017-10-25 21:02:53',120.00,1,2,NULL,NULL,'1/6 часть поля'),(6,52,9,'2017-10-25 21:05:20',120.00,1,2,NULL,NULL,'1/6 часть поля'),(7,52,9,'2017-10-25 21:06:05',120.00,1,2,NULL,NULL,'1/6 часть поля'),(8,52,9,'2017-10-25 21:06:27',120.00,1,2,NULL,NULL,'1/6 часть поля'),(9,52,9,'2017-10-25 21:09:52',120.00,1,2,NULL,NULL,'1/6 часть поля'),(10,52,16,'2017-10-25 21:10:16',120.00,1,2,NULL,NULL,'Манишки (10 шт)'),(11,52,16,'2017-10-25 21:11:20',120.00,1,2,NULL,NULL,'Манишки (10 шт)'),(12,52,9,'2017-10-25 21:18:24',120.00,1,2,NULL,NULL,'1/6 часть поля'),(13,52,9,'2017-10-25 21:18:57',120.00,1,2,NULL,NULL,'1/6 часть поля'),(14,52,9,'2017-10-25 21:21:02',120.00,1,2,NULL,NULL,'1/6 часть поля'),(15,52,9,'2017-10-25 21:22:27',120.00,1,2,NULL,NULL,'1/6 часть поля'),(16,52,9,'2017-10-25 21:22:40',120.00,1,2,NULL,NULL,'1/6 часть поля'),(17,52,13,'2017-10-25 21:23:25',120.00,1,2,NULL,NULL,'Беговая дорожка'),(18,52,16,'2017-10-25 21:23:45',120.00,1,2,NULL,NULL,'Манишки (10 шт)'),(19,52,9,'2017-10-25 21:27:46',120.00,1,2,NULL,NULL,'1/6 часть поля'),(20,52,9,'2017-10-25 21:30:48',120.00,1,2,NULL,NULL,'1/6 часть поля'),(21,52,35,'2017-10-25 21:31:36',120.00,1,2,NULL,NULL,'Услуга'),(22,52,35,'2017-10-25 21:33:49',120.00,1,2,NULL,NULL,'Услуга'),(23,52,35,'2017-10-25 21:34:38',120.00,1,2,NULL,NULL,'Услуга'),(24,52,35,'2017-10-25 21:35:18',120.00,1,2,NULL,NULL,'Услуга'),(25,52,35,'2017-10-25 21:43:43',120.00,1,2,NULL,NULL,'Услуга'),(26,52,35,'2017-10-25 21:45:27',120.00,1,2,NULL,NULL,'Услуга'),(27,52,35,'2017-10-25 21:45:55',120.00,1,2,NULL,NULL,'Услуга'),(28,52,9,'2017-10-25 21:46:52',120.00,1,2,NULL,NULL,'1/6 часть поля'),(29,52,7,'2017-10-25 22:23:28',120.00,1,3,6500.00,-1.00,'1/2 часть поля'),(30,52,35,'2017-10-25 22:24:20',120.00,1,3,2.00,1.00,'Услуга'),(31,52,31,'2017-10-25 22:24:32',120.00,1,3,2.00,-1.00,NULL),(32,52,22,'2017-10-25 22:24:45',120.00,1,3,2.00,-1.00,'Манишки (10 шт)'),(33,52,33,'2017-10-27 17:26:35',120.00,0,NULL,12000.00,-1.00,'Все поле'),(34,52,23,'2017-10-27 17:26:50',120.00,0,NULL,2.00,0.00,NULL),(35,52,22,'2017-10-27 17:29:47',120.00,0,NULL,2.00,-1.00,'Манишки (10 шт)'),(36,52,36,'2017-10-27 17:30:12',120.00,0,NULL,-1.00,-1.00,'Прокат коньков (дети)'),(37,52,25,'2017-11-30 15:38:58',4.00,0,NULL,4.00,1000.00,'Выход на лед'),(38,52,29,'2017-11-30 15:39:16',100.00,0,NULL,2.00,0.00,'Прокат коньков (взрослый)'),(39,52,31,'2017-11-30 15:40:25',400.00,0,NULL,2.00,0.00,NULL),(40,52,25,'2017-11-30 15:40:39',100.00,0,NULL,4.00,1000.00,'Выход на лед'),(41,52,36,'2017-11-30 18:15:05',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(42,52,36,'2017-11-30 18:36:35',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(43,52,36,'2017-11-30 18:38:59',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(44,52,36,'2017-11-30 18:40:59',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(45,52,36,'2017-11-30 18:49:46',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(46,52,36,'2017-11-30 18:50:08',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(47,52,36,'2017-11-30 18:51:32',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(48,52,36,'2017-11-30 18:53:08',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(49,52,36,'2017-11-30 18:56:56',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(50,52,36,'2017-11-30 19:00:37',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(51,52,36,'2017-11-30 19:05:39',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(52,52,36,'2017-11-30 19:08:25',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(53,52,36,'2017-11-30 19:09:05',10.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(54,52,36,'2017-11-30 19:09:37',50.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(55,52,25,'2017-11-30 19:29:32',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(56,52,36,'2017-11-30 19:36:34',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(57,52,25,'2017-11-30 19:37:11',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(58,52,25,'2017-11-30 19:37:59',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(59,52,25,'2017-11-30 19:38:27',10.00,0,NULL,50.00,4000.00,'Выход на лед'),(60,52,25,'2017-11-30 20:31:51',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(61,52,25,'2017-11-30 20:32:21',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(62,52,25,'2017-11-30 20:33:43',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(63,52,25,'2017-11-30 20:38:02',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(64,52,25,'2017-11-30 20:39:13',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(65,52,25,'2017-11-30 20:39:41',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(66,52,25,'2017-11-30 20:40:16',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(67,52,25,'2017-11-30 20:40:47',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(68,52,25,'2017-11-30 20:43:46',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(69,52,25,'2017-11-30 20:45:40',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(70,52,25,'2017-11-30 20:48:07',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(71,52,25,'2017-11-30 20:48:42',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(72,52,25,'2017-11-30 20:50:29',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(73,52,25,'2017-11-30 20:52:31',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(74,52,25,'2017-11-30 20:53:05',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(75,52,36,'2017-11-30 20:54:22',100.00,0,NULL,50.00,4000.00,'Прокат коньков (дети)'),(76,52,25,'2017-11-30 20:57:34',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(77,52,25,'2017-11-30 20:58:53',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(78,52,45,'2017-12-02 09:39:47',2500.00,0,NULL,2000.00,0.00,'1/6 часть поля'),(79,52,9,'2017-12-04 12:36:07',4100.00,0,NULL,2000.00,0.00,'1/6 часть поля'),(80,52,13,'2017-12-04 13:35:24',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(82,52,13,'2017-12-04 13:35:56',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(83,52,13,'2017-12-04 13:36:00',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(85,52,13,'2017-12-04 13:37:29',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(86,52,13,'2017-12-04 13:37:29',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(87,52,13,'2017-12-04 13:37:29',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(88,52,13,'2017-12-04 13:37:29',170.00,0,NULL,170.00,0.00,'Беговая дорожка'),(89,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(90,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(91,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(92,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(93,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(94,52,25,'2017-12-04 13:40:43',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(95,52,25,'2017-12-04 13:41:19',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(96,52,25,'2017-12-04 13:41:19',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(97,52,25,'2017-12-04 14:02:00',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(98,52,25,'2017-12-04 14:02:00',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(99,52,25,'2017-12-04 14:42:38',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(100,52,25,'2017-12-04 14:42:38',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(101,52,25,'2017-12-04 14:44:21',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(102,52,25,'2017-12-04 14:44:21',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(103,52,25,'2017-12-04 14:59:54',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(104,52,25,'2017-12-04 14:59:54',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(105,52,25,'2017-12-04 14:59:54',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(106,52,25,'2017-12-04 14:59:54',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(107,52,25,'2017-12-04 16:26:41',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(108,52,25,'2017-12-04 16:26:41',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(109,52,25,'2017-12-04 16:26:41',50.00,0,NULL,50.00,4000.00,'Выход на лед'),(110,52,81,'2017-12-05 15:20:20',3000.00,0,NULL,0.00,1000.00,'Услуги по договору (с НДС)'),(111,52,82,'2017-12-05 15:29:30',4000.00,0,NULL,0.00,4000.00,'Услуги по договору (без НДС)'),(112,52,25,'2017-12-08 11:56:07',100.00,0,NULL,50.00,4000.00,'Выход на лед'),(113,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(114,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(115,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(116,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(117,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(118,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(119,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(120,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(121,52,29,'2017-12-08 13:52:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(122,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(123,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(124,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(125,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(126,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(127,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(128,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(129,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(130,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(131,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(132,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(133,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(134,52,29,'2017-12-08 13:57:01',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(135,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(136,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(137,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(138,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(139,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(140,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(141,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(142,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(143,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(144,52,36,'2017-12-08 14:00:51',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(145,52,36,'2017-12-19 11:57:53',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(146,52,36,'2017-12-19 11:57:53',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(147,52,36,'2017-12-19 11:57:53',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(148,52,36,'2017-12-19 11:57:53',850.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(149,52,29,'2017-12-19 12:19:55',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(150,52,29,'2017-12-19 12:19:55',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(151,52,29,'2017-12-19 12:19:55',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(152,52,36,'2017-12-19 12:19:55',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(153,52,36,'2017-12-19 12:19:55',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(154,52,36,'2017-12-19 12:19:55',600.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(155,52,36,'2017-12-19 12:37:21',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(156,52,36,'2017-12-19 12:37:21',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(157,52,36,'2017-12-19 12:37:21',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(158,52,36,'2017-12-19 12:37:21',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(159,52,36,'2017-12-19 12:37:21',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(160,52,36,'2017-12-19 12:37:21',750.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(161,52,36,'2017-12-19 12:38:56',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(162,52,36,'2017-12-19 12:38:56',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(163,52,36,'2017-12-19 12:38:56',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(164,52,36,'2017-12-19 12:38:56',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(165,52,36,'2017-12-19 12:38:56',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(166,52,36,'2017-12-19 12:38:56',750.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(167,52,36,'2017-12-19 12:42:34',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(168,52,36,'2017-12-19 12:42:34',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(169,52,36,'2017-12-19 12:42:34',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(170,52,36,'2017-12-19 12:42:34',50.00,0,NULL,50.00,4000.00,'Прокат коньков детям до 6 лет (включительно)'),(171,52,29,'2017-12-19 12:42:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(172,52,29,'2017-12-19 12:42:34',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(173,52,29,'2017-12-19 12:42:34',600.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(174,52,85,'2017-12-19 12:45:42',750.00,0,NULL,750.00,4000.00,'Дополнительная раздевалка'),(175,52,85,'2017-12-19 12:45:42',750.00,0,NULL,750.00,4000.00,'Дополнительная раздевалка'),(176,52,29,'2017-12-19 12:45:42',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(177,52,29,'2017-12-19 12:45:42',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(178,52,29,'2017-12-19 12:45:42',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(179,52,29,'2017-12-19 12:45:42',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(180,52,29,'2017-12-19 12:45:42',100.00,0,NULL,100.00,4000.00,'Прокат коньков (взрослый)'),(181,52,9,'2017-12-19 12:46:50',1000.00,0,NULL,2000.00,4000.00,'1/6 часть поля'),(182,52,73,'2017-12-20 15:26:35',1000.00,0,NULL,550.00,4000.00,'Взрослые (1 день)'),(183,52,73,'2017-12-20 15:30:05',1000.00,0,NULL,550.00,4000.00,'Взрослые (1 день)'),(184,52,102,'2017-12-20 15:31:55',3000.00,0,NULL,2750.00,4000.00,'Взрослые (5 дней)'),(185,52,102,'2017-12-20 15:37:54',2750.00,0,NULL,2750.00,4000.00,'Взрослые (5 дней)'),(186,52,102,'2017-12-20 15:37:54',3250.00,0,NULL,2750.00,4000.00,'Взрослые (5 дней)');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prepayments`
--

DROP TABLE IF EXISTS `prepayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepayments` (
  `id_card` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_card`),
  KEY `card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepayments`
--

LOCK TABLES `prepayments` WRITE;
/*!40000 ALTER TABLE `prepayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `prepayments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prepayments_bi` BEFORE INSERT ON `prepayments` FOR EACH ROW BEGIN
    insert into prepayments_history (id_card, dt, amount, name)
    select new.id_card, now(), new.amount, c.name
    from cards c
    where c.id = new.id_card;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prepayments_bu` BEFORE UPDATE ON `prepayments` FOR EACH ROW BEGIN
    insert into prepayments_history (id_card, dt, amount, name)
    select new.id_card, now(), new.amount, c.name
    from cards c
    where c.id = new.id_card;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prepayments_history`
--

DROP TABLE IF EXISTS `prepayments_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prepayments_history` (
  `id_card` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  KEY `dt` (`dt`),
  KEY `card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prepayments_history`
--

LOCK TABLES `prepayments_history` WRITE;
/*!40000 ALTER TABLE `prepayments_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `prepayments_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(50) DEFAULT NULL,
  `start_url` varchar(50) DEFAULT NULL COMMENT 'стартовая страница',
  `first_screen` int(11) DEFAULT NULL,
  `first_action` text,
  `new` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Админ','admin.php',2,'move',0),(2,'Киоск','terminal.php',1,'getServiceList',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `html` text NOT NULL,
  `real` int(11) NOT NULL DEFAULT '0',
  `add_screen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (1,'Терминал. Основной экран','<div class=\"error\">\n    <h1>Внимание!</h1>\n    <h2>Терминал  сдачу  не  дает.</h2>\n</div>\n\n<div class=\"basketState {BASKET_VISIBILITY}\">\n	<span class=\'glyphicon glyphicon-shopping-cart\'></span>: {BASKET_STATE} руб.\n             <span>\n                <input class=\'nextScreen\' type=\'hidden\' value=\'2\' />\n                <input class=\'activity\' type=\'hidden\' value=\'getMoneyScreen\' />\n                <input class=\'value idBasket\' type=\'hidden\' value=\'{IDBASKET}\' />\n                <button class=\'btn btn-primary action service control\'>Оплатить</button>   \n            </span>\n</div>\n\n<div class=\"commentItem\">\n	{SCREEN_COMMENT}\n</div>\n<div class=\"container newServiceListArea\">\n    {SERVICES_LIST}\n</div>\n<div class=\"container controlArea\">\n    {CONTROLS_LIST}\n</div>\n',0,NULL),(2,'Прием денег','<div class=\"col-md-12 text-center\">\r\n    <input class=\'nextScreen\' type=\'hidden\' value=\'1\' />\r\n    <input class=\'activity\' type=\'hidden\' value=\'getServiceList\' />\r\n    <a class=\'btn btn-primary action cancel\'>\r\n        <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>\r\n    </a>   \r\n</div>\r\n<div class=\"container\">\r\n    <div class=\"row\">\r\n        <div class=\"col-md-4 text-left\">\r\n            <div id=\"basket\">\r\n                {BASKET}\r\n            </div>\r\n        </div>\r\n        <div class=\"col-md-8 acceptArea\">\r\n            <div class=\'error\'>\r\n                <h4>Внимание! Терминал  сдачу  не  дает.</h4>\r\n                <h2>Вставляйте купюры по одной</h2>\r\n            </div>\r\n            <div class=\"title\">\r\n                <h4>Итого: {MINAMOUNT} руб.</h4>\r\n            </div>\r\n            <div class=\"accept\">\r\n                <h3>Принято</h3>\r\n                <div class=\"amountScreen\">0</div> \r\n                <h3>руб</h3>\r\n            </div>\r\n            <input class=\'nextScreen\' type=\'hidden\' value=\'3\' />\r\n            <input class=\'activity\' type=\'hidden\' value=\'pay\' />\r\n            <input class=\'value amount\' type=\'hidden\' value=\'0\' />\r\n            <input class=\'minamount\' type=\'hidden\' value=\'{MINAMOUNT}\' />\r\n            <input class=\'value idBasket\' type=\'hidden\' value=\'{IDBASKET}\' />\r\n            <a class=\"btn btn-primary action pay hidden\">оплатить</a>\r\n        </div>\r\n    </div>\r\n</div\r\n',0,NULL),(3,'Оплачено','<div class=\"title\">\r\n    <h2>Ваш платеж принят</h2>\r\n    <h1>Заберите чек</h1>\r\n</div>\r\n\r\n\r\n\r\n',0,NULL),(4,'Чек. Верх','Номер транзакции: {TRN}\\\\n\\\\n.\\\\n----------------------------------------\\\\n',0,NULL),(5,'Чек. Позиция','{SERVICE};{PRICE};{QTY};{NDS};',0,NULL),(6,'Чек. Низ','',0,NULL),(7,'Чек. Сдача','\\\\n \\\\n \\\\n644009, Омская обл., г.Омск,\\\\nул.Масленникова, д.142/1\\\\n\\\\n \\\\n \\\\nДата/время  операции: {DATE} {TIME}\\\\n \\\\n \\\\n\\\\n \\\\n \\\\n СДАЧА: {REST} руб. \\\\n \\\\n \\\\n\\\\n \\\\n \\\\n \\\\n \\\\n \\\\nСПАСИБО\\\\n \\\\n',0,NULL),(9,'Терминал. Инкассация','<div class=\"title\">\r\n    <h1>Инкассация</h1>\r\n    <h2>Для окончания инкассации заберите чек и вставьте кассету обратно</h2>\r\n</div>\r\n',0,NULL),(12,'Терминал. Временно не работает','<div class=\"error\">\r\n    <h1>Терминал временно не работает</h1>\r\n</div>\r\n',0,NULL),(13,'Ввод количества услуг','<div class=\"container-fluid\">\r\n    <div class=\"col-md-12 text-center qtyCancel\">\r\n        <input class=\'nextScreen\' type=\'hidden\' value=\'1\' />\r\n        <input class=\'activity\' type=\'hidden\' value=\'getServiceList\' />\r\n        <a class=\'btn btn-primary action cancel\'>\r\n            <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>\r\n        </a>   \r\n    </div>\r\n    <div class=\"row qtyArea\">\r\n        <div class=\"title\">\r\n            <h2>{SERVICE}</h2>\r\n            <h2>Стоимость услуги: {PRICE} руб.</h2>\r\n        </div>\r\n\r\n        <div class=\"col-md-3 text-center\">\r\n            <button class=\"btn btn-primary qtyAction minus left\">\r\n                <span class=\"glyphicon glyphicon-minus\" aria-hidden=\"true\"></span>\r\n            </button>\r\n        </div>\r\n\r\n        <div class=\"col-md-6 text-center\">\r\n            <div class=\"quantity\">\r\n                <h3>Количество</h3>\r\n                <div class=\"qtyScreen\">1</div> \r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"col-md-3 text-center\">\r\n            <button class=\"btn btn-primary qtyAction plus right\">\r\n                <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>\r\n            </button>\r\n        </div>\r\n    </div>\r\n\r\n    <div class=\"row controlAreaQty text-center\">\r\n        <div class=\"col-md-3\"></div>\r\n        <!-- div class=\"col-md-6\">\r\n                <input class=\'nextScreen\' type=\'hidden\' value=\'2\' />\r\n                <input class=\'activity\' type=\'hidden\' value=\'getMoneyScreen\' />\r\n                <input class=\'value price\' type=\'hidden\' value=\'{PRICE}\' />\r\n                <input class=\'value idService\' type=\'hidden\' value=\'{IDSERVICE}\' />\r\n                <input class=\'value idBasket\' type=\'hidden\' value=\'{IDBASKET}\' />\r\n                <input class=\'value serviceName\' type=\'hidden\' value=\'{SERVICE}\' />\r\n                <input class=\'value qty\' type=\'hidden\' value=\'1\' />\r\n\r\n                <button class=\'btn btn-primary action service control\'>Добавить в корзину и оплатить</button>   \r\n        </div-->\r\n        <div class=\"col-md-6 text-center\">\r\n                <input class=\'nextScreen\' type=\'hidden\' value=\'1\' />\r\n                <input class=\'activity\' type=\'hidden\' value=\'addToBasket\' />\r\n                <input class=\'value idService\' type=\'hidden\' value=\'{IDSERVICE}\' />\r\n                <input class=\'value idBasket\' type=\'hidden\' value=\'{IDBASKET}\' />\r\n                <input class=\'value qty\' type=\'hidden\' value=\'1\' />\r\n                <button class=\'btn btn-primary action service control\'>Добавить</button>   \r\n        </div>\r\n    </div>\r\n</div>\r\n',0,NULL),(14,'Выбор коньков','<div class=\"container-fluid\">\r\n    <div class=\"col-md-12 text-center qtyCancel\">\r\n        <input class=\"nextScreen\" type=\"hidden\" value=\"1\">\r\n        <input class=\"activity\" type=\"hidden\" value=\"getServiceList\">\r\n        <a class=\"btn btn-primary action cancel\">\r\n            <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>\r\n        </a>\r\n    </div>\r\n    <div class=\"row qtyArea\">\r\n        <div class=\"title\">\r\n            <h2>{SERVICE}</h2>\r\n            <h2>Стоимость услуги: {PRICE} руб.</h2>\r\n        </div>\r\n        <div class=\"row sizeSelect\">\r\n            <div class=\"col-md-1\">\r\n                <button class=\"btn btn-primary btn-left\" disabled><</button>\r\n            </div>\r\n            <div class=\"col-md-10 track-wrap\">\r\n                <div class=\"track\">{SERVICE_SIZE}</div>\r\n            </div>\r\n            <div class=\"col-md-1\">\r\n                <button class=\"btn btn-primary btn-right\">></button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"row controlAreaQty text-center\">\r\n        <div class=\"col-md-3\"></div>\r\n        <div class=\"col-md-6 text-center\">\r\n            <input class=\'nextScreen\' type=\'hidden\' value=\'1\' />\r\n            <input class=\'activity\' type=\'hidden\' value=\'addToBasket\' />\r\n            <input class=\'value idService\' type=\'hidden\' value=\'{IDSERVICE}\' />\r\n            <input class=\'value idBasket\' type=\'hidden\' value=\'{IDBASKET}\' />\r\n            <input class=\'value qty\' type=\'hidden\' value=\'0\' />\r\n            <input class=\"value sizes\" type=\"hidden\" />\r\n            <button class=\'btn btn-primary action service control\'>Добавить</button>\r\n        </div>\r\n    </div>\r\n</div>',0,15),(15,'Элемент выбора коньков','<div class=\"text-center item\">\r\n    <div class=\"quantity\" style=\"margin: 10px 0\">\r\n        <h3>Размер {SIZE} всего {VAL}</h3>\r\n        <div class=\"qtyScreen\" data-size=\"{SIZE}\">{SEL}</div>\r\n    </div>\r\n    <button class=\"btn btn-primary qtyAction-2 minus left\">\r\n        <span class=\"glyphicon glyphicon-minus\" aria-hidden=\"true\"></span>\r\n    </button>\r\n    <button class=\"btn btn-primary qtyAction-2 plus left\" data-max=\"{VAL}\">\r\n        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>\r\n    </button>\r\n</div>',0,NULL),(16,'Терминал. Ошибка резервирования.','<div class=\"error\">\r\n    <h1>Выбранных коньков нет в наличии.</h1>\r\n</div>\r\n<div class=\"container controlArea\">\r\n    {CONTROLS_LIST}\r\n</div>',0,NULL);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id_user` int(10) DEFAULT NULL,
  `id_session` varchar(50) DEFAULT NULL,
  `dt_reg` datetime DEFAULT NULL COMMENT 'Дата логина',
  `dt_last_update` datetime DEFAULT NULL COMMENT 'Дата последнего рефреша главной страницы',
  UNIQUE KEY `id_user` (`id_user`),
  KEY `id_session` (`id_session`),
  CONSTRAINT `FK_session_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (52,'b416a3df-356f-11e8-88be-c6d4d19ea354','2018-04-01 11:44:10','2018-04-01 12:59:07'),(2,'e695185e-2d1c-11e8-8846-c5ceb831cc6d','2018-03-21 21:31:18','2018-03-21 21:32:22'),(53,'df090fb3-bac6-11e7-8e26-7824af3a08df','2017-10-27 09:28:16','2017-10-27 09:31:47');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_action` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_system_log_users` (`id_user`),
  KEY `dt` (`dt`),
  KEY `id_action` (`id_action`),
  CONSTRAINT `FK_system_log_actions` FOREIGN KEY (`id_action`) REFERENCES `actions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (1,'2017-09-13 15:14:53',52,1,'127.0.0.1'),(2,'2017-09-13 15:14:57',52,1,'127.0.0.1'),(3,'2017-09-13 15:15:21',52,1,'127.0.0.1'),(4,'2017-09-13 15:16:38',52,1,'127.0.0.1'),(5,'2017-09-13 15:16:39',52,1,'127.0.0.1'),(6,'2017-09-13 15:20:41',52,1,'127.0.0.1'),(7,'2017-09-13 15:24:02',52,1,'127.0.0.1'),(8,'2017-09-13 15:25:07',52,1,'127.0.0.1'),(9,'2017-09-13 15:27:39',52,1,'127.0.0.1'),(10,'2017-09-13 15:28:27',52,1,'127.0.0.1'),(11,'2017-09-13 15:29:26',2,1,'127.0.0.1'),(12,'2017-09-13 15:34:03',2,1,'127.0.0.1'),(13,'2017-09-13 15:34:33',2,1,'127.0.0.1'),(14,'2017-09-13 15:34:40',2,1,'127.0.0.1'),(15,'2017-09-13 15:34:43',2,1,'127.0.0.1'),(16,'2017-09-13 15:34:52',2,7,'id_role: 1, ip: , login123, address: '),(17,'2017-09-13 15:34:54',2,9,'id_user: 59, Status: 1'),(18,'2017-09-13 15:34:56',2,9,'id_user: 59, Status: 0'),(19,'2017-09-13 15:35:00',2,10,'id_user: 59'),(20,'2017-09-13 15:35:05',2,8,'id: 59, ip: , login123, address: '),(21,'2017-09-13 15:35:33',2,1,'127.0.0.1'),(22,'2017-09-13 15:39:57',2,1,'127.0.0.1'),(23,'2017-09-13 15:40:10',2,7,'id_role: 2, ip: 111, login, address: 1231344'),(24,'2017-09-13 15:40:12',2,9,'id_user: 60, Status: 1'),(25,'2017-09-13 15:40:16',2,8,'id: 60, ip: 111, login, address: 342341231344'),(26,'2017-09-13 15:40:18',2,1,'127.0.0.1'),(27,'2017-09-13 15:40:23',2,6,'id_user: 60'),(28,'2017-09-13 15:40:27',2,9,'id_user: 59, Status: 1'),(29,'2017-09-13 15:40:29',2,9,'id_user: 59, Status: 0'),(30,'2017-09-13 15:40:32',2,10,'id_user: 59'),(31,'2017-09-13 15:40:36',2,8,'id: 59, ip: , login123sdfgsdfg, address: '),(32,'2017-09-13 15:40:37',2,1,'127.0.0.1'),(33,'2017-09-13 15:40:42',2,6,'id_user: 59'),(34,'2017-09-13 15:42:04',2,1,'127.0.0.1'),(35,'2017-09-13 15:45:25',2,1,'127.0.0.1'),(36,'2017-09-13 15:45:42',2,1,'127.0.0.1'),(37,'2017-09-13 15:47:57',2,1,'127.0.0.1'),(38,'2017-09-13 15:48:31',2,1,'127.0.0.1'),(39,'2017-09-13 15:52:30',2,1,'127.0.0.1'),(40,'2017-09-13 15:54:59',2,21,'type: lds, id_item: 25, color: warning'),(41,'2017-09-13 15:59:32',2,1,'127.0.0.1'),(42,'2017-09-13 16:00:18',2,21,'type: lds, id_item: 25, color: primary'),(43,'2017-09-13 16:00:23',2,21,'type: lds, id_item: 1, color: success'),(44,'2017-09-13 16:00:24',2,21,'type: lds, id_item: 13, color: success'),(45,'2017-09-13 16:00:25',2,21,'type: lds, id_item: 14, color: success'),(46,'2017-09-13 16:00:28',2,21,'type: lds, id_item: 16, color: success'),(47,'2017-09-13 16:00:29',2,21,'type: lds, id_item: 15, color: success'),(48,'2017-09-13 16:00:30',2,21,'type: lds, id_item: 4, color: success'),(49,'2017-09-13 16:00:31',2,21,'type: lds, id_item: 5, color: success'),(50,'2017-09-13 16:00:32',2,21,'type: lds, id_item: 7, color: success'),(51,'2017-09-13 16:00:33',2,21,'type: lds, id_item: 8, color: success'),(52,'2017-09-13 16:00:34',2,21,'type: lds, id_item: 9, color: success'),(53,'2017-09-13 16:00:36',2,21,'type: lds, id_item: 6, color: success'),(54,'2017-09-13 16:00:37',2,21,'type: lds, id_item: 10, color: success'),(55,'2017-09-13 16:00:37',2,21,'type: lds, id_item: 11, color: success'),(56,'2017-09-13 16:00:38',2,21,'type: lds, id_item: 12, color: success'),(57,'2017-09-13 16:00:41',2,21,'type: lds, id_item: 2, color: warning'),(58,'2017-09-13 16:00:42',2,21,'type: lds, id_item: 17, color: warning'),(59,'2017-09-13 16:00:43',2,21,'type: lds, id_item: 19, color: warning'),(60,'2017-09-13 16:00:44',2,21,'type: lds, id_item: 18, color: warning'),(61,'2017-09-13 16:00:45',2,21,'type: lds, id_item: 20, color: warning'),(62,'2017-09-13 16:00:46',2,21,'type: lds, id_item: 22, color: warning'),(63,'2017-09-13 16:00:47',2,21,'type: lds, id_item: 21, color: warning'),(64,'2017-09-13 16:04:30',2,1,'127.0.0.1'),(65,'2017-09-13 16:05:11',2,21,'type: lds, id_item: 7, color: warning'),(66,'2017-09-13 16:05:12',2,21,'type: lds, id_item: 7, color: success'),(67,'2017-09-13 16:05:19',2,21,'type: lds, id_item: 29, color: warning'),(68,'2017-09-13 16:05:20',2,21,'type: lds, id_item: 29, color: primary'),(69,'2017-09-13 16:10:10',2,1,'127.0.0.1'),(70,'2017-09-13 16:39:43',2,1,'127.0.0.1'),(71,'2017-09-13 16:39:53',2,23,'type: lds, id_item: 3, price: 200'),(72,'2017-09-13 16:42:29',2,24,'type: lds, id_item: 23, nds: 0'),(73,'2017-09-13 16:42:31',2,24,'type: lds, id_item: 25, nds: 1'),(74,'2017-09-13 16:42:52',2,24,'type: lds, id_item: 3, nds: 0'),(75,'2017-09-13 16:42:55',2,24,'type: lds, id_item: 3, nds: -1'),(76,'2017-09-13 16:43:06',2,24,'type: lds, id_item: 3, nds: 0'),(77,'2017-09-13 16:43:12',2,24,'type: lds, id_item: 3, nds: -1'),(78,'2017-09-13 16:43:23',2,1,'127.0.0.1'),(79,'2017-09-13 16:46:22',2,24,'type: lds, id_item: 24, nds: 0'),(80,'2017-09-13 16:47:20',52,1,'127.0.0.1'),(81,'2017-09-13 16:49:46',52,1,'127.0.0.1'),(82,'2017-09-13 16:52:49',52,1,'127.0.0.1'),(83,'2017-09-13 16:53:51',52,1,'127.0.0.1'),(84,'2017-09-13 17:00:59',52,1,'127.0.0.1'),(85,'2017-09-13 17:02:26',52,1,'127.0.0.1'),(86,'2017-09-13 17:10:54',52,1,'127.0.0.1'),(87,'2017-09-13 17:11:09',52,1,'127.0.0.1'),(88,'2017-09-13 17:12:31',52,1,'127.0.0.1'),(89,'2017-09-13 17:13:45',52,1,'127.0.0.1'),(90,'2017-09-13 17:14:02',52,1,'127.0.0.1'),(91,'2017-09-13 17:16:37',52,1,'127.0.0.1'),(92,'2017-09-13 17:19:18',52,1,'127.0.0.1'),(93,'2017-09-13 17:19:21',52,1,'127.0.0.1'),(94,'2017-09-13 17:23:50',52,1,'127.0.0.1'),(95,'2017-09-13 17:27:28',52,1,'127.0.0.1'),(96,'2017-09-13 19:39:49',52,1,'127.0.0.1'),(97,'2017-09-13 19:39:53',52,1,'127.0.0.1'),(98,'2017-09-13 19:40:05',52,1,'127.0.0.1'),(99,'2017-09-14 10:41:48',52,1,'127.0.0.1'),(100,'2017-09-14 10:42:35',52,1,'127.0.0.1'),(101,'2017-09-14 10:42:37',52,1,'127.0.0.1'),(102,'2017-09-15 14:11:47',52,1,'127.0.0.1'),(103,'2017-09-15 14:18:30',2,1,'127.0.0.1'),(104,'2017-09-15 14:20:12',2,21,'type: lds, id_item: 3, color: warning'),(105,'2017-09-15 14:20:17',2,21,'type: lds, id_item: 3, color: primary'),(106,'2017-09-15 14:20:20',2,24,'type: lds, id_item: 25, nds: 0'),(107,'2017-09-19 14:45:03',52,1,'127.0.0.1'),(108,'2017-09-19 15:00:30',52,1,'127.0.0.1'),(109,'2017-09-19 15:00:46',52,1,'127.0.0.1'),(110,'2017-09-19 15:03:00',52,1,'127.0.0.1'),(111,'2017-09-19 15:06:19',52,1,'127.0.0.1'),(112,'2017-09-19 15:08:10',52,1,'127.0.0.1'),(113,'2017-09-19 15:08:15',52,1,'127.0.0.1'),(114,'2017-09-19 15:11:32',52,1,'127.0.0.1'),(115,'2017-09-19 15:12:06',52,1,'127.0.0.1'),(116,'2017-09-19 15:12:46',52,1,'127.0.0.1'),(117,'2017-09-19 15:13:08',52,1,'127.0.0.1'),(118,'2017-09-19 15:13:11',52,1,'127.0.0.1'),(119,'2017-09-19 15:14:33',52,1,'127.0.0.1'),(120,'2017-09-19 15:16:24',52,1,'127.0.0.1'),(121,'2017-09-19 15:16:42',52,1,'127.0.0.1'),(122,'2017-09-19 15:17:16',52,1,'127.0.0.1'),(123,'2017-09-19 15:17:32',52,1,'127.0.0.1'),(124,'2017-09-19 15:20:59',52,1,'127.0.0.1'),(125,'2017-09-19 15:21:05',52,1,'127.0.0.1'),(126,'2017-09-19 15:23:02',52,1,'127.0.0.1'),(127,'2017-09-19 15:23:50',52,1,'127.0.0.1'),(128,'2017-09-19 15:24:29',52,1,'127.0.0.1'),(129,'2017-09-19 15:25:32',52,1,'127.0.0.1'),(130,'2017-09-19 15:25:48',52,1,'127.0.0.1'),(131,'2017-09-19 15:25:51',52,1,'127.0.0.1'),(132,'2017-09-19 15:26:48',52,1,'127.0.0.1'),(133,'2017-09-19 15:27:10',52,1,'127.0.0.1'),(134,'2017-09-19 15:27:53',52,1,'127.0.0.1'),(135,'2017-09-19 16:07:56',52,1,'127.0.0.1'),(136,'2017-09-19 16:10:41',52,1,'127.0.0.1'),(137,'2017-09-19 16:11:28',52,1,'127.0.0.1'),(138,'2017-09-19 16:11:53',52,1,'127.0.0.1'),(139,'2017-09-19 16:12:26',52,1,'127.0.0.1'),(140,'2017-09-19 16:13:01',52,1,'127.0.0.1'),(141,'2017-09-19 16:13:26',52,1,'127.0.0.1'),(142,'2017-09-19 16:13:38',52,1,'127.0.0.1'),(143,'2017-09-19 16:14:34',52,1,'127.0.0.1'),(144,'2017-09-19 16:15:17',52,1,'127.0.0.1'),(145,'2017-09-20 19:34:09',52,1,'127.0.0.1'),(146,'2017-09-20 19:38:41',52,1,'127.0.0.1'),(147,'2017-09-20 19:38:56',52,1,'127.0.0.1'),(148,'2017-09-20 19:39:30',52,1,'127.0.0.1'),(149,'2017-09-20 19:41:39',52,1,'127.0.0.1'),(150,'2017-09-20 19:42:08',52,1,'127.0.0.1'),(151,'2017-09-20 19:42:59',52,1,'127.0.0.1'),(152,'2017-09-20 19:43:45',52,1,'127.0.0.1'),(153,'2017-09-20 19:47:46',52,1,'127.0.0.1'),(154,'2017-09-20 19:49:39',52,1,'127.0.0.1'),(155,'2017-09-20 19:51:14',52,1,'127.0.0.1'),(156,'2017-09-20 19:51:38',52,1,'127.0.0.1'),(157,'2017-09-20 19:53:41',52,1,'127.0.0.1'),(158,'2017-09-20 19:54:42',52,1,'127.0.0.1'),(159,'2017-09-20 19:55:32',52,1,'127.0.0.1'),(160,'2017-09-20 19:56:28',52,1,'127.0.0.1'),(161,'2017-09-20 20:02:42',52,1,'127.0.0.1'),(162,'2017-09-21 22:48:54',52,1,'127.0.0.1'),(163,'2017-09-26 12:45:09',52,1,'127.0.0.1'),(164,'2017-09-26 12:46:53',52,1,'127.0.0.1'),(165,'2017-09-26 13:04:36',52,1,'127.0.0.1'),(166,'2017-09-26 13:05:16',52,1,'127.0.0.1'),(167,'2017-09-26 13:46:06',2,1,'127.0.0.1'),(168,'2017-09-26 13:55:07',2,1,'127.0.0.1'),(169,'2017-09-26 13:56:31',2,1,'127.0.0.1'),(170,'2017-09-26 13:56:49',2,1,'127.0.0.1'),(171,'2017-09-26 13:57:14',2,1,'127.0.0.1'),(172,'2017-09-26 14:04:12',2,1,'127.0.0.1'),(173,'2017-09-26 14:04:39',2,1,'127.0.0.1'),(174,'2017-09-26 14:33:55',2,1,'127.0.0.1'),(175,'2017-09-26 14:36:22',2,1,'127.0.0.1'),(176,'2017-09-26 14:36:53',2,1,'127.0.0.1'),(177,'2017-09-26 14:37:10',2,1,'127.0.0.1'),(178,'2017-09-26 14:44:20',2,1,'127.0.0.1'),(179,'2017-09-26 14:45:12',2,1,'127.0.0.1'),(180,'2017-09-26 14:47:05',2,1,'127.0.0.1'),(181,'2017-09-26 14:48:15',2,1,'127.0.0.1'),(182,'2017-09-26 14:48:40',2,1,'127.0.0.1'),(183,'2017-09-26 14:49:10',2,1,'127.0.0.1'),(184,'2017-09-26 14:49:32',2,1,'127.0.0.1'),(185,'2017-09-26 14:50:46',2,1,'127.0.0.1'),(186,'2017-09-26 14:51:09',2,1,'127.0.0.1'),(187,'2017-09-26 15:02:34',2,1,'127.0.0.1'),(188,'2017-09-26 15:03:01',2,1,'127.0.0.1'),(189,'2017-09-26 16:41:22',2,1,'127.0.0.1'),(190,'2017-09-26 17:12:29',2,1,'127.0.0.1'),(191,'2017-09-26 17:26:18',2,1,'127.0.0.1'),(192,'2017-09-26 17:28:02',2,1,'127.0.0.1'),(193,'2017-09-26 17:28:36',2,1,'127.0.0.1'),(194,'2017-09-26 17:45:03',2,1,'127.0.0.1'),(195,'2017-09-26 17:45:44',2,1,'127.0.0.1'),(196,'2017-09-26 17:53:08',2,1,'127.0.0.1'),(197,'2017-09-26 17:53:23',2,1,'127.0.0.1'),(198,'2017-09-26 17:53:26',2,1,'127.0.0.1'),(199,'2017-09-26 17:54:04',2,1,'127.0.0.1'),(200,'2017-09-26 18:01:00',2,1,'127.0.0.1'),(201,'2017-09-26 18:02:22',2,1,'127.0.0.1'),(202,'2017-09-26 21:17:43',2,1,'127.0.0.1'),(203,'2017-09-26 21:18:40',2,1,'127.0.0.1'),(204,'2017-09-26 22:13:27',2,1,'127.0.0.1'),(205,'2017-09-26 22:14:57',2,1,'127.0.0.1'),(206,'2017-09-26 22:16:09',2,1,'127.0.0.1'),(207,'2017-09-26 22:16:39',2,1,'127.0.0.1'),(208,'2017-09-26 22:17:46',2,1,'127.0.0.1'),(209,'2017-09-26 22:23:38',2,1,'127.0.0.1'),(210,'2017-09-26 22:25:01',2,1,'127.0.0.1'),(211,'2017-09-26 22:29:11',2,1,'127.0.0.1'),(212,'2017-09-26 22:30:42',2,17,'type: lds, id_item: 60, Status: 0'),(213,'2017-09-26 22:33:23',2,1,'127.0.0.1'),(214,'2017-09-26 22:33:51',2,17,'type: lds, id_item: 60, Status: 1'),(215,'2017-09-26 22:38:20',2,23,'type: lds, id_item: 61, price: 25'),(216,'2017-09-26 22:38:30',2,18,'type: lds, id_item: 61, Clients_desc: 1234'),(217,'2017-09-26 22:38:37',2,18,'type: lds, id_item: 61, Clients_desc: null'),(218,'2017-09-26 22:38:41',2,17,'type: lds, id_item: 60, Status: 0'),(219,'2017-09-26 22:38:49',2,17,'type: lds, id_item: 60, Status: 1'),(220,'2017-09-26 22:38:58',2,24,'type: lds, id_item: 60, nds: 1'),(221,'2017-09-27 14:46:04',2,1,'127.0.0.1'),(222,'2017-09-27 14:53:05',2,1,'127.0.0.1'),(223,'2017-09-27 14:54:58',2,1,'127.0.0.1'),(224,'2017-09-27 14:55:19',2,1,'127.0.0.1'),(225,'2017-09-27 14:56:35',2,1,'127.0.0.1'),(226,'2017-09-27 14:58:31',2,1,'127.0.0.1'),(227,'2017-09-27 14:59:52',2,1,'127.0.0.1'),(228,'2017-09-27 15:00:14',2,1,'127.0.0.1'),(229,'2017-09-27 15:01:12',2,1,'127.0.0.1'),(230,'2017-09-27 15:01:50',2,1,'127.0.0.1'),(231,'2017-09-27 15:03:34',2,1,'127.0.0.1'),(232,'2017-09-27 15:04:39',2,1,'127.0.0.1'),(233,'2017-10-13 10:05:09',2,1,'127.0.0.1'),(234,'2017-10-25 15:14:27',2,1,'127.0.0.1'),(235,'2017-10-25 15:15:29',2,1,'127.0.0.1'),(236,'2017-10-25 15:15:56',2,7,'id_role: 1, ip: , loginadmin, address: '),(237,'2017-10-25 15:15:58',2,9,'id_user: 53, Status: 1'),(238,'2017-10-25 15:16:03',2,10,'id_user: 53'),(239,'2017-10-25 15:16:09',2,8,'id: 53, ip: , loginadmin, address: '),(240,'2017-10-25 15:16:43',52,1,'127.0.0.1'),(241,'2017-10-25 18:22:25',52,1,'127.0.0.1'),(242,'2017-10-25 19:16:34',52,1,'127.0.0.1'),(243,'2017-10-25 20:35:07',52,14,' Сумма: 120.00 id_service: 9'),(244,'2017-10-25 20:53:39',52,14,' Сумма: 120.00 id_service: 9'),(245,'2017-10-25 20:58:38',52,14,' Сумма: 120.00 id_service: 9'),(246,'2017-10-25 21:00:55',52,14,' Сумма: 120.00 id_service: 9'),(247,'2017-10-25 21:02:53',52,14,' Сумма: 120.00 id_service: 9'),(248,'2017-10-25 21:05:20',52,14,' Сумма: 120.00 id_service: 9'),(249,'2017-10-25 21:06:05',52,14,' Сумма: 120.00 id_service: 9'),(250,'2017-10-25 21:06:27',52,14,' Сумма: 120.00 id_service: 9'),(251,'2017-10-25 21:09:52',52,14,' Сумма: 120.00 id_service: 9'),(252,'2017-10-25 21:10:16',52,14,' Сумма: 120.00 id_service: 16'),(253,'2017-10-25 21:11:20',52,14,' Сумма: 120.00 id_service: 16'),(254,'2017-10-25 21:18:24',52,14,' Сумма: 120.00 id_service: 9'),(255,'2017-10-25 21:18:57',52,14,' Сумма: 120.00 id_service: 9'),(256,'2017-10-25 21:21:02',52,14,' Сумма: 120.00 id_service: 9'),(257,'2017-10-25 21:22:27',52,14,' Сумма: 120.00 id_service: 9'),(258,'2017-10-25 21:22:40',52,14,' Сумма: 120.00 id_service: 9'),(259,'2017-10-25 21:23:25',52,14,' Сумма: 120.00 id_service: 13'),(260,'2017-10-25 21:23:45',52,14,' Сумма: 120.00 id_service: 16'),(261,'2017-10-25 21:27:46',52,14,' Сумма: 120.00 id_service: 9'),(262,'2017-10-25 21:30:48',52,14,' Сумма: 120.00 id_service: 9'),(263,'2017-10-25 21:31:36',52,14,' Сумма: 120.00 id_service: 35'),(264,'2017-10-25 21:33:49',52,14,' Сумма: 120.00 id_service: 35'),(265,'2017-10-25 21:34:38',52,14,' Сумма: 120.00 id_service: 35'),(266,'2017-10-25 21:35:18',52,14,' Сумма: 120.00 id_service: 35'),(267,'2017-10-25 21:43:43',52,14,' Сумма: 120.00 id_service: 35'),(268,'2017-10-25 21:45:27',52,14,' Сумма: 120.00 id_service: 35'),(269,'2017-10-25 21:45:55',52,14,' Сумма: 120.00 id_service: 35'),(270,'2017-10-25 21:46:52',52,14,' Сумма: 120.00 id_service: 9'),(271,'2017-10-25 21:57:24',2,1,'127.0.0.1'),(272,'2017-10-25 22:14:10',52,15,'Сумма: 3360.00 '),(273,'2017-10-25 22:23:28',52,14,' Сумма: 120.00 id_service: 7'),(274,'2017-10-25 22:24:20',52,14,' Сумма: 120.00 id_service: 35'),(275,'2017-10-25 22:24:32',52,14,' Сумма: 120.00 id_service: 31'),(276,'2017-10-25 22:24:45',52,14,' Сумма: 120.00 id_service: 22'),(277,'2017-10-25 22:24:51',52,15,'Сумма: 480.00 '),(278,'2017-10-27 09:26:49',2,1,'127.0.0.1'),(279,'2017-10-27 09:27:27',2,1,'127.0.0.1'),(280,'2017-10-27 09:27:49',2,1,'127.0.0.1'),(281,'2017-10-27 09:28:05',2,8,'id: 53, ip: , loginadmin@atms-zs.ru, address: '),(282,'2017-10-27 09:28:16',53,1,'127.0.0.1'),(283,'2017-10-27 09:30:02',53,17,'type: lds, id_item: 23, Status: 0'),(284,'2017-10-27 09:30:05',53,17,'type: lds, id_item: 23, Status: 1'),(285,'2017-10-27 09:30:27',53,23,'type: lds, id_item: 25, price: 4'),(286,'2017-10-27 09:30:31',53,24,'type: lds, id_item: 25, nds: 1'),(287,'2017-10-27 09:30:53',53,21,'type: lds, id_item: 25, color: warning'),(288,'2017-10-27 09:30:53',53,21,'type: lds, id_item: 25, color: success'),(289,'2017-10-27 09:30:56',53,21,'type: lds, id_item: 25, color: primary'),(290,'2017-10-27 17:23:48',52,1,'127.0.0.1'),(291,'2017-10-27 17:24:17',52,1,'127.0.0.1'),(292,'2017-10-27 17:26:35',52,14,' Сумма: 120.00 id_service: 33'),(293,'2017-10-27 17:26:50',52,14,' Сумма: 120.00 id_service: 23'),(294,'2017-10-27 17:29:25',52,1,'127.0.0.1'),(295,'2017-10-27 17:29:47',52,14,' Сумма: 120.00 id_service: 22'),(296,'2017-10-27 17:30:12',52,14,' Сумма: 120.00 id_service: 36'),(297,'2017-10-27 17:39:57',52,1,'127.0.0.1'),(298,'2017-10-27 17:40:43',52,1,'127.0.0.1'),(299,'2017-10-27 17:41:19',52,1,'127.0.0.1'),(300,'2017-10-27 17:52:31',52,1,'127.0.0.1'),(301,'2017-10-29 01:41:22',52,1,'127.0.0.1'),(302,'2017-10-30 14:45:11',52,1,'127.0.0.1'),(303,'2017-11-17 13:46:03',52,1,'127.0.0.1'),(304,'2017-11-17 13:48:04',52,1,'127.0.0.1'),(305,'2017-11-17 13:50:20',52,1,'127.0.0.1'),(306,'2017-11-17 13:51:29',52,1,'127.0.0.1'),(307,'2017-11-17 13:52:58',52,1,'127.0.0.1'),(308,'2017-11-19 18:34:00',52,1,'127.0.0.1'),(309,'2017-11-19 18:34:40',2,1,'127.0.0.1'),(310,'2017-11-19 18:37:16',2,1,'127.0.0.1'),(311,'2017-11-19 18:37:48',2,9,'id_user: 52, Status: 0'),(312,'2017-11-19 18:37:49',2,9,'id_user: 52, Status: 1'),(313,'2017-11-19 18:38:01',52,1,'127.0.0.1'),(314,'2017-11-19 18:40:00',52,1,'127.0.0.1'),(315,'2017-11-19 18:46:22',2,1,'127.0.0.1'),(316,'2017-11-21 10:50:37',2,1,'127.0.0.1'),(317,'2017-11-21 10:50:44',2,9,'id_user: 52, Status: 0'),(318,'2017-11-21 10:51:06',52,1,'127.0.0.1'),(319,'2017-11-21 10:53:56',52,1,'127.0.0.1'),(320,'2017-11-21 13:38:13',2,1,'127.0.0.1'),(321,'2017-11-21 13:39:14',2,24,'type: lds, id_item: 25, nds: 4000'),(322,'2017-11-21 13:39:32',2,24,'type: lds, id_item: 25, nds: 0000'),(323,'2017-11-21 13:39:37',2,24,'type: lds, id_item: 25, nds: 1000'),(324,'2017-11-21 14:14:30',2,1,'127.0.0.1'),(325,'2017-11-21 14:14:48',52,1,'127.0.0.1'),(326,'2017-11-21 14:37:59',52,1,'127.0.0.1'),(327,'2017-11-21 14:38:19',2,1,'127.0.0.1'),(328,'2017-11-21 15:03:24',2,1,'127.0.0.1'),(329,'2017-11-21 15:04:03',2,1,'127.0.0.1'),(330,'2017-11-21 15:04:40',2,1,'127.0.0.1'),(331,'2017-11-21 15:04:47',2,1,'127.0.0.1'),(332,'2017-11-21 15:05:20',2,1,'127.0.0.1'),(333,'2017-11-21 15:06:20',2,1,'127.0.0.1'),(334,'2017-11-21 15:06:48',2,1,'127.0.0.1'),(335,'2017-11-21 15:12:33',2,1,'127.0.0.1'),(336,'2017-11-21 15:13:34',2,1,'127.0.0.1'),(337,'2017-11-21 15:15:18',2,1,'127.0.0.1'),(338,'2017-11-21 15:31:26',2,1,'127.0.0.1'),(339,'2017-11-21 15:32:41',2,25,'type: lds, id_item: 3, id_day: 6, status: 0'),(340,'2017-11-21 15:33:03',2,25,'type: lds, id_item: 3, id_day: 6, status: 1'),(341,'2017-11-21 15:33:07',2,25,'type: lds, id_item: 3, id_day: 2, status: 1'),(342,'2017-11-21 15:33:07',2,25,'type: lds, id_item: 3, id_day: 1, status: 1'),(343,'2017-11-21 15:33:13',2,25,'type: lds, id_item: 1, id_day: 0, status: 1'),(344,'2017-11-21 15:33:26',2,25,'type: lds, id_item: 3, id_day: 0, status: 0'),(345,'2017-11-21 15:33:36',2,25,'type: lds, id_item: 39, id_day: 0, status: 0'),(346,'2017-11-21 15:33:58',52,1,'127.0.0.1'),(347,'2017-11-21 15:34:14',2,25,'type: lds, id_item: 39, id_day: 1, status: 0'),(348,'2017-11-21 15:34:51',2,25,'type: lds, id_item: 39, id_day: 1, status: 1'),(349,'2017-11-21 15:34:54',2,25,'type: lds, id_item: 3, id_day: 1, status: 0'),(350,'2017-11-21 15:35:19',2,25,'type: lds, id_item: 3, id_day: 1, status: 1'),(351,'2017-11-21 15:35:25',2,25,'type: lds, id_item: 3, id_day: 1, status: 0'),(352,'2017-11-21 15:35:26',2,25,'type: lds, id_item: 1, id_day: 1, status: 0'),(353,'2017-11-21 15:35:28',2,25,'type: lds, id_item: 2, id_day: 1, status: 0'),(354,'2017-11-21 15:35:35',2,25,'type: lds, id_item: 2, id_day: 1, status: 1'),(355,'2017-11-21 15:35:45',2,25,'type: lds, id_item: 1, id_day: 1, status: 1'),(356,'2017-11-21 15:35:55',2,25,'type: lds, id_item: 3, id_day: 1, status: 1'),(357,'2017-11-21 16:23:31',52,1,'127.0.0.1'),(358,'2017-11-29 12:49:59',52,1,'127.0.0.1'),(359,'2017-11-29 12:51:51',52,1,'127.0.0.1'),(360,'2017-11-29 14:28:17',52,1,'127.0.0.1'),(361,'2017-11-29 14:55:22',52,1,'127.0.0.1'),(362,'2017-11-29 14:56:50',52,1,'127.0.0.1'),(363,'2017-11-29 14:57:52',52,1,'127.0.0.1'),(364,'2017-11-29 16:30:07',52,1,'127.0.0.1'),(365,'2017-11-29 16:45:57',2,1,'127.0.0.1'),(366,'2017-11-29 16:46:24',2,18,'type: lds, id_item: 27, Clients_desc: Прокат инвентаря'),(367,'2017-11-29 16:46:37',52,1,'127.0.0.1'),(368,'2017-11-29 22:38:28',52,1,'127.0.0.1'),(369,'2017-11-29 22:38:56',2,1,'127.0.0.1'),(370,'2017-11-30 08:55:13',2,1,'127.0.0.1'),(371,'2017-11-30 09:41:12',2,1,'127.0.0.1'),(372,'2017-11-30 09:41:37',2,1,'127.0.0.1'),(373,'2017-11-30 09:42:59',2,1,'127.0.0.1'),(374,'2017-11-30 09:43:27',2,1,'127.0.0.1'),(375,'2017-11-30 09:44:32',2,1,'127.0.0.1'),(376,'2017-11-30 09:45:24',2,1,'127.0.0.1'),(377,'2017-11-30 09:45:58',2,1,'127.0.0.1'),(378,'2017-11-30 09:53:08',2,1,'127.0.0.1'),(379,'2017-11-30 09:53:37',2,1,'127.0.0.1'),(380,'2017-11-30 09:54:13',2,1,'127.0.0.1'),(381,'2017-11-30 09:55:57',2,1,'127.0.0.1'),(382,'2017-11-30 10:00:47',2,1,'127.0.0.1'),(383,'2017-11-30 10:01:44',2,1,'127.0.0.1'),(384,'2017-11-30 10:02:43',2,1,'127.0.0.1'),(385,'2017-11-30 10:02:57',2,1,'127.0.0.1'),(386,'2017-11-30 10:03:12',2,1,'127.0.0.1'),(387,'2017-11-30 10:03:49',2,1,'127.0.0.1'),(388,'2017-11-30 10:04:57',2,1,'127.0.0.1'),(389,'2017-11-30 10:06:09',2,1,'127.0.0.1'),(390,'2017-11-30 10:45:50',52,1,'127.0.0.1'),(391,'2017-11-30 10:55:46',2,1,'127.0.0.1'),(392,'2017-11-30 10:56:08',2,1,'127.0.0.1'),(393,'2017-11-30 10:56:35',2,1,'127.0.0.1'),(394,'2017-11-30 10:58:18',2,1,'127.0.0.1'),(395,'2017-11-30 10:58:42',2,1,'127.0.0.1'),(396,'2017-11-30 10:58:42',2,1,'127.0.0.1'),(397,'2017-11-30 10:59:10',2,1,'127.0.0.1'),(398,'2017-11-30 10:59:17',2,1,'127.0.0.1'),(399,'2017-11-30 10:59:27',2,1,'127.0.0.1'),(400,'2017-11-30 11:02:10',2,1,'127.0.0.1'),(401,'2017-11-30 11:02:54',2,1,'127.0.0.1'),(402,'2017-11-30 11:15:45',2,NULL,'type: lds, id_item: 0, t_start: 11:00:00, t_finish: 21:00:00'),(403,'2017-11-30 11:16:04',2,NULL,'type: lds, id_item: 0, t_start: 12:00:00, t_finish: 21:00:00'),(404,'2017-11-30 11:16:28',2,NULL,'type: lds, id_item: 0, t_start: 13:00:00, t_finish: 21:00:00'),(405,'2017-11-30 11:28:54',2,1,'127.0.0.1'),(406,'2017-11-30 11:28:54',2,NULL,'type: lds, id_item: 0, t_start: 11:00:00, t_finish: 21:00:00'),(407,'2017-11-30 11:28:59',2,NULL,'type: lds, id_item: 3, t_start: 11:00:00, t_finish: 21:00:00'),(408,'2017-11-30 11:29:30',2,NULL,'type: lds, id_item: 3, t_start: 12:00:00, t_finish: 21:00:00'),(409,'2017-11-30 11:29:46',2,NULL,'type: lds, id_item: 3, t_start: 12:00:00, t_finish: 21:00:00'),(410,'2017-11-30 11:31:00',2,26,'type: lds, id_item: 3, t_start: 12:00:00, t_finish: 21:00:00'),(411,'2017-11-30 11:34:19',2,26,'type: lds, id_item: 3, t_start: 12:00:00, t_finish: 21:00:00'),(412,'2017-11-30 11:34:36',2,26,'type: lds, id_item: 3, t_start: 11:00:00, t_finish: 21:00:00'),(413,'2017-11-30 11:34:51',2,26,'type: lds, id_item: 3, t_start: 12:00:00, t_finish: 21:00:00'),(414,'2017-11-30 11:35:05',2,26,'type: lds, id_item: 3, t_start: 10:00:00, t_finish: 21:00:00'),(415,'2017-11-30 11:51:33',2,1,'127.0.0.1'),(416,'2017-11-30 12:00:20',2,27,'type: lds, id_item: 3, comment_item: 111'),(417,'2017-11-30 12:00:36',2,27,'type: lds, id_item: 3, comment_item: null'),(418,'2017-11-30 12:01:17',2,27,'type: lds, id_item: 25, comment_item: Дети до 6 лет включительно - бесплатно'),(419,'2017-11-30 12:13:01',52,1,'127.0.0.1'),(420,'2017-11-30 12:19:48',52,1,'127.0.0.1'),(421,'2017-11-30 14:46:06',52,1,'127.0.0.1'),(422,'2017-11-30 14:47:14',52,1,'127.0.0.1'),(423,'2017-11-30 14:51:39',52,1,'127.0.0.1'),(424,'2017-11-30 14:52:23',52,1,'127.0.0.1'),(425,'2017-11-30 14:53:10',52,1,'127.0.0.1'),(426,'2017-11-30 14:57:08',52,1,'127.0.0.1'),(427,'2017-11-30 14:59:18',52,1,'127.0.0.1'),(428,'2017-11-30 15:02:36',52,1,'127.0.0.1'),(429,'2017-11-30 15:03:36',52,1,'127.0.0.1'),(430,'2017-11-30 15:05:41',52,1,'127.0.0.1'),(431,'2017-11-30 15:06:33',52,1,'127.0.0.1'),(432,'2017-11-30 15:33:23',52,1,'127.0.0.1'),(433,'2017-11-30 15:38:31',52,1,'127.0.0.1'),(434,'2017-11-30 15:38:58',52,14,' Сумма: 4.00 id_service: 25'),(435,'2017-11-30 15:39:16',52,14,' Сумма: 100.00 id_service: 29'),(436,'2017-11-30 15:40:25',52,14,' Сумма: 400.00 id_service: 31'),(437,'2017-11-30 15:40:39',52,14,' Сумма: 100.00 id_service: 25'),(438,'2017-11-30 15:56:54',2,1,'127.0.0.1'),(439,'2017-11-30 15:58:22',2,1,'127.0.0.1'),(440,'2017-11-30 16:00:43',2,1,'127.0.0.1'),(441,'2017-11-30 16:04:33',2,1,'127.0.0.1'),(442,'2017-11-30 16:05:39',52,1,'127.0.0.1'),(443,'2017-11-30 16:16:43',52,1,'127.0.0.1'),(444,'2017-11-30 16:18:14',52,1,'127.0.0.1'),(445,'2017-11-30 17:11:59',52,1,'127.0.0.1'),(446,'2017-11-30 17:12:36',2,1,'127.0.0.1'),(447,'2017-11-30 17:16:00',2,1,'127.0.0.1'),(448,'2017-11-30 17:22:04',2,1,'127.0.0.1'),(449,'2017-11-30 17:22:35',2,1,'127.0.0.1'),(450,'2017-11-30 18:14:34',52,1,'127.0.0.1'),(451,'2017-11-30 18:15:05',52,14,' Сумма: 100.00 id_service: 36'),(452,'2017-11-30 18:36:35',52,14,' Сумма: 100.00 id_service: 36'),(453,'2017-11-30 18:38:59',52,14,' Сумма: 100.00 id_service: 36'),(454,'2017-11-30 18:40:59',52,14,' Сумма: 100.00 id_service: 36'),(455,'2017-11-30 18:49:46',52,14,' Сумма: 100.00 id_service: 36'),(456,'2017-11-30 18:50:08',52,14,' Сумма: 100.00 id_service: 36'),(457,'2017-11-30 18:51:32',52,14,' Сумма: 100.00 id_service: 36'),(458,'2017-11-30 18:53:08',52,14,' Сумма: 100.00 id_service: 36'),(459,'2017-11-30 18:56:56',52,14,' Сумма: 100.00 id_service: 36'),(460,'2017-11-30 19:00:37',52,14,' Сумма: 100.00 id_service: 36'),(461,'2017-11-30 19:05:39',52,14,' Сумма: 100.00 id_service: 36'),(462,'2017-11-30 19:08:25',52,14,' Сумма: 100.00 id_service: 36'),(463,'2017-11-30 19:09:05',52,14,' Сумма: 10.00 id_service: 36'),(464,'2017-11-30 19:09:37',52,14,' Сумма: 50.00 id_service: 36'),(465,'2017-11-30 19:29:32',52,14,' Сумма: 100.00 id_service: 25'),(466,'2017-11-30 19:36:08',52,1,'127.0.0.1'),(467,'2017-11-30 19:36:34',52,14,' Сумма: 100.00 id_service: 36'),(468,'2017-11-30 19:37:11',52,14,' Сумма: 100.00 id_service: 25'),(469,'2017-11-30 19:37:59',52,14,' Сумма: 50.00 id_service: 25'),(470,'2017-11-30 19:38:27',52,14,' Сумма: 10.00 id_service: 25'),(471,'2017-11-30 20:30:11',52,1,'127.0.0.1'),(472,'2017-11-30 20:31:51',52,14,' Сумма: 100.00 id_service: 25'),(473,'2017-11-30 20:31:58',52,1,'127.0.0.1'),(474,'2017-11-30 20:32:21',52,14,' Сумма: 100.00 id_service: 25'),(475,'2017-11-30 20:32:45',52,1,'127.0.0.1'),(476,'2017-11-30 20:33:43',52,14,' Сумма: 100.00 id_service: 25'),(477,'2017-11-30 20:37:45',52,1,'127.0.0.1'),(478,'2017-11-30 20:38:02',52,14,' Сумма: 100.00 id_service: 25'),(479,'2017-11-30 20:38:59',52,1,'127.0.0.1'),(480,'2017-11-30 20:39:13',52,14,' Сумма: 100.00 id_service: 25'),(481,'2017-11-30 20:39:25',52,1,'127.0.0.1'),(482,'2017-11-30 20:39:41',52,14,' Сумма: 100.00 id_service: 25'),(483,'2017-11-30 20:40:00',52,1,'127.0.0.1'),(484,'2017-11-30 20:40:16',52,14,' Сумма: 100.00 id_service: 25'),(485,'2017-11-30 20:40:31',52,1,'127.0.0.1'),(486,'2017-11-30 20:40:47',52,14,' Сумма: 100.00 id_service: 25'),(487,'2017-11-30 20:43:29',52,1,'127.0.0.1'),(488,'2017-11-30 20:43:46',52,14,' Сумма: 100.00 id_service: 25'),(489,'2017-11-30 20:45:19',52,1,'127.0.0.1'),(490,'2017-11-30 20:45:24',52,1,'127.0.0.1'),(491,'2017-11-30 20:45:40',52,14,' Сумма: 100.00 id_service: 25'),(492,'2017-11-30 20:46:33',52,1,'127.0.0.1'),(493,'2017-11-30 20:47:46',52,1,'127.0.0.1'),(494,'2017-11-30 20:48:07',52,14,' Сумма: 100.00 id_service: 25'),(495,'2017-11-30 20:48:27',52,1,'127.0.0.1'),(496,'2017-11-30 20:48:42',52,14,' Сумма: 100.00 id_service: 25'),(497,'2017-11-30 20:50:12',52,1,'127.0.0.1'),(498,'2017-11-30 20:50:29',52,14,' Сумма: 100.00 id_service: 25'),(499,'2017-11-30 20:52:03',52,1,'127.0.0.1'),(500,'2017-11-30 20:52:15',52,1,'127.0.0.1'),(501,'2017-11-30 20:52:31',52,14,' Сумма: 100.00 id_service: 25'),(502,'2017-11-30 20:52:48',52,1,'127.0.0.1'),(503,'2017-11-30 20:53:05',52,14,' Сумма: 100.00 id_service: 25'),(504,'2017-11-30 20:53:55',52,1,'127.0.0.1'),(505,'2017-11-30 20:54:04',52,1,'127.0.0.1'),(506,'2017-11-30 20:54:22',52,14,' Сумма: 100.00 id_service: 36'),(507,'2017-11-30 20:57:18',52,1,'127.0.0.1'),(508,'2017-11-30 20:57:34',52,14,' Сумма: 100.00 id_service: 25'),(509,'2017-11-30 20:58:31',52,1,'127.0.0.1'),(510,'2017-11-30 20:58:53',52,14,' Сумма: 100.00 id_service: 25'),(511,'2017-12-02 09:07:09',52,1,'127.0.0.1'),(512,'2017-12-02 09:16:52',52,1,'127.0.0.1'),(513,'2017-12-02 09:21:38',52,1,'127.0.0.1'),(514,'2017-12-02 09:27:33',52,1,'127.0.0.1'),(515,'2017-12-02 09:28:53',52,1,'127.0.0.1'),(516,'2017-12-02 09:30:50',52,1,'127.0.0.1'),(517,'2017-12-02 09:31:52',52,1,'127.0.0.1'),(518,'2017-12-02 09:33:27',52,1,'127.0.0.1'),(519,'2017-12-02 09:36:19',52,1,'127.0.0.1'),(520,'2017-12-02 09:39:02',52,1,'127.0.0.1'),(521,'2017-12-02 09:39:47',52,14,' Сумма: 2500.00 id_service: 45'),(522,'2017-12-03 23:06:32',52,1,'127.0.0.1'),(523,'2017-12-03 23:07:41',52,1,'127.0.0.1'),(524,'2017-12-03 23:11:24',52,1,'127.0.0.1'),(525,'2017-12-03 23:20:00',52,1,'127.0.0.1'),(526,'2017-12-03 23:22:17',52,1,'127.0.0.1'),(527,'2017-12-03 23:22:23',52,1,'127.0.0.1'),(528,'2017-12-04 11:18:13',52,1,'127.0.0.1'),(529,'2017-12-04 11:22:38',52,1,'127.0.0.1'),(530,'2017-12-04 11:26:33',52,1,'127.0.0.1'),(531,'2017-12-04 11:30:42',52,1,'127.0.0.1'),(532,'2017-12-04 11:32:00',52,1,'127.0.0.1'),(533,'2017-12-04 11:35:35',52,1,'127.0.0.1'),(534,'2017-12-04 11:39:04',52,1,'127.0.0.1'),(535,'2017-12-04 11:40:31',52,1,'127.0.0.1'),(536,'2017-12-04 11:40:57',52,1,'127.0.0.1'),(537,'2017-12-04 11:48:21',52,1,'127.0.0.1'),(538,'2017-12-04 11:50:48',52,1,'127.0.0.1'),(539,'2017-12-04 11:53:14',52,1,'127.0.0.1'),(540,'2017-12-04 11:53:55',52,1,'127.0.0.1'),(541,'2017-12-04 12:03:25',52,1,'127.0.0.1'),(542,'2017-12-04 12:04:00',52,1,'127.0.0.1'),(543,'2017-12-04 12:04:44',52,1,'127.0.0.1'),(544,'2017-12-04 12:06:01',52,1,'127.0.0.1'),(545,'2017-12-04 12:08:25',52,1,'127.0.0.1'),(546,'2017-12-04 12:08:28',52,1,'127.0.0.1'),(547,'2017-12-04 12:10:14',52,1,'127.0.0.1'),(548,'2017-12-04 12:11:42',52,1,'127.0.0.1'),(549,'2017-12-04 12:27:37',52,1,'127.0.0.1'),(550,'2017-12-04 12:29:24',52,1,'127.0.0.1'),(551,'2017-12-04 12:30:35',52,1,'127.0.0.1'),(552,'2017-12-04 12:36:07',52,14,' Сумма: 4100.00 id_service: 9'),(553,'2017-12-04 12:39:12',52,1,'127.0.0.1'),(554,'2017-12-04 12:40:32',52,1,'127.0.0.1'),(555,'2017-12-04 12:41:49',52,1,'127.0.0.1'),(556,'2017-12-04 13:34:37',52,1,'127.0.0.1'),(557,'2017-12-04 13:35:24',52,14,' Сумма: 170.00 id_service: 13'),(558,'2017-12-04 13:35:56',52,14,' Сумма: 170.00 id_service: 13'),(559,'2017-12-04 13:36:00',52,14,' Сумма: 170.00 id_service: 13'),(560,'2017-12-04 13:37:29',52,14,' Сумма: 170.00 id_service: 13'),(561,'2017-12-04 13:37:29',52,14,' Сумма: 170.00 id_service: 13'),(562,'2017-12-04 13:37:29',52,14,' Сумма: 170.00 id_service: 13'),(563,'2017-12-04 13:37:29',52,14,' Сумма: 170.00 id_service: 13'),(564,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(565,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(566,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(567,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(568,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(569,'2017-12-04 13:40:43',52,14,' Сумма: 50.00 id_service: 25'),(570,'2017-12-04 13:41:19',52,14,' Сумма: 50.00 id_service: 25'),(571,'2017-12-04 13:41:19',52,14,' Сумма: 50.00 id_service: 25'),(572,'2017-12-04 14:02:00',52,14,' Сумма: 50.00 id_service: 25'),(573,'2017-12-04 14:02:00',52,14,' Сумма: 50.00 id_service: 25'),(574,'2017-12-04 14:24:25',52,1,'127.0.0.1'),(575,'2017-12-04 14:29:44',52,1,'127.0.0.1'),(576,'2017-12-04 14:30:46',52,1,'127.0.0.1'),(577,'2017-12-04 14:34:20',52,1,'127.0.0.1'),(578,'2017-12-04 14:42:38',52,14,' Сумма: 50.00 id_service: 25'),(579,'2017-12-04 14:42:38',52,14,' Сумма: 50.00 id_service: 25'),(580,'2017-12-04 14:44:21',52,14,' Сумма: 50.00 id_service: 25'),(581,'2017-12-04 14:44:21',52,14,' Сумма: 50.00 id_service: 25'),(582,'2017-12-04 14:46:20',52,1,'127.0.0.1'),(583,'2017-12-04 14:50:35',52,1,'127.0.0.1'),(584,'2017-12-04 14:52:50',52,1,'127.0.0.1'),(585,'2017-12-04 14:55:01',52,1,'127.0.0.1'),(586,'2017-12-04 14:55:09',52,1,'127.0.0.1'),(587,'2017-12-04 14:57:55',52,1,'127.0.0.1'),(588,'2017-12-04 14:59:20',52,1,'127.0.0.1'),(589,'2017-12-04 14:59:54',52,14,' Сумма: 50.00 id_service: 25'),(590,'2017-12-04 14:59:54',52,14,' Сумма: 50.00 id_service: 25'),(591,'2017-12-04 14:59:54',52,14,' Сумма: 50.00 id_service: 25'),(592,'2017-12-04 14:59:54',52,14,' Сумма: 50.00 id_service: 25'),(593,'2017-12-04 15:06:56',52,1,'127.0.0.1'),(594,'2017-12-04 15:20:53',52,1,'127.0.0.1'),(595,'2017-12-04 15:21:55',52,1,'127.0.0.1'),(596,'2017-12-04 15:22:44',52,1,'127.0.0.1'),(597,'2017-12-04 15:23:45',52,1,'127.0.0.1'),(598,'2017-12-04 15:26:55',52,1,'127.0.0.1'),(599,'2017-12-04 15:38:34',52,1,'127.0.0.1'),(600,'2017-12-04 15:45:49',52,1,'127.0.0.1'),(601,'2017-12-04 15:52:49',52,1,'127.0.0.1'),(602,'2017-12-04 15:59:19',52,1,'127.0.0.1'),(603,'2017-12-04 16:07:17',52,1,'127.0.0.1'),(604,'2017-12-04 16:08:35',52,1,'127.0.0.1'),(605,'2017-12-04 16:14:49',52,1,'127.0.0.1'),(606,'2017-12-04 16:17:47',52,1,'127.0.0.1'),(607,'2017-12-04 16:17:55',52,1,'127.0.0.1'),(608,'2017-12-04 16:24:52',52,1,'127.0.0.1'),(609,'2017-12-04 16:26:41',52,14,' Сумма: 50.00 id_service: 25'),(610,'2017-12-04 16:26:41',52,14,' Сумма: 50.00 id_service: 25'),(611,'2017-12-04 16:26:41',52,14,' Сумма: 50.00 id_service: 25'),(612,'2017-12-04 16:30:22',52,1,'127.0.0.1'),(613,'2017-12-04 19:33:50',52,1,'127.0.0.1'),(614,'2017-12-05 08:58:35',52,1,'127.0.0.1'),(615,'2017-12-05 12:59:32',52,1,'127.0.0.1'),(616,'2017-12-05 13:08:14',2,1,'127.0.0.1'),(617,'2017-12-05 13:09:44',2,1,'127.0.0.1'),(618,'2017-12-05 13:10:23',2,1,'127.0.0.1'),(619,'2017-12-05 13:17:54',2,1,'127.0.0.1'),(620,'2017-12-05 13:22:11',2,1,'127.0.0.1'),(621,'2017-12-05 13:22:35',2,1,'127.0.0.1'),(622,'2017-12-05 13:50:49',2,1,'127.0.0.1'),(623,'2017-12-05 13:51:41',2,1,'127.0.0.1'),(624,'2017-12-05 15:13:02',2,1,'127.0.0.1'),(625,'2017-12-05 15:19:26',52,1,'127.0.0.1'),(626,'2017-12-05 15:20:20',52,14,' Сумма: 3000.00 id_service: 81'),(627,'2017-12-05 15:29:30',52,14,' Сумма: 4000.00 id_service: 82'),(628,'2017-12-05 17:18:15',52,1,'127.0.0.1'),(629,'2017-12-05 17:18:33',2,1,'127.0.0.1'),(630,'2017-12-08 11:51:18',2,1,'127.0.0.1'),(631,'2017-12-08 11:51:38',52,1,'127.0.0.1'),(632,'2017-12-08 11:54:49',52,1,'127.0.0.1'),(633,'2017-12-08 11:56:07',52,14,' Сумма: 50.00 id_service: 25'),(634,'2017-12-08 11:56:55',2,1,'127.0.0.1'),(635,'2017-12-08 12:44:41',2,1,'127.0.0.1'),(636,'2017-12-08 13:12:26',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 13:12:00, t_finish: 00:00:00'),(637,'2017-12-08 13:12:28',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 14:12:00, t_finish: 00:00:00'),(638,'2017-12-08 13:12:29',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 15:12:00, t_finish: 00:00:00'),(639,'2017-12-08 13:12:40',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 15:12:00, t_finish: 13:12:00'),(640,'2017-12-08 13:12:43',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 15:12:00, t_finish: 13:00:00'),(641,'2017-12-08 13:12:49',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 15:12:00, t_finish: 13:00:00'),(642,'2017-12-08 13:12:53',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 08:12:00, t_finish: 13:00:00'),(643,'2017-12-08 13:12:56',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 08:00:00, t_finish: 13:00:00'),(644,'2017-12-08 13:16:03',2,26,'type: lds, id_item: 3, id_day: 8, t_start: 13:14:00, t_finish: 00:00:00'),(645,'2017-12-08 13:16:48',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 00:14:00, t_finish: 00:00:00'),(646,'2017-12-08 13:16:58',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:14:00, t_finish: 00:00:00'),(647,'2017-12-08 13:17:00',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:00:00, t_finish: 00:00:00'),(648,'2017-12-08 13:17:02',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:00:00, t_finish: 13:17:00'),(649,'2017-12-08 13:17:04',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:00:00, t_finish: 00:17:00'),(650,'2017-12-08 13:17:07',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:00:00, t_finish: 16:17:00'),(651,'2017-12-08 13:17:10',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 08:00:00, t_finish: 16:00:00'),(652,'2017-12-08 13:17:31',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 13:17:00, t_finish: 00:00:00'),(653,'2017-12-08 13:17:34',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:17:00, t_finish: 00:00:00'),(654,'2017-12-08 13:17:37',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 00:00:00'),(655,'2017-12-08 13:17:39',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 13:17:00'),(656,'2017-12-08 13:17:42',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 10:17:00'),(657,'2017-12-08 13:17:45',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 10:00:00'),(658,'2017-12-08 13:21:46',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 10:00:00'),(659,'2017-12-08 13:21:50',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 14:00:00'),(660,'2017-12-08 13:22:54',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 16:00:00'),(661,'2017-12-08 13:22:55',2,26,'type: lds, id_item: 3, id_day: 4, t_start: 08:00:00, t_finish: 08:00:00'),(662,'2017-12-08 13:46:45',52,1,'127.0.0.1'),(663,'2017-12-08 13:47:10',52,1,'127.0.0.1'),(664,'2017-12-08 13:51:08',52,1,'127.0.0.1'),(665,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(666,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(667,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(668,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(669,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(670,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(671,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(672,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(673,'2017-12-08 13:52:34',52,14,' Сумма: 100.00 id_service: 29'),(674,'2017-12-08 13:56:01',52,1,'127.0.0.1'),(675,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(676,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(677,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(678,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(679,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(680,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(681,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(682,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(683,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(684,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(685,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(686,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(687,'2017-12-08 13:57:01',52,14,' Сумма: 100.00 id_service: 29'),(688,'2017-12-08 13:58:49',52,1,'127.0.0.1'),(689,'2017-12-08 14:00:16',52,1,'127.0.0.1'),(690,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(691,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(692,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(693,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(694,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(695,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(696,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(697,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(698,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(699,'2017-12-08 14:00:51',52,14,' Сумма: 50.00 id_service: 36'),(700,'2017-12-19 11:22:03',52,1,'127.0.0.1'),(701,'2017-12-19 11:33:26',2,1,'127.0.0.1'),(702,'2017-12-19 11:36:07',2,28,'type: lds, id_item: 0, type: 0'),(703,'2017-12-19 11:36:17',2,28,'type: lds, id_item: 0, type: 0'),(704,'2017-12-19 11:36:24',2,28,'type: lds, id_item: 0, type: 0'),(705,'2017-12-19 11:37:46',2,1,'127.0.0.1'),(706,'2017-12-19 11:43:38',2,28,'type: lds, id_item: 0, type: 0'),(707,'2017-12-19 11:43:38',2,1,'127.0.0.1'),(708,'2017-12-19 11:43:52',2,28,'type: lds, id_item: 0, type: 1'),(709,'2017-12-19 11:43:59',2,28,'type: lds, id_item: 0, type: 0'),(710,'2017-12-19 11:44:04',2,28,'type: lds, id_item: 0, type: 1'),(711,'2017-12-19 11:44:10',2,1,'127.0.0.1'),(712,'2017-12-19 11:45:01',2,28,'type: lds, id_item: 0, type: 1'),(713,'2017-12-19 11:47:39',2,28,'type: lds, id_item: 29, type: 1'),(714,'2017-12-19 11:49:45',52,1,'127.0.0.1'),(715,'2017-12-19 11:57:29',52,1,'127.0.0.1'),(716,'2017-12-19 11:57:53',52,14,' Сумма: 50.00 id_service: 36'),(717,'2017-12-19 11:57:53',52,14,' Сумма: 50.00 id_service: 36'),(718,'2017-12-19 11:57:53',52,14,' Сумма: 50.00 id_service: 36'),(719,'2017-12-19 11:57:53',52,14,' Сумма: 50.00 id_service: 36'),(720,'2017-12-19 12:19:55',52,14,' Сумма: 100.00 id_service: 29'),(721,'2017-12-19 12:19:55',52,14,' Сумма: 100.00 id_service: 29'),(722,'2017-12-19 12:19:55',52,14,' Сумма: 100.00 id_service: 29'),(723,'2017-12-19 12:19:55',52,14,' Сумма: 50.00 id_service: 36'),(724,'2017-12-19 12:19:55',52,14,' Сумма: 50.00 id_service: 36'),(725,'2017-12-19 12:19:55',52,14,' Сумма: 50.00 id_service: 36'),(726,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(727,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(728,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(729,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(730,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(731,'2017-12-19 12:37:21',52,14,' Сумма: 50.00 id_service: 36'),(732,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(733,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(734,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(735,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(736,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(737,'2017-12-19 12:38:56',52,14,' Сумма: 50.00 id_service: 36'),(738,'2017-12-19 12:42:34',52,14,' Сумма: 50.00 id_service: 36'),(739,'2017-12-19 12:42:34',52,14,' Сумма: 50.00 id_service: 36'),(740,'2017-12-19 12:42:34',52,14,' Сумма: 50.00 id_service: 36'),(741,'2017-12-19 12:42:34',52,14,' Сумма: 50.00 id_service: 36'),(742,'2017-12-19 12:42:34',52,14,' Сумма: 100.00 id_service: 29'),(743,'2017-12-19 12:42:34',52,14,' Сумма: 100.00 id_service: 29'),(744,'2017-12-19 12:42:34',52,14,' Сумма: 100.00 id_service: 29'),(745,'2017-12-19 12:45:42',52,14,' Сумма: 750.00 id_service: 85'),(746,'2017-12-19 12:45:42',52,14,' Сумма: 750.00 id_service: 85'),(747,'2017-12-19 12:45:42',52,14,' Сумма: 100.00 id_service: 29'),(748,'2017-12-19 12:45:42',52,14,' Сумма: 100.00 id_service: 29'),(749,'2017-12-19 12:45:42',52,14,' Сумма: 100.00 id_service: 29'),(750,'2017-12-19 12:45:42',52,14,' Сумма: 100.00 id_service: 29'),(751,'2017-12-19 12:45:42',52,14,' Сумма: 100.00 id_service: 29'),(752,'2017-12-19 12:46:50',52,14,' Сумма: 0.00 id_service: 9'),(753,'2017-12-19 21:17:43',52,1,'127.0.0.1'),(754,'2017-12-19 21:19:50',2,1,'127.0.0.1'),(755,'2017-12-20 14:20:03',2,1,'127.0.0.1'),(756,'2017-12-20 14:58:18',2,1,'127.0.0.1'),(757,'2017-12-20 15:02:36',52,1,'127.0.0.1'),(758,'2017-12-20 15:09:05',52,1,'127.0.0.1'),(759,'2017-12-20 15:12:57',52,1,'127.0.0.1'),(760,'2017-12-20 15:13:32',52,1,'127.0.0.1'),(761,'2017-12-20 15:26:35',52,14,' Сумма: 550.00 id_service: 73'),(762,'2017-12-20 15:30:05',52,14,' Сумма: 550.00 id_service: 73'),(763,'2017-12-20 15:31:55',52,14,' Сумма: 2750.00 id_service: 102'),(764,'2017-12-20 15:37:54',52,14,' Сумма: 2750.00 id_service: 102'),(765,'2017-12-20 15:37:54',52,14,' Сумма: 2750.00 id_service: 102'),(766,'2017-12-20 16:26:30',2,1,'127.0.0.1'),(767,'2018-01-02 14:11:28',2,1,'127.0.0.1'),(768,'2018-01-02 14:24:53',2,23,'type: lds, id_item: 25, price: 100.00'),(769,'2018-01-02 14:25:29',2,23,'type: lds, id_item: 25, price: 50.00'),(770,'2018-03-03 15:54:07',2,1,'127.0.0.1'),(771,'2018-03-03 16:04:33',2,1,'127.0.0.1'),(772,'2018-03-03 17:24:00',2,1,'127.0.0.1'),(773,'2018-03-03 17:25:41',2,1,'127.0.0.1'),(774,'2018-03-03 17:30:33',2,1,'127.0.0.1'),(775,'2018-03-03 17:32:29',2,1,'127.0.0.1'),(776,'2018-03-03 17:33:22',2,1,'127.0.0.1'),(777,'2018-03-03 17:35:27',2,1,'127.0.0.1'),(778,'2018-03-03 18:29:59',52,1,'127.0.0.1'),(779,'2018-03-03 18:33:14',52,1,'127.0.0.1'),(780,'2018-03-04 09:45:18',2,1,'127.0.0.1'),(781,'2018-03-04 10:05:35',2,1,'127.0.0.1'),(782,'2018-03-04 10:12:42',2,1,'127.0.0.1'),(783,'2018-03-04 10:13:46',2,1,'127.0.0.1'),(784,'2018-03-04 10:17:45',52,1,'127.0.0.1'),(785,'2018-03-04 10:42:20',52,1,'127.0.0.1'),(786,'2018-03-04 10:42:22',52,1,'127.0.0.1'),(787,'2018-03-04 11:17:24',52,1,'127.0.0.1'),(788,'2018-03-04 11:19:33',52,1,'127.0.0.1'),(789,'2018-03-04 11:20:45',52,1,'127.0.0.1'),(790,'2018-03-04 11:25:54',52,1,'127.0.0.1'),(791,'2018-03-04 11:25:56',52,1,'127.0.0.1'),(792,'2018-03-04 11:25:58',52,1,'127.0.0.1'),(793,'2018-03-04 11:26:57',52,1,'127.0.0.1'),(794,'2018-03-04 11:35:07',52,1,'127.0.0.1'),(795,'2018-03-04 12:03:08',52,1,'127.0.0.1'),(796,'2018-03-04 12:03:12',52,1,'127.0.0.1'),(797,'2018-03-04 12:05:24',52,1,'127.0.0.1'),(798,'2018-03-04 12:13:50',52,1,'127.0.0.1'),(799,'2018-03-04 12:14:40',52,1,'127.0.0.1'),(800,'2018-03-04 12:14:51',52,1,'127.0.0.1'),(801,'2018-03-04 12:17:08',52,1,'127.0.0.1'),(802,'2018-03-04 12:17:52',52,1,'127.0.0.1'),(803,'2018-03-04 12:18:32',52,1,'127.0.0.1'),(804,'2018-03-04 12:19:47',52,1,'127.0.0.1'),(805,'2018-03-04 12:22:17',52,1,'127.0.0.1'),(806,'2018-03-04 12:27:12',52,1,'127.0.0.1'),(807,'2018-03-04 13:12:30',2,1,'127.0.0.1'),(808,'2018-03-04 13:13:33',52,1,'127.0.0.1'),(809,'2018-03-04 13:14:04',52,1,'127.0.0.1'),(810,'2018-03-04 13:19:11',52,1,'127.0.0.1'),(811,'2018-03-04 13:20:06',52,1,'127.0.0.1'),(812,'2018-03-04 13:22:14',52,1,'127.0.0.1'),(813,'2018-03-04 13:23:10',52,1,'127.0.0.1'),(814,'2018-03-04 13:24:43',52,1,'127.0.0.1'),(815,'2018-03-04 13:25:52',52,1,'127.0.0.1'),(816,'2018-03-04 13:26:38',52,1,'127.0.0.1'),(817,'2018-03-04 13:30:38',52,1,'127.0.0.1'),(818,'2018-03-04 13:32:57',52,1,'127.0.0.1'),(819,'2018-03-04 13:33:00',52,1,'127.0.0.1'),(820,'2018-03-04 13:33:27',52,1,'127.0.0.1'),(821,'2018-03-04 13:36:40',52,1,'127.0.0.1'),(822,'2018-03-04 13:37:31',52,1,'127.0.0.1'),(823,'2018-03-04 13:39:25',52,1,'127.0.0.1'),(824,'2018-03-04 13:42:28',52,1,'127.0.0.1'),(825,'2018-03-04 13:47:53',52,1,'127.0.0.1'),(826,'2018-03-08 10:30:40',52,1,'127.0.0.1'),(827,'2018-03-08 11:01:57',52,1,'127.0.0.1'),(828,'2018-03-08 11:03:47',52,1,'127.0.0.1'),(829,'2018-03-08 11:12:03',52,1,'127.0.0.1'),(830,'2018-03-08 11:21:17',52,1,'127.0.0.1'),(831,'2018-03-08 11:22:20',52,1,'127.0.0.1'),(832,'2018-03-08 11:22:57',52,1,'127.0.0.1'),(833,'2018-03-08 11:24:34',52,1,'127.0.0.1'),(834,'2018-03-08 11:25:07',52,1,'127.0.0.1'),(835,'2018-03-08 11:26:43',52,1,'127.0.0.1'),(836,'2018-03-08 11:27:28',52,1,'127.0.0.1'),(837,'2018-03-08 11:28:03',52,1,'127.0.0.1'),(838,'2018-03-08 11:28:26',52,1,'127.0.0.1'),(839,'2018-03-08 11:29:30',52,1,'127.0.0.1'),(840,'2018-03-08 11:33:16',2,1,'127.0.0.1'),(841,'2018-03-08 11:35:42',52,1,'127.0.0.1'),(842,'2018-03-08 11:36:21',52,1,'127.0.0.1'),(843,'2018-03-08 11:37:59',52,1,'127.0.0.1'),(844,'2018-03-08 11:38:20',52,1,'127.0.0.1'),(845,'2018-03-08 11:41:48',52,1,'127.0.0.1'),(846,'2018-03-08 11:46:52',52,1,'127.0.0.1'),(847,'2018-03-08 11:50:05',52,1,'127.0.0.1'),(848,'2018-03-08 11:53:03',52,1,'127.0.0.1'),(849,'2018-03-08 13:22:51',52,1,'127.0.0.1'),(850,'2018-03-08 13:23:16',52,1,'127.0.0.1'),(851,'2018-03-08 13:23:46',52,1,'127.0.0.1'),(852,'2018-03-08 13:24:15',52,1,'127.0.0.1'),(853,'2018-03-08 13:24:45',52,1,'127.0.0.1'),(854,'2018-03-08 13:28:41',52,1,'127.0.0.1'),(855,'2018-03-08 13:30:31',52,1,'127.0.0.1'),(856,'2018-03-08 13:33:43',52,1,'127.0.0.1'),(857,'2018-03-08 13:46:59',2,1,'127.0.0.1'),(858,'2018-03-08 13:48:41',2,1,'127.0.0.1'),(859,'2018-03-08 13:49:44',2,1,'127.0.0.1'),(860,'2018-03-08 13:51:28',52,1,'127.0.0.1'),(861,'2018-03-08 16:03:06',52,1,'127.0.0.1'),(862,'2018-03-08 16:20:12',52,1,'127.0.0.1'),(863,'2018-03-08 16:37:10',52,1,'127.0.0.1'),(864,'2018-03-08 16:43:56',52,1,'127.0.0.1'),(865,'2018-03-08 16:45:45',52,1,'127.0.0.1'),(866,'2018-03-08 16:47:28',52,1,'127.0.0.1'),(867,'2018-03-08 16:51:16',52,1,'127.0.0.1'),(868,'2018-03-08 16:53:59',52,1,'127.0.0.1'),(869,'2018-03-08 16:56:17',52,1,'127.0.0.1'),(870,'2018-03-08 17:01:39',52,1,'127.0.0.1'),(871,'2018-03-08 17:02:40',52,1,'127.0.0.1'),(872,'2018-03-08 18:38:04',52,1,'127.0.0.1'),(873,'2018-03-08 18:53:07',52,1,'127.0.0.1'),(874,'2018-03-08 18:54:40',52,1,'127.0.0.1'),(875,'2018-03-08 18:59:50',52,1,'127.0.0.1'),(876,'2018-03-08 19:01:41',52,1,'127.0.0.1'),(877,'2018-03-08 19:04:08',52,1,'127.0.0.1'),(878,'2018-03-09 13:41:57',52,1,'127.0.0.1'),(879,'2018-03-09 16:19:11',2,1,'127.0.0.1'),(880,'2018-03-09 16:32:33',52,1,'127.0.0.1'),(881,'2018-03-09 16:33:32',52,1,'127.0.0.1'),(882,'2018-03-09 16:59:25',52,1,'127.0.0.1'),(883,'2018-03-09 19:07:43',52,1,'127.0.0.1'),(884,'2018-03-09 19:09:21',52,1,'127.0.0.1'),(885,'2018-03-09 20:30:22',52,1,'127.0.0.1'),(886,'2018-03-09 20:31:22',52,1,'127.0.0.1'),(887,'2018-03-09 20:33:36',52,1,'127.0.0.1'),(888,'2018-03-09 20:35:10',52,1,'127.0.0.1'),(889,'2018-03-09 20:51:02',52,1,'127.0.0.1'),(890,'2018-03-09 20:54:51',52,1,'127.0.0.1'),(891,'2018-03-09 20:54:58',52,1,'127.0.0.1'),(892,'2018-03-09 20:56:25',52,1,'127.0.0.1'),(893,'2018-03-09 21:07:11',52,1,'127.0.0.1'),(894,'2018-03-09 21:08:34',52,1,'127.0.0.1'),(895,'2018-03-09 21:12:41',52,1,'127.0.0.1'),(896,'2018-03-09 21:18:43',52,1,'127.0.0.1'),(897,'2018-03-09 21:20:01',52,1,'127.0.0.1'),(898,'2018-03-09 21:21:35',52,1,'127.0.0.1'),(899,'2018-03-09 21:29:13',52,1,'127.0.0.1'),(900,'2018-03-09 21:29:43',52,1,'127.0.0.1'),(901,'2018-03-09 21:32:21',52,1,'127.0.0.1'),(902,'2018-03-09 21:33:51',52,1,'127.0.0.1'),(903,'2018-03-09 21:35:27',52,1,'127.0.0.1'),(904,'2018-03-09 21:38:46',52,1,'127.0.0.1'),(905,'2018-03-09 21:40:24',52,1,'127.0.0.1'),(906,'2018-03-09 21:55:53',52,1,'127.0.0.1'),(907,'2018-03-09 21:58:55',52,1,'127.0.0.1'),(908,'2018-03-09 22:07:20',52,1,'127.0.0.1'),(909,'2018-03-09 22:10:21',52,1,'127.0.0.1'),(910,'2018-03-09 22:16:43',52,1,'127.0.0.1'),(911,'2018-03-10 12:37:08',2,1,'127.0.0.1'),(912,'2018-03-10 12:50:48',2,1,'127.0.0.1'),(913,'2018-03-10 12:51:04',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 16:45:00, t_finish: 21:30:00'),(914,'2018-03-10 12:51:04',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 15:45:00, t_finish: 21:30:00'),(915,'2018-03-10 12:51:04',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 14:45:00, t_finish: 21:30:00'),(916,'2018-03-10 12:51:05',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 13:45:00, t_finish: 21:30:00'),(917,'2018-03-10 12:51:05',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 12:45:00, t_finish: 21:30:00'),(918,'2018-03-10 12:51:13',2,1,'127.0.0.1'),(919,'2018-03-10 12:51:48',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 16:45:00, t_finish: 21:30:00'),(920,'2018-03-10 12:51:48',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 15:45:00, t_finish: 21:30:00'),(921,'2018-03-10 12:51:48',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 14:45:00, t_finish: 21:30:00'),(922,'2018-03-10 12:51:49',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 13:45:00, t_finish: 21:30:00'),(923,'2018-03-10 12:51:49',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 12:45:00, t_finish: 21:30:00'),(924,'2018-03-10 12:51:54',2,26,'type: lds, id_item: 3, id_day: 6, t_start: 16:45:00, t_finish: 21:30:00'),(925,'2018-03-10 12:51:54',2,26,'type: lds, id_item: 3, id_day: 6, t_start: 15:45:00, t_finish: 21:30:00'),(926,'2018-03-10 12:51:54',2,26,'type: lds, id_item: 3, id_day: 6, t_start: 14:45:00, t_finish: 21:30:00'),(927,'2018-03-10 12:51:55',2,26,'type: lds, id_item: 3, id_day: 6, t_start: 13:45:00, t_finish: 21:30:00'),(928,'2018-03-10 12:51:55',2,26,'type: lds, id_item: 3, id_day: 6, t_start: 12:45:00, t_finish: 21:30:00'),(929,'2018-03-10 14:55:52',52,1,'127.0.0.1'),(930,'2018-03-10 14:57:39',52,1,'127.0.0.1'),(931,'2018-03-10 14:58:01',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 16:45:00, t_finish: 21:30:00'),(932,'2018-03-10 14:58:01',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 15:45:00, t_finish: 21:30:00'),(933,'2018-03-10 14:58:01',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 14:45:00, t_finish: 21:30:00'),(934,'2018-03-10 14:58:02',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 13:45:00, t_finish: 21:30:00'),(935,'2018-03-10 14:58:02',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 12:45:00, t_finish: 21:30:00'),(936,'2018-03-10 14:58:05',2,25,'type: lds, id_item: 3, id_day: 0, status: 1'),(937,'2018-03-10 14:58:10',52,1,'127.0.0.1'),(938,'2018-03-10 14:58:38',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 15:45:00, t_finish: 21:30:00'),(939,'2018-03-10 14:58:39',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 14:45:00, t_finish: 21:30:00'),(940,'2018-03-10 14:58:39',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 13:45:00, t_finish: 21:30:00'),(941,'2018-03-10 14:58:40',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:45:00, t_finish: 21:30:00'),(942,'2018-03-10 14:58:40',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 11:45:00, t_finish: 21:30:00'),(943,'2018-03-10 14:58:41',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:45:00, t_finish: 21:30:00'),(944,'2018-03-10 14:58:43',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:44:00, t_finish: 21:30:00'),(945,'2018-03-10 14:58:44',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:43:00, t_finish: 21:30:00'),(946,'2018-03-10 14:58:45',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:42:00, t_finish: 21:30:00'),(947,'2018-03-10 14:58:45',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:41:00, t_finish: 21:30:00'),(948,'2018-03-10 14:58:45',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:40:00, t_finish: 21:30:00'),(949,'2018-03-10 14:58:45',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:39:00, t_finish: 21:30:00'),(950,'2018-03-10 14:58:46',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:38:00, t_finish: 21:30:00'),(951,'2018-03-10 14:58:46',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:37:00, t_finish: 21:30:00'),(952,'2018-03-10 14:58:46',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:36:00, t_finish: 21:30:00'),(953,'2018-03-10 14:58:46',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:35:00, t_finish: 21:30:00'),(954,'2018-03-10 14:58:47',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:34:00, t_finish: 21:30:00'),(955,'2018-03-10 14:58:47',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:33:00, t_finish: 21:30:00'),(956,'2018-03-10 14:58:48',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:32:00, t_finish: 21:30:00'),(957,'2018-03-10 14:58:48',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:31:00, t_finish: 21:30:00'),(958,'2018-03-10 14:58:49',2,26,'type: lds, id_item: 39, id_day: 5, t_start: 12:30:00, t_finish: 21:30:00'),(959,'2018-03-10 14:58:53',52,1,'127.0.0.1'),(960,'2018-03-10 14:59:58',52,1,'127.0.0.1'),(961,'2018-03-10 15:00:23',52,1,'127.0.0.1'),(962,'2018-03-10 15:01:11',52,1,'127.0.0.1'),(963,'2018-03-10 16:47:02',52,1,'127.0.0.1'),(964,'2018-03-10 16:48:41',52,1,'127.0.0.1'),(965,'2018-03-10 16:49:44',2,1,'127.0.0.1'),(966,'2018-03-10 16:55:55',52,1,'127.0.0.1'),(967,'2018-03-10 17:05:52',52,1,'127.0.0.1'),(968,'2018-03-10 17:06:17',2,1,'127.0.0.1'),(969,'2018-03-10 17:06:32',2,25,'type: lds, id_item: 39, id_day: 0, status: 1'),(970,'2018-03-10 17:10:33',52,1,'127.0.0.1'),(971,'2018-03-10 17:17:56',52,1,'127.0.0.1'),(972,'2018-03-10 17:34:00',52,1,'127.0.0.1'),(973,'2018-03-10 17:35:35',52,1,'127.0.0.1'),(974,'2018-03-10 17:37:50',52,1,'127.0.0.1'),(975,'2018-03-10 17:40:55',52,1,'127.0.0.1'),(976,'2018-03-10 17:44:38',52,1,'127.0.0.1'),(977,'2018-03-10 17:49:54',52,1,'127.0.0.1'),(978,'2018-03-10 17:50:35',52,1,'127.0.0.1'),(979,'2018-03-10 17:51:21',52,1,'127.0.0.1'),(980,'2018-03-10 17:52:03',52,1,'127.0.0.1'),(981,'2018-03-10 17:52:05',52,1,'127.0.0.1'),(982,'2018-03-10 17:52:06',52,1,'127.0.0.1'),(983,'2018-03-10 17:52:30',52,1,'127.0.0.1'),(984,'2018-03-10 18:04:07',52,1,'127.0.0.1'),(985,'2018-03-10 18:08:34',52,1,'127.0.0.1'),(986,'2018-03-10 18:09:40',52,1,'127.0.0.1'),(987,'2018-03-10 18:14:07',52,1,'127.0.0.1'),(988,'2018-03-10 18:15:12',52,1,'127.0.0.1'),(989,'2018-03-10 18:16:06',52,1,'127.0.0.1'),(990,'2018-03-10 18:18:46',52,1,'127.0.0.1'),(991,'2018-03-10 18:41:03',52,1,'127.0.0.1'),(992,'2018-03-10 18:47:07',52,1,'127.0.0.1'),(993,'2018-03-10 18:48:08',52,1,'127.0.0.1'),(994,'2018-03-10 18:49:51',52,1,'127.0.0.1'),(995,'2018-03-10 18:50:52',52,1,'127.0.0.1'),(996,'2018-03-10 18:54:10',52,1,'127.0.0.1'),(997,'2018-03-10 18:55:37',52,1,'127.0.0.1'),(998,'2018-03-10 19:15:15',52,1,'127.0.0.1'),(999,'2018-03-10 19:16:45',52,1,'127.0.0.1'),(1000,'2018-03-10 19:17:32',52,1,'127.0.0.1'),(1001,'2018-03-10 19:24:13',52,1,'127.0.0.1'),(1002,'2018-03-10 19:26:25',52,1,'127.0.0.1'),(1003,'2018-03-10 19:27:46',52,1,'127.0.0.1'),(1004,'2018-03-10 19:30:37',52,1,'127.0.0.1'),(1005,'2018-03-10 19:33:04',52,1,'127.0.0.1'),(1006,'2018-03-10 19:34:25',52,1,'127.0.0.1'),(1007,'2018-03-10 19:40:47',52,1,'127.0.0.1'),(1008,'2018-03-10 19:42:11',52,1,'127.0.0.1'),(1009,'2018-03-10 19:43:58',52,1,'127.0.0.1'),(1010,'2018-03-10 19:51:27',52,1,'127.0.0.1'),(1011,'2018-03-10 19:51:29',52,1,'127.0.0.1'),(1012,'2018-03-10 19:52:07',52,1,'127.0.0.1'),(1013,'2018-03-10 19:52:32',52,1,'127.0.0.1'),(1014,'2018-03-10 19:55:24',52,1,'127.0.0.1'),(1015,'2018-03-10 19:58:43',52,1,'127.0.0.1'),(1016,'2018-03-10 20:03:06',52,1,'127.0.0.1'),(1017,'2018-03-10 20:04:56',52,1,'127.0.0.1'),(1018,'2018-03-10 20:06:57',52,1,'127.0.0.1'),(1019,'2018-03-10 20:07:42',52,1,'127.0.0.1'),(1020,'2018-03-10 20:08:33',52,1,'127.0.0.1'),(1021,'2018-03-10 20:10:14',52,1,'127.0.0.1'),(1022,'2018-03-10 20:15:08',52,1,'127.0.0.1'),(1023,'2018-03-10 20:23:59',52,1,'127.0.0.1'),(1024,'2018-03-20 21:43:22',52,1,'127.0.0.1'),(1025,'2018-03-20 21:52:43',2,1,'127.0.0.1'),(1026,'2018-03-20 21:52:51',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 12:45:00, t_finish: 22:30:00'),(1027,'2018-03-20 21:52:51',2,26,'type: lds, id_item: 3, id_day: 0, t_start: 12:45:00, t_finish: 23:30:00'),(1028,'2018-03-20 21:52:55',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 12:45:00, t_finish: 22:30:00'),(1029,'2018-03-20 21:52:55',2,26,'type: lds, id_item: 3, id_day: 2, t_start: 12:45:00, t_finish: 23:30:00'),(1030,'2018-03-20 21:53:16',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 12:45:00, t_finish: 22:30:00'),(1031,'2018-03-20 21:53:16',2,26,'type: lds, id_item: 3, id_day: 1, t_start: 12:45:00, t_finish: 23:30:00'),(1032,'2018-03-20 22:02:34',52,1,'127.0.0.1'),(1033,'2018-03-21 18:40:50',2,1,'127.0.0.1'),(1034,'2018-03-21 18:46:11',52,1,'127.0.0.1'),(1035,'2018-03-21 18:53:33',52,1,'127.0.0.1'),(1036,'2018-03-21 18:59:32',52,1,'127.0.0.1'),(1037,'2018-03-21 19:00:21',52,1,'127.0.0.1'),(1038,'2018-03-21 19:08:14',52,1,'127.0.0.1'),(1039,'2018-03-21 19:41:00',52,1,'127.0.0.1'),(1040,'2018-03-21 19:59:22',52,1,'127.0.0.1'),(1041,'2018-03-21 19:59:30',52,1,'127.0.0.1'),(1042,'2018-03-21 19:59:31',52,1,'127.0.0.1'),(1043,'2018-03-21 20:00:19',52,1,'127.0.0.1'),(1044,'2018-03-21 20:01:13',52,1,'127.0.0.1'),(1045,'2018-03-21 20:01:15',52,1,'127.0.0.1'),(1046,'2018-03-21 20:01:16',52,1,'127.0.0.1'),(1047,'2018-03-21 20:01:17',52,1,'127.0.0.1'),(1048,'2018-03-21 20:01:26',52,1,'127.0.0.1'),(1049,'2018-03-21 20:02:24',52,1,'127.0.0.1'),(1050,'2018-03-21 20:05:07',52,1,'127.0.0.1'),(1051,'2018-03-21 20:06:52',52,1,'127.0.0.1'),(1052,'2018-03-21 20:08:26',52,1,'127.0.0.1'),(1053,'2018-03-21 20:21:56',52,1,'127.0.0.1'),(1054,'2018-03-21 20:23:29',52,1,'127.0.0.1'),(1055,'2018-03-21 20:28:23',2,1,'127.0.0.1'),(1056,'2018-03-21 20:30:03',2,1,'127.0.0.1'),(1057,'2018-03-21 20:30:39',52,1,'127.0.0.1'),(1058,'2018-03-21 20:46:26',2,1,'127.0.0.1'),(1059,'2018-03-21 21:31:18',2,1,'127.0.0.1'),(1060,'2018-03-21 21:38:13',52,1,'127.0.0.1'),(1061,'2018-03-21 21:51:44',52,1,'127.0.0.1'),(1062,'2018-03-21 21:55:29',52,1,'127.0.0.1'),(1063,'2018-03-21 21:55:50',52,1,'127.0.0.1'),(1064,'2018-03-21 21:56:12',52,1,'127.0.0.1'),(1065,'2018-03-21 21:57:11',52,1,'127.0.0.1'),(1066,'2018-03-21 22:09:42',52,1,'127.0.0.1'),(1067,'2018-03-21 22:11:01',52,1,'127.0.0.1'),(1068,'2018-03-21 22:14:46',52,1,'127.0.0.1'),(1069,'2018-03-21 22:17:37',52,1,'127.0.0.1'),(1070,'2018-03-21 22:20:17',52,1,'127.0.0.1'),(1071,'2018-03-21 22:24:28',52,1,'127.0.0.1'),(1072,'2018-03-21 22:26:31',52,1,'127.0.0.1'),(1073,'2018-03-21 22:28:24',52,1,'127.0.0.1'),(1074,'2018-03-21 22:30:19',52,1,'127.0.0.1'),(1075,'2018-03-21 22:35:13',52,1,'127.0.0.1'),(1076,'2018-03-21 22:38:33',52,1,'127.0.0.1'),(1077,'2018-03-21 22:39:29',52,1,'127.0.0.1'),(1078,'2018-03-21 22:41:18',52,1,'127.0.0.1'),(1079,'2018-03-21 22:43:39',52,1,'127.0.0.1'),(1080,'2018-03-21 22:44:50',52,1,'127.0.0.1'),(1081,'2018-03-21 22:47:21',52,1,'127.0.0.1'),(1082,'2018-03-21 22:48:34',52,1,'127.0.0.1'),(1083,'2018-03-21 22:50:02',52,1,'127.0.0.1'),(1084,'2018-03-21 22:53:33',52,1,'127.0.0.1'),(1085,'2018-03-21 22:54:41',52,1,'127.0.0.1'),(1086,'2018-03-21 23:03:02',52,1,'127.0.0.1'),(1087,'2018-03-21 23:05:12',52,1,'127.0.0.1'),(1088,'2018-03-21 23:07:36',52,1,'127.0.0.1'),(1089,'2018-03-21 23:12:39',52,1,'127.0.0.1'),(1090,'2018-03-21 23:16:42',52,1,'127.0.0.1'),(1091,'2018-03-21 23:17:18',52,1,'127.0.0.1'),(1092,'2018-03-21 23:20:36',52,1,'127.0.0.1'),(1093,'2018-03-21 23:21:08',52,1,'127.0.0.1'),(1094,'2018-03-21 23:23:43',52,1,'127.0.0.1'),(1095,'2018-03-21 23:25:08',52,1,'127.0.0.1'),(1096,'2018-03-21 23:31:30',52,1,'127.0.0.1'),(1097,'2018-03-21 23:32:05',52,1,'127.0.0.1'),(1098,'2018-03-21 23:32:45',52,1,'127.0.0.1'),(1099,'2018-03-21 23:34:23',52,1,'127.0.0.1'),(1100,'2018-03-22 00:20:31',52,1,'127.0.0.1'),(1101,'2018-03-22 00:27:59',52,1,'127.0.0.1'),(1102,'2018-03-22 00:31:48',52,1,'127.0.0.1'),(1103,'2018-03-22 00:36:47',52,1,'127.0.0.1'),(1104,'2018-03-22 00:39:45',52,1,'127.0.0.1'),(1105,'2018-03-22 00:41:27',52,1,'127.0.0.1'),(1106,'2018-03-22 07:48:00',52,1,'127.0.0.1'),(1107,'2018-03-22 07:50:18',52,1,'127.0.0.1'),(1108,'2018-03-22 20:45:50',52,1,'127.0.0.1'),(1109,'2018-03-22 20:46:56',52,1,'127.0.0.1'),(1110,'2018-03-22 20:54:28',52,1,'127.0.0.1'),(1111,'2018-03-22 20:58:13',52,1,'127.0.0.1'),(1112,'2018-03-22 20:58:41',52,1,'127.0.0.1'),(1113,'2018-03-22 21:00:01',52,1,'127.0.0.1'),(1114,'2018-03-22 21:07:36',52,1,'127.0.0.1'),(1115,'2018-03-22 21:17:46',52,1,'127.0.0.1'),(1116,'2018-03-22 21:18:37',52,1,'127.0.0.1'),(1117,'2018-03-22 21:19:37',52,1,'127.0.0.1'),(1118,'2018-03-22 21:27:46',52,1,'127.0.0.1'),(1119,'2018-03-22 21:29:50',52,1,'127.0.0.1'),(1120,'2018-03-22 21:33:09',52,1,'127.0.0.1'),(1121,'2018-03-22 21:34:41',52,1,'127.0.0.1'),(1122,'2018-03-22 21:34:53',52,1,'127.0.0.1'),(1123,'2018-03-22 21:37:17',52,1,'127.0.0.1'),(1124,'2018-03-22 21:38:35',52,1,'127.0.0.1'),(1125,'2018-03-22 21:39:10',52,1,'127.0.0.1'),(1126,'2018-03-22 21:39:27',52,1,'127.0.0.1'),(1127,'2018-03-22 21:43:30',52,1,'127.0.0.1'),(1128,'2018-03-22 21:48:00',52,1,'127.0.0.1'),(1129,'2018-03-22 21:49:18',52,1,'127.0.0.1'),(1130,'2018-03-22 21:49:49',52,1,'127.0.0.1'),(1131,'2018-03-22 21:50:25',52,1,'127.0.0.1'),(1132,'2018-03-22 21:51:29',52,1,'127.0.0.1'),(1133,'2018-03-22 21:52:01',52,1,'127.0.0.1'),(1134,'2018-03-22 21:57:55',52,1,'127.0.0.1'),(1135,'2018-03-22 21:58:54',52,1,'127.0.0.1'),(1136,'2018-03-22 22:08:30',52,1,'127.0.0.1'),(1137,'2018-03-22 22:09:58',52,1,'127.0.0.1'),(1138,'2018-03-22 22:13:08',52,1,'127.0.0.1'),(1139,'2018-03-22 22:13:38',52,1,'127.0.0.1'),(1140,'2018-03-22 22:16:55',52,1,'127.0.0.1'),(1141,'2018-03-22 22:17:59',52,1,'127.0.0.1'),(1142,'2018-03-22 22:19:43',52,1,'127.0.0.1'),(1143,'2018-03-22 22:23:13',52,1,'127.0.0.1'),(1144,'2018-03-22 22:25:31',52,1,'127.0.0.1'),(1145,'2018-03-22 22:26:21',52,1,'127.0.0.1'),(1146,'2018-03-22 22:27:30',52,1,'127.0.0.1'),(1147,'2018-03-22 22:28:58',52,1,'127.0.0.1'),(1148,'2018-03-22 22:29:57',52,1,'127.0.0.1'),(1149,'2018-03-22 22:40:01',52,1,'127.0.0.1'),(1150,'2018-03-22 22:42:40',52,1,'127.0.0.1'),(1151,'2018-03-22 22:43:04',52,1,'127.0.0.1'),(1152,'2018-03-22 22:43:48',52,1,'127.0.0.1'),(1153,'2018-03-22 22:45:56',52,1,'127.0.0.1'),(1154,'2018-03-22 22:47:11',52,1,'127.0.0.1'),(1155,'2018-03-22 22:49:08',52,1,'127.0.0.1'),(1156,'2018-03-22 22:50:19',52,1,'127.0.0.1'),(1157,'2018-03-22 22:52:33',52,1,'127.0.0.1'),(1158,'2018-03-22 22:53:03',52,1,'127.0.0.1'),(1159,'2018-03-22 22:53:38',52,1,'127.0.0.1'),(1160,'2018-03-22 23:00:12',52,1,'127.0.0.1'),(1161,'2018-03-22 23:01:44',52,1,'127.0.0.1'),(1162,'2018-03-22 23:02:38',52,1,'127.0.0.1'),(1163,'2018-03-22 23:03:38',52,1,'127.0.0.1'),(1164,'2018-03-22 23:04:09',52,1,'127.0.0.1'),(1165,'2018-03-22 23:04:59',52,1,'127.0.0.1'),(1166,'2018-03-22 23:05:26',52,1,'127.0.0.1'),(1167,'2018-03-22 23:06:12',52,1,'127.0.0.1'),(1168,'2018-03-22 23:08:03',52,1,'127.0.0.1'),(1169,'2018-03-22 23:10:25',52,1,'127.0.0.1'),(1170,'2018-03-22 23:11:56',52,1,'127.0.0.1'),(1171,'2018-03-23 00:01:47',52,1,'127.0.0.1'),(1172,'2018-03-23 00:41:15',52,1,'127.0.0.1'),(1173,'2018-03-23 00:50:14',52,1,'127.0.0.1'),(1174,'2018-03-23 00:56:37',52,1,'127.0.0.1'),(1175,'2018-03-23 01:02:57',52,1,'127.0.0.1'),(1176,'2018-03-23 01:06:28',52,1,'127.0.0.1'),(1177,'2018-03-23 01:12:57',52,1,'127.0.0.1'),(1178,'2018-03-23 01:15:36',52,1,'127.0.0.1'),(1179,'2018-03-23 01:16:38',52,1,'127.0.0.1'),(1180,'2018-03-23 01:23:24',52,1,'127.0.0.1'),(1181,'2018-03-23 01:25:42',52,1,'127.0.0.1'),(1182,'2018-03-23 01:42:29',52,1,'127.0.0.1'),(1183,'2018-03-23 11:01:04',52,1,'127.0.0.1'),(1184,'2018-03-23 11:02:45',52,1,'127.0.0.1'),(1185,'2018-03-23 11:05:50',52,1,'127.0.0.1'),(1186,'2018-03-23 11:06:17',52,1,'127.0.0.1'),(1187,'2018-03-23 11:07:08',52,1,'127.0.0.1'),(1188,'2018-03-23 11:07:58',52,1,'127.0.0.1'),(1189,'2018-03-23 11:09:29',52,1,'127.0.0.1'),(1190,'2018-03-23 11:11:45',52,1,'127.0.0.1'),(1191,'2018-03-23 11:13:04',52,1,'127.0.0.1'),(1192,'2018-03-23 11:13:51',52,1,'127.0.0.1'),(1193,'2018-03-23 11:15:24',52,1,'127.0.0.1'),(1194,'2018-03-23 11:17:22',52,1,'127.0.0.1'),(1195,'2018-03-23 11:20:20',52,1,'127.0.0.1'),(1196,'2018-03-23 11:21:06',52,1,'127.0.0.1'),(1197,'2018-03-23 11:22:50',52,1,'127.0.0.1'),(1198,'2018-03-23 13:13:37',52,1,'127.0.0.1'),(1199,'2018-03-23 13:16:56',52,1,'127.0.0.1'),(1200,'2018-03-23 13:21:26',52,1,'127.0.0.1'),(1201,'2018-03-23 13:30:16',52,1,'127.0.0.1'),(1202,'2018-03-23 13:31:18',52,1,'127.0.0.1'),(1203,'2018-03-23 13:31:55',52,1,'127.0.0.1'),(1204,'2018-03-23 13:32:37',52,1,'127.0.0.1'),(1205,'2018-03-23 13:34:36',52,1,'127.0.0.1'),(1206,'2018-03-24 10:01:55',52,1,'127.0.0.1'),(1207,'2018-03-24 10:02:57',52,1,'127.0.0.1'),(1208,'2018-03-24 10:22:12',52,1,'127.0.0.1'),(1209,'2018-03-24 10:23:04',52,1,'127.0.0.1'),(1210,'2018-03-24 13:33:33',52,1,'127.0.0.1'),(1211,'2018-03-24 13:34:01',52,1,'127.0.0.1'),(1212,'2018-03-24 13:34:15',52,1,'127.0.0.1'),(1213,'2018-03-24 13:40:12',52,1,'127.0.0.1'),(1214,'2018-03-24 13:40:55',52,1,'127.0.0.1'),(1215,'2018-03-24 13:42:05',52,1,'127.0.0.1'),(1216,'2018-03-24 13:43:55',52,1,'127.0.0.1'),(1217,'2018-03-24 13:52:13',52,1,'127.0.0.1'),(1218,'2018-03-24 13:54:05',52,1,'127.0.0.1'),(1219,'2018-03-24 13:57:54',52,1,'127.0.0.1'),(1220,'2018-03-24 13:59:49',52,1,'127.0.0.1'),(1221,'2018-03-24 14:16:19',52,1,'127.0.0.1'),(1222,'2018-03-24 14:18:13',52,1,'127.0.0.1'),(1223,'2018-03-24 14:19:11',52,1,'127.0.0.1'),(1224,'2018-03-24 14:27:04',52,1,'127.0.0.1'),(1225,'2018-03-24 14:34:56',52,1,'127.0.0.1'),(1226,'2018-03-24 14:48:47',52,1,'127.0.0.1'),(1227,'2018-03-24 14:50:58',52,1,'127.0.0.1'),(1228,'2018-03-24 14:53:56',52,1,'127.0.0.1'),(1229,'2018-03-24 14:57:17',52,1,'127.0.0.1'),(1230,'2018-03-24 15:03:09',52,1,'127.0.0.1'),(1231,'2018-03-24 15:08:07',52,1,'127.0.0.1'),(1232,'2018-03-24 15:11:10',52,1,'127.0.0.1'),(1233,'2018-03-24 15:12:07',52,1,'127.0.0.1'),(1234,'2018-03-24 15:20:41',52,1,'127.0.0.1'),(1235,'2018-03-24 15:21:29',52,1,'127.0.0.1'),(1236,'2018-03-24 15:21:36',52,1,'127.0.0.1'),(1237,'2018-03-24 15:23:00',52,1,'127.0.0.1'),(1238,'2018-03-24 15:34:31',52,1,'127.0.0.1'),(1239,'2018-03-24 15:38:32',52,1,'127.0.0.1'),(1240,'2018-03-24 15:40:33',52,1,'127.0.0.1'),(1241,'2018-03-24 15:42:21',52,1,'127.0.0.1'),(1242,'2018-03-24 15:43:48',52,1,'127.0.0.1'),(1243,'2018-03-24 15:51:49',52,1,'127.0.0.1'),(1244,'2018-03-24 18:02:56',52,1,'127.0.0.1'),(1245,'2018-03-24 18:09:38',52,1,'127.0.0.1'),(1246,'2018-03-24 18:10:42',52,1,'127.0.0.1'),(1247,'2018-03-24 18:12:06',52,1,'127.0.0.1'),(1248,'2018-03-24 18:14:51',52,1,'127.0.0.1'),(1249,'2018-03-24 18:15:18',52,1,'127.0.0.1'),(1250,'2018-03-24 18:17:25',52,1,'127.0.0.1'),(1251,'2018-03-24 18:27:21',52,1,'127.0.0.1'),(1252,'2018-03-24 18:29:15',52,1,'127.0.0.1'),(1253,'2018-03-24 18:31:38',52,1,'127.0.0.1'),(1254,'2018-03-24 19:00:35',52,1,'127.0.0.1'),(1255,'2018-03-24 19:05:56',52,1,'127.0.0.1'),(1256,'2018-03-24 19:12:45',52,1,'127.0.0.1'),(1257,'2018-03-24 19:17:22',52,1,'127.0.0.1'),(1258,'2018-03-24 19:18:01',52,1,'127.0.0.1'),(1259,'2018-03-24 19:18:58',52,1,'127.0.0.1'),(1260,'2018-03-24 19:19:41',52,1,'127.0.0.1'),(1261,'2018-03-24 19:20:11',52,1,'127.0.0.1'),(1262,'2018-03-24 19:23:46',52,1,'127.0.0.1'),(1263,'2018-03-24 19:24:25',52,1,'127.0.0.1'),(1264,'2018-03-24 19:24:49',52,1,'127.0.0.1'),(1265,'2018-03-24 19:25:13',52,1,'127.0.0.1'),(1266,'2018-03-24 19:33:51',52,1,'127.0.0.1'),(1267,'2018-03-24 19:38:41',52,1,'127.0.0.1'),(1268,'2018-03-24 19:40:27',52,1,'127.0.0.1'),(1269,'2018-03-24 19:42:51',52,1,'127.0.0.1'),(1270,'2018-03-24 19:45:13',52,1,'127.0.0.1'),(1271,'2018-03-24 19:49:51',52,1,'127.0.0.1'),(1272,'2018-03-24 19:52:08',52,1,'127.0.0.1'),(1273,'2018-03-24 19:53:50',52,1,'127.0.0.1'),(1274,'2018-03-25 10:15:43',52,1,'127.0.0.1'),(1275,'2018-03-25 10:33:41',52,1,'127.0.0.1'),(1276,'2018-03-25 10:34:59',52,1,'127.0.0.1'),(1277,'2018-03-25 10:48:36',52,1,'127.0.0.1'),(1278,'2018-03-25 10:49:17',52,1,'127.0.0.1'),(1279,'2018-03-25 13:08:49',52,1,'127.0.0.1'),(1280,'2018-03-25 13:10:24',52,1,'127.0.0.1'),(1281,'2018-03-25 13:16:47',52,1,'127.0.0.1'),(1282,'2018-03-25 13:21:51',52,1,'127.0.0.1'),(1283,'2018-03-25 13:23:04',52,1,'127.0.0.1'),(1284,'2018-03-25 13:41:50',52,1,'127.0.0.1'),(1285,'2018-03-25 15:05:10',52,1,'127.0.0.1'),(1286,'2018-03-25 15:10:42',52,1,'127.0.0.1'),(1287,'2018-03-25 15:15:30',52,1,'127.0.0.1'),(1288,'2018-03-25 15:46:22',52,1,'127.0.0.1'),(1289,'2018-03-25 16:12:52',52,1,'127.0.0.1'),(1290,'2018-03-27 18:10:10',52,1,'127.0.0.1'),(1291,'2018-03-27 18:27:02',52,1,'127.0.0.1'),(1292,'2018-03-27 18:30:01',52,1,'127.0.0.1'),(1293,'2018-03-27 18:54:43',52,1,'127.0.0.1'),(1294,'2018-03-27 18:59:06',52,1,'127.0.0.1'),(1295,'2018-03-27 19:16:07',52,1,'127.0.0.1'),(1296,'2018-03-27 19:17:56',52,1,'127.0.0.1'),(1297,'2018-03-27 21:14:08',52,1,'127.0.0.1'),(1298,'2018-03-27 21:33:02',52,1,'127.0.0.1'),(1299,'2018-03-27 21:45:26',52,1,'127.0.0.1'),(1300,'2018-03-27 22:38:34',52,1,'127.0.0.1'),(1301,'2018-03-27 23:04:47',52,1,'127.0.0.1'),(1302,'2018-03-27 23:08:04',52,1,'127.0.0.1'),(1303,'2018-03-27 23:18:32',52,1,'127.0.0.1'),(1304,'2018-03-28 18:26:27',52,1,'127.0.0.1'),(1305,'2018-03-28 18:52:27',52,1,'127.0.0.1'),(1306,'2018-03-28 19:03:06',52,1,'127.0.0.1'),(1307,'2018-03-28 21:54:11',52,1,'127.0.0.1'),(1308,'2018-03-28 21:54:42',52,1,'127.0.0.1'),(1309,'2018-03-28 21:55:37',52,1,'127.0.0.1'),(1310,'2018-03-28 21:56:06',52,1,'127.0.0.1'),(1311,'2018-03-28 21:58:25',52,1,'127.0.0.1'),(1312,'2018-03-28 22:01:23',52,1,'127.0.0.1'),(1313,'2018-03-28 22:04:45',52,1,'127.0.0.1'),(1314,'2018-03-28 22:26:33',52,1,'127.0.0.1'),(1315,'2018-03-28 23:54:57',52,1,'127.0.0.1'),(1316,'2018-03-28 23:55:34',52,1,'127.0.0.1'),(1317,'2018-03-29 00:03:38',52,1,'127.0.0.1'),(1318,'2018-03-29 00:04:31',52,1,'127.0.0.1'),(1319,'2018-03-29 00:16:17',52,1,'127.0.0.1'),(1320,'2018-03-29 00:19:03',52,1,'127.0.0.1'),(1321,'2018-03-29 00:28:12',52,1,'127.0.0.1'),(1322,'2018-03-29 00:29:46',52,1,'127.0.0.1'),(1323,'2018-03-29 00:31:48',52,1,'127.0.0.1'),(1324,'2018-03-29 00:58:53',52,1,'127.0.0.1'),(1325,'2018-03-29 00:59:44',52,1,'127.0.0.1'),(1326,'2018-03-29 01:09:15',52,1,'127.0.0.1'),(1327,'2018-04-01 11:44:10',52,1,'127.0.0.1');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `system_log_bi` BEFORE INSERT ON `system_log` FOR EACH ROW BEGIN
    set new.dt = now();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - запрещен, 1 - разрешен, -1 - пауза',
  `dt_insert` datetime NOT NULL,
  `real` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `ip` (`ip`),
  KEY `FK_users_roles` (`id_role`),
  CONSTRAINT `FK_users_roles` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'lsi@atms-zs.ru',NULL,NULL,1,'202cb962ac59075b964b07152d234b70',1,'2015-10-15 14:48:12',1),(52,'','127.0.0.11','г. Омск, Станционная 6-я, 2/4',2,NULL,1,'2016-10-13 13:03:49',1),(53,'admin@atms-zs.ru','','',1,'202cb962ac59075b964b07152d234b70',1,'2017-10-25 15:15:56',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_bi` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    set new.dt_insert = now();
    if (new.ip = '') then set new.ip = null; end if;
    if (new.login = '') then set new.login = null; end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `v_active_users`
--

DROP TABLE IF EXISTS `v_active_users`;
/*!50001 DROP VIEW IF EXISTS `v_active_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_active_users` (
  `id` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `id_role` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `dt_insert` tinyint NOT NULL,
  `real` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_clients_custom_pricelist`
--

DROP TABLE IF EXISTS `v_clients_custom_pricelist`;
/*!50001 DROP VIEW IF EXISTS `v_clients_custom_pricelist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_clients_custom_pricelist` (
  `id` tinyint NOT NULL,
  `dt` tinyint NOT NULL,
  `dt_type` tinyint NOT NULL,
  `id_parent` tinyint NOT NULL,
  `desc` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `nds` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `order` tinyint NOT NULL,
  `start` tinyint NOT NULL,
  `finish` tinyint NOT NULL,
  `comment` tinyint NOT NULL,
  `screen` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_custom_pricelist`
--

DROP TABLE IF EXISTS `v_custom_pricelist`;
/*!50001 DROP VIEW IF EXISTS `v_custom_pricelist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_custom_pricelist` (
  `id` tinyint NOT NULL,
  `day_type` tinyint NOT NULL,
  `id_parent` tinyint NOT NULL,
  `desc` tinyint NOT NULL,
  `clients_desc` tinyint NOT NULL,
  `color` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `nds` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `comment` tinyint NOT NULL,
  `bill` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_not_collected`
--

DROP TABLE IF EXISTS `v_not_collected`;
/*!50001 DROP VIEW IF EXISTS `v_not_collected`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_not_collected` (
  `id` tinyint NOT NULL,
  `id_user` tinyint NOT NULL,
  `dt_insert` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `collected` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `nds` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_payments`
--

DROP TABLE IF EXISTS `v_payments`;
/*!50001 DROP VIEW IF EXISTS `v_payments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_payments` (
  `id` tinyint NOT NULL,
  `id_user` tinyint NOT NULL,
  `dt_insert` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `collected` tinyint NOT NULL,
  `id_collection` tinyint NOT NULL,
  `id_service` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `nds` tinyint NOT NULL,
  `desc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_real_users`
--

DROP TABLE IF EXISTS `v_real_users`;
/*!50001 DROP VIEW IF EXISTS `v_real_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_real_users` (
  `id` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `ip` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `id_role` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `dt_insert` tinyint NOT NULL,
  `real` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `year_schedule`
--

DROP TABLE IF EXISTS `year_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year_schedule` (
  `dt` date NOT NULL,
  `dt_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_schedule`
--

LOCK TABLES `year_schedule` WRITE;
/*!40000 ALTER TABLE `year_schedule` DISABLE KEYS */;
INSERT INTO `year_schedule` VALUES ('2017-09-26',2),('2017-09-27',2),('2017-09-28',2),('2017-09-29',2),('2017-09-30',1),('2017-10-01',1),('2017-10-02',2),('2017-10-03',2),('2017-10-04',2),('2017-10-05',2),('2017-10-06',2),('2017-10-07',1),('2017-10-08',1),('2017-10-09',2),('2017-10-10',2),('2017-10-11',2),('2017-10-12',2),('2017-10-13',2),('2017-10-14',1),('2017-10-15',1),('2017-10-16',2),('2017-10-17',2),('2017-10-18',2),('2017-10-19',2),('2017-10-20',2),('2017-10-21',1),('2017-10-22',1),('2017-10-23',2),('2017-10-24',2),('2017-10-25',2),('2017-10-26',2),('2017-10-27',2),('2017-10-28',1),('2017-10-29',1),('2017-10-30',2),('2017-10-31',2),('2017-11-01',2),('2017-11-02',2),('2017-11-03',2),('2017-11-04',1),('2017-11-05',1),('2017-11-06',2),('2017-11-07',2),('2017-11-08',2),('2017-11-09',2),('2017-11-10',2),('2017-11-11',1),('2017-11-12',1),('2017-11-13',2),('2017-11-14',2),('2017-11-15',2),('2017-11-16',2),('2017-11-17',2),('2017-11-18',1),('2017-11-19',1),('2017-11-20',2),('2017-11-21',2),('2017-11-22',2),('2017-11-23',2),('2017-11-24',2),('2017-11-25',1),('2017-11-26',1),('2017-11-27',2),('2017-11-28',2),('2017-11-29',2),('2017-11-30',2),('2017-12-01',2),('2017-12-02',1),('2017-12-03',1),('2017-12-04',2),('2017-12-05',2),('2017-12-06',2),('2017-12-07',2),('2017-12-08',2),('2017-12-09',1),('2017-12-10',1),('2017-12-11',2),('2017-12-12',2),('2017-12-13',2),('2017-12-14',2),('2017-12-15',2),('2017-12-16',1),('2017-12-17',1),('2017-12-18',2),('2017-12-19',2),('2017-12-20',2),('2017-12-21',2),('2017-12-22',2),('2017-12-23',1),('2017-12-24',1),('2017-12-25',2),('2017-12-26',2),('2017-12-27',2),('2017-12-28',2),('2017-12-29',2),('2017-12-30',1),('2017-12-31',1),('2018-01-01',2),('2018-01-02',1),('2018-01-03',2),('2018-01-04',2),('2018-01-05',2),('2018-01-06',1),('2018-01-07',1),('2018-01-08',2),('2018-01-09',2),('2018-01-10',2),('2018-01-11',2),('2018-01-12',2),('2018-01-13',1),('2018-01-14',1),('2018-01-15',2),('2018-01-16',2),('2018-01-17',2),('2018-01-18',2),('2018-01-19',2),('2018-01-20',1),('2018-01-21',1),('2018-01-22',2),('2018-01-23',2),('2018-01-24',2),('2018-01-25',2),('2018-01-26',2),('2018-01-27',1),('2018-01-28',1),('2018-01-29',2),('2018-01-30',2),('2018-01-31',2),('2018-02-01',2),('2018-02-02',2),('2018-02-03',1),('2018-02-04',1),('2018-02-05',2),('2018-02-06',2),('2018-02-07',2),('2018-02-08',2),('2018-02-09',2),('2018-02-10',1),('2018-02-11',1),('2018-02-12',2),('2018-02-13',2),('2018-02-14',2),('2018-02-15',2),('2018-02-16',2),('2018-02-17',1),('2018-02-18',1),('2018-02-19',2),('2018-02-20',2),('2018-02-21',2),('2018-02-22',2),('2018-02-23',2),('2018-02-24',1),('2018-02-25',1),('2018-02-26',2),('2018-02-27',2),('2018-02-28',2),('2018-03-01',2),('2018-03-02',2),('2018-03-03',1),('2018-03-04',1),('2018-03-05',2),('2018-03-06',2),('2018-03-07',2),('2018-03-08',2),('2018-03-09',2),('2018-03-10',1),('2018-03-11',1),('2018-03-12',2),('2018-03-13',2),('2018-03-14',2),('2018-03-15',2),('2018-03-16',2),('2018-03-17',1),('2018-03-18',1),('2018-03-19',2),('2018-03-20',2),('2018-03-21',2),('2018-03-22',2),('2018-03-23',2),('2018-03-24',1),('2018-03-25',1),('2018-03-26',2),('2018-03-27',2),('2018-03-28',2),('2018-03-29',2),('2018-03-30',2),('2018-03-31',1),('2018-04-01',1),('2018-04-02',2),('2018-04-03',2),('2018-04-04',2),('2018-04-05',2),('2018-04-06',2),('2018-04-07',1),('2018-04-08',1),('2018-04-09',2),('2018-04-10',2),('2018-04-11',2),('2018-04-12',2),('2018-04-13',2),('2018-04-14',1),('2018-04-15',1),('2018-04-16',2),('2018-04-17',2),('2018-04-18',2),('2018-04-19',2),('2018-04-20',2),('2018-04-21',1),('2018-04-22',1),('2018-04-23',2),('2018-04-24',2),('2018-04-25',2),('2018-04-26',2),('2018-04-27',2),('2018-04-28',1),('2018-04-29',1),('2018-04-30',2),('2018-05-01',2),('2018-05-02',2),('2018-05-03',2),('2018-05-04',2),('2018-05-05',1),('2018-05-06',1),('2018-05-07',2),('2018-05-08',2),('2018-05-09',2),('2018-05-10',2),('2018-05-11',2),('2018-05-12',1),('2018-05-13',1),('2018-05-14',2),('2018-05-15',2),('2018-05-16',2),('2018-05-17',2),('2018-05-18',2),('2018-05-19',1),('2018-05-20',1),('2018-05-21',2),('2018-05-22',2),('2018-05-23',2),('2018-05-24',2),('2018-05-25',2),('2018-05-26',1),('2018-05-27',1),('2018-05-28',2),('2018-05-29',2),('2018-05-30',2),('2018-05-31',2),('2018-06-01',2),('2018-06-02',1),('2018-06-03',1),('2018-06-04',2),('2018-06-05',2),('2018-06-06',2),('2018-06-07',2),('2018-06-08',2),('2018-06-09',1),('2018-06-10',1),('2018-06-11',2),('2018-06-12',2),('2018-06-13',2),('2018-06-14',2),('2018-06-15',2),('2018-06-16',1),('2018-06-17',1),('2018-06-18',2),('2018-06-19',2),('2018-06-20',2),('2018-06-21',2),('2018-06-22',2),('2018-06-23',1),('2018-06-24',1),('2018-06-25',2),('2018-06-26',2),('2018-06-27',2),('2018-06-28',2),('2018-06-29',2),('2018-06-30',1),('2018-07-01',1),('2018-07-02',2),('2018-07-03',2),('2018-07-04',2),('2018-07-05',2),('2018-07-06',2),('2018-07-07',1),('2018-07-08',1),('2018-07-09',2),('2018-07-10',2),('2018-07-11',2),('2018-07-12',2),('2018-07-13',2),('2018-07-14',1),('2018-07-15',1),('2018-07-16',2),('2018-07-17',2),('2018-07-18',2),('2018-07-19',2),('2018-07-20',2),('2018-07-21',1),('2018-07-22',1),('2018-07-23',2),('2018-07-24',2),('2018-07-25',2),('2018-07-26',2),('2018-07-27',2),('2018-07-28',1),('2018-07-29',1),('2018-07-30',2),('2018-07-31',2),('2018-08-01',2),('2018-08-02',2),('2018-08-03',2),('2018-08-04',1),('2018-08-05',1),('2018-08-06',2),('2018-08-07',2),('2018-08-08',2),('2018-08-09',2),('2018-08-10',2),('2018-08-11',1),('2018-08-12',1),('2018-08-13',2),('2018-08-14',2),('2018-08-15',2),('2018-08-16',2),('2018-08-17',2),('2018-08-18',1),('2018-08-19',1),('2018-08-20',2),('2018-08-21',2),('2018-08-22',2),('2018-08-23',2),('2018-08-24',2),('2018-08-25',1),('2018-08-26',1),('2018-08-27',2),('2018-08-28',2),('2018-08-29',2),('2018-08-30',2),('2018-08-31',2),('2018-09-01',1),('2018-09-02',1),('2018-09-03',2),('2018-09-04',2),('2018-09-05',2),('2018-09-06',2),('2018-09-07',2),('2018-09-08',1),('2018-09-09',1),('2018-09-10',2),('2018-09-11',2),('2018-09-12',2),('2018-09-13',2),('2018-09-14',2),('2018-09-15',1),('2018-09-16',1),('2018-09-17',2),('2018-09-18',2),('2018-09-19',2),('2018-09-20',2),('2018-09-21',2),('2018-09-22',1),('2018-09-23',1),('2018-09-24',2),('2018-09-25',2),('2018-09-26',2),('2018-09-27',2),('2018-09-28',2),('2018-09-29',1),('2018-09-30',1),('2018-10-01',2),('2018-10-02',2),('2018-10-03',2),('2018-10-04',2),('2018-10-05',2),('2018-10-06',1),('2018-10-07',1),('2018-10-08',2),('2018-10-09',2),('2018-10-10',2),('2018-10-11',2),('2018-10-12',2),('2018-10-13',1),('2018-10-14',1),('2018-10-15',2),('2018-10-16',2),('2018-10-17',2),('2018-10-18',2),('2018-10-19',2),('2018-10-20',1),('2018-10-21',1),('2018-10-22',2),('2018-10-23',2),('2018-10-24',2),('2018-10-25',2),('2018-10-26',2),('2018-10-27',1),('2018-10-28',1),('2018-10-29',2),('2018-10-30',2),('2018-10-31',2),('2018-11-01',2),('2018-11-02',2),('2018-11-03',1),('2018-11-04',1),('2018-11-05',2),('2018-11-06',2),('2018-11-07',2),('2018-11-08',2),('2018-11-09',2),('2018-11-10',1),('2018-11-11',1),('2018-11-12',2),('2018-11-13',2),('2018-11-14',2),('2018-11-15',2),('2018-11-16',2),('2018-11-17',1),('2018-11-18',1),('2018-11-19',2),('2018-11-20',2),('2018-11-21',2),('2018-11-22',2),('2018-11-23',2),('2018-11-24',1),('2018-11-25',1),('2018-11-26',2),('2018-11-27',2),('2018-11-28',2),('2018-11-29',2),('2018-11-30',2),('2018-12-01',1),('2018-12-02',1),('2018-12-03',2),('2018-12-04',2),('2018-12-05',2),('2018-12-06',2),('2018-12-07',2),('2018-12-08',1),('2018-12-09',1),('2018-12-10',2),('2018-12-11',2),('2018-12-12',2),('2018-12-13',2),('2018-12-14',2),('2018-12-15',1),('2018-12-16',1),('2018-12-17',2),('2018-12-18',2),('2018-12-19',2),('2018-12-20',2),('2018-12-21',2),('2018-12-22',1),('2018-12-23',1),('2018-12-24',2),('2018-12-25',2),('2018-12-26',2),('2018-12-27',2),('2018-12-28',2),('2018-12-29',1),('2018-12-30',1),('2018-12-31',2),('2019-01-01',2),('2019-01-02',2),('2019-01-03',2),('2019-01-04',2),('2019-01-05',1),('2019-01-06',1),('2019-01-07',2),('2019-01-08',2),('2019-01-09',2),('2019-01-10',2),('2019-01-11',2),('2019-01-12',1),('2019-01-13',1),('2019-01-14',2),('2019-01-15',2),('2019-01-16',2),('2019-01-17',2),('2019-01-18',2),('2019-01-19',1),('2019-01-20',1),('2019-01-21',2),('2019-01-22',2),('2019-01-23',2),('2019-01-24',2),('2019-01-25',2),('2019-01-26',1),('2019-01-27',1),('2019-01-28',2),('2019-01-29',2),('2019-01-30',2),('2019-01-31',2),('2019-02-01',2),('2019-02-02',1),('2019-02-03',1),('2019-02-04',2),('2019-02-05',2),('2019-02-06',2),('2019-02-07',2);
/*!40000 ALTER TABLE `year_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'q_lds'
--
/*!50003 DROP FUNCTION IF EXISTS `baskets_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `baskets_add`(`_uid` INT) RETURNS int(11)
BEGIN
	insert into baskets (id_user, dt)
	values (_uid, now());

	select b.id into @id
	from baskets b
	where b.id_user = _uid
	order by b.dt desc
	limit 1;

	return @id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `baskets_items_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `baskets_items_add`(`_uid` INT, `_id_basket` INT, `_id_service` INT) RETURNS int(11)
BEGIN
	select c.desc into @name from custom_price_lds c where c.id = _id_service;
	insert into baskets_items (id_basket, id_service, service_name)
	values (_id_basket, _id_service, @name);

	return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `baskets_items_skates_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `baskets_items_skates_add`(`_uid` INT, `_id_basket` INT, `_id_service` INT, `_name` CHAR(100)) RETURNS int(11)
BEGIN
	INSERT INTO baskets_items (id_basket, id_service, service_name)
	VALUES (_id_basket, _id_service, _name);
	RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `collection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `collection`(`_uid` INT) RETURNS decimal(10,0)
BEGIN
declare _full decimal(10,2) default 0;
declare _id_collection int default collections_add(_uid);

    drop temporary table if exists to_collection;
    create temporary table to_collection as
    select v.id, v.amount
    from v_not_collected v
    where v.id_user = _uid;

    update to_collection t, payments p
    set p.collected = 1, p.id_collection = _id_collection
    where t.id = p.id;

    select ifnull(sum(t.amount), 0) into _full
    from to_collection t;

    call system_log_write(_uid, 'collection', concat('Сумма: ', _full, ' '));

    return _full;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `collections_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `collections_add`(`_id_user` INT) RETURNS int(11)
BEGIN
	declare _dt datetime default now();
	declare _res int default 0;

	insert into collections (id_user, dt) values (_id_user, _dt);

	select c.id into _res
	from collections c
	where c.id_user = _id_user
		and c.dt = _dt;

	return _res;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_delete`(`_uid` INT, `_type` TEXT, `_id` INT) RETURNS int(11)
BEGIN
	case _type
				when 'lds' then
			delete from custom_price_lds where id = _id;
	end case;

	call system_log_write(_uid, 'pricelist_delete', concat('type: ', _type, ', id_item: ', _id));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_bill`(`_uid` INT, `_type` TEXT, `_id` INT, `_status` INT) RETURNS int(11)
BEGIN
	case _type
				when 'lds' then
			update custom_price_lds p set p.bill = _status where p.id = _id;
			end case;

   call system_log_write(_uid, 'pricelist_change_bill', concat('type: ', _type, ', id_item: ', _id, ', type: ', _status));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_clients_desc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_clients_desc`(`_uid` INT, `_type` TEXT, `_id` INT, `_text` TEXT) RETURNS int(11)
BEGIN
   set _text = trim(_text);
   if (_text = '') then set _text = null; end if;

	case _type
				when 'lds' then
			update custom_price_lds p set p.clients_desc = _text where p.id = _id;
			end case;

   call system_log_write(_uid, 'pricelist_change_clients_desc', concat('type: ', _type, ', id_item: ', _id, ', Clients_desc: ', ifnull(_text, 'null')));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_color` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_color`(`_uid` INT, `_type` TEXT, `_id` INT, `_color` TEXT) RETURNS int(11)
BEGIN
   set _color = trim(_color);
   if (_color = '') then set _color = 'primary'; end if;

	case _type
				when 'lds' then
			update custom_price_lds p set p.color = _color where p.id = _id;
	end case;

   call system_log_write(_uid, 'pricelist_change_color', concat('type: ', _type, ', id_item: ', _id, ', color: ', ifnull(_color, 'null')));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_comment`(`_uid` INT, `_type` TEXT, `_id` INT, `_text` TEXT) RETURNS int(11)
BEGIN
   set _text = trim(_text);
   if (_text = '') then set _text = null; end if;

	case _type
				when 'lds' then
			update custom_price_lds p set p.`comment` = _text where p.id = _id;
			end case;

   call system_log_write(_uid, 'pricelist_set_comment', concat('type: ', _type, ', id_item: ', _id, ', comment_item: ', ifnull(_text, 'null')));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_dayoff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_dayoff`(`_uid` INT, `_type` TEXT, `_id` INT, `_id_day` INT, `_status` INT) RETURNS int(11)
BEGIN
	case _type
				when 'lds' then
         if (_status = 0) then
   			insert ignore into custom_price_lds_dayoff (id_item, id_day) values (_id, _id_day);
         else
            delete o.* from custom_price_lds_dayoff o where o.id_item = _id and o.id_day = _id_day;
         end if;
			end case;

   call system_log_write(_uid, 'pricelist_change_dayoff', concat('type: ', _type, ', id_item: ', _id, ', id_day: ', _id_day, ', status: ', _status));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_nds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_nds`(`_uid` INT, `_type` TEXT, `_id` INT, `_nds` TEXT) RETURNS int(11)
BEGIN
	case _type
				when 'lds' then
			update custom_price_lds p set p.nds = _nds where p.id = _id;
			end case;

   call system_log_write(_uid, 'pricelist_change_nds', concat('type: ', _type, ', id_item: ', _id, ', nds: ', _nds));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_price`(`_uid` INT, `_type` TEXT, `_id` INT, `_text` TEXT) RETURNS int(11)
BEGIN
   set _text = trim(_text);
   if (_text = '') then set _text = 0; end if;

	case _type
				when 'lds' then
			update custom_price_lds p set p.price = _text where p.id = _id;
			end case;

   call system_log_write(_uid, 'pricelist_change_price', concat('type: ', _type, ', id_item: ', _id, ', price: ', ifnull(_text, 'null')));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_status`(`_uid` INT, `_type` TEXT, `_id` INT, `_status` INT) RETURNS int(11)
BEGIN
	case _type
				when 'lds' then
			update custom_price_lds p set p.`status` = _status where p.id = _id;
	end case;

   call system_log_write(_uid, 'pricelist_change_status', concat('type: ', _type, ', id_item: ', _id, ', Status: ', _status));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `custom_price_set_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `custom_price_set_time`(`_uid` INT, `_type` TEXT, `_id` INT, `_id_day` INT, `_tstart` TIME, `_tfinish` TIME) RETURNS bigint(20)
BEGIN
	case _type
				when 'lds' then
			insert into custom_price_lds_time (id_item, `start`, finish, id_day)
         values (_id, _tstart, _tfinish, _id_day)
         on duplicate key update `start` = _tstart, finish = _tfinish;
	end case;

   if (_tfinish is null) then set _tfinish = ''; end if;
   if (_tstart is null) then set _tstart = ''; end if;

   call system_log_write(_uid, 'pricelist_set_time', concat('type: ', _type, ', id_item: ', _id, ', id_day: ', _id_day, ', t_start: ', _tstart, ', t_finish: ', _tfinish));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `extra_days_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `extra_days_add`(`_uid` INT, `_dt` DATE, `_is_work` INT) RETURNS int(11)
BEGIN
   insert into extra_days (dt, dt_type)
   values(_dt, _is_work)
   on duplicate key update dt_type = _is_work;

   call year_schedule_fill(_dt, _dt + interval 12 month);

   return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `extra_days_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `extra_days_del`(`_uid` INT, `_id` INT) RETURNS int(11)
BEGIN
   select e.dt into @dt from extra_days e where e.id = _id;
   call year_schedule_fill(@dt, @dt + interval 12 month);

   delete from extra_days where id = _id;

   return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `payments_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `payments_add`(`_uid` INT, `_id_service` INT, `_amount` DECIMAL(10,2)) RETURNS int(11)
BEGIN
declare _dt_insert datetime default now();
declare _id_payment int default 0;

   insert into payments (id_user, id_service, dt_insert, amount, price, nds, `desc`)
   select _uid, _id_service, _dt_insert, _amount, r.price, r.nds, r.`desc`
   from custom_price_lds r
   where r.id = _id_service;

   select p.id into _id_payment
   from payments p
   where p.dt_insert = _dt_insert
      and p.id_user = _uid
      and p.amount = _amount
	order by p.id desc
	limit 1;

   call system_log_write(_uid, 'payment',
      concat(
         ' Сумма: ', _amount,
         ' id_service: ', _id_service
      )
   );

   return _id_payment;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `payments_add_rest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `payments_add_rest`(`_uid` INT, `_id_payment` INT, `_rest` INT) RETURNS int(11)
BEGIN
   update payments p
   set p.amount = p.amount + _rest
   where p.id = _id_payment;

   return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prepayments_change` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prepayments_change`(`_uid` INT, `_id` INT, `_amount` DECIMAL(10,2)) RETURNS int(11)
BEGIN
declare _old decimal(10,2) default 0;
declare _exist int default 1;
declare continue handler for not found set _exist = 0;

	select p.amount into _old from prepayments p where p.id_card = _id;

   if (_exist = 0) then
      insert into prepayments (id_card, amount)
      values (_id, _amount);
   else
      update prepayments p set p.amount = _amount where p.id_card = _id;
   end if;

   call system_log_write(_uid, 'prepayments_change', concat('id_card: ', _id, ', Старая сумма: ', _old, ', новая сумма: ', _amount, ' '));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sessions_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sessions_add`(`_login` TEXT, `_pass` TEXT, `_ip` TEXT, `_id` INT) RETURNS text CHARSET utf8
BEGIN
declare _sid text default uuid();
declare _uid int default 0;

		if (_ip != '') then
		select u.id into _uid
		from v_real_users u
		where u.ip = _ip;

      	end if;

		if (_uid = 0 and _id > 0) then
		select u.id into _uid
		from v_real_users u
		where u.id = _id;
	end if;

		if (_uid = 0) then
		select u.id into _uid
		from v_real_users u
		where u.login = _login
			and u.password = md5(_pass);
	end if;

		if (_uid != 0) then
		insert into sessions (id_user, id_session, dt_reg, dt_last_update)
		values (_uid, _sid, now(), now())
		on duplicate key update id_session = _sid, dt_reg = now(), dt_last_update = now();

		call system_log_write(_uid, 'sessions_add', _ip);
   else
      set _sid = '';
   end if;

   return _sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sessions_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sessions_check`(`_sid` TEXT charset 'utf8') RETURNS int(11)
BEGIN
declare _uid int default 0;

	SELECT s.id_user into _uid
	FROM sessions s
		join v_real_users u on s.id_user = u.id
	WHERE s.id_session = _sid;

	if (_uid != 0) then
		update sessions s set s.dt_last_update = now() where s.id_user = _uid;
	end if;

	return _uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sessions_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sessions_del`(`_sid` TEXT charset 'utf8') RETURNS int(11)
BEGIN
	delete from `session` where id_session = _sid;
	call system_log_write(_uid, 'sessions_del', '');

	return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `users_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `users_add`(`_uid` INT, `_id_role` INT, `_ip` TEXT, `_login` TEXT, `_address` TEXT) RETURNS int(11)
BEGIN

	insert ignore into users (login, ip, address, id_role, password, `status`)
	values (_login, _ip, _address, _id_role, md5('123'), 0);

    call system_log_write(_uid, 'users_add', concat('id_role: ', _id_role, ', ip: ', _ip, ', login', _login, ', address: ', _address));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `users_change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `users_change_password`(`_uid` INT, `_id` INT, `_password` TEXT) RETURNS int(11)
BEGIN

    update users u set u.password = md5(_password) where u.id = _id;

    call system_log_write(_uid, 'users_change_password', concat('id_user: ', _id));

    return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `users_change_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `users_change_status`(`_uid` INT, `_id` INT, `_status` INT) RETURNS int(11)
BEGIN
	update users u set u.`status` = _status where u.id = _id;

    call system_log_write(_uid, 'users_change_status', concat('id_user: ', _id, ', Status: ', _status));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `users_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `users_delete`(`_uid` INT, `_id` INT) RETURNS int(11)
BEGIN
	update users u set u.`real` = 0 where u.id = _id;

   call system_log_write(_uid, 'users_delete', concat('id_user: ', _id));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `users_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `users_edit`(`_uid` INT, `_id` INT, `_ip` TEXT, `_login` TEXT, `_address` TEXT) RETURNS int(11)
BEGIN

	update ignore users u
	set u.ip = _ip, u.login = _login, u.address = _address
	where u.id = _id;

   call system_log_write(_uid, 'users_edit', concat('id: ', _id, ', ip: ', _ip, ', login', _login, ', address: ', _address));

	return 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `_is_date_off` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `_is_date_off`(`_dt` DATE) RETURNS int(11)
BEGIN
declare _res int;

	select if(count(*)=0, if(WEEKDAY(_dt) >= 5, 1, 2), e.dt_type) into _res
	from extra_days e where e.dt = _dt;

	return _res;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `general_settings_save_xml` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `general_settings_save_xml`(IN `_uid` INT, IN `_text` TEXT)
BEGIN
    call system_log_write(_uid, 'Редактирование сценария', 21, null, null);

    update general_settings g set g.params_xml = _text;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hws_status_write` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hws_status_write`(IN `_id_user` INT, IN `_type` TEXT, IN `_is_error` INT, IN `_message` TEXT)
BEGIN
	insert into hws_status (id_user, `type`, dt, message, is_error)
	values (_id_user, _type, now(), _message, _is_error)
	on DUPLICATE KEY update dt = now(), message = _message, is_error = _is_error;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `system_log_write` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `system_log_write`(IN `_uid` INT, IN `_sql_function` TEXT, IN `_additional` TEXT)
BEGIN
declare _id_action int default null;

    select a.id into _id_action
	 from actions a
	 where a.sql_function = _sql_function;

    insert into system_log (dt, id_user, action, id_action)
    values (now(), _uid, _additional, _id_action);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `year_schedule_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `year_schedule_fill`(IN `_dt_start` DATE, IN `_dt_end` DATE)
BEGIN
	if (_dt_start > _dt_end) then
		set _dt_start = _dt_end;
	end if;

	while (_dt_start < _dt_end) do
		insert into year_schedule (dt, dt_type)
		values (_dt_start, _is_date_off(_dt_start))
		on duplicate key update dt_type = _is_date_off(_dt_start);
		set _dt_start = _dt_start + interval 1 day;
	end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `_copy_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_copy_price`()
BEGIN
	update custom_price_lds r
	set r.`desc` = r.clients_desc
	where r.clients_desc is not null
		and trim(r.clients_desc) != '';

	update custom_price_lds r
	set r.clients_desc = null
	where r.clients_desc is not null
		and trim(r.clients_desc) != '';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_active_users`
--

/*!50001 DROP TABLE IF EXISTS `v_active_users`*/;
/*!50001 DROP VIEW IF EXISTS `v_active_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_users` AS select `u`.`id` AS `id`,`u`.`login` AS `login`,`u`.`ip` AS `ip`,`u`.`id_role` AS `id_role`,`u`.`password` AS `password`,`u`.`status` AS `status`,`u`.`dt_insert` AS `dt_insert`,`u`.`real` AS `real` from `users` `u` where ((`u`.`real` = 1) and (`u`.`status` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_clients_custom_pricelist`
--

/*!50001 DROP TABLE IF EXISTS `v_clients_custom_pricelist`*/;
/*!50001 DROP VIEW IF EXISTS `v_clients_custom_pricelist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clients_custom_pricelist` AS select `p`.`id` AS `id`,`y`.`dt` AS `dt`,`y`.`dt_type` AS `dt_type`,`p`.`id_parent` AS `id_parent`,ifnull(`p`.`clients_desc`,`p`.`desc`) AS `desc`,`p`.`price` AS `price`,`p`.`nds` AS `nds`,`p`.`color` AS `color`,`p`.`order` AS `order`,`t`.`start` AS `start`,`t`.`finish` AS `finish`,`p`.`comment` AS `comment`,`p`.`screen` AS `screen` from (((`year_schedule` `y` join `custom_price_lds` `p` on(((`p`.`day_type` = `y`.`dt_type`) and (`p`.`status` = 1)))) left join `custom_price_lds_dayoff` `o` on(((`o`.`id_item` = `p`.`id`) and (`o`.`id_day` = weekday(curdate()))))) left join `custom_price_lds_time` `t` on(((`t`.`id_item` = `p`.`id`) and (`t`.`id_day` = weekday(curdate()))))) where ((`y`.`dt` = curdate()) and isnull(`o`.`id`) and ((isnull(`t`.`start`) and isnull(`t`.`finish`)) or (isnull(`t`.`start`) and (`t`.`finish` is not null) and (`t`.`finish` > curtime())) or (isnull(`t`.`finish`) and (`t`.`start` is not null) and (`t`.`start` < curtime())) or ((`t`.`finish` > curtime()) and (`t`.`start` < curtime())))) order by `p`.`id_parent`,`p`.`desc` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_custom_pricelist`
--

/*!50001 DROP TABLE IF EXISTS `v_custom_pricelist`*/;
/*!50001 DROP VIEW IF EXISTS `v_custom_pricelist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_custom_pricelist` AS select `c`.`id` AS `id`,`c`.`day_type` AS `day_type`,`c`.`id_parent` AS `id_parent`,`c`.`desc` AS `desc`,`c`.`clients_desc` AS `clients_desc`,`c`.`color` AS `color`,`c`.`price` AS `price`,`c`.`nds` AS `nds`,`c`.`status` AS `status`,`c`.`comment` AS `comment`,`c`.`bill` AS `bill` from `custom_price_lds` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_not_collected`
--

/*!50001 DROP TABLE IF EXISTS `v_not_collected`*/;
/*!50001 DROP VIEW IF EXISTS `v_not_collected`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_not_collected` AS select `p`.`id` AS `id`,`p`.`id_user` AS `id_user`,`p`.`dt_insert` AS `dt_insert`,`p`.`amount` AS `amount`,`p`.`collected` AS `collected`,`p`.`price` AS `price`,`p`.`nds` AS `nds` from `payments` `p` where (`p`.`collected` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_payments`
--

/*!50001 DROP TABLE IF EXISTS `v_payments`*/;
/*!50001 DROP VIEW IF EXISTS `v_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_payments` AS select `p`.`id` AS `id`,`p`.`id_user` AS `id_user`,`p`.`dt_insert` AS `dt_insert`,`p`.`amount` AS `amount`,`p`.`collected` AS `collected`,`p`.`id_collection` AS `id_collection`,`p`.`id_service` AS `id_service`,`p`.`price` AS `price`,`p`.`nds` AS `nds`,`p`.`desc` AS `desc` from `payments` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_real_users`
--

/*!50001 DROP TABLE IF EXISTS `v_real_users`*/;
/*!50001 DROP VIEW IF EXISTS `v_real_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_real_users` AS select `u`.`id` AS `id`,`u`.`login` AS `login`,`u`.`ip` AS `ip`,`u`.`address` AS `address`,`u`.`id_role` AS `id_role`,`u`.`password` AS `password`,`u`.`status` AS `status`,`u`.`dt_insert` AS `dt_insert`,`u`.`real` AS `real` from `users` `u` where (`u`.`real` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-01 12:59:32
