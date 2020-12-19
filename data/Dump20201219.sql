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
  `soluotthich` int DEFAULT NULL,
  `hinhmacdinh` varchar(255) DEFAULT NULL,
  `Tentaikhoan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idbaiviet`),
  KEY `fk_Tentaikhoan_Baiviet` (`Tentaikhoan`),
  CONSTRAINT `fk_Tentaikhoan_Baiviet` FOREIGN KEY (`Tentaikhoan`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baiviet`
--

LOCK TABLES `tbl_baiviet` WRITE;
/*!40000 ALTER TABLE `tbl_baiviet` DISABLE KEYS */;
INSERT INTO `tbl_baiviet` VALUES (11,'Điều đầu tiên mình ấn tượng nơi này là không gian quá thích. Nằm trong một con hẻm nhỏ nhưng khi đến đây Map sẽ tạo cho bạn một không gian thoải mái nhất, bình yên nhất Sài Gòn. Menu nước đa dạng, bao gồm cái món cà phê, trà, Mình thích nhất dalgona coffee rất hợp khẩu vị của mình, mà giá chỉ 45k, ngoài ra bạn nên thử trà hoa cúc liên tử nhé, đây cũng là món đặt trưng của quán, giá dao động cũng từ 45k thôi. Đến để có nhiều bức ảnh sống ảo nhé các bạn.',101,'Mapiness Coffee',9,'345/3 Nguyễn Đình Chiểu, P. 5, Quận 3, TP. HCM','TP. HCM','8h30 đến 22h','30k đến 50k','Cộng đồng','Chưa','2020-01-10 17:00:00','Mapiness Coffee',NULL,NULL,'hien'),(12,'Một trong những con hẻm nổi tiếng về bán đồ ăn vặt ở Sài Gòn, đó chính là hẻm 76 Hai Bà Trưng. Khi bước vào sẽ bạn hít được rất nhiều mùi vị của món ăn xộc vào mũi: nào là bắp xào bơ, chân gà ngâm sả tắc, các loại ốc xào, phá lấu,.',1455,'Hẻm đồ ăn vặt',8,'76 Hai Bà Trưng ,Q1, TPHCM','TP.HCM','14h đến 23h',NULL,'Cộng đồng','Chưa','2019-12-10 17:00:00','Hẻm đồ ăn nên thử ở sài gòn',NULL,NULL,'thuha'),(13,'? Trước khi ghé Hàng Dương mua đồ hải sản ăn trưa thì chúng mình có ghé Đảo Khỉ thăm khỉ nè (Khỉ dạn người và rất hung dữ - chú ý vật dụng cầm tay bánh trái chai nước, điện thoại, ...) view trong khu đảo khỉ khá deap nhe... các bạn thích tạo dáng tha hồ feel luôn. Đi sâu vào trong thì không còn khỉ nữa nên không sợ đâu.',256,'Hải sản Hàng Dương',10,'Chợ Hàng Dương','Cần Giờ',NULL,NULL,'Cộng đồng','Chưa','2020-10-04 17:00:00','Hải sản tươi sống rất ngon ở biển Cần giờ',NULL,NULL,'hien'),(14,'Đầu tuần học bài và làm việc thì ghé Here Coffee , không gian yên tĩnh nhẹ nhàng thích hợp học tập và làm việc lắm nha. Ánh đèn vàng mang cảm giác tập trung và ấm áp hòa cũng tiếng nhạc du dương. ??',3256,'Here Coffee',7,'78 Bùi Viện','TPHCM',NULL,NULL,'Cộng đồng','Chưa','2020-03-20 17:00:00','Quán này chill phết',NULL,NULL,'thuha'),(15,'Toạ lạc ngay trung tâm mua sắm sầm uất quận Bình Thạnh, bên cạnh Pearl Plaza, The Chu’s Coffee mang không gian ấm áp hiện đại cùng với menu thức uống nguyên chất thơm ngon đều ở tất cả các món, là một địa điểm dễ tìm và phù hợp cho bạn nào có nhu cầu thư giản và làm việc.',567,'Chu’s Coffee',8,' 561 Điện Biên Phủ, Phường 25, Quận Bình Thạnh','TPHCM',' 7:am - 21:pm',NULL,'Cộng đồng','Chưa','2019-11-30 17:00:00','THE CHU’S COFFEE CHẤT CHILL HIỆN ĐẠI',NULL,NULL,'thuha'),(16,'Là thương hiệu cafe được hơn 2 triệu tín đồ cà phê toàn cầu bình chọn trong danh sách 50 quán hàng đầu châu Á, Là Việt mang cho khách hàng nhiều sự kết hợp của cafe với các sản vật đặc trưng của nhiều vùng miền, đem lại sự mới lạ cho các tín đồ cafe',6526,'Là Việt Coffee Saigon',8,'57A Tú Xương, Phường 7, Quận 3','TPHCM','7:00 - 22:00 (Mon - Sun).',NULL,'Cộng đồng','Chưa','2020-02-13 17:00:00','ĐẾN LÀ VIỆT UỐNG CAFE VIỆT NÀO!',NULL,NULL,'hien'),(21,'-Nửa đêm thèm cơm tấm thì ra đây ngay nha. Cơm tấm thơm mùi lá dứa, thịt sườn nguyên miếng to nêm nếm vừa ăn nướng vừa tới không bị khô, trứng lòng đào béo ơi là béo, chả trứng ngon . Nước mắm chua ngọt cay cay ăn đã lắm. Giá cơm tấm là 45k cho một dĩa đầy đủ, có canh khổ qua nhồi thịt 25k nữa',5454,'Cơm Tấm đêm CuBo',7,'122 Nguyễn Cư Trinh, Phường Nguyễn Cư Trinh, Quận 1','TPHCM','18h-nửa đêm','45k ','Cộng đồng','Chưa','2019-05-10 17:00:00','Cơm Tấm đêm CuBo',NULL,NULL,'nobita'),(22,'Mình lúa thật. Quán rất nổi tiếng ở quận 10. Vậy mà nay bạn dẫn đến mới biết á ?',545,'Há cảo Ngọc Lan',7,'500 Vĩnh Viễn quận 10','TPHCM',NULL,'30k','Cộng đồng','Chưa','2019-06-10 17:00:00','ĂN HÁ CẢO NGỌC LAN Q10 VÀ NGHE ANH TÍNH TIỀN BẮN RAP',NULL,NULL,'xuka'),(23,'Bữa bạn rủ đi qua con đường ăn vặt Hồ Thị Kỷ. Lần đầu ghé nên thấy bất ngờ với độ nhộn nhịp nơi đây. Từ đầu đến cuối hẻm là đủ loại xe đẩy đồ ăn luôn. Nào là hủ tiếu xào Thái (pad Thái), xiên que, trà sữa, mooping Thái ( mình ăn bên Thái rồi, thấy chỗ này làm cũng ngon mà mùi vị hổng giống).',455,'Mr.Pad Thái',8,'87/27 Hồ Thị Kỷ, Phường 1, Quận 10 ','TPHCM',NULL,NULL,'Cộng đồng','Chưa','2019-06-21 17:00:00','CON ĐƯỜNG ĂN VẶT GIỐNG HỆT THÁI LAN',NULL,NULL,'xuka'),(24,'Tình cờ biết đến SITOOTERIE và từ đó trở đi quán sẽ trở thành quán yêu thích của mình luôn ^^.',4545,'sitooterie - coffee & stories',9,'35, 2 Đường Khởi Nghĩa Bắc Sơn, Phường 10','Đà Lạt',NULL,NULL,'Cộng đồng','Chưa','2020-01-14 17:00:00','CÀ PHÊ Ở ĐÀ LẠT',NULL,NULL,'nobita'),(25,'- Về chất lượng: bọn mình gọi 1 sữa đậu phộng giá là 10K, 1 sữa đậu xanh giá là 10K và 1 sữa mè đen giá là 11K. Sữa đâu phông thơm lắm, ngậy ngậy béo béo uống 1 cốc sữa đậu phộng nóng vào buổi tối trong cái thời tiết se se lạnh ở Đà Lạt đúng đỉnh luôn ạ :(((, sữa đậu xanh thì với mình hơi ngọt xíu.',2657,'Quán hoa sữa',9,'64 Tăng Bạt Hổ','Đà Lạt','16h - 22h','5,000đ - 20,000đ','Cộng đông','Chưa','2019-05-25 17:00:00','QUÁN HOA SỮA - TĂNG BẠT HỔ - ĐÀ LẠT',NULL,NULL,'nobita'),(26,'Là người cực thích nộm mà tìm được quán này lúc lạc đường thì cũng may mắn phết ? Ăn 1 lần xong mình ăn mãi luôn',6554,'Nộm Nguyệt',8,'19 Hàm Long','Hà Nội','10h sáng- 7h30 tối','40k-70k/người','Cộng đồng','Chưa','2019-01-15 17:00:00','Hàng nộm ? điểm mình tìm ra lúc lạc đường',NULL,NULL,'Doraemon'),(27,'Check in Aeon mall Hà Đông mng đã thử chưa ạ!!',6534,'Aeon Mall Hà Đông',7,'Khu dân cư Hoàng Văn Thụ, Quận Hà Đông','Hà Nội',NULL,NULL,'Cộng đồng','Chưa','2020-05-22 17:00:00','Aeon Mall Hà Đông',NULL,NULL,'Doraemon'),(28,'- Đồ uống : 38k - 80k ( có bánh ngọt , trà , cocktail )    Mình là cái đứa thích đi lượn lờ , nhất là trên khu hồ Tây. Thỉnh thoảng ngó nghiêng xem có quán cafe nào ổn áp không để tiện review cho mọi người thì may quá , đúng hôm tớ đi tớ đã tia được một quán cafe outdoor mới mở nên ghé vào luôn',365,'ROSETTA KAFE & CHILL',8,'158 Xuân Diệu, Phường Quảng An, Quận Hồ Tây','Hà Nội',NULL,'38k - 80k','Cộng đồng','Chưa','2020-11-11 17:00:00',' QUÁN CAFE OUTDOOR MỚI TOANH Ở HỒ TÂY',NULL,NULL,'Doraemon');
/*!40000 ALTER TABLE `tbl_baiviet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_after_insert_baiviet` AFTER INSERT ON `tbl_baiviet` FOR EACH ROW begin
	declare Noidung text;
    declare Email varchar(255);
    declare sl int;
    declare Trangthai varchar(100);
    set Trangthai ='Chưa xem';
    select concat(new.Email, ' vừa đăng bài viết mới') into Noidung ;
    select count(Email) from tbl_Taikhoantheodoi where Emailtheodoi = new.Email into sl;
    /*while(sl>0) do
		select Email from tbl_Taikhoantheodoi where Emailtheodoi= new.Email into Email;
		insert into tbl_Thongbao(Noidung,Trangthai,Email,Idbaiviet) values (Noidung,Trangthai,Email,new.Idbaiviet);
        set sl= sl-1;
	end while;*/
    insert into tbl_Thongbao(Noidung,Trangthai,Email,Idbaiviet) 
    select concat('Bạn có thông báo mới từ ', new.Email),'Chưa xem',tbl_Taikhoantheodoi.Email,new.Idbaiviet 
    from tbl_Taikhoantheodoi where Emailtheodoi= new.Email;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_baivietyeuthich`
--

DROP TABLE IF EXISTS `tbl_baivietyeuthich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_baivietyeuthich` (
  `Idbaivietyeuthich` int NOT NULL AUTO_INCREMENT,
  `Idbaiviet` int DEFAULT NULL,
  `Tentaikhoan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idbaivietyeuthich`),
  KEY `fk_Idbaiviet_Baivietyeuthich` (`Idbaiviet`),
  KEY `fk_Tentaikhoan_Baivietyeuthich` (`Tentaikhoan`),
  CONSTRAINT `fk_Idbaiviet_Baivietyeuthich` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`),
  CONSTRAINT `fk_Tentaikhoan_Baivietyeuthich` FOREIGN KEY (`Tentaikhoan`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baivietyeuthich`
--

LOCK TABLES `tbl_baivietyeuthich` WRITE;
/*!40000 ALTER TABLE `tbl_baivietyeuthich` DISABLE KEYS */;
INSERT INTO `tbl_baivietyeuthich` VALUES (12,13,'tuan'),(18,14,'tuan'),(19,15,'tuan'),(20,21,'hien'),(21,22,'hien'),(22,25,'thuha');
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
  `Idbaiviet` int DEFAULT NULL,
  `Tentaikhoan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idbinhluan`),
  KEY `fk_Idbaiviet_Binhluan` (`Idbaiviet`),
  KEY `fk_Tentaikhoan_Binhluan` (`Tentaikhoan`),
  CONSTRAINT `fk_Idbaiviet_Binhluan` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`),
  CONSTRAINT `fk_Tentaikhoan_Binhluan` FOREIGN KEY (`Tentaikhoan`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_binhluan`
--

LOCK TABLES `tbl_binhluan` WRITE;
/*!40000 ALTER TABLE `tbl_binhluan` DISABLE KEYS */;
INSERT INTO `tbl_binhluan` VALUES (1,'Món ăn rất ngon','2020-11-04 17:00:00',11,'tuan'),(2,'Không gian quán khá đẹp, nước uống cũng tạm ổn, nhưng thái độ phục vụ của nhân viên chưa được như kỳ vọng của mình ','2020-11-25 17:00:00',11,'thuha'),(3,'Hôm trước có đi ngang qua thấy quán khá đông mà mình lại đang bận nên vẫn chưa được thử. Đọc bài review này mình sẽ cố ghé lại','2020-01-04 17:00:00',12,'xuka');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_chitietkehoach`
--

LOCK TABLES `tbl_chitietkehoach` WRITE;
/*!40000 ALTER TABLE `tbl_chitietkehoach` DISABLE KEYS */;
INSERT INTO `tbl_chitietkehoach` VALUES (4,'Bánh căn','Chưa xong','2021-01-12','64 Tăng Bạt Hổ',1),(5,'Tiệm bánh cối xoay gió','Chưa xong','2021-01-13','45 Ba tháng Hai',1),(6,'Thác Datala','Chưa xong','2021-01-13','Thác Datala',1),(7,'Cầu Rồng','Xong','2020-01-13','Cầu Rồng',2),(8,'Mì Quảng Bà Dú','Xong','2020-01-14','95 Núi Thành',2),(9,'Cà phê sitooterie - coffee & stories','Xong','2019-05-25','35, 2 Đường Khởi Nghĩa Bắc Sơn, Phường 10',3),(10,'Quán Hoa Sữa','Xong','2019-05-26','64 Tăng Bạt Hổ',3),(11,'Đi ăn Nộm Nguyệt','Xong','2019-05-11','19 Hàm Long',4),(12,'Đi cà phê Chiil','Xong','2019-05-12','158 Xuân Diệu, Phường Quảng An, Quận Hồ Tây',4);
/*!40000 ALTER TABLE `tbl_chitietkehoach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hashtag`
--

DROP TABLE IF EXISTS `tbl_hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hashtag` (
  `Idtag` int NOT NULL AUTO_INCREMENT,
  `Tentag` text NOT NULL,
  PRIMARY KEY (`Idtag`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hashtag`
--

LOCK TABLES `tbl_hashtag` WRITE;
/*!40000 ALTER TABLE `tbl_hashtag` DISABLE KEYS */;
INSERT INTO `tbl_hashtag` VALUES (1,'banh_mi'),(2,'banh_trang_tron'),(3,'banh_canh_cua'),(4,'tra_sua'),(5,'ca_phe'),(6,'com_tam');
/*!40000 ALTER TABLE `tbl_hashtag` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hinhanh`
--

LOCK TABLES `tbl_hinhanh` WRITE;
/*!40000 ALTER TABLE `tbl_hinhanh` DISABLE KEYS */;
INSERT INTO `tbl_hinhanh` VALUES (1,'image/amthuc1.jpg',11),(2,'image/amthuc1.jpg',11),(3,'image/amthuc1.jpg',12);
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
  `Tentaikhoan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Idkehoachkhampha`),
  KEY `fk_Tentaikhoan_Kehoachkhampha` (`Tentaikhoan`),
  CONSTRAINT `fk_Tentaikhoan_Kehoachkhampha` FOREIGN KEY (`Tentaikhoan`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kehoachkhampha`
--

LOCK TABLES `tbl_kehoachkhampha` WRITE;
/*!40000 ALTER TABLE `tbl_kehoachkhampha` DISABLE KEYS */;
INSERT INTO `tbl_kehoachkhampha` VALUES (1,'Đà lạt mùa lạnh','Đà lạt','hien'),(2,'Đà nẵng 2020','Đà Nẵng','hien'),(3,'Chu du Đà Lạt','Đà Lạt','thuha'),(4,'Hà Nội nào','Hà Nôi','xuka');
/*!40000 ALTER TABLE `tbl_kehoachkhampha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tagbaiviet`
--

DROP TABLE IF EXISTS `tbl_tagbaiviet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tagbaiviet` (
  `Idtag` int NOT NULL,
  `Idbaiviet` int NOT NULL,
  PRIMARY KEY (`Idtag`,`Idbaiviet`),
  KEY `Idbaiviet` (`Idbaiviet`),
  CONSTRAINT `tbl_tagbaiviet_ibfk_1` FOREIGN KEY (`Idtag`) REFERENCES `tbl_hashtag` (`Idtag`),
  CONSTRAINT `tbl_tagbaiviet_ibfk_2` FOREIGN KEY (`Idbaiviet`) REFERENCES `tbl_baiviet` (`Idbaiviet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tagbaiviet`
--

LOCK TABLES `tbl_tagbaiviet` WRITE;
/*!40000 ALTER TABLE `tbl_tagbaiviet` DISABLE KEYS */;
INSERT INTO `tbl_tagbaiviet` VALUES (5,11),(5,14),(5,15),(5,16),(6,21),(5,28);
/*!40000 ALTER TABLE `tbl_tagbaiviet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_taikhoan`
--

DROP TABLE IF EXISTS `tbl_taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_taikhoan` (
  `Email` varchar(255) NOT NULL,
  `Tentaikhoan` varchar(255) NOT NULL,
  `Matkhau` varchar(255) DEFAULT NULL,
  `Tenhienthi` varchar(255) NOT NULL,
  `Ngaysinh` date DEFAULT NULL,
  `Gioitinh` varchar(30) DEFAULT NULL,
  `Congviec` varchar(255) DEFAULT NULL,
  `Ngaytaotaikhoan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Hinhdaidien` varchar(255) DEFAULT NULL,
  `Hinhtrangchu` varchar(255) DEFAULT NULL,
  `Idtrangthai` int DEFAULT NULL,
  PRIMARY KEY (`Tentaikhoan`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Tentaikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_taikhoan`
--

LOCK TABLES `tbl_taikhoan` WRITE;
/*!40000 ALTER TABLE `tbl_taikhoan` DISABLE KEYS */;
INSERT INTO `tbl_taikhoan` VALUES ('admin2@gmail.com','124010119034','e10adc3949ba59abbe56e057f20f883e','124010119034',NULL,NULL,NULL,'2020-12-17 03:05:25',NULL,NULL,NULL),('hiennguyen30081998@gmail.com','admin','e10adc3949ba59abbe56e057f20f883e','admin',NULL,NULL,NULL,'2020-12-17 03:03:21',NULL,NULL,NULL),('dekhi@gmail.com','Dekhi','d41d8cd98f00b204e9800998ecf8427e','Dekhi',NULL,NULL,NULL,'2020-12-17 05:19:41',NULL,NULL,2),('doremon@gmail.com','Doraemon','123456','Bé Mon','1999-06-02','Nữ','Sinh viên',NULL,'user-female.png',NULL,NULL),('hien@gmail.com','hien','123','hien','2000-02-15','Nam','Sinh viên',NULL,'user-male.jpg','collection_1.jpg',NULL),('hien1234@gmail.com','hien1234','81dc9bdb52d04dc20036dbd8313ed055','hien1234',NULL,NULL,NULL,'2020-12-17 04:51:05',NULL,NULL,2),('mfd@gmail.com','Meet.Foodie','e10adc3949ba59abbe56e057f20f883e','Meet.Foodie',NULL,NULL,NULL,'2020-12-15 03:34:02','mfdDefault.png',NULL,NULL),('nobita@gmail.com','nobita','e10adc3949ba59abbe56e057f20f883e','Nobita','2002-12-05','Nam','Sinh viên',NULL,'user-male.jpg',NULL,NULL),('tam@gamil.com','tam','12345','tam',NULL,NULL,NULL,'2020-12-17 03:51:43',NULL,NULL,2),('thuha2@gmail.com','thuha','1234','thu hà','1999-01-05','Nữ','Nhân viên văn phòng',NULL,'user-female.png',NULL,NULL),('tuan@gmail.com','tuan','12345','tuấn','1999-05-01','Nam','Nhân viên văn phòng',NULL,'user-male.jpg',NULL,NULL),('tuantu@gmail.com','Tuan Tu','e10adc3949ba59abbe56e057f20f883e','Tuan Tu',NULL,NULL,NULL,'2020-12-17 05:29:42',NULL,NULL,2),('xuka@gmail.com','xuka','123456','Xuka','2003-12-05','Nữ','Học sinh',NULL,'user-female.png',NULL,NULL);
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
-- Table structure for table `tbl_theodoi`
--

DROP TABLE IF EXISTS `tbl_theodoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_theodoi` (
  `Idtheodoi` int NOT NULL AUTO_INCREMENT,
  `Taikhoan` varchar(255) NOT NULL,
  `Taikhoantheodoi` varchar(255) NOT NULL,
  PRIMARY KEY (`Idtheodoi`),
  KEY `fk_tk_theodoi_1` (`Taikhoan`),
  KEY `fk_tk_theodoi_2` (`Taikhoantheodoi`),
  CONSTRAINT `fk_tk_theodoi_1` FOREIGN KEY (`Taikhoan`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`),
  CONSTRAINT `fk_tk_theodoi_2` FOREIGN KEY (`Taikhoantheodoi`) REFERENCES `tbl_taikhoan` (`Tentaikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_theodoi`
--

LOCK TABLES `tbl_theodoi` WRITE;
/*!40000 ALTER TABLE `tbl_theodoi` DISABLE KEYS */;
INSERT INTO `tbl_theodoi` VALUES (1,'hien','Meet.Foodie'),(2,'xuka','Meet.Foodie'),(3,'hien','xuka'),(4,'Doraemon','hien'),(5,'nobita','xuka');
/*!40000 ALTER TABLE `tbl_theodoi` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_thongbao`
--

LOCK TABLES `tbl_thongbao` WRITE;
/*!40000 ALTER TABLE `tbl_thongbao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_thongbao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'reviewthucpham'
--

--
-- Dumping routines for database 'reviewthucpham'
--
/*!50003 DROP FUNCTION IF EXISTS `Fn_kiemtraDangnhap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_kiemtraDangnhap`(mail varchar(255), pass varchar(255)) RETURNS int
    READS SQL DATA
BEGIN
	declare flag int(11) default -1;
    select Idtrangthai into flag from tbl_Taikhoan where Email = mail and Matkhau = MD5(pass);
	return flag;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Fn_kiemtraEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Fn_kiemtraEmail`(mail varchar(255)) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
   return EXISTS (select * from tbl_Taikhoan where Email = mail) ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Dangky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Dangky`(in tentk varchar(255), in mail varchar(255),in mk1 varchar(255),in mk2 varchar(255),out mess int)
begin
	if(exists(select Tentaikhoan from tbl_taikhoan where Tentaikhoan=tentk))then
		select 1 into mess;
	elseif(exists(select Email from tbl_taikhoan where Email=mail))then
		select 2 into mess;
	elseif (mk1 <> mk2 )then
		select 3 into mess;
	else
		insert into tbl_taikhoan(Email,Tentaikhoan,Matkhau,Tenhienthi,Ngaytaotaikhoan,Idtrangthai)
        values (mail,tentk,mk1,tentk,current_timestamp(),2);
        select 4 into mess;
	end if;
    select mess;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Dangnhap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Dangnhap`(in Tendangnhap varchar(255), in Matkhau varchar(255),out Ketqua varchar(255))
begin
declare err varchar(255);
declare tdn varchar(255);
declare mk varchar(255);
set err='';
select Email from tbl_Taikhoan into tdn;
select Matkhau from tbl_Taikhoan into mk;
if(tdn = Tendangnhap and mk = Matkhau ) then
	set err ='Đăng nhập thành công';
else
	set err ='Sai tên đăng nhập hoặc mật khẩu';
end if;
set Ketqua = err;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_DemTheoDoi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DemTheoDoi`(
	in tk varchar(255)
)
begin
	drop temporary table if exists temp_dem_theodoi;
	create temporary table if not exists temp_dem_theodoi as (
			select 
				(SELECT count(*) FROM tbl_theodoi WHERE Taikhoan = tk) AS following,
				(SELECT count(*) FROM tbl_theodoi WHERE Taikhoantheodoi = tk) AS followers);
	select * from temp_dem_theodoi;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Laybaivietyeuthich` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Laybaivietyeuthich`(in param varchar(255))
begin
	drop temporary table if exists temp_laybaivietyeuthich;
	create temporary table if not exists temp_laybaivietyeuthich as(
	select bv.Idbaiviet,bv.Tentaikhoan,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,soluotthich 
    from tbl_baivietyeuthich bvyt, tbl_baiviet bv where bvyt.Tentaikhoan=param and bv.Idbaiviet = bvyt.Idbaiviet
);
select * from temp_laybaivietyeuthich;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Laybinhluan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Laybinhluan`(in idbv int)
begin
	drop temporary table if exists temp_laybinhluan;
	create temporary table if not exists temp_laybinhluan as(
	select *
    from tbl_binhluan where Idbaiviet = idbv
    );
select * from temp_laybinhluan;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Layhinhanh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Layhinhanh`(in idbv int)
begin
	drop temporary table if exists temp_layhinhanh;
	create temporary table if not exists temp_layhinhanh as(
	select *
    from tbl_hinhanh where Idbaiviet = idbv
    );
select * from temp_layhinhanh;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Laykehoach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Laykehoach`(in param varchar(255))
begin
	drop temporary table if exists temp_laykehoach;
	create temporary table if not exists temp_laykehoach as(
	select khkp.Idkehoachkhampha,Tenkehoach,Diadiem,Idchitietkehoach,Hoatdong,Trangthai,Ngaydutinhthuchien,Diachi from tbl_kehoachkhampha khkp, tbl_chitietkehoach ctkh 
	where khkp.IdKehoachkhampha = ctkh.IdKehoachkhampha and Tentaikhoan= param    
);
select * from temp_laykehoach;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Taokehoachamthuc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Taokehoachamthuc`(in Tenkehoach varchar(255), in Diadiem varchar(255),in Email varchar(255))
begin
	insert into tbl_Kehoachkhampha values(Tenkehoach,Diadiem,Email);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Themhoatdong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Themhoatdong`(in Hoatdong varchar(255), in Trangthai varchar(100),in Ngaydutinh date, in Diachi varchar(255), in Idkehoach int)
begin
	insert into tbl_Chitietkehoach values(Hoatdong,Trangthai,Ngaydutinh,Diachi,Idkehoach);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Timbaiviet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Timbaiviet`(in param int)
begin
	drop temporary table if exists temp_timbaiviet;
    if (param < 0) then
		create temporary table if not exists temp_timbaiviet as (select * from tbl_baiviet);
	else
		create temporary table if not exists temp_timbaiviet as (select * from tbl_baiviet where Idbaiviet = param);
	end if;
    select * from temp_timbaiviet;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_TimbaivietTheoDiaDiem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TimbaivietTheoDiaDiem`(in diadiemm varchar(255))
begin
	drop temporary table if exists temp_bvTheoDiaDiem;
	create temporary table if not exists temp_bvTheoDiaDiem as(
	select *
    from tbl_baiviet where Diadiem = diadiemm
    );
select * from temp_bvTheoDiaDiem;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_TimbaivietTheoHashtag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TimbaivietTheoHashtag`(in tag varchar(255))
begin
drop temporary table if exists temp_bvTheoHashtag;
	create temporary table if not exists temp_bvTheoHashtag as(
	select bv.Idbaiviet,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,Tentaikhoan,hinhmacdinh,soluotthich
    from tbl_baiviet bv, tbl_tagbaiviet tbv where bv.Idbaiviet= tbv.Idbaiviet and tbv.Idtag = (select Idtag from tbl_hashtag where Tentag=tag)
    );
select * from temp_bvTheoHashtag;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_TimbaivietTheoTuKhoa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_TimbaivietTheoTuKhoa`(in tukhoa varchar(255))
begin
drop temporary table if exists temp_bvTheoHashtag;
	create temporary table if not exists temp_bvTheoHashtag as(
	select bv.Idbaiviet,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,Tentaikhoan,hinhmacdinh,soluotthich
    from tbl_baiviet bv, tbl_tagbaiviet tbv where bv.Idbaiviet= tbv.Idbaiviet and tbv.Idtag = (select Idtag from tbl_hashtag where Tentag=tag)
    );
select * from temp_bvTheoHashtag;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sp_Timtaikhoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Timtaikhoan`(
	in tk varchar(255)
)
begin
	drop temporary table if exists temp_tim_taikhoan;
    if tk = '' then
		create temporary table if not exists temp_tim_taikhoan as (
			select 
				Email as email, 
				Tentaikhoan as username,
				Tenhienthi as viewname,
				Ngaysinh as birthday,
				Gioitinh as gender,
				Congviec as job,
				Ngaytaotaikhoan as createdate,
				Hinhdaidien as avatar,
				Hinhtrangchu as cover,
				Idtrangthai as userstatus
			from tbl_Taikhoan);
	else
		create temporary table if not exists temp_tim_taikhoan as (
			select 
					Email as email, 
					Tentaikhoan as username,
					Tenhienthi as viewname,
					Ngaysinh as birthday,
					Gioitinh as gender,
					Congviec as job,
					Ngaytaotaikhoan as createdate,
					Hinhdaidien as avatar,
					Hinhtrangchu as cover,
					Idtrangthai as userstatus
				from tbl_Taikhoan 
				where tk = Tentaikhoan);
	end if;
    select * from temp_tim_taikhoan;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tim_baiviet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tim_baiviet`(in param int)
begin
	drop temporary table if exists temp_tim_baiviet;
    if (param < 0) then
		create temporary table if not exists temp_tim_baiviet as (select * from tbl_baiviet);
	else
		create temporary table if not exists temp_tim_baiviet as (select * from tbl_baiviet where Idbaiviet = param);
	end if;
    select * from temp_tim_baiviet;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19  9:20:00
