use DB_BakeryWeb
CREATE TABLE style
(
  codeStyle CHAR(5) NOT NULL,
  nameStyle NVARCHAR(100) NULL,
  PRIMARY KEY (codeStyle)
);


CREATE TABLE customer
(
  codeCus CHAR(5) NOT NULL,
  nameCus NVARCHAR(150) NULL,
  address NVARCHAR(150) NULL,
  phone CHAR(10) NULL,
  email NVARCHAR(150) NULL,
  PRIMARY KEY (codeCus)
);

CREATE TABLE tlb_user
(
  idUser INT NOT NULL,
  --codeCus INT NOT NULL,
  userName NVARCHAR(100) NULL,
  userPass NVARCHAR(max) NULL,
  userRole NVARCHAR(50) NULL,
  PRIMARY KEY (idUser),
  --FOREIGN KEY (codeCus) REFERENCES customer(codeCus)
  --UNIQUE (codeCus)
);


CREATE TABLE product
(
  ID int identity(1,1) ,
  codePro CHAR(5) NOT NULL,
  namePro NVARCHAR(100) NULL,
  descriptionPro NVARCHAR(max) NULL,
  price FLOAT NULL,
  size NVARCHAR(50) NULL,
  image NVARCHAR(max) NULL,
  state NVARCHAR(100) NULL,
  codeStyle CHAR(5) NOT NULL,
  PRIMARY KEY (codePro),
  FOREIGN KEY (codeStyle) REFERENCES style(codeStyle),
  --FOREIGN KEY (idDetailBill) REFERENCES detailBill(idDetailBill)

);

CREATE TABLE bill
(
  idBill INT NOT NULL,
  billDate DATE NULL,
  idUser INT NOT NULL,
  totalBuy FLOAT NULL,
  codeCus CHAR(5) NOT NULL,
  PRIMARY KEY (idBill),
  FOREIGN KEY (codeCus) REFERENCES customer(codeCus),
  --FOREIGN KEY (idUser) REFERENCES tlb_user(idUser)
);



CREATE TABLE detailBill
(
  idBill INT NOT NULL,
  codePro CHAR(5) NOT NULL,
  quantityPro INT NULL,
  totalMoney FLOAT NULL,
  priceProBuying FLOAT NULL,
  PRIMARY KEY (idBill, codePro),
  --FOREIGN KEY (codePro) REFERENCES product(codePro),
  FOREIGN KEY (idBill) REFERENCES bill(idBill),
  FOREIGN KEY (codePro) REFERENCES product(codePro)
  );







INSERT INTO style VALUES('PL001',N'Bánh ngọt');
INSERT INTO style VALUES('PL002',N'Bánh mì');
INSERT INTO style VALUES('PL003',N'Bánh sinh nhật');
INSERT INTO style VALUES('PL004',N'Bánh theo mùa');
select*from style;

INSERT INTO customer VALUES('KH001',N'Nguyễn Thị Huệ',N'Long An',0913533554,'ngthihue@gmail.com');
INSERT INTO customer VALUES('KH002',N'Trần Thị Lan',N'Cà Mau',0913545674,'trthilan@gmail.com');
INSERT INTO customer VALUES('KH003',N'Đỗ Khánh Vân',N'An Giang',0913545654,'dkv@gmail.com');
INSERT INTO customer VALUES('KH004',N'Nguyễn Thị Cúc',N'Đồng Nai',0912333554,'ngthicuc@gmail.com');
INSERT INTO customer VALUES('KH005',N'Nguyễn Hoa',N'TP HCM',0913567554,'nghoa@gmail.com');
INSERT INTO customer VALUES('KH006',N'Lê Như',N'Vũng Tàu',0913545554,'lenhu@gmail.com');
INSERT INTO customer VALUES('KH007',N'Nguyễn Hùng',N'Bình Dương',0913587554,'nghung@gmail.com');
INSERT INTO customer VALUES('KH008',N'Mai Hương',N'Bình Phước',0913589554,'maihuong@gmail.com');
INSERT INTO customer VALUES('KH009',N'Nguyễn Văn Nam',N'TP HCM',0913455564,'ngvannam@gmail.com');
INSERT INTO customer VALUES('KH010',N'Nguyễn An',N'TP HCM',0913455564,'ngan@gmail.com');
select*from customer;


INSERT INTO tlb_user VALUES(001,'ngthihue','ngthihue123',null);
INSERT INTO tlb_user VALUES(002,'trthilan','trthilan123',null);
INSERT INTO tlb_user VALUES(003,'dkv','dkv123',null);
INSERT INTO tlb_user VALUES(004,'ngthicuc','ngthicuc123',null);
INSERT INTO tlb_user VALUES(005,'nghoa','nghoa123',null);
INSERT INTO tlb_user VALUES(006,'lenhu','lenhu123',null);
INSERT INTO tlb_user VALUES(007,'nghung','nghung123',null);
INSERT INTO tlb_user VALUES(008,'maihuong','maihuong123',null);
INSERT INTO tlb_user VALUES(009,'ngvannam','ngvannam123',null);
INSERT INTO tlb_user VALUES(010,'ngan','ngan123',null);
select*from tlb_user;
--1
INSERT INTO product VALUES('BL001',N'Bánh bông lan truyền thống',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('BL002',N'Bánh bông lan cuộn chà bông',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('BL003',N'Bánh bông lan cuộn chà bông gà sốt dầu trứng',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('BL004',N'Bánh bông lan phô mai',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('BL005',N'Bánh bông lan socola cuộn kem',null,50000,null,null,N'Còn hàng','PL001');



--2
INSERT INTO product VALUES('SK001',N'Bánh su kem vỏ giòn 3 vị',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('SK002',N'Bánh su kem gấu',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('SK003',N'Bánh su kem matcha',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('SK004',N'Bánh su kem trứng',null,50000,null,null,N'Còn hàng','PL001');

--3
INSERT INTO product VALUES('MS001',N'Chocolate Raspberry Mousse',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('MS002',N'Chocolate strawberry mousse',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('MS003',N'Lemon Mousse',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('MS004',N'Mulberry Mousse',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('MS005',N'Raspberry Mousse',null,50000,null,null,N'Còn hàng','PL001');
select*from product;
--4
INSERT INTO product VALUES('TR001',N'Coffee Tiramisu',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('TR002',N'Lemon Tiramisu',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('TR003',N'Matcha Tiramisu',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('TR004',N'Strawberry Tiramisu',null,50000,null,null,N'Còn hàng','PL001');

--5
INSERT INTO product VALUES('PC001',N'Panna Cotta Blueberry',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('PC002',N'Panna Cotta Chanh dây',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('PC003',N'Panna Cotta Coffee',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('PC004',N'Panna Cotta Xoài',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('PC005',N'Panna Cotta Rasberry',null,50000,null,null,N'Còn hàng','PL001');

--6
INSERT INTO product VALUES('DN001',N'Donut Oreo',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('DN002',N'Donut phủ đường',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('DN003',N'Donut phủ đường nhân kem',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('DN004',N'Donut Red velvet',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('DN005',N'Donut Socola',null,50000,null,null,N'Còn hàng','PL001');

--7
INSERT INTO product VALUES('CC001',N'Candy Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('CC002',N'Chocolate Biscoff Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('CC003',N'Chocolate Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('CC004',N'Cookies and Cream Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('CC005',N'CupcLemon Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
INSERT INTO product VALUES('CC006',N'Red Velvet Cupcakes',null,50000,null,null,N'Còn hàng','PL001');
--8
INSERT INTO product VALUES('TT000',N'Bánh Tart Trứng',null,50000,null,null,N'Còn hàng','PL001');


--1
INSERT INTO product VALUES('SW001',N'Bánh sandwich bơ sữa',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('SW001',N'Bánh sandwich mix hạt óc chó',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('SW001',N'Bánh sandwich mix nho khô',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('SW001',N'Bánh sandwich nguyên cám',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('SW001',N'Bánh sandwich trà xanh',null,50000,null,null,N'Còn hàng','PL002');

--2
INSERT INTO product VALUES('BM001',N'Bánh mì mặn',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BM002',N'Bánh mì xúc xích',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BM003',N'Bánh mì phô mai bơ tỏi',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BM004',N'Bánh mì phô mai tan chảy',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BM005',N'Bánh mì chà bông',null,50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BM006',N'Bánh mì chà bông rong biển',null,50000,null,null,N'Còn hàng','PL002');

--3
INSERT INTO product VALUES('BN001',N'Bánh mì hoa cúc',N'Mùi thơm đặc trưng của bánh mới ra lò',50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BN002',N'Bánh mì hoa cúc bơ tỏi',N'Vị bơ tỏi thơm lừng',50000,null,null,N'Còn hàng','PL002');
INSERT INTO product VALUES('BN003',N'Bánh mì sữa Hokkaido',N'Bánh mì thơm ngon mềm mịn hấp dẫn',50000,null,null,N'Còn hàng','PL002');



INSERT INTO product VALUES('SN001',N'Bánh kem gấu nhỏ',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN002',N'Bánh kem khủng long',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN003',N'Bánh kem con nhện dễ thương',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN004',N'Bánh kem Shin cậu bé bút chì',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN005',N'Bánh kem trái cây',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN006',N'Bánh kem nơ hồng',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN007',N'Bánh kem happy',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN008',N'Bánh kem shin',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN009',N'Bánh kem cừu nhỏ',null,50000,null,null,N'Còn hàng','PL003');
INSERT INTO product VALUES('SN010',N'Bánh kem cầu vồng',null,50000,null,null,N'Còn hàng','PL003');

INSERT INTO product VALUES('HW001',N'Bánh kem HALLOWEEN mini',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW002',N'Bánh quy HALLOWEEN',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW003',N'Chocolate Halloween Cupcakes',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW004',N'Donut halloween Ghost',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW005',N'Donut halloween',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW006',N'Macaron Halloween',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW007',N'Mousse Halloween',null,50000,null,null,N'Còn hàng','PL004');
INSERT INTO product VALUES('HW008',N'Tiramisu Halloween',null,50000,null,null,N'Còn hàng','PL004');




INSERT INTO bill VALUES(1,null,003,null,'KH003');
INSERT INTO bill VALUES(2,null,006,null,'KH006');
INSERT INTO bill VALUES(3,null,005,null,'KH005');
INSERT INTO bill VALUES(4,null,002,null,'KH002');
INSERT INTO bill VALUES(5,null,008,null,'KH008');
select*from bill;

INSERT INTO detailBill VALUES(1,'BL001',10,null,20000);
INSERT INTO detailBill VALUES(2,'SK001',5,null,50000);
INSERT INTO detailBill VALUES(3,'SK001',15,null,100000);
INSERT INTO detailBill VALUES(4,'SK001',20,null,150000);
INSERT INTO detailBill VALUES(5,'SK001',2,null,20000);
select*from detailBill;



