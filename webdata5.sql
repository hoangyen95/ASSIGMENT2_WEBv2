-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2016 at 03:19 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdata5`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) UNSIGNED NOT NULL,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
(1, 'Sony'),
(2, 'iPhone'),
(3, 'Samsung'),
(4, 'Asus'),
(5, 'Oppo'),
(6, 'HTC'),
(7, 'Nokia'),
(8, 'Lenovo'),
(9, 'asus'),
(10, 'dell'),
(11, 'aaa'),
(12, 'bbb'),
(13, 'bbb');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentID` int(11) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userID` int(11) UNSIGNED NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `content`, `userID`, `productID`) VALUES
(3, 'ahihi', 2, 2),
(6, 'dsd', 2, 5),
(9, 'mm m \r\n', 2, 5),
(10, 'dfdsvf', 2, 3),
(11, 'hello', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactID` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactID`, `title`, `content`) VALUES
(1, 'đánh giá sản phẩm', 'sản phẩm tốt chất lượng tốt, dễ dàng đặt hàng'),
(2, 'nhan xet ', 'tot'),
(3, 'xin chÃ o ', 'ahiii'),
(4, 'xin chào', 'xin chào');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imageID` int(11) UNSIGNED NOT NULL,
  `imageName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL,
  `choose` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`imageID`, `imageName`, `url`, `productID`, `choose`) VALUES
(4, 'iPhone 7 Plus', 'apple-iphone-7-plus-1.jpg', 2, 1),
(5, 'iPhone 7 Plus', 'iphone7-plus-oro-rosa_6.jpg', 2, 1),
(6, 'SAMSUNG GALAXY J7', 'samsung-galaxy-j7-gold.jpg', 3, 1),
(7, 'SAMSUNG GALAXY J7', 'samsung-galaxy-j7-black.jpg', 3, 1),
(8, 'ASUS ZENFONE GO', 'asus-zenfone-go-red.jpg', 4, 1),
(9, 'ASUS ZENFONE GO', 'asus-zenfone-go-white.jpg', 4, 1),
(10, 'OPPO A37 NEO 9', 'oppo-a37-hero.png', 5, 1),
(11, 'OPPO A37 NEO 9', 'oppo-a371.jpg', 5, 1),
(14, 'LUMIA 730', 'xanh.jpg', 6, 1),
(15, 'LUMIA 730', 'trang1.jpg', 6, 1),
(18, 'iphone 6', 'iphone-6s-plus-64gb-bac-org-1.png', 10, 1),
(19, 'iphone 6', 'iphone-6s-plus-128gb-black-gray.jpg', 10, 1),
(26, 'dell', 'sony.jpg', 15, 1),
(27, 'dell', 'xperia-z5-premium-dual-1.jpg', 15, 1),
(28, 'demo', 'sony-xperia-m5-single-sim-vang-dong-700x467-11.jpg', 16, 1),
(29, 'demo', 'SonyXperiaXA2.jpg', 16, 1),
(46, 'Lumia 550', 'lumia.png', 18, 1),
(47, 'Lumia 550', 'xanh.jpg', 18, 1),
(48, 'Sony Xperia Z5 Dual', 'sony-xperia-z5.jpg', 1, 1),
(49, 'Sony Xperia Z5 Dual', 'SONY-XPERIA-Z5-DUAL-3.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `idOther` int(11) UNSIGNED NOT NULL,
  `fullname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_buy` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `is_customer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_pay` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idOther`, `fullname`, `email`, `phone`, `address`, `date_buy`, `total`, `is_customer`, `is_pay`) VALUES
(50, 'Trần Văn B', 'thanhyen107@gmail.com', 1234567890, 'quận 10, tp Hồ Chí Minh                        ', '25/11/2016', 33580000, '3', 'đã thanh toán'),
(51, 'Trần Văn B', 'thanhyen107@gmail.com', 1234567890, 'quận 10                        ', '25/11/2016', 5100000, '3', 'đã thanh toán'),
(52, 'Trần Văn B', 'thanhyen107sds@gmail.coms', 1234567890, 'quận 10                        ', '25/11/2016', 28290000, '3', 'đã thanh toán'),
(53, 'Trần Văn B', 'thanhyen107sds@gmail.coms', 1234567890, 'quận 10                        ', '25/11/2016', 27190000, '3', 'đang chờ xử lý'),
(54, 'Trần Văn B', 'thanhyen107sds@gmail.coms', 1234567890, 'quận 10                        ', '25/11/2016', 8800000, '3', 'đang chờ xử lý'),
(55, 'testtest', 'test@gmail.com', 123456789, 'quận 3                        ', '26/11/2016', 5100000, '6', 'đã thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) UNSIGNED NOT NULL,
  `productName` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `price` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryID` int(11) UNSIGNED NOT NULL,
  `dateupdate` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soluonghientai` int(11) NOT NULL DEFAULT '0',
  `soluongconlai` int(11) NOT NULL DEFAULT '0',
  `soluongbanduoc` int(11) DEFAULT NULL,
  `thoigian_baohanh` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `description`, `price`, `discount`, `image`, `categoryID`, `dateupdate`, `soluonghientai`, `soluongconlai`, `soluongbanduoc`, `thoigian_baohanh`) VALUES
(1, 'Sony Xperia Z5 Dual', 'Xperia Z5 Dual là smartphone chủ lực của Sony với nhiều cải tiến về công nghệ lẫn thiết kế sẽ mang lại nhiều thích thú cho bạn.\r\n\r\nCảm biến vân tay 1 chạm dễ dàng sử dụng và nhận diện nhanh chóng\r\n\r\nCảm biến vân tay một chạm trên Xperia Z5 Dual có tốc độ xử lý nhanh, nhạy giúp cho mở khóa nhanh hơn, ngoài ra cảm biến được đặt ngay vị trí rất dễ để thao tác nhanh chóng mở khóa.\r\nCamera cho tốc độ lấy nét siêu nhanh\r\n\r\nCamera trên máy được tích hợp cảm biến Exmor RS cho tốc độ lấy nét nhanh chỉ 0.03 giây, độ phân giải cao 23 MP hỗ trợ chống rung quang học, chụp thiếu sáng tốt, quay video 4K hay khả năng zoom gấp 5 lần mà không ảnh hưởng đến chất lượng ảnh quá nhiều.\r\nVới camera trước độ phân giải 5 MP vừa đủ để người dùng có những tấm hình selfie ấn tượng cùng bạn bè và người thân.\r\nCông nghệ sạc nhanh cùng tính năng siêu tiết kiệm pin\r\n\r\nSony Z5 có dung lượng pin lớn 2900 mAh đảm bảo khả năng duy trì thời gian sử dụng được nhiều hơn, ngoài ra máy còn tích hợp công nghệ sạc nhanh Quick Charge 2.0 rút ngắn thời gian sạc pin.\r\nSony Xperia Z5 Premium Dual thuộc phân khúc cấp cao với những trang bị tốt nhất và độc quyền nhất, sẽ mang đến cho bạn những trải nghiệm thú vị và thích nhất.\r\n', 11990000, 500000, 'sony-xperia-z5-dual.png', 1, '15/11/2016', 30, 30, 19, 7),
(2, 'iPhone 7 Plus', 'iPhone 7 Plus 32 GB với bộ đôi camera kép ấn tượng cùng tiêu chuẩn chống nước lần đầu tiên xuất hiện trên các thế hệ iPhone sẽ là smartphone đáng mua nhất dịp cuối năm.\r\n\r\nThiết kế quen thuộc\r\n\r\nThiết kế của chiếc iPhone 7 Plus 32 GB không có nhiều điểm khác biệt so với người anh em iPhone 6s Plus năm ngoái. Mặt lưng chính là điểm nổi bật nhất của iPhone 7 Plus 32 GB với bộ đôi camera kép lồi hẳn lên.\r\nNgoài ra thì Phím Home vật lý truyền thống trên các dòng iPhone cũng đã được Apple loại bỏ và thay vào đó là phím Home với với công nghệ cảm ứng lực giúp bạn sử dụng thiết bị thoải mái hơn mà không sợ bị liệt hay hỏng phím Home.\r\nMàn hình của máy vẫn giữ nguyên kích thước 5.5 inch độ phân giải 1080 x 1920 pixels nhưng được cải tiến về độ sáng cũng như độ tương phản mang lại trải nghiệm tốt hơn.\r\n\r\nHiệu năng hàng đầu\r\n\r\nNăm ngoái khi Apple giới thiệu con chip Apple A9 trên bộ đôi iPhone 6s và 6s Plus thì người dùng đã không khỏi bất ngờ về hiệu năng mà nó mang lại.\r\nNăm nay với con chip Apple thế hệ mới mà theo Apple công bố là sẽ cho tốc độ CPU nhanh hơn 40% và tốc độ GPU nhanh hơn 50% so với thế hệ trước thì chắc chắn iPhone 7 Plus 32 GB sẽ không làm người dùng thất vọng.\r\n\r\nKhả năng chống nước IP67\r\n\r\nLần đầu tiên trên một chiếc iPhone thì Apple đã tích hợp khả năng chống nước và chống bụi tiêu chuẩn IP67 giúp người dùng có thể thoải mái mang theo chiếc iPhone của mình xuống hồ bơi và chụp những bức hình vui vẻ.\r\nBộ đôi camera ấn tượng\r\n\r\nVới bộ đôi camera kép có cùng độ phân giải 12 MP và một trong số đó là ống kinh góc rộng và máy ảnh còn lại có tiêu cự 56 mm. Theo Apple hệ thống camera kép này cho phép zoom quang 2X mà không làm suy giảm chất lượng ảnh.\r\n\r\nKhi chụp người dùng có thể zoom từ 1-10x nhưng từ 2x trở lên là zoom số, khi zoom số thuật toán xử lý ảnh sẽ cùng kết hợp hình ảnh từ cả 2 camera để xử lý, qua đó sẽ cho chất lượng cao gấp 4 lần hệ thống thường.\r\nNgoài ra thì Apple cũng sẽ tích hợp khả năng sử dụng đồng thời cả 2 camera để giả lập độ sâu trường ảnh mang lại cho người dùng những bức ảnh xóa phông ấn tượng.\r\n\r\nHệ điều hành mới\r\n\r\nĐồng thời với việc ra mắt iPhone mới thì Apple cũng giới thiệu tới người dùng hệ điều hành iOS 10 hoàn toàn mới với nhiều cải tiến mạnh mẽ về giao diện màn hình khóa, thanh thông báo, Apple Maps, Apple Music, Messages và HomeKit.\r\nVới những trang bị hàng đầu hiện nay thì iPhone 7 Plus 32 GB thực sự là 1 flahship đáng sở hữu trong dịp mua sắm cuối năm.', 22290000, 200000, 'iphone-7-plus-2.png', 2, '2016-11-10', 30, 20, 13, 12),
(3, 'SAMSUNG GALAXY J7', 'Samsung Galaxy J7 có thiết kế khá quen thuộc trên dòng Galaxy J Series, cộng với đó là cấu hình ổn định, camera tốt.\r\n\r\nThiết kế đậm chất dòng Galaxy J Series\r\n\r\nGalaxy J7 sở hữu phong cách thiết kế đầy trẻ trung và năng động của dòng Galaxy J Series, các cạnh máy được bo tròn cùng với viền giả kim loại mang lại cảm giác thoải mái khi cầm trên tay.\r\nChụp ảnh đẹp hơn với Galaxy J7\r\n\r\nNhờ được tích hợp cảm biến khẩu độ f/1.9 trên camera 13 MP cho chất lượng hình ảnh chụp ấn tượng, đồng thời hỗ trợ chụp ảnh tốt hơn trong điều kiện thiếu sáng nhờ tích hợp đèn flash.\r\nẢnh chụp tốt trong tầm giá\r\n\r\nGalaxy J7 được trang bị vi xử lý 8 nhân Exynos 7580 do chính Samsung tự sản xuất, chip đồ họa Mali T720, RAM dung lượng 1.5 GB, bộ nhớ trong 16 GB và có hỗ trợ thẻ nhớ ngoài MicroSD lên tới 128 GB.\r\nĐáng tiếc một chút khi trên Galaxy J7 không hỗ trợ 4G, tuy nhiên điều này cũng không quá cần thiết khi tốc độ 3G hay Wi-Fi hiện nay đã khá tốt.', 4500000, 100000, 'samsung-galaxy-j7-1-400x533.png', 3, '2016-11-03', 30, 20, 13, 6),
(4, 'ASUS ZENFONE GO', 'MÀU SẮC ĐẸP, CẤU HÌNH MẠNH', 53000000, 200000, 'asus-zenfone2-gold.jpg', 4, '2016-11-10', 30, 20, 1, 12),
(5, 'OPPO A37 NEO 9', 'KIỂU DÁNG ĐẸP, THÍCH HỢP VỚI PHÂN KHÚC TẦM TRUNG', 6300000, 100000, 'oppo-a37-vangdong.png', 5, '', 30, 20, 3, 6),
(6, 'LUMIA 730', 'đẹp dễ sử dụng, giá cả hợp lý', 5300000, 200000, 'xam.jpg', 7, '2016-11-04', 30, 20, 12, 6),
(10, 'iPhone 6s Plus 64GB', 'iPhone 6s Plus là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.\r\n\r\nCamera được cải tiến iPhone 6s Plus\r\n\r\niPhone 6s Plus 64 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.\r\nCamera trước với độ phân giải 5 MP cho hình ảnh với độ chi tiết rõ nét, đặc biệt máy còn có tính năng Retina Flash, sẽ giúp màn hình sáng lên như đèn Flash để bức ảnh khi bạn chụp trong trời tối được tốt hơn.\r\nThích thú hơn với màn hình rộng\r\n\r\nMàn hình lớn cùng màu sắc tươi tắn, độ nét cao sẽ mang đến nhiều thích thú khi lướt web, xem phim hay làm việc.\r\nCảm ứng 3D Touch độc đáo\r\n\r\n3D Touch là tính năng hoàn toàn mới trên iPhone 6s Plus, cho phép người dùng xem trước được các tùy chọn nhanh dựa vào lực nhấn mạnh hay nhẹ mà không cần phải nhấp vào ứng dụng. Để sử dụng, bạn chỉ cần nhấn vào màn hình hoặc ứng dụng 1 lực mạnh đến khi máy rung nhẹ là có thể xem được.\r\nĐáng tiếc tính năng 3D Touch này chỉ mới được áp dụng trên các ứng dụng của Apple như: danh bạ, camera, mail, máy ảnh ... \r\n\r\nBạn có thể tìm hiểu thêm tính năng 3D Touch tại đây.\r\n\r\nSức mạnh của bộ vi xử lý A9 mới nhất\r\n\r\niPhone 6s Plus sử dụng vi xử lý A9 tốc độ 1.8 GHz (iPhone 6 Plus chỉ với 1.4 GHz), giúp máy chạy cùng lúc nhiều ứng dụng mượt mà. Bạn sẽ thực sự cảm nhận được sức mạnh của iPhone 6s Plus khi chiến các game có đồ họa nặng như Modern Combat 5 hay Warhammer 40.000.\r\nNgoài ra iPhone 6s Plus còn được trang bị các công nghệ tiên tiến nhất hiện nay như: Wifi chuẩn dual-band và tính năng kết nối 4G thời thượng, cho tốc độ kết nối và tải dữ liệu rất nhanh, cảm biến vân tay cải tiến để nhận diện và mở khóa nhanh hơn.\r\n\r\nMột chiếc điện thoại vừa thể hiện đẳng cấp của bạn vừa mang lại những nâng cấp tốt hơn như camera, hiệu năng hoạt động mạnh mẽ hơn, tính năng 3D Touch độc đáo, tất cả sẽ là trải nghiệm mới mẻ cho bạn khi chọn mua iPhone 6s Plus.', 19900000, 0, 'iphone6s.png', 2, '2016-11-03', 100, 20, NULL, 12),
(15, 'Sony Xperia XA Ultra', 'Sony Xperia XA Ultra sở hữu màn hình lớn cùng camera trước có độ phân giải cao cùng nhiều tính năng cao cấp.\r\n\r\nMàn hình lớn\r\n\r\nSony Xperia XA Ultra mang trong mình màn hình có kích thước 6 inch độ phân giải 1080 x 1920 pixels cùng tấm nền IPS LCD. Máy đem lại màu sắc thể hiện khá sắc nét cùng một góc nhìn rộng cho bạn thoải mái chia sẻ nội dung với bạn bè.\r\nMáy cũng sở hữu thiết kế khá thon gọn so với một chiếc phablet màn hình lớn với các góc cạnh bo tròn mềm mại cùng phần viền màn hình siêu mỏng tương tự như trên chiếc Xperia XA.\r\nĐiểm trừ trên thiết kế của các dòng Xperia là cụm phím điều hướng cơ bản của Android vẫn nằm ở bên trong màn hình và chiếm diện tích hiển thị vẫn xuất hiện trên XA Ultra, hi vọng Sony sẽ lắng nghe người dùng và có những thay đổi cho các thiết bị của mình trong thời gian tới.\r\nCamera trước sắc nét\r\n\r\nVới camera trước có độ phân giải 16 MP, hỗ trợ đèn flash trợ sáng cùng tính năng chống rung quang học OIS cao cấp sẽ giúp bạn có những bức ảnh có chất lượng vượt trội với XA Ultra. Ngoài ra máy cũng hỗ trợ chụp hình bằng cử chỉ giúp bạn có thể có những bức ảnh nhóm dễ dàng.\r\nNgoài ra camera chính của máy cũng có độ phân giải lên tới 21.5 MP cùng đèn flash trợ sáng cho bạn những bức ảnh thiếu sáng có chất lượng tốt. Máy cũng hỗ trợ quay phim độ phân giải FullHD 1080p@30fps giúp bạn có thể lưu lại những đoạn video thú vị.\r\nHiệu năng tốt\r\n\r\nXperia XA Ultra mang trên mình vi xử lý MediaTek Helio P10 8 nhân, RAM 3 GB, bộ nhớ trong 16 GB kèm khe cắm thẻ nhớ hỗ trợ tối đa lên đến hơn 200 GB. Máy chạy trên nền Android 6.0 Marshmallow, và viên pin có dung lượng 2700 mAh cùng chế độ sạc nhanh.\r\nVới cấu hình này, XA Ultra sẽ mang lại cho bạn những trải nghiệm đa nhiệm mượt mà và khả năng giải trí cùng những game đỉnh cao mà không giật lag.\r\n\r\nXperia XA Ultra là smartphone đáng sở hữu nhất trong phân khúc điện thoại màn hình lớn.', 7490000, 200000, 'sony-xperia-xa-ultra-1.png', 1, '2016-11-25', 23, 20, NULL, 12),
(16, 'Sony Xperia M5', 'Sony Xperia M5 (Single SIM) là sự kết hợp hài hòa các ưu điểm giữa Xperia Z3 Plus và M4 Aqua để đưa ra sản phẩm tốt nhất, khắc phục một vài hạn chế ở chiếc M4 trước kia.\r\n\r\nThiết kế cao cấp của Xperia Z3 Plus\r\n\r\nNhìn tổng thể bên ngoài, Sony Xperia M5 (Single SIM) có nhiều nét tương đồng với Xperia Z3 Plus, đây là một ưu điểm tạo nên vẻ sang trọng, cao cấp và sắc sảo hơn so với Xperia M4.\r\nMáy được hoàn thiện với chất lượng tốt, đậm phong cách quen thuộc của các dòng điện thoại Sony, bao phủ toàn bộ máy là hai mặt kính được làm từ nhựa, chống xước. Khung viền xung quanh của máy bằng chất liệu kim loại và được gia cố ở bốn góc nhằm bảo vệ máy một cách tối đa khi có va đập xảy ra.\r\nMàn hình Full HD mịn màng\r\n\r\nSo với thế hệ M4 trước kia thì Xperia M5 (Single SIM) đã được nâng cấp từ màn hình HD sang Full HD, một nâng cấp đáng giá với số tiền bỏ ra.\r\nCặp đôi camera “khủng”\r\n\r\nĐầu tiên “khủng” về thông số camera với camera chính với độ phân giải 21.5 MP, camera trước là 13 MP.\r\nHiệu năng mạnh mẽ\r\n\r\nSony Xperia M5 (Single SIM) được trang bị bộ vi xử lý tám nhân MediaTek MT6795 Helio X10 tốc độ xung nhịp đạt 2 Ghz, tích hợp chip đồ họa GPU PowerVR G6200 và đi kèm với bộ nhớ RAM 3 GB.\r\nQuản lý ứng dụng trên máy rất tốt giúp máy chạy rất nhanh, mượt mà và ổn định. Các tác vụ đa nhiệm hoạt động trơn tru và không gặp bất cứ vấn đề gì như giật, treo.\r\n\r\nVới mức giá hấp dẫn, thiết kế sang trọng, cao cấp, cấu hình mạnh mẽ và camera ấn tượng Sony Xperia M5 (Single SIM) rất đáng để bạn lựa chọn trong phân khúc.', 7490000, 0, 'sony-xperia-m5-single-sim-300x300.jpg', 1, '2016-11-10', 32, 20, 1, 6),
(18, 'Lumia 550', 'Nếu bạn muốn trải nghiệm Windows 10 Phone với mức giá rẻ cùng các tính năng như Cortana tiện ích, kết nối 4G tốc độ nhanh thì Lumia 550 sẽ là sự lựa chọn tốt cho bạn.\r\nTrợ lý ảo Cortana cải thiện tốt hơn\r\nĐồng bộ dữ liệu dễ dàng\r\nVới hệ điều hành Windows 10, bạn sẽ có được những ứng dụng microsoft rất quen thuộc và bạn dễ dàng đồng bộ dữ liệu với nhau, giúp bạn truy cập tài liệu bất cứ nơi nào.\r\nCấu hình ổn\r\nMáy dùng chip Snapdragon 210, 4 nhân cho tốc độ 1.15 GHz, RAM 1 GB giúp máy hoạt động khá ổn, để máy nhẹ nhàng hơn bạn nên mở rộng thêm thẻ nhớ ngoài (có thể lên đến 200 GB) \r\nCamera vừa đủ dùng\r\nLumia 550 là một chiếc máy chú trọng vào việc hỗ trợ bạn đồng bộ dữ liệu tốt với Win 10, các ứng dụng office dễ dàng sử dụng hơn và cấu hình đủ tốt.\r\n', 1500000, 0, 'den.png', 7, '2016-11-25', 30, 20, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `productorders`
--

CREATE TABLE `productorders` (
  `id` int(11) UNSIGNED NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL,
  `idOther` int(11) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productorders`
--

INSERT INTO `productorders` (`id`, `productID`, `idOther`, `amount`) VALUES
(50, 1, 50, 1),
(51, 2, 50, 1),
(52, 6, 51, 1),
(53, 2, 52, 1),
(54, 5, 52, 1),
(55, 2, 53, 1),
(56, 6, 53, 1),
(57, 3, 54, 2),
(58, 6, 55, 1);

-- --------------------------------------------------------

--
-- Table structure for table `thongso`
--

CREATE TABLE `thongso` (
  `thongsoID` int(11) UNSIGNED NOT NULL,
  `productID` int(11) UNSIGNED NOT NULL,
  `manhinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HDD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CMRTruoc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `CMRSau` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `RAM` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ROM` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `thesim` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `dungluongPIN` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thongso`
--

INSERT INTO `thongso` (`thongsoID`, `productID`, `manhinh`, `HDD`, `CMRTruoc`, `CMRSau`, `RAM`, `ROM`, `thesim`, `dungluongPIN`) VALUES
(4, 2, 'LED-backlit IPS LCD, 5.5", Retina HD', 'iOS 10', '7 MP', 'Hai camera 12 MP', '3 GB', '32 GB', '1 SIM, Nano SIM', '2900 mAh'),
(6, 3, 'Super AMOLED, 5.5", HD', 'Android 5.1 (Lollipop)', '5 MP', '13 MP', '1.5 GB', '8 GB', '2 SIM 2 sóng, Micro SIM', '3000mA'),
(7, 4, '5.5 INCH', 'YES', '8.0 pixel', '16.0 pixel', '8GB', '6GB', '2 khe', '4000mA'),
(8, 5, '5 INCH', 'YES', '8.0 pixel', '16.0 pixel', '8gb', '6GB', '1 KHE', '3400ma'),
(10, 6, '4 inch', 'yes', '5.0 pixel', '8.0 pixel', '16GB', '4GB', '2 khe', '3400mA'),
(12, 10, 'LED-backlit IPS LCD, 5.5", Retina HD', 'iOS 9', '8 MP', '12 MP', '4GB', '64 GB', '1 SIM, Nano SIM', '2750 mAh'),
(16, 15, 'IPS LCD, 6", Full HD', 'Android 6.0 (Marshmallow)', '16 MP', '21.5 MP', '3 GB', '16 GB', '2 SIM, Nano SIM', '2700 mAh'),
(17, 16, 'IPS LCD, 6', 'Android 5.0 (Lollipop)', '16 MP', '21.5 MP', '3 GB', '16 GB', '2 SIM, Nano SIM', '4000mA'),
(26, 18, 'LCD, 4.7", HD', 'Windows 10 (for Mobile)', '2 MP', '5 MP', '1 GB', '8 GB', '1 SIM, Nano SIM', '2100 mAh'),
(27, 1, 'IPS LCD, 5.5', 'Android 6.0 (Marshmallow)', '5 MP', '23 MP', '3 GB', '32 GB', 'Đang cập nhật, Nano SIM', '2900 mAh');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(1) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `phone`, `address`, `fullname`, `level`, `add_date`) VALUES
(1, 'hoangyen107', '670b14728ad9902aecba32e22fa4f6bd', 'admingg@gmail.com', 123456781, 'quận 2', 'Nguyễn Văn A', 1, NULL),
(2, 'hoangyen107', '96e79218965eb72c92a549dd5a330112', 'thanhyen107@gmail.com', 123456789, 'quận 3', 'yenhoang', 1, NULL),
(3, 'test', '96e79218965eb72c92a549dd5a330112', 'thanhyen107sds@gmail.coms', 1234567890, 'quận 10', 'Trần Văn B', 2, NULL),
(4, 'test1', '96e79218965eb72c92a549dd5a330112', 'thanhyen107sds@gmail.comsgjvj', 1234567890, 'quận 5', 'Lê Văn C', 2, NULL),
(5, 'hoàng yên ', '96e79218965eb72c92a549dd5a330112', 'test1@gmail.com', 123466789, 'quận 3', 'hoàng thịthanh yên ', 2, '0000-00-00 00:00:00'),
(6, 'testing', '670b14728ad9902aecba32e22fa4f6bd', 'test@gmail.com', 123456789, 'quận 3', 'testtest', 2, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `fk_comment_product` (`productID`),
  ADD KEY `fk_comment_user` (`userID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `fk_image_product` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`idOther`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `fk_product_category` (`categoryID`);

--
-- Indexes for table `productorders`
--
ALTER TABLE `productorders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_product` (`productID`),
  ADD KEY `fk_orders` (`idOther`);

--
-- Indexes for table `thongso`
--
ALTER TABLE `thongso`
  ADD PRIMARY KEY (`thongsoID`),
  ADD KEY `fk_thongso_product` (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imageID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `idOther` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `productorders`
--
ALTER TABLE `productorders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `thongso`
--
ALTER TABLE `thongso`
  MODIFY `thongsoID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_image_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Constraints for table `productorders`
--
ALTER TABLE `productorders`
  ADD CONSTRAINT `fk_orders` FOREIGN KEY (`idOther`) REFERENCES `orders` (`idOther`),
  ADD CONSTRAINT `fk_orders_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `thongso`
--
ALTER TABLE `thongso`
  ADD CONSTRAINT `fk_thongso_product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
