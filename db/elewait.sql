CREATE DATABASE  IF NOT EXISTS `begemot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `begemot`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: begemot
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (8,'Станислава','Зиновьева','Администратор'),(9,'Май','Кулагин ','Администратор'),(10,'Назарий','Борисов ','Бармен'),(11,'Вениамин','Сазонов ','Бармен'),(12,'Ада','Крюкова','Официант'),(13,'Мишель','Стрелкова','Официант'),(14,'Генриетта','Авдеева','Повар'),(15,'Ермолай','Сорокин ','Повар'),(16,'Артур','Иванченко','Официант'),(19,'Кирилл','Николаев','Официант');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_category`
--

DROP TABLE IF EXISTS `food_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_category` (
  `categoryId` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_category`
--

LOCK TABLES `food_category` WRITE;
/*!40000 ALTER TABLE `food_category` DISABLE KEYS */;
INSERT INTO `food_category` VALUES (1,'Горячее'),(3,'Супы'),(4,'Закуски'),(5,'Напитки'),(6,'Салаты'),(7,'Другое');
/*!40000 ALTER TABLE `food_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventoryId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`inventoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'мясо(свинина)',1231,10,'кг'),(2,'мясо(курица)',1232,10,'кг'),(3,'мясо(говядина)',1233,10,'кг'),(4,'помидоры',1010,3,'кг'),(5,'огурцы',1011,3,'кг'),(6,'салат(айсберг)',1012,2,'кг'),(7,'салат(руккола)',1013,1,'кг'),(8,'мука',1303,10,'кг'),(9,'сахар',1304,10,'кг'),(10,'соль',1305,7,'кг'),(11,'перец',1014,3,'кг'),(12,'перец болгарский',1015,3,'кг'),(13,'капуста',1016,6,'кг'),(14,'масло(сливочное)',1306,2,'кг'),(15,'масло(подсолнечное)',1307,6,'л'),(16,'рыба(форель)',1234,3,'кг'),(17,'макароны(спагетти)',1308,8,'кг'),(18,'макароны(равиоли)',1309,8,'кг'),(19,'картофель',1017,5,'кг'),(20,'горох(маринованный)',1018,2.1,'кг'),(21,'тест',123,10,'литров');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `foodId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `caption` text,
  `price` int DEFAULT NULL,
  `path_to_img` text,
  `food_category_categoryId` int unsigned NOT NULL,
  `stoplist` varchar(45) DEFAULT 'доступно',
  PRIMARY KEY (`foodId`),
  KEY `fk_menu_food_category1_idx` (`food_category_categoryId`),
  CONSTRAINT `fk_menu_food_category1` FOREIGN KEY (`food_category_categoryId`) REFERENCES `food_category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Пельмени русские','Самолепные пельмени с фаршем из говядины и свинины, подаются со сметаной\r\n310 г.',350,'пельмени.jpg',1,'недоступно'),(2,'Блины','Блины — древнейшее блюдо русской кухни, появившееся в IX веке. Рецепт приготовления одного из самых известных русских яств весьма прост — молоко, яйца, соль, а вот процесс приготовления сродни мастерству, овладеть которым под силу не каждой хозяйке. Жидкое тесто выливают на разогретое на сковороде масло, задача повара — испечь румяный ровный блин без комочков и не дать ему сгореть раньше времени. Чем тоньше блины, тем выше уровень мастерства. В России до сих пор в ходу поговорка «Первый блин комом», означающая неудачу в начале какого-либо дела. Обычно блины подают горячими со сметаной, маслом, медом или заворачивают в них различные начинки – мясные, рыбные, овощные, сладкие, фруктовые и другие. Особый шик – блины с икрой.',300,'блины.jpg',1,'недоступно'),(3,'Оливье','Так же как американцам трудно представить День благодарения без традиционной индейки, а итальянцам рождественский стол без чечевицы и дзампоне, так и новогодний стол во многих российских семьях немыслим без «Оливье», известного за рубежом как «Русский салат». Названный так в честь своего создателя – работавшего в Москве в XIX веке шеф-повара Люсьена Оливье — он обрел особую популярность в советские годы. Не в последнюю роль в этом сыграла простота приготовления и доступность ингредиентов. Классический советский «Оливье» включал отварные картофель и морковь, колбасу, сваренные вкрутую яйца, соленые огурцы, зелёный горошек и укроп. Все это резалось на мелкие кубики и заправлялось майонезом.',250,'bim.png',6,'доступно'),(4,'Винегрет','Этот салат появился в русской кухне в XIX веке. Его готовят из отварных свеклы, картофеля, фасоли, моркови, а также соленых огурцов и лука. Заправляется подсолнечным маслом. По виду напоминает «сухой» борщ.',400,'bim.png',6,'недоступно'),(6,'Нарезка закусочная','Два вида сала, поджаренные бородинские гренки и деликатесный говяжий язык. Подается с горчицей и хреном.',600,'narezkazakusochnaja-818x818.webp',4,'доступно'),(7,'Мини бургеры','Мини-бургеры на свекольной булочке собственного приготовления с медальоном из свиной вырезки с сочным беконом, карамелизированным луком и свежими овощами.',1000,'bim.png',1,'доступно'),(8,'Ассорти мини-чиабат','Ассорти из трех видов мини-чиабатт с начинками из курицы с соусом цезарь, ветчины и сыра, кижуча и соуса тартар.',900,'assortibokatini-min-818x818.webp',4,'доступно'),(10,'Стейк из семги','Запеченный стейк из красной рыбы со сливочным соусом и гарниром на выбор: ароматный рис или картофельное пюре\r\n243 г.',1115,'стейк из семги.jpg',1,'доступно'),(11,'Бефстроганов','Фермерская говядина, приготовленная в сливках высшего качества с добавлением шампиньонов, с нежнейшим картофельным пюре на сливочном масле\r\n413 г.',785,'bim.png',1,'доступно'),(12,'Бифштекс с яйцом','502 г.',545,'bim.png',1,'доступно'),(13,'Форель запеченая в конверте с картофелем','Форель приготовленная в духовом шкафу – нежная, сочная, ароматная с запеченым мини-картофелем \r\n377 г.',705,'Форель запеченая в конверте с картофелем.jpg',1,'доступно'),(14,'Рис с креветками и овощами','Сладкий болгарский перец, морковь, цукини, красный лук, тигровые креветки обжаренные с рисом на кунжутном масле\r\n314 г.',595,'bim.png',1,'доступно'),(15,'Суп Фо-Бо','Блюдо вьетнамской кухни, говяжий бульон с лапшой, в который при сервировке добавляют говядину и зелень\r\n752 г.',525,'bim.png',1,'доступно'),(16,'Свиная корейка на кости «Челогач»','Свиная корейка гриль с картофельным пюре и грибным соусом\r\n405 г.',645,'bim.png',1,'доступно'),(17,'Карбонара','Самая популярная итальянская паста в мире. Неповторимый вкус - сливочный и нежный на основе сливок и пармезана, с добавлением бекона и яйца\r\n261 г.',415,'Карбонара.jpg',1,'доступно'),(18,'Лазанья мясная','Блюдо итальянской кухни, традиционно приготовляемое из тонких листов теста со слоями начинки на основе рагу с мясным фаршем, залитого соусом бешамель и посыпанного сыром пармезан.\r\n351 г.',525,'Лазанья мясная.jpg',1,'доступно'),(19,'Пенне 4 сыра','Сливочная паста с пикантным дор блю, нежнейшей моцареллой, оранжевым чеддером и классическим пармезаном\r\n288 г.',435,'Пенне 4 сыра.jpg',1,'доступно'),(20,'Пенне с креветкой','Тигровые креветки обжаренные с добавлением сливочного соуса и пасты пенне\r\n284 г.',835,'Пенне с креветкой.jpg',1,'доступно'),(21,'Спагетти болоньезе','Мясной соус на основе свино-говяжьего фарша для итальянской пасты родом из Болоньи.\r\n372 г.',395,'Спагетти болоньезе.jpg',1,'доступно'),(22,'Цезарь с курицей','Куриное филе, приготовленное по особому рецепту в сочетании со свежими перепелиными яйцами, сочным салатом Романо, хрустящими гренками из белого хлеба и густым соусом Цезарь.\r\n230 г.',465,'Цезарь с курицей.jpg',6,'доступно'),(23,'Греческий','Любимый салат сторонников правильного питания. Свежие хрустящие огурчики, сочные помидоры и сладкий перец, пикантные оливки и маслины дополнены двумя видами сыров - сиртаки и жаренной фетой, с добавлением душистого оливкового масла.\r\n315 г.',475,'Греческий.jpg',6,'доступно'),(24,'Цезарь с лангустинами','Большие, нежные лангустины в сочетании со свежими перепелиными яйцами, сочным салатом Романо, хрустящими гренками из белого хлеба и густым соусом Цезарь.\r\n290 г.',825,'bim.png',6,'доступно'),(25,'Оливье с языком','Настоящий классический оливье с говяжьим языком. В роскошной мантии отварных овощей, свежих и соленых огурчиков и домашнего майонеза.\r\n180 г.',305,'Оливье с языком.jpg',6,'доступно'),(26,'Черная метка','Печеная свёкла, микс салатных листьев, сыр Фета, томаты черри, фирменный соус \"Винегрет\"\r\n250 г.',515,'Черная метка.jpg',6,'доступно'),(27,'Борщ домашний','Наваристый густой борщ на домашнем говяжьем бульоне, который подается с гренками и паштетом из сала\r\n415 г.',385,'Борщ домашний.jpg',3,'доступно'),(28,'Куриный суп','Домашняя куриная лапша на золотистом бульоне со свежим перепелиным яйцом\r\n346 г.\r\n',265,'Куриный суп.jpg',3,'доступно'),(29,'Солянка мясная сборная','Густой, насыщенный суп с легкой кислинкой, сваренный из трех видов мяса с добавлением оливок и маслин\r\n350 г.',365,'Солянка мясная сборная.jpg',3,'доступно'),(30,'Уха по карельски','Этот суп мы готовим из двух видов деликатесной рыбы со сливками высшего качества, картофелем и морковью\r\n330 г.',515,'Уха по карельски.jpg',3,'доступно'),(31,'О.Бургер сырный Джони','Белая булочка, говяжья котлета, соус сырный, сыр Чеддер, помидор, лук красный\r\n355 г.',455,'О.Бургер сырный Джони.jpg',7,'доступно'),(32,'Мега чизбургер','Белая булочка, говяжья котлета, огурцы маринованные, лук маринованный, сыр Чеддер\r\n300 г.',405,'-О.Мега чизбургер.jpg',7,'доступно'),(33,'Умри, но не сейчас','Бургер из 6-ти говяжьих котлет, с сыром и овощами, двойная порция, подается с двойной порцией картошки фри с сырным соусом\r\n1480 г.',1955,'Умри, но не сейчас.jpg',7,'доступно'),(34,'Бургер дьябло','Цветная булочка, говяжья котлета, помидоры, халапеньо, лук маринованный, салат Айсберг, сыр Чеддер\r\n303 г.',415,'Бургер дьябло.jpg',7,'доступно'),(35,'Дорадо с овощами гриль','Рыба с ярким морским вкусом, запеченная целиком подается с овощями гриль.\r\n450 г.',1195,'Дорадо с овощами гриль.jpg',1,'доступно'),(36,'Каре ягненка','Свежее мясо молодого барашка на косточке в сочетании с ароматными специями и травами, приготовленное на открытом огне\r\n478 г.',1295,'Каре ягненка.jpg',1,'доступно'),(37,'Биф-кебаб','Поджаренный на мангале, ароматный сочный кебаб из свежего бараньего мяса с курдючным салом и маринованным луком.\r\n305 г.',515,'Биф-кебаб.jpg',1,'доступно'),(38,'Шашлык свинина','Сочные шашлыки из свиной шеи, приготовленные на открытом огне. Подаются со свежими овощами, томатным соусом и лавашем\r\n440 г.',635,'Шашлык свинина.jpg',1,'доступно'),(39,'Сок апельсиновый',NULL,200,'apelsin_sok.jpg',5,'доступно'),(40,'Сок яблочный',NULL,200,'сок яблочный.jpg',5,'доступно'),(41,'Вода',NULL,100,'вода.jpg',5,'доступно'),(42,'Квас',NULL,200,'kvas.jpg',5,'доступно');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `caption` varchar(45) DEFAULT NULL,
  `tableId` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `bill` int DEFAULT NULL,
  `employeeId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_orders_employee1_idx` (`employeeId`),
  CONSTRAINT `fk_orders_employee1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,1,'2023-12-12',2500,12),(2,NULL,2,'2023-12-12',1300,13),(3,NULL,3,'2023-12-13',2500,12),(4,NULL,4,'2024-02-12',3250,13),(5,NULL,3,'2024-02-14',2500,11),(6,NULL,3,'2024-02-14',1300,12),(7,NULL,3,'2024-02-15',2500,13),(9,NULL,11,'2024-02-15',6600,12),(10,NULL,1,'2024-02-16',650,13),(11,NULL,4,'2024-02-14',1000,NULL),(12,NULL,3,'2024-02-15',8390,NULL),(13,NULL,10,'2024-02-15',2115,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_menu`
--

DROP TABLE IF EXISTS `orders_has_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_menu` (
  `orders_orderId` int NOT NULL,
  `menu_foodId` int NOT NULL,
  `ordered_amount` int DEFAULT NULL,
  PRIMARY KEY (`orders_orderId`,`menu_foodId`),
  KEY `fk_orders_has_menu_menu1_idx` (`menu_foodId`),
  KEY `fk_orders_has_menu_orders1_idx` (`orders_orderId`),
  CONSTRAINT `fk_orders_has_menu_menu1` FOREIGN KEY (`menu_foodId`) REFERENCES `menu` (`foodId`) ON DELETE CASCADE,
  CONSTRAINT `fk_orders_has_menu_orders1` FOREIGN KEY (`orders_orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_menu`
--

LOCK TABLES `orders_has_menu` WRITE;
/*!40000 ALTER TABLE `orders_has_menu` DISABLE KEYS */;
INSERT INTO `orders_has_menu` VALUES (1,1,1),(1,2,2),(2,1,3),(2,2,1),(3,2,3),(3,3,2),(3,4,2),(4,3,1),(4,4,2),(9,1,10),(9,2,4),(9,7,1),(9,8,1),(10,1,1),(10,2,1),(11,1,2),(11,2,1),(12,3,1),(12,4,1),(12,7,4),(12,10,3),(12,21,1),(13,7,1),(13,10,1);
/*!40000 ALTER TABLE `orders_has_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationId` int NOT NULL AUTO_INCREMENT,
  `reservation_date` date DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `table_num` int DEFAULT NULL,
  PRIMARY KEY (`reservationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (2,'2024-02-01','89152033245','стол на 14:30',1),(3,'2024-02-02','89144233456','стол на 10 00',3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `recordId` int NOT NULL AUTO_INCREMENT,
  `day_of_shift` date DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2023-12-01',NULL),(2,'2023-12-02',NULL),(3,'2024-02-04',NULL),(4,'2024-02-03',NULL),(8,'2024-02-14',NULL),(9,'2024-02-15',NULL),(10,'2024-02-16',NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_has_employee`
--

DROP TABLE IF EXISTS `schedule_has_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_has_employee` (
  `schedule_recordId` int NOT NULL,
  `employee_employeeId` int NOT NULL,
  PRIMARY KEY (`schedule_recordId`,`employee_employeeId`),
  KEY `fk_schedule_has_employee_employee1_idx` (`employee_employeeId`),
  KEY `fk_schedule_has_employee_schedule1_idx` (`schedule_recordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_has_employee`
--

LOCK TABLES `schedule_has_employee` WRITE;
/*!40000 ALTER TABLE `schedule_has_employee` DISABLE KEYS */;
INSERT INTO `schedule_has_employee` VALUES (1,8),(3,8),(4,8),(8,8),(9,8),(10,8),(2,9),(10,9),(1,10),(3,10),(4,10),(8,10),(9,10),(10,10),(2,11),(1,12),(3,12),(4,12),(8,12),(9,12),(10,12),(2,13),(8,13),(9,13),(1,14),(3,14),(4,14),(8,14),(9,14),(10,14),(2,15);
/*!40000 ALTER TABLE `schedule_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablelist`
--

DROP TABLE IF EXISTS `tablelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablelist` (
  `tableId` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `waiter` tinyint DEFAULT NULL,
  PRIMARY KEY (`tableId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablelist`
--

LOCK TABLES `tablelist` WRITE;
/*!40000 ALTER TABLE `tablelist` DISABLE KEYS */;
INSERT INTO `tablelist` VALUES (1,'Обслуживается',1),(2,'Обслуживается',0),(3,'Обслуживается',0),(4,'Обслуживается',0),(5,'Пустой',0),(6,'Ожидает',0),(7,'Пустой',0),(8,'Пустой',0),(9,'Пустой',0),(10,'Обслуживается',0),(11,'Пустой',0),(12,'Ожидает',0),(13,'Пустой',0),(14,'Пустой',0),(15,'Пустой',0),(16,'Пустой',0),(17,'Пустой',0),(18,'Пустой',0),(19,'Пустой',0),(20,'Пустой',0);
/*!40000 ALTER TABLE `tablelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'sergei','sergei','Сергей','Грачев');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-15  1:56:22
