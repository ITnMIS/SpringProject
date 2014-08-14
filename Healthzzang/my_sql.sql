

--
-- Table structure for table `B_QNA`
--

DROP TABLE IF EXISTS `B_QNA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_QNA` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `GYM_Seq` int(11) NOT NULL,
  `WriterId` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Content` text NOT NULL,
  `Img` blob,
  `Fileupload` blob,
  `Time` datetime NOT NULL,
  `Hitcount` int(11) NOT NULL,
  `Recommendcount` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `B_QNA`
--

LOCK TABLES `B_QNA` WRITE;
/*!40000 ALTER TABLE `B_QNA` DISABLE KEYS */;
/*!40000 ALTER TABLE `B_QNA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `B_Q_COMMENT`
--

DROP TABLE IF EXISTS `B_Q_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B_Q_COMMENT` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Content` text,
  `LinkedArticleNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `B_Q_COMMENT`
--

LOCK TABLES `B_Q_COMMENT` WRITE;
/*!40000 ALTER TABLE `B_Q_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `B_Q_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_E_Comment`
--

DROP TABLE IF EXISTS `C_E_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_E_Comment` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `Content` text,
  `LinkedArticleNum` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_E_Comment`
--

LOCK TABLES `C_E_Comment` WRITE;
/*!40000 ALTER TABLE `C_E_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_E_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Event`
--

DROP TABLE IF EXISTS `C_Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Event` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Subject` varchar(45) DEFAULT NULL,
  `Content` text,
  `Img` blob,
  `Fileupload` blob,
  `Time` datetime DEFAULT NULL,
  `Hitcount` int(11) DEFAULT NULL,
  `Recommendcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Event`
--

LOCK TABLES `C_Event` WRITE;
/*!40000 ALTER TABLE `C_Event` DISABLE KEYS */;
INSERT INTO `C_Event` VALUES (1,'ajh','한글테스트','지금 한글 되고있나요?','','','2014-08-13 00:32:53',2,0),(2,'운영자','\"나이는 숫자에 불과하다\" - 이벤트','안녕하세요. 더운 여름이 지나가고 가을이 오고 있습니다! <br />가을 다음은? 겨울이죠! <br />나이가 들 수록 추위를 더 타게 된다고하죠. <br />그래서 준비했습니다.<br />추운 겨울을 따듯하게 보내기 위한 건강증진 이벤트!! <br />50세 이상의 고객께서는 \"나는 헬스짱\" 게시판에 자신의 건강/몸매 등을 어필해 주세요. <br /><br />- 나이<br />- 이력 <br />- 사는 곳 <br />- 다니는 헬스장<br />- 기타<br /><br />추천을 통해 <br /><br />1위 : 런닝머신<br />2위 : 헬스용 벤드<br />3위 : 파스 100통 <br />을 드려요 :D','','','2014-08-13 01:07:00',2,0),(3,'운영자','OPEN EVENT!! ','OPEN EVENT<br /><br />대상 : 헬스짱에 등록된 헬스장을 다니는 헬스짱 가입 고객<br />방법 : \"나는 헬스짱이다\" 게시판에 <br />- 나이<br />- 헬스장<br />- 운동 전과 운동 후의 변화된 모습<br />- 기타<br />를 입력<br /><br />추첨을 통해 한달 무료이용권을 드려요<br />*단, <br />- 2015년까지 사용가능<br />- 헬스짱에 등록된 헬스장<br />','','','2014-08-13 01:11:01',0,0),(4,'운영자','\"다이어트? 헬스?, 먹고하자!!\"','<br /> 안먹는다고 빠지나요? (....그렇긴하죠.)<br />그러나 우리의 치느님을 외면할 수 없죠. <br />헬스 지식인을 통해 아래에 해당되는 내용의 글을 올려주세요. 추첨을 통해 교치치킨 교환 권을 드려요!<br /><br />내용 : <br />- 헬스장 이용후기<br />- 헬스장 이용 정보<br />- 헬스관련 지식<br /><br />2015년 1월까지!<br /> ','','','2014-08-13 01:27:40',0,0);
/*!40000 ALTER TABLE `C_Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_F_Comment`
--

DROP TABLE IF EXISTS `C_F_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_F_Comment` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `Content` text NOT NULL,
  `LinkedArticleNum` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_F_Comment`
--

LOCK TABLES `C_F_Comment` WRITE;
/*!40000 ALTER TABLE `C_F_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_F_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Free`
--

DROP TABLE IF EXISTS `C_Free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Free` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Content` text NOT NULL,
  `Img` blob,
  `Fileupload` blob,
  `Time` datetime NOT NULL,
  `Hitcount` int(11) NOT NULL,
  `Recommendcount` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Free`
--

LOCK TABLES `C_Free` WRITE;
/*!40000 ALTER TABLE `C_Free` DISABLE KEYS */;
INSERT INTO `C_Free` VALUES (1,'흑형','이곳이?','자유게시판맞죠?','','','2014-08-13 04:13:11',0,0),(2,'운영자','와글와글 테스트','와글와글 테스트','','','2014-08-13 04:18:21',0,0),(3,'운영자','와글와글 테스트','와글와글 테스트','','','2014-08-13 04:18:24',0,0),(4,'운영자','와글와글 테스트','와글와글 테스트','','','2014-08-13 04:18:27',0,0),(5,'운영자','와글와글 테스트','와글와글 테스트','','','2014-08-13 04:18:31',0,0),(6,'운영자','와글와글 테스트- 1','와글와글 테스트','','','2014-08-13 04:18:36',0,0),(7,'운영자','와글와글 테스트- 2','와글와글 테스트','','','2014-08-13 04:18:41',0,0),(8,'운영자','와글와글 테스트- 3','와글와글 테스트','','','2014-08-13 04:18:47',0,0),(9,'운영자','와글와글 테스트- 4','와글와글 테스트','','','2014-08-13 04:18:54',0,0),(10,'운영자','와글와글 테스트- 5','와글와글 테스트','','','2014-08-13 04:19:00',0,0),(11,'운영자','asd','ㅁㄴㅇ','','','2014-08-13 04:22:18',0,0);
/*!40000 ALTER TABLE `C_Free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_H_Comment`
--

DROP TABLE IF EXISTS `C_H_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_H_Comment` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `Content` text NOT NULL,
  `LinkedArticleNum` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_H_Comment`
--

LOCK TABLES `C_H_Comment` WRITE;
/*!40000 ALTER TABLE `C_H_Comment` DISABLE KEYS */;
INSERT INTO `C_H_Comment` VALUES (1,'운영자','2014-08-13 04:23:12','흑형님 이달의 나는헬스짱이다에 선정 되셨습니다. 축하드립니다. <br />',1);
/*!40000 ALTER TABLE `C_H_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Healthz`
--

DROP TABLE IF EXISTS `C_Healthz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Healthz` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Content` text NOT NULL,
  `Img` blob,
  `Fileupload` blob,
  `Time` datetime NOT NULL,
  `Hitcount` int(11) NOT NULL,
  `Recommendcount` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Healthz`
--

LOCK TABLES `C_Healthz` WRITE;
/*!40000 ALTER TABLE `C_Healthz` DISABLE KEYS */;
INSERT INTO `C_Healthz` VALUES (1,'흑형','내가 \"흑형\"이다.','안녕하세요. <br />저는 경기도 용인에 살고 있는 흑형이라고 합니다.<br />오해하지마세요. 인종차별이아닌 성이 \'흑\'이고 이름이 \'형\'입니다.<br />저는 현제 경기도 용인에 위치한 \'정현\'헬스장에 다니고 있으며, 약 한달만에 엄청난 몸을 만들어 냈습니다.<br />그래서 저의 운동법 및 몸짱 만들기 비법을 공유해드립니다.<br /><br />한달! 딱 한달이면 됩니다.<br /><br />아침 : <br /> 식단 - 닭가슴살 + 샐러드(토마토와 양배추)<br /> 운동 - 직장 도착 3정거장 전에 내려서 걸어가기 + 걸으며 노트북으로 팔운동 <br /><br />점심 :<br /> 식단 - 고구마 및 견과류 위주<br /> 운동 - 30분동안 윗몸일으키기 및 팔굽혀 펴기 <br /><br />저녁 : <br /> 식단 - 달걀, 닭가슴살, 잡곡 밥<br /> 운동 - 헬스장 1시간 30분 운동으로 30분 유산소 후 1시간 헬스장 코스 ( 놀러오세요 상세하게 알려드립니다)<br /><br />자! 여러분도 한달이면 몸짱이 될 수있습니다. 자세한건 저희 헬스장에 놀러오시면 알려드릴께요. <br />*보통 저녁 8시부터 있습니다. <br /><br />','','','2014-08-13 04:12:03',6,1);
/*!40000 ALTER TABLE `C_Healthz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_I_Comment`
--

DROP TABLE IF EXISTS `C_I_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_I_Comment` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Time` datetime NOT NULL,
  `Content` text NOT NULL,
  `LinkedArticleNum` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_I_Comment`
--

LOCK TABLES `C_I_Comment` WRITE;
/*!40000 ALTER TABLE `C_I_Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_I_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Idea`
--

DROP TABLE IF EXISTS `C_Idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Idea` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `WriterId` varchar(45) NOT NULL,
  `Subject` varchar(45) NOT NULL,
  `Content` text NOT NULL,
  `Img` blob,
  `Fileupload` blob,
  `Time` datetime NOT NULL,
  `Hitcount` int(11) NOT NULL,
  `Recommendcount` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Idea`
--

LOCK TABLES `C_Idea` WRITE;
/*!40000 ALTER TABLE `C_Idea` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GYM`
--

DROP TABLE IF EXISTS `GYM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GYM` (
  `Gidx` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Town` varchar(45) NOT NULL,
  `RegDate` datetime NOT NULL,
  `BizNo` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Img` blob,
  `Scale` varchar(45) NOT NULL,
  `Intro` text,
  PRIMARY KEY (`Gidx`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GYM`
--

LOCK TABLES `GYM` WRITE;
/*!40000 ALTER TABLE `GYM` DISABLE KEYS */;
INSERT INTO `GYM` VALUES (1,'정현헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','용인에 이만한 곳 없다. 용인 최대의 장비와 시설이 존재하는 그곳 !!'),(2,'수현헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','여성들을 위한 여성들에 의한 여성들의 헬스장! 몸장 여헬스트레이너가 여성들을 책임집니다.'),(3,'환희헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','음악과 하나가 되는 헬스장. 국내 최초 락컨셉의 헬스장으로 여러분을 초대합니다.'),(4,'영숙헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','어르신들을 위한 어르신들에 의한 헬스장입니다. 나이는 숫자에 불과하다! 나이를 잊고 건강을 찾으세요.'),(5,'앙리헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음'),(6,'박지성헬스장','경기','용인시','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음'),(7,'지단 헬스장','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','근육이 찢어지는 소리가 들리는 그날까지. 멘탈 고정해주는 친절한 헬스장'),(8,'정현헬스장 강북점','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음'),(9,'펠레 헬스장','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','몸짱이 될 확률과 적중률을 완벽하게 계산해주는 몸짱 트레이너 펠레가 있는!강북구 명소'),(10,'벤제마 헬스장','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음'),(11,'안드로메다 헬스장','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음'),(12,'호나우도 헬스장','서울시','강북구','2014-07-01 00:00:00','7777-777','000-000-0000',NULL,'1000m*1000m','헬스장이 넓고 좋음');
/*!40000 ALTER TABLE `GYM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G_FEE`
--

DROP TABLE IF EXISTS `G_FEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `G_FEE` (
  `G_F_Seq` int(11) NOT NULL AUTO_INCREMENT,
  `Gidx` int(11) NOT NULL,
  `Period` varchar(45) DEFAULT NULL,
  `Fee` varchar(45) DEFAULT NULL,
  `SubFee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`G_F_Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G_FEE`
--

LOCK TABLES `G_FEE` WRITE;
/*!40000 ALTER TABLE `G_FEE` DISABLE KEYS */;
INSERT INTO `G_FEE` VALUES (1,1,'1개월','4만원','락커1만원'),(2,1,'3개월','10만원','락커 무료'),(3,1,'6개월','18만원',''),(4,7,'1개월','5만원',NULL),(5,7,'6개월','14만원',NULL),(6,9,'1개월','8만원','락커 무료'),(7,9,'3개월','12만원','스팀사우나 제공');
/*!40000 ALTER TABLE `G_FEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER` (
  `M_seq` int(11) NOT NULL AUTO_INCREMENT,
  `Id` varchar(45) NOT NULL,
  `Pw` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`M_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'a','a','a@a.com'),(2,'ajh','123','c@c.com'),(3,'운영자','123','b@b.com'),(4,'흑형','123','d@d.com'),(5,'정현','87','an_1249@naver.com');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINER`
--

DROP TABLE IF EXISTS `TRAINER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAINER` (
  `T_Seq` int(11) NOT NULL AUTO_INCREMENT,
  `Gidx` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Img` blob,
  `Career` varchar(45) DEFAULT NULL,
  `Intro` text,
  PRIMARY KEY (`T_Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINER`
--

LOCK TABLES `TRAINER` WRITE;
/*!40000 ALTER TABLE `TRAINER` DISABLE KEYS */;
INSERT INTO `TRAINER` VALUES (1,1,'정현','010-0000-0000',NULL,'2014년 헬스짱대회 우숭 ','훈남 트레이너의 특강 기대하세요!'),(2,7,'지단','000-0000-0000',NULL,'2008~2014년 프랑스 헬스짱','탈모가 매력적이 남자'),(3,9,'펠레','000-0000-0000',NULL,'2001, 2000 올해 최고의 트레이너 ','적중률 100%의 최고 몸짱트레이너');
/*!40000 ALTER TABLE `TRAINER` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-13 18:35:31
