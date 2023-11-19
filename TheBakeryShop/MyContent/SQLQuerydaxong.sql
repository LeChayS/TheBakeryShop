CREATE DATABASE DBBakeryShop
use DBBakeryShop

CREATE TABLE tbStyle
(
  codeStyle CHAR(5) NOT NULL,
  nameStyle NVARCHAR(100) NULL,
  PRIMARY KEY (codeStyle)
);


CREATE TABLE tbCustomer
(
  codeCus CHAR(5) NOT NULL,
  nameCus NVARCHAR(150) NULL,
  addressCus NVARCHAR(150) NULL,
  phoneCus CHAR(10) NULL,
  emailCus NVARCHAR(150) NULL,
  PRIMARY KEY (codeCus)
);

CREATE TABLE tbUser
(
  idUser INT IDENTITY(1,1) NOT NULL,
  userName NVARCHAR(100) NULL,
  userPass NVARCHAR(max) NULL,
  --userRole NVARCHAR(50) NULL,
  codeCus CHAR(5) NULL,
  PRIMARY KEY (idUser),
  FOREIGN KEY (codeCus) REFERENCES tbCustomer(codeCus)
  --UNIQUE (codeCus)
);


CREATE TABLE tbProduct
(
  codePro CHAR(5) NOT NULL,
  namePro NVARCHAR(100) NULL,
  descriptionPro NVARCHAR(max) NULL,
  pricePro FLOAT NULL,
  sizePro NVARCHAR(50) NULL,
  imagePro NVARCHAR(max) NULL,
  statePro NVARCHAR(100) NULL,
  codeStyle CHAR(5) NOT NULL,
  PRIMARY KEY (codePro),
  FOREIGN KEY (codeStyle) REFERENCES tbStyle(codeStyle),
  --FOREIGN KEY (idDetailBill) REFERENCES detailBill(idDetailBill)
);

CREATE TABLE tbBill
(
  idBill INT IDENTITY(1,1) NOT NULL,
  billDate DATE NULL,
  idUser INT NOT NULL,
  totalBuy FLOAT NULL,
  --codeCus CHAR(5) NOT NULL,
  PRIMARY KEY (idBill),
  --FOREIGN KEY (codeCus) REFERENCES tbCustomer(codeCus),
  FOREIGN KEY (idUser) REFERENCES tbUser(idUser)
);


CREATE TABLE tbDetailBill
(
  idBill INT IDENTITY(1,1) NOT NULL,
  codePro CHAR(5) NOT NULL,
  quantityPro INT NULL,
  totalMoney FLOAT NULL,
  priceProBuying FLOAT NULL,
  PRIMARY KEY (idBill, codePro),
  --FOREIGN KEY (codePro) REFERENCES product(codePro),
  FOREIGN KEY (idBill) REFERENCES tbBill(idBill),
  FOREIGN KEY (codePro) REFERENCES tbProduct(codePro)
 );






--tbStyle
INSERT into tbStyle VALUES('PL001',N'Bánh ngọt');
INSERT into tbStyle VALUES('PL002',N'Bánh mì');
INSERT into tbStyle VALUES('PL003',N'Bánh sinh nhật');
INSERT into tbStyle VALUES('PL004',N'Bánh theo mùa');
select*from tbStyle;

--tbCustomer
INSERT into tbCustomer VALUES('KH001',N'Nguyễn Thị Huệ',N'Long An',0913533554,'ngthihue@gmail.com');
INSERT into tbCustomer VALUES('KH002',N'Trần Thị Lan',N'Cà Mau',0913545674,'trthilan@gmail.com');
INSERT into tbCustomer VALUES('KH003',N'Đỗ Khánh Vân',N'An Giang',0913545654,'dkv@gmail.com');
INSERT into tbCustomer VALUES('KH004',N'Nguyễn Thị Cúc',N'Đồng Nai',0912333554,'ngthicuc@gmail.com');
INSERT into tbCustomer VALUES('KH005',N'Nguyễn Hoa',N'TP HCM',0913567554,'nghoa@gmail.com');
INSERT into tbCustomer VALUES('KH006',N'Lê Như',N'Vũng Tàu',0913545554,'lenhu@gmail.com');
INSERT into tbCustomer VALUES('KH007',N'Nguyễn Hùng',N'Bình Dương',0913587554,'nghung@gmail.com');
INSERT into tbCustomer VALUES('KH008',N'Mai Hương',N'Bình Phước',0913589554,'maihuong@gmail.com');
INSERT into tbCustomer VALUES('KH009',N'Nguyễn Văn Nam',N'TP HCM',0913455564,'ngvannam@gmail.com');
INSERT into tbCustomer VALUES('KH010',N'Nguyễn An',N'TP HCM',0913455564,'ngan@gmail.com');
select*from tbCustomer;

--tbUser
INSERT into tbUser VALUES('ngthihue','ngthihue123','KH001');
INSERT into tbUser VALUES('trthilan','trthilan123','KH001');
INSERT into tbUser VALUES('dkv','dkv123','KH003');
INSERT into tbUser VALUES('ngthicuc','ngthicuc123','KH004');
INSERT into tbUser VALUES('nghoa','nghoa123','KH005');
INSERT into tbUser VALUES('lenhu','lenhu123','KH006');
INSERT into tbUser VALUES('nghung','nghung123','KH007');
INSERT into tbUser VALUES('maihuong','maihuong123','KH008');
INSERT into tbUser VALUES('ngvannam','ngvannam123','KH009');
INSERT into tbUser VALUES('ngan','ngan123','KH010');
select*from tbUser;


--tbProduct (codePro,namePro,desPro,pricePro,sizePro,imagePro,statePro,codeSyle)
--1 bánh bông lan
INSERT into tbProduct VALUES('BL001',N'Bánh bông lan truyền thống',null,50000,null,
'~\MyContent\Image\banh-ngot\bong-lan\banh-bong-lan-truyen-thong.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('BL002',N'Bánh bông lan cuộn chà bông',null,50000,null,
'~\MyContent\Image\banh-ngot\bong-lan\banh-bong-lan-cuon-cha-bong.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('BL003',N'Bánh bông lan cuộn chà bông gà sốt dầu trứng',null,50000,null,
'~\MyContent\Image\banh-ngot\bong-lan\banh-bong-lan-cuon-cha-bong-ga-sot-dau-trung.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('BL004',N'Bánh bông lan phô mai',null,50000,null,
'~\MyContent\Image\banh-ngot\bong-lan\banh-bong-lan-pho-mai.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('BL005',N'Bánh bông lan socola cuộn kem',null,50000,null,
'~\MyContent\Image\banh-ngot\bong-lan\banh-bong-lan-socola-cuon-kem.jpg',N'Còn hàng','PL001');

--2 bánh su kem
INSERT into tbProduct VALUES('SK001',N'Bánh su kem vỏ giòn 3 vị',null,50000,null,
'~\MyContent\Image\banh-ngot\su-kem\banh-su-kem-gau-vo-gion.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('SK002',N'Bánh su kem gấu',null,50000,null,
'~\MyContent\Image\banh-ngot\su-kem\banh-su-kem-gau-vo-gion.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('SK003',N'Bánh su kem matcha',null,50000,null,
'~\MyContent\Image\banh-ngot\su-kem\banh-su-kem-mem-matcha.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('SK004',N'Bánh su kem trứng',null,50000,null,
'~\MyContent\Image\banh-ngot\su-kem\banh-su-kem-mem-trung.jpg',N'Còn hàng','PL001');

--3 mousse
INSERT into tbProduct VALUES('MS001',N'Chocolate Raspberry Mousse',null,50000,null,
'~\MyContent\Image\banh-ngot\mousse\chocolate-raspberry-mousse.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('MS002',N'Chocolate strawberry mousse',null,50000,null,
'~\MyContent\Image\banh-ngot\mousse\chocolate-strawberry-mousse.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('MS003',N'Lemon Mousse',null,50000,null,
'~\MyContent\Image\banh-ngot\mousse\lemon-mousse.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('MS004',N'Mulberry Mousse',null,50000,null,
'~\MyContent\Image\banh-ngot\mousse\mulberry-mousse.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('MS005',N'Raspberry Mousse',null,50000,null,
'~\MyContent\Image\banh-ngot\mousse\raspberry-mousse.jpg',N'Còn hàng','PL001');

--4 tiramisu
INSERT into tbProduct VALUES('TR001',N'Coffee Tiramisu',null,50000,null,
'~\MyContent\Image\banh-ngot\tiramisu\coffee-tiramisu.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('TR002',N'Lemon Tiramisu',null,50000,null,
'~\MyContent\Image\banh-ngot\tiramisu\lemon-tiramisu.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('TR003',N'Matcha Tiramisu',null,50000,null,
'~\MyContent\Image\banh-ngot\tiramisu\matcha-tiramisu.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('TR004',N'Strawberry Tiramisu',null,50000,null,
'~\MyContent\Image\banh-ngot\tiramisu\strawberry-tiramisu.jpg',N'Còn hàng','PL001');

--5 panna cotta
INSERT into tbProduct VALUES('PC001',N'Panna Cotta Blueberry',null,50000,null,
'~\MyContent\Image\banh-ngot\panna-cotta\panna-cotta-blueberry.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('PC002',N'Panna Cotta Chanh dây',null,50000,null,
'~\MyContent\Image\banh-ngot\panna-cotta\panna-cotta-chanh-day.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('PC003',N'Panna Cotta Coffee',null,50000,null,
'~\MyContent\Image\banh-ngot\panna-cotta\panna-cotta-coffee.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('PC004',N'Panna Cotta Xoài',null,50000,null,
'~\MyContent\Image\banh-ngot\panna-cotta\panna-cotta-mango.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('PC005',N'Panna Cotta Rasberry',null,50000,null,
'~\MyContent\Image\banh-ngot\panna-cotta\panna-cotta-raspberry.jpg',N'Còn hàng','PL001');

--6 donut
INSERT into tbProduct VALUES('DN001',N'Donut Oreo',null,50000,null,
'~\MyContent\Image\banh-ngot\donut\donut-oreo.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('DN002',N'Donut phủ đường',null,50000,null,
'~\MyContent\Image\banh-ngot\donut\donut-phu-duong.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('DN003',N'Donut phủ đường nhân kem',null,50000,null,
'~\MyContent\Image\banh-ngot\donut\donut-phu-duong-nhan-kem.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('DN004',N'Donut Red velvet',null,50000,null,
'~\MyContent\Image\banh-ngot\donut\donut-red-velvet.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('DN005',N'Donut Socola',null,50000,null,
'~\MyContent\Image\banh-ngot\donut\donut-socola.jpg',N'Còn hàng','PL001');

--7 cupcake
INSERT into tbProduct VALUES('CC001',N'Candy Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\candy-cupcakes.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('CC002',N'Chocolate Biscoff Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\chocolate-biscoff-cupcakes.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('CC003',N'Chocolate Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\chocolate-cupcakes.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('CC004',N'Cookies and Cream Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\cookies-cream-cupcakes.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('CC005',N'Lemon Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\lemon-cupcakes.jpg',N'Còn hàng','PL001');
INSERT into tbProduct VALUES('CC006',N'Red Velvet Cupcakes',null,50000,null,
'~\MyContent\Image\banh-ngot\cupcake\red-velvet-cupcakes.jpg',N'Còn hàng','PL001');

--8
INSERT into tbProduct VALUES('TT000',N'Bánh Tart Trứng',null,50000,null,
'~\MyContent\Image\banh-ngot\tart-trung.jpg',N'Còn hàng','PL001');



--1 bánh mì
INSERT into tbProduct VALUES('SW001',N'Bánh sandwich bơ sữa',null,50000,null,
'~\MyContent\Image\banh-mi\banh-sandwich-bo-sua.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('SW002',N'Bánh sandwich mix hạt óc chó',null,50000,null,
'~\MyContent\Image\banh-mi\banh-sandwich-mix-hat-oc-cho.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('SW003',N'Bánh sandwich mix nho khô',null,50000,null,
'~\MyContent\Image\banh-mi\banh-sandwich-mix-nho-kho.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('SW004',N'Bánh sandwich nguyên cám',null,50000,null,
'~\MyContent\Image\banh-mi\banh-sandwich-nguyen-cam.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('SW005',N'Bánh sandwich trà xanh',null,50000,null,
'~\MyContent\Image\banh-mi\banh-sandwich-tra-xanh.jpg',N'Còn hàng','PL002');

--2 bánh mì
INSERT into tbProduct VALUES('BM001',N'Bánh mì mặn',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-man.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BM002',N'Bánh mì xúc xích',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-xuc-xich.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BM003',N'Bánh mì phô mai bơ tỏi',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-pho-mai-bo-toi.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BM004',N'Bánh mì phô mai tan chảy',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-pho-mai-tan-chay.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BM005',N'Bánh mì chà bông',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-cha-bong.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BM006',N'Bánh mì chà bông rong biển',null,50000,null,
'~\MyContent\Image\banh-mi\banh-mi-cha-bong-rong-bien.jpg',N'Còn hàng','PL002');

--3 bánh mì
INSERT into tbProduct VALUES('BN001',N'Bánh mì hoa cúc',N'Mùi thơm đặc trưng của bánh mới ra lò',50000,null,
'~\MyContent\Image\banh-mi\banh-mi-hoa-cuc.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BN002',N'Bánh mì hoa cúc bơ tỏi',N'Vị bơ tỏi thơm lừng',50000,null,
'~\MyContent\Image\banh-mi\banh-mi-hoa-cuc-bo-toi.jpg',N'Còn hàng','PL002');
INSERT into tbProduct VALUES('BN003',N'Bánh mì sữa Hokkaido',N'Bánh mì thơm ngon mềm mịn hấp dẫn',50000,null,
'~\MyContent\Image\banh-mi\banh-mi-sua-hokkaido.jpg',N'Còn hàng','PL002');


-- bánh sinh nhật
INSERT into tbProduct VALUES('SN001',N'Bánh kem gấu nhỏ',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-gau-nho.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN002',N'Bánh kem khủng long',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-khung-long.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN003',N'Bánh kem con nhện dễ thương',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-con-nhen-cute.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN004',N'Bánh kem Shin cậu bé bút chì',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-shin-cau-be-but-chi.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN005',N'Bánh kem trái cây',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-trai-cay.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN006',N'Bánh kem nơ hồng',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-no-hong.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN007',N'Bánh kem happy',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-happy.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN008',N'Bánh kem shin',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-shin.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN009',N'Bánh kem cừu nhỏ',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-cuu-mini.jpg',N'Còn hàng','PL003');
INSERT into tbProduct VALUES('SN010',N'Bánh kem cầu vồng',null,50000,null,
'~\MyContent\Image\banh-sinh-nhat\banh-kem-cau-vong.jpg',N'Còn hàng','PL003');

-- bánh theo mùa
INSERT into tbProduct VALUES('HW001',N'Bánh kem Halloween mini',null,50000,null,
'~\MyContent\Image\banh-theo-mua\banh-kem-mini-halloween.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW002',N'Bánh quy Halloween',null,50000,null,
'~\MyContent\Image\banh-theo-mua\banh-quy-halloween.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW003',N'Chocolate Halloween Cupcakes',null,50000,null,
'~\MyContent\Image\banh-theo-mua\chocolate-halloween-cupcakes.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW004',N'Donut halloween Ghost',null,50000,null,
'~\MyContent\Image\banh-theo-mua\donut-halloween-ghost.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW005',N'Donut halloween',null,50000,null,
'~\MyContent\Image\banh-theo-mua\donut-halloween.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW006',N'Macaron Halloween',null,50000,null,
'~\MyContent\Image\banh-theo-mua\macaron-halloween.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW007',N'Mousse Halloween',null,50000,null,
'~\MyContent\Image\banh-theo-mua\mousse-halloween.jpg',N'Còn hàng','PL004');
INSERT into tbProduct VALUES('HW008',N'Tiramisu Halloween',null,50000,null,
'~\MyContent\Image\banh-theo-mua\tiramisu-halloween.jpg',N'Còn hàng','PL004');
select*from tbProduct;

--tbBill
INSERT into tbBill VALUES('2023-06-15',003,250000);
INSERT into tbBill VALUES('2023-02-9',006,50000);
INSERT into tbBill VALUES('2023-12-28',005,150000);
INSERT into tbBill VALUES('2023-01-30',002,76000);
INSERT into tbBill VALUES('2023-11-20',008,91000);
select*from tbBill;

--tbDetailBill
INSERT into tbDetailBill VALUES('BL001',10,null,20000);
INSERT into tbDetailBill VALUES('SK001',5,null,50000);
INSERT into tbDetailBill VALUES('SK001',15,null,100000);
INSERT into tbDetailBill VALUES('SK001',20,null,150000);
INSERT into tbDetailBill VALUES('SK001',2,null,20000);
select*from tbDetailBill;

