CREATE DATABASE `webdata5`;
USE `webdata5`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

INSERT INTO `user` (`id`, `username`, `password`, `email`, `phone`, `address`, `fullname`, `level`, `add_date`) VALUES(1, 'admin', '96e79218965eb72c92a549dd5a330112', 'admin@gmail.com', 123456789, 'quận 3, tphcm', 'Nguyễn Văn A', 1, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `email`, `phone`, `address`, `fullname`, `level`, `add_date`) VALUES(2, 'hoangyen107', '96e79218965eb72c92a549dd5a330112', 'thanhyen107@gmail.com', 123456789, 'quáº­n 3', 'yenhoang', 1, NULL);

CREATE TABLE `category` (
  `categoryID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (1,'Sony');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (2,'iPhone');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (3,'Samsung');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (4,'Asus');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (5,'Oppo');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (6,'HTC');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (7,'Nokia');
INSERT INTO `category`(`categoryID`, `categoryName`) VALUES (8,'Lenovo');


CREATE TABLE `product` (
  `productID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `price` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryID` int(11) unsigned NOT NULL,
  `dateupdate` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soluonghientai` int(11) NOT NULL DEFAULT '0',
  `soluongconlai` int(11) NOT NULL DEFAULT '0',
  `soluongbanduoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`categoryID`)
  REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product` (`productID`, `productName`, `description`, `price`, `discount`, `image`, `categoryID`, `dateupdate`, `soluonghientai`, `soluongconlai`, `soluongbanduoc`) VALUES 
(1, 'SONY M4 AQUAL', 'thiet ke hop thoi trang nhieu mau sac', 8000000, 500000, 'sony.jpg', 1, NULL, 30, 30, NULL);


CREATE TABLE `image` (
  `imageID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imageName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productID` int(11) unsigned NOT NULL,
  `choose` tinyint(1) DEFAULT NULL, 
  PRIMARY KEY (`imageID`),
  CONSTRAINT `fk_image_product` FOREIGN KEY (`productID`)
  REFERENCES `product` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `image` (`imageID`, `imageName`, `url`, `productID`, `choose`) VALUES (1, 'SONY', 'samsung1.jpg', 1, 1);
INSERT INTO `image` (`imageID`, `imageName`, `url`, `productID`, `choose`) VALUES (2, 'SONY', 'sony.png', 1, 1);
CREATE TABLE `ThongSo` (
  `thongsoID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(11) unsigned NOT NULL,
  `manhinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HDD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CMRTruoc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `CMRSau` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `RAM` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ROM` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `thesim` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `dungluongPIN` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`thongsoID`),
  CONSTRAINT `fk_thongso_product` FOREIGN KEY (`productID`)
  REFERENCES `product` (`productID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ThongSo` (`thongsoID`, `productID`, `manhinh`, `HDD`, `CMRTruoc`, `CMRSau`, `RAM`, `ROM`, `thesim`, `dungluongPIN`)
VALUES (1, 1, '4.5 INCH FULL HD', 'YES', '8.0 pixel', '5.0 pixel', '4GB', '8GB', '2 khe', '4800 mA');

CREATE TABLE `comment` (
  `commentID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `productID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`commentID`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `comment` (`commentID`, `content`, `userID`, `productID`) VALUES (1, "sản phẩm chất lượng tốt, giá cả phải chăng", 1, 1);

CREATE TABLE `contact` (
  `contactID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`contactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `contact` (`contactID`, `title`, `content`) VALUES (1, "đánh giá sản phẩm","sản phẩm tốt chất lượng tốt, dễ dàng đặt hàng");

CREATE TABLE `orders` (
  `idOther` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_buy` varchar(20) DEFAULT NULL,
  `total` int(11) NOT NULL ,
  PRIMARY KEY (`idOther`)
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE `productorders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(11) unsigned NOT NULL,
  `idOther` int(11) unsigned NOT NULL ,
  `amount` int(11) NOT NULL ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orders_product` FOREIGN KEY (`productID`)
  REFERENCES `product` (`productID`),
  CONSTRAINT `fk_orders` FOREIGN KEY (`idOther`)
  REFERENCES `orders` (`idOther`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;