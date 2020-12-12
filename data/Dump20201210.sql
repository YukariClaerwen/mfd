-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: reviewthucpham
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `tbl_baiviet`
--

DROP TABLE IF EXISTS `tbl_baiviet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_baiviet` (
  `Idbaiviet` int NOT NULL AUTO_INCREMENT,
  `Noidung` text NOT NULL,
  `Soluotxem` int DEFAULT NULL,
  `Tenquan` varchar(255) NOT NULL,
  `Diemdanhgia` int NOT NULL,
  `Diachiquan` varchar(255) NOT NULL,
  `Diadiem` varchar(255) DEFAULT NULL,
  `Thoigianmocua` varchar(100) DEFAULT NULL,
  `Giaban` varchar(255) DEFAULT NULL,
  `Trangthaibaiviet` varchar(100) DEFAULT NULL,
  `Dachinhsua` varchar(50) DEFAULT NULL,
  `Ngaydangbaiviet` timestamp NULL DEFAULT NULL,
  `Tieudebaiviet` text,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idbaiviet`),
  KEY `fk_Email_Baiviet` (`Email`),
  CONSTRAINT `fk_Email_Baiviet` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baiviet`
--

LOCK TABLES `tbl_baiviet` WRITE;
/*!40000 ALTER TABLE `tbl_baiviet` DISABLE KEYS */;
INSERT INTO `tbl_baiviet` VALUES (11,'Điều đầu tiên mình ấn tượng nơi này là không gian quá thích. Nằm trong một con hẻm nhỏ nhưng khi đến đây Map sẽ tạo cho bạn một không gian thoải mái nhất, bình yên nhất Sài Gòn. Menu nước đa dạng, bao gồm cái món cà phê, trà, Mình thích nhất dalgona coffee rất hợp khẩu vị của mình, mà giá chỉ 45k, ngoài ra bạn nên thử trà hoa cúc liên tử nhé, đây cũng là món đặt trưng của quán, giá dao động cũng từ 45k thôi. Đến để có nhiều bức ảnh sống ảo nhé các bạn.',101,'Mapiness Coffee',9,'345/3 Nguyễn Đình Chiểu, P. 5, Quận 3, TP. HCM','TP. HCM','8h30 đến 22h','30k đến 50k','Cộng đồng','Chưa','2020-01-10 17:00:00','Mapiness Coffee','hien@gmail.com'),(12,'Một trong những con hẻm nổi tiếng về bán đồ ăn vặt ở Sài Gòn, đó chính là hẻm 76 Hai Bà Trưng. Khi bước vào sẽ bạn hít được rất nhiều mùi vị của món ăn xộc vào mũi: nào là bắp xào bơ, chân gà ngâm sả tắc, các loại ốc xào, phá lấu,.',1455,'Hẻm đồ ăn vặt',8,'76 Hai Bà Trưng ,Q1, TPHCM','TP.HCM','14h đến 23h',NULL,'Cộng đồng','Chưa','2019-12-10 17:00:00','Hẻm đồ ăn nên thử ở sài gòn','thuha2@gmail.com'),(13,'? Trước khi ghé Hàng Dương mua đồ hải sản ăn trưa thì chúng mình có ghé Đảo Khỉ thăm khỉ nè (Khỉ dạn người và rất hung dữ - chú ý vật dụng cầm tay bánh trái chai nước, điện thoại, ...) view trong khu đảo khỉ khá deap nhe... các bạn thích tạo dáng tha hồ feel luôn. Đi sâu vào trong thì không còn khỉ nữa nên không sợ đâu.',256,'Hải sản Hàng Dương',10,'Chợ Hàng Dương','Cần Giờ',NULL,NULL,'Cộng đồng','Chưa','2020-10-04 17:00:00','Hải sản tươi sống rất ngon ở biển Cần giờ','hien@gmail.com'),(14,'Đầu tuần học bài và làm việc thì ghé Here Coffee , không gian yên tĩnh nhẹ nhàng thích hợp học tập và làm việc lắm nha. Ánh đèn vàng mang cảm giác tập trung và ấm áp hòa cũng tiếng nhạc du dương. ??',3256,'Here Coffee',7,'78 Bùi Viện','TPHCM',NULL,NULL,'Cộng đồng','Chưa','2020-03-20 17:00:00','Quán này chill phết','thuha2@gmail.com'),(15,'Toạ lạc ngay trung tâm mua sắm sầm uất quận Bình Thạnh, bên cạnh Pearl Plaza, The Chu’s Coffee mang không gian ấm áp hiện đại cùng với menu thức uống nguyên chất thơm ngon đều ở tất cả các món, là một địa điểm dễ tìm và phù hợp cho bạn nào có nhu cầu thư giản và làm việc.',567,'Chu’s Coffee',8,' 561 Điện Biên Phủ, Phường 25, Quận Bình Thạnh','TPHCM',' 7:am - 21:pm',NULL,'Cộng đồng','Chưa','2019-11-30 17:00:00','THE CHU’S COFFEE CHẤT CHILL HIỆN ĐẠI','thuha2@gmail.com'),(16,'Là thương hiệu cafe được hơn 2 triệu tín đồ cà phê toàn cầu bình chọn trong danh sách 50 quán hàng đầu châu Á, Là Việt mang cho khách hàng nhiều sự kết hợp của cafe với các sản vật đặc trưng của nhiều vùng miền, đem lại sự mới lạ cho các tín đồ cafe',6526,'Là Việt Coffee Saigon',8,'57A Tú Xương, Phường 7, Quận 3','TPHCM','7:00 - 22:00 (Mon - Sun).',NULL,'Cộng đồng','Chưa','2020-02-13 17:00:00','ĐẾN LÀ VIỆT UỐNG CAFE VIỆT NÀO!','hien@gmail.com'),(21,'-Nửa đêm thèm cơm tấm thì ra đây ngay nha. Cơm tấm thơm mùi lá dứa, thịt sườn nguyên miếng to nêm nếm vừa ăn nướng vừa tới không bị khô, trứng lòng đào béo ơi là béo, chả trứng ngon . Nước mắm chua ngọt cay cay ăn đã lắm. Giá cơm tấm là 45k cho một dĩa đầy đủ, có canh khổ qua nhồi thịt 25k nữa',5454,'Cơm Tấm đêm CuBo',7,'122 Nguyễn Cư Trinh, Phường Nguyễn Cư Trinh, Quận 1','TPHCM','18h-nửa đêm','45k ','Cộng đồng','Chưa','2019-05-10 17:00:00','Cơm Tấm đêm CuBo','nobita@gmail.com'),(22,'Mình lúa thật. Quán rất nổi tiếng ở quận 10. Vậy mà nay bạn dẫn đến mới biết á ?',545,'Há cảo Ngọc Lan',7,'500 Vĩnh Viễn quận 10','TPHCM',NULL,'30k','Cộng đồng','Chưa','2019-06-10 17:00:00','ĂN HÁ CẢO NGỌC LAN Q10 VÀ NGHE ANH TÍNH TIỀN BẮN RAP','xuka@gmail.com'),(23,'Bữa bạn rủ đi qua con đường ăn vặt Hồ Thị Kỷ. Lần đầu ghé nên thấy bất ngờ với độ nhộn nhịp nơi đây. Từ đầu đến cuối hẻm là đủ loại xe đẩy đồ ăn luôn. Nào là hủ tiếu xào Thái (pad Thái), xiên que, trà sữa, mooping Thái ( mình ăn bên Thái rồi, thấy chỗ này làm cũng ngon mà mùi vị hổng giống).',455,'Mr.Pad Thái',8,'87/27 Hồ Thị Kỷ, Phường 1, Quận 10 ','TPHCM',NULL,NULL,'Cộng đồng','Chưa','2019-06-21 17:00:00','CON ĐƯỜNG ĂN VẶT GIỐNG HỆT THÁI LAN','xuka@gmail.com'),(24,'Tình cờ biết đến SITOOTERIE và từ đó trở đi quán sẽ trở thành quán yêu thích của mình luôn ^^.',4545,'sitooterie - coffee & stories',9,'35, 2 Đường Khởi Nghĩa Bắc Sơn, Phường 10','Đà Lạt',NULL,NULL,'Cộng đồng','Chưa','2020-01-14 17:00:00','CÀ PHÊ Ở ĐÀ LẠT','nobita@gmail.com'),(25,'- Về chất lượng: bọn mình gọi 1 sữa đậu phộng giá là 10K, 1 sữa đậu xanh giá là 10K và 1 sữa mè đen giá là 11K. Sữa đâu phông thơm lắm, ngậy ngậy béo béo uống 1 cốc sữa đậu phộng nóng vào buổi tối trong cái thời tiết se se lạnh ở Đà Lạt đúng đỉnh luôn ạ :(((, sữa đậu xanh thì với mình hơi ngọt xíu.',2657,'Quán hoa sữa',9,'64 Tăng Bạt Hổ','Đà Lạt','16h - 22h','5,000đ - 20,000đ','Cộng đông','Chưa','2019-05-25 17:00:00','QUÁN HOA SỮA - TĂNG BẠT HỔ - ĐÀ LẠT','nobita@gmail.com'),(26,'Là người cực thích nộm mà tìm được quán này lúc lạc đường thì cũng may mắn phết ? Ăn 1 lần xong mình ăn mãi luôn',6554,'Nộm Nguyệt',8,'19 Hàm Long','Hà Nội','10h sáng- 7h30 tối','40k-70k/người','Cộng đồng','Chưa','2019-01-15 17:00:00','Hàng nộm ? điểm mình tìm ra lúc lạc đường','doremon@gmail.com'),(27,'Check in Aeon mall Hà Đông mng đã thử chưa ạ!!',6534,'Aeon Mall Hà Đông',7,'Khu dân cư Hoàng Văn Thụ, Quận Hà Đông','Hà Nội',NULL,NULL,'Cộng đồng','Chưa','2020-05-22 17:00:00','Aeon Mall Hà Đông','doremon@gmail.com'),(28,'- Đồ uống : 38k - 80k ( có bánh ngọt , trà , cocktail )    Mình là cái đứa thích đi lượn lờ , nhất là trên khu hồ Tây. Thỉnh thoảng ngó nghiêng xem có quán cafe nào ổn áp không để tiện review cho mọi người thì may quá , đúng hôm tớ đi tớ đã tia được một quán cafe outdoor mới mở nên ghé vào luôn',365,'ROSETTA KAFE & CHILL',8,'158 Xuân Diệu, Phường Quảng An, Quận Hồ Tây','Hà Nội',NULL,'38k - 80k','Cộng đồng','Chưa','2020-11-11 17:00:00',' QUÁN CAFE OUTDOOR MỚI TOANH Ở HỒ TÂY','doremon@gmail.com');
/*!40000 ALTER TABLE `tbl_baiviet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_baivietyeuthich`
--

DROP TABLE IF EXISTS `tbl_baivietyeuthich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_baivietyeuthich` (
  `Idbaivietyeuthich` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) DEFAULT NULL,
  `Idbaiviet` int DEFAULT NULL,
  PRIMARY KEY (`Idbaivietyeuthich`),
  KEY `fk_Email_Baivietyeuthich` (`Email`),
  KEY `fk_Idbaiviet_Baivietyeuthich` (`Idbaiviet`),
  CONSTRAINT `fk_Email_Baivietyeuthich` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`),
  CONSTRAINT `fk_Idbaiviet_Baivietyeuthich` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baivietyeuthich`
--

LOCK TABLES `tbl_baivietyeuthich` WRITE;
/*!40000 ALTER TABLE `tbl_baivietyeuthich` DISABLE KEYS */;
INSERT INTO `tbl_baivietyeuthich` VALUES (12,'tuan@gmail.com',13);
/*!40000 ALTER TABLE `tbl_baivietyeuthich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_baocaobaiviet`
--

DROP TABLE IF EXISTS `tbl_baocaobaiviet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_baocaobaiviet` (
  `Idbaocao` int NOT NULL AUTO_INCREMENT,
  `Loibaocao` text NOT NULL,
  `Ngaygui` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Idbaiviet` int DEFAULT NULL,
  PRIMARY KEY (`Idbaocao`),
  KEY `fk_Email_Baocao` (`Email`),
  KEY `fk_Idbaiviet_Baocao` (`Idbaiviet`),
  CONSTRAINT `fk_Email_Baocao` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`),
  CONSTRAINT `fk_Idbaiviet_Baocao` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baocaobaiviet`
--

LOCK TABLES `tbl_baocaobaiviet` WRITE;
/*!40000 ALTER TABLE `tbl_baocaobaiviet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_baocaobaiviet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_binhluan`
--

DROP TABLE IF EXISTS `tbl_binhluan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_binhluan` (
  `Idbinhluan` int NOT NULL AUTO_INCREMENT,
  `Noidung` text NOT NULL,
  `Ngaybinhluan` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Idbaiviet` int DEFAULT NULL,
  PRIMARY KEY (`Idbinhluan`),
  KEY `fk_Email_Binhluan` (`Email`),
  KEY `fk_Idbaiviet_Binhluan` (`Idbaiviet`),
  CONSTRAINT `fk_Email_Binhluan` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`),
  CONSTRAINT `fk_Idbaiviet_Binhluan` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_binhluan`
--

LOCK TABLES `tbl_binhluan` WRITE;
/*!40000 ALTER TABLE `tbl_binhluan` DISABLE KEYS */;
INSERT INTO `tbl_binhluan` VALUES (1,'Món ăn rất ngon','2020-11-04 17:00:00','tuan@gmail.com',11),(2,'Không gian quán khá đẹp, nước uống cũng tạm ổn, nhưng thái độ phục vụ của nhân viên chưa được như kỳ vọng của mình ','2020-11-25 17:00:00','thuha2@gmail.com',11),(3,'Hôm trước có đi ngang qua thấy quán khá đông mà mình lại đang bận nên vẫn chưa được thử. Đọc bài review này mình sẽ cố ghé lại','2020-01-04 17:00:00','tuan@gmail.com',12);
/*!40000 ALTER TABLE `tbl_binhluan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_chitietkehoach`
--

DROP TABLE IF EXISTS `tbl_chitietkehoach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_chitietkehoach` (
  `Idchitietkehoach` int NOT NULL AUTO_INCREMENT,
  `Hoatdong` varchar(255) NOT NULL,
  `Trangthai` varchar(100) DEFAULT NULL,
  `Ngaydutinhthuchien` date DEFAULT NULL,
  `Diachi` varchar(255) NOT NULL,
  `Idkehoachkhampha` int DEFAULT NULL,
  PRIMARY KEY (`Idchitietkehoach`),
  KEY `fk_Idkehoachkhampha` (`Idkehoachkhampha`),
  CONSTRAINT `fk_Idkehoachkhampha` FOREIGN KEY (`Idkehoachkhampha`) REFERENCES `tbl_kehoachkhampha` (`Idkehoachkhampha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_chitietkehoach`
--

LOCK TABLES `tbl_chitietkehoach` WRITE;
/*!40000 ALTER TABLE `tbl_chitietkehoach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_chitietkehoach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hinhanh`
--

DROP TABLE IF EXISTS `tbl_hinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hinhanh` (
  `Idhinhanh` int NOT NULL AUTO_INCREMENT,
  `Duongdan` varchar(255) NOT NULL,
  `Idbaiviet` int DEFAULT NULL,
  PRIMARY KEY (`Idhinhanh`),
  KEY `fk_Idbaiviet_Hinhanh` (`Idbaiviet`),
  CONSTRAINT `fk_Idbaiviet_Hinhanh` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hinhanh`
--

LOCK TABLES `tbl_hinhanh` WRITE;
/*!40000 ALTER TABLE `tbl_hinhanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_hinhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_kehoachkhampha`
--

DROP TABLE IF EXISTS `tbl_kehoachkhampha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_kehoachkhampha` (
  `Idkehoachkhampha` int NOT NULL AUTO_INCREMENT,
  `Tenkehoach` text,
  `Diadiem` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idkehoachkhampha`),
  KEY `fk_Email_Kehoachkhampha` (`Email`),
  CONSTRAINT `fk_Email_Kehoachkhampha` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kehoachkhampha`
--

LOCK TABLES `tbl_kehoachkhampha` WRITE;
/*!40000 ALTER TABLE `tbl_kehoachkhampha` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_kehoachkhampha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_taikhoan`
--

DROP TABLE IF EXISTS `tbl_taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_taikhoan` (
  `Email` varchar(255) NOT NULL,
  `Matkhau` varchar(255) DEFAULT NULL,
  `Tenhienthi` varchar(255) NOT NULL,
  `Ngaysinh` date DEFAULT NULL,
  `Gioitinh` varchar(30) DEFAULT NULL,
  `Congviec` varchar(255) DEFAULT NULL,
  `Ngaytaotaikhoan` timestamp NULL DEFAULT NULL,
  `Hinhdaidien` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_taikhoan`
--

LOCK TABLES `tbl_taikhoan` WRITE;
/*!40000 ALTER TABLE `tbl_taikhoan` DISABLE KEYS */;
INSERT INTO `tbl_taikhoan` VALUES ('doremon@gmail.com','123456','Bé Mon','1999-06-02','Nữ','Sinh viên',NULL,NULL),('hien@gmail.com','123','hien','2000-02-15','Nam','Sinh viên',NULL,NULL),('nobita@gmail.com','123456','Nobita','2002-12-05','Nam','Sinh viên',NULL,NULL),('thuha2@gmail.com','1234','thu hà','1999-01-05','Nữ','Nhân viên văn phòng',NULL,NULL),('tuan@gmail.com','12345','tuấn','1999-05-01','Nam','Nhân viên văn phòng',NULL,NULL),('xuka@gmail.com','123456','Xuka','2003-12-05','Nữ','Học sinh',NULL,NULL);
/*!40000 ALTER TABLE `tbl_taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_taikhoantheodoi`
--

DROP TABLE IF EXISTS `tbl_taikhoantheodoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_taikhoantheodoi` (
  `Idtaikhoantheodoi` int NOT NULL AUTO_INCREMENT,
  `Emailtheodoi` varchar(255) NOT NULL,
  `Ngaybatdautheodoi` timestamp NULL DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idtaikhoantheodoi`),
  KEY `fk_Email_Taikhoantheodoi` (`Email`),
  CONSTRAINT `fk_Email_Taikhoantheodoi` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_taikhoantheodoi`
--

LOCK TABLES `tbl_taikhoantheodoi` WRITE;
/*!40000 ALTER TABLE `tbl_taikhoantheodoi` DISABLE KEYS */;
INSERT INTO `tbl_taikhoantheodoi` VALUES (4,'hien@gmail.com','2020-09-11 17:00:00','tuan@gmail.com'),(5,'thuha2@gmail.com','2020-06-29 17:00:00','tuan@gmail.com'),(6,'hien@gmail.com','2020-05-21 17:00:00','thuha2@gmail.com');
/*!40000 ALTER TABLE `tbl_taikhoantheodoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_thongbao`
--

DROP TABLE IF EXISTS `tbl_thongbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_thongbao` (
  `Idthongbao` int NOT NULL AUTO_INCREMENT,
  `Noidung` text,
  `Trangthai` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Idbaiviet` int DEFAULT NULL,
  PRIMARY KEY (`Idthongbao`),
  KEY `fk_Email_Thongbao` (`Email`),
  KEY `fk_Idbaiviet_Thongbao` (`Idbaiviet`),
  CONSTRAINT `fk_Email_Thongbao` FOREIGN KEY (`Email`) REFERENCES `tbl_taikhoan` (`Email`),
  CONSTRAINT `fk_Idbaiviet_Thongbao` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_thongbao`
--

LOCK TABLES `tbl_thongbao` WRITE;
/*!40000 ALTER TABLE `tbl_thongbao` DISABLE KEYS */;
INSERT INTO `tbl_thongbao` VALUES (5,'Bạn có thông báo mới từ thuha2@gmail.com','Chưa xem','tuan@gmail.com',14),(6,'Bạn có thông báo mới từ thuha2@gmail.com','Chưa xem','tuan@gmail.com',15),(7,'Bạn có thông báo mới từ hien@gmail.com','Chưa xem','tuan@gmail.com',16),(8,'Bạn có thông báo mới từ hien@gmail.com','Chưa xem','thuha2@gmail.com',16);
/*!40000 ALTER TABLE `tbl_thongbao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 14:51:58
