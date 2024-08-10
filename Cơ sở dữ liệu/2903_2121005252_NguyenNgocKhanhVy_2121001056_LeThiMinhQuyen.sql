CREATE DATABASE MQvaKV_QLNS_TL
GO

USE MQvaKV_QLNS_TL


--Bảng 2:
CREATE TABLE ChiNhanh
(
	MaCN nvarchar(20) not null Constraint PK_ChiNhanh Primary Key,
	TenCN nvarchar(30) not null,
	DienThoaiCN nvarchar(12),
	DiaChiCN nvarchar(100) 
)


--Bảng 3:
CREATE TABLE ChucVu
(
	MaCV nchar(10) not null Constraint PK_ChucVu Primary Key,
	TenCV nvarchar(20) not null
)

--Bảng 4:
CREATE TABLE HinhThucLamViec
(
	MaHTLV nchar(10) not null Constraint PK_HinhThucLamViec Primary Key,
	TenHTLV nvarchar(15) not null
)

--Bảng 5:
CREATE TABLE Luong
(
	MaLuong nvarchar(10) not null Constraint PK_Luong Primary Key, --mã lương chia ra hai phần là luongfulltime và luongparttime 
	DVT nvarchar(10) Constraint def_tbMatHang_DVT default N'giờ',
	TienLuongTheoGio float  --luongfulltime 40k/giờ, luongparttime 22k/giờ	
)

--Bảng 6:
CREATE TABLE PhuCap
(
	MaPC nvarchar(20) not null Constraint PK_PhuCap Primary Key,
	MaCV nchar(10) not null Constraint FK_PhuCap_MaCV Foreign Key (MaCV) references  ChucVu(MaCV),
	TienPC float
)

--Bảng 7:
CREATE TABLE Thuong
(
	MaThuong nvarchar(20) not null Constraint PK_Thuong Primary Key,
	MaCV nchar(10) not null Constraint FK_Thuong_MaCV Foreign Key (MaCV) references  ChucVu(MaCV),
	TienThuong float
)


--Bảng 1:
CREATE TABLE NhanVien
(
	MaNV nchar(10) not null Constraint PK_NhanVien Primary Key,
	HoNV nvarchar(30),
	TenNV nvarchar(30),
	GioiTinh nvarchar(10),
	NgaySinh datetime,
	DienThoai nvarchar(12),
	DiaChi nvarchar(100),
	Email nvarchar(50),
	NgayVaoLam datetime,
	MaCN nvarchar(20) not null Constraint FK_NhanVien_MaCN Foreign Key (MaCN) references  ChiNhanh(MaCN),
	MaCV nchar(10) not null Constraint FK_NhanVien_MaCV Foreign Key (MaCV) references  ChucVu(MaCV),
	MaHTLV nchar(10) not null Constraint FK_NhanVien_MaHTLV Foreign Key (MaHTLV) references  HinhThucLamViec(MaHTLV),
	MaLuong nvarchar(10) not null Constraint FK_NhanVien_MaLuong Foreign Key (MaLuong) references Luong(MaLuong),
	MaPC nvarchar(20) not null Constraint FK_NhanVien_MaPC Foreign Key (MaPC) references  PhuCap(MaPC),
	MaThuong nvarchar(20) not null Constraint FK_NhanVien_MaThuong Foreign Key (MaThuong)  references Thuong(MaThuong)
)


--Bảng 8:
CREATE TABLE ChamCong
(
	MaCong nchar(20) not null Constraint PK_ChamCong Primary Key,
	Thang int not null ,
	MaNV nchar(10) not null Constraint FK_ChamCong_MaNV Foreign Key (MaNV) references NhanVien(MaNV),
	SoGioLamViec int,
	TienLuongTheoGio float,
	TienPC float,
	TienThuong float,
	TamUng float
)

--Nhập liệu - Insert into


--Bảng 2:
INSERT INTO ChiNhanh 
VALUES 
	(N'HN01',N'H&M Aeon Hà Đông',' 02437576999',N'Dương Nội, Hà Đông, Hà Nội')
INSERT INTO ChiNhanh 
VALUES 
	(N'HN02',N'H&M Nguyễn Chí Thanh','02462844848',N'54A Nguyễn Chí Thanh, Láng Thượng, Đống Đa, Hà Nội')
INSERT INTO ChiNhanh 
VALUES 
	(N'HN03',N'H&M Royal City','02462767799',N'72A Nguyễn Trãi, Thượng Đình, Thanh Xuân, Hà Nội')
INSERT INTO ChiNhanh 
VALUES 
	(N'HN04',N'H&M Times City','0974876218',N'458 Phố Minh Khai, Vĩnh Phú, Hai Bà Trưng, Hà Nội')
INSERT INTO ChiNhanh 
VALUES 
	(N'DN05',N'H&M Ngô Quyền','028965478',N'910a Ngô Quyền, An Hải, An Hải Bắc, Sơn Trà, Đà Nẵng')
INSERT INTO ChiNhanh 
VALUES 
	(N'HCM06',N'H&M Aeon Tân Phú','02862887733',N'30 Bờ Bao Tân Thắng, Sơn Ký, Tân Phú, Thành phố Hồ Chí Minh')
INSERT INTO ChiNhanh 
VALUES 
	(N'HCM07',N'H&M Crescent Mall','02854133333',N'101 Tôn Dật Tiên, Tân Phú, Quận 7, Thành phố Hồ Chí Minh')
INSERT INTO ChiNhanh 
VALUES 
	(N'HCM08',N'H&M Đồng Khởi','19006017',N'M15-19 & L2-02, 72 Lê Thánh Tôn, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh')
INSERT INTO ChiNhanh 
VALUES 
	(N'HCM09',N'H&M Thảo Điền','02862852299',N'161 Xa lộ Hà Nội, Phường Thảo Điền, Thành phố Thủ Đức, Thành phố Hồ Chí Minh')

--Bảng 3:
INSERT INTO ChucVu 
VALUES 
	('QL',N'Quản lý')
INSERT INTO ChucVu 
VALUES
	('NV',N'Nhân viên')

--Bảng 4:
INSERT INTO HinhThucLamViec
VALUES 
	('Fulltime',N'Toàn Thời Gian')
INSERT INTO HinhThucLamViec
VALUES
	('Parttime',N'Bán Thời Gian')

--Bảng 5:
INSERT INTO Luong
VALUES 
	('LuongFT', N'giờ', 40000)
INSERT INTO Luong
VALUES
	('LuongPT', N'giờ', 22000)

--Bảng 6:
INSERT INTO PhuCap
VALUES 
	(N'Ngày lễ','QL', 500000)
INSERT INTO PhuCap
VALUES 
	(N'Ngày nghỉ lễ','NV', 100000)


--Bảng 7
INSERT INTO Thuong
VALUES 
	(N'Hoàn thành xuất sắc','QL', 1000000) --mai đổi thành doanh thu vượt bậc
INSERT INTO Thuong
VALUES
	(N'Hoàn thành tốt','QL', 500000)   --doanh thu tốt
	
	
--Bảng 1:
INSERT INTO NhanVien
VALUES 
	('QL01',N'Nguyễn',N'Anh Chi',N'Nữ',Convert(datetime,'1989-04-05'),'092989787',N'Lô D,phòng 18,Chung cư Thanh Đa,Thành phố Hà Nội','anhchiqlh&m@gmail.com',Convert(datetime,'2020-10-30'),'HN01','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('QL02',N'Lê',N'Minh Tùng',N'Nam',Convert(datetime,'1985-12-05'),'092678687',N'85 Nguyễn Du,Thành phố Hà Nội','minhtungqlh&m@gmail.com',Convert(datetime,'2019-01-01'),'HN02','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('QL03',N'Nguyễn',N'Minh Vũ',N'Nam',Convert(datetime,'1991-12-30'),'0909875632',N'178/97 An Dương Vương, Thành phố Hà Nội','minhvuqlh&m@gmail.com',Convert(datetime,'2018-06-05'),'HN03','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('QL04',N'Mai',N'Minh Mẫn',N'Nam',Convert(datetime,'1990-07-03'),'098789756',N'78/12/8 Phan Đình Phùng,Thành phố Hà Nội','minhmanqlh&m@gmail.com',Convert(datetime,'2020-05-26'),'HN04','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('QL05',N'Trần',N'Việt Bảo Hoàng',N'Nam',Convert(datetime,'1991-08-25'),'0982456987',N'87/5 Ngô Quyền,Thành phố Đà Nẵng','baohoangqlh&m@gmail.com',convert(datetime,'2018-08-09'),'DN05','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('QL06',N'Phạm',N'Kim Dung',N'Nữ',Convert(datetime,'1979-02-16'),'097586123',N'34 Nguyễn Sơn,Phường Phú Thọ Hòa,Quận Tân Phú, Thành phố Hồ Chí Minh','dungphamqlh&m@gmail.com',convert(datetime,'2019-02-09'),'HCM06','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('QL07',N'Vương',N'Thị Mỹ Huệ',N'Nữ',Convert(datetime,'1981-05-19'),'0354846123',N'480 Nguyễn Thị Thập ,Phường Tân Quy,Quận 7, Thành phố Hồ Chí Minh','myhueqlh&m@gmail.com',convert(datetime,'2017-01-31'),'HCM07','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('QL08',N'Trần',N'Ngọc Huyền',N'Nữ',Convert(datetime,'1983-02-28'),'0356852146',N'40 Phạm Hồng Thái,Phường Bến Thành,Quận 1, Thành phố Hồ Chí Minh','huyentranqlh&m@gmail.com',convert(datetime,'2017-05-04'),'HCM08','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('QL09',N'Nguyễn',N'Đình Thắng',N'Nam',Convert(datetime,'1986-08-29'),'0914569852',N'83 Xa Lộ Hà Nội,Phường Thảo Điền,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','thangnguyenqlh&m@gmail.com',convert(datetime,'2022-05-13'),'HCM09','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO NhanVien
VALUES
	('NV01',N'Nguyễn',N'Đình Hiếu',N'Nam',Convert(datetime,'2000-01-20'),'0862139838',N'29 La Thành,Phường Ô Chợ Dừa,Quận Đống Đa, Thành phố Hà Nội','dinhhieuh&m@gmail.com',Convert(datetime,'2020-10-03'),'HN02','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV02',N'Lê',N'Dương Bảo Lâm',N'Nam',Convert(datetime,'1999-12-09'),'0909092648',N'178 Tây Sơn,Phường Trung Liệt,Quận Đống Đa, Thành phố Hà Nội','baolamh&m@gmail.com',Convert(datetime,'2019-11-30'),'HN02','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV03',N'Kiều',N'Minh Tuấn',N'Nam',Convert(datetime,'2001-08-30'),'02899995555',N'112 đường Lê Lợi,Phường Nguyễn Trãi,Quận Hà Đông,Thành phố Hà Nội','minhtuanh&m@gmail.com',Convert(datetime,'2021-09-02'),'HN01','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV04',N'Nguyễn',N'Thanh Tùng',N'Nam',Convert(datetime,'2000-04-06'),'02462660198',N'197 Quang Trung,Phường Hà Cầu,Quận Hà Đông, Thành phố Hà Nội','thanhtuanh&m@gmail.com',Convert(datetime,'2018-08-15'),'HN01','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV05',N'Nguyễn',N'Thị Ngọc Trinh',N'Nữ',Convert(datetime,'1995-05-26'),'0902880791',N'24 Lê Trọng Tấn,Phường Khương Mai, Quận Thanh Xuân, Thành phố Hà Nội','trinhnguyenh&m@gmail.com',Convert(datetime,'2020-10-01'),'HN03','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV06',N'Nguyễn',N'Việt Hoàng',N'Nam',Convert(datetime,'2003-12-28'),'0923457211',N'81 Lê Văn Lương,Phường Nhân Chính,Quận Thanh Xuân, Thành phố Hà Nội','viethoangh&m@gmail.com',Convert(datetime,'2020-01-10'),'HN03','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV07',N'Trịnh',N'Trần Phương Tuấn',N'Nam',Convert(datetime,'2004-03-03'),'0356889521',N'2A Đại Cồ Việt,Phường Lê Đại Hành, Quận Hai Bà Trưng, Thành phố Hà Nội','phuongtuanh&m@gmail.com',Convert(datetime,'2020-02-03'),'HN04','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV08',N'Trần',N'Minh Hiếu',N'Nam',Convert(datetime,'1999-04-18'),'0236541223',N'18 Tam Trinh,Phường Minh Khai,Quận Hai Bà Trưng, Thành phố Hà Nội','hieutranh&m@gmail.com',Convert(datetime,'2020-01-01'),'HN04','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV09',N'Hoàng',N'Thái Vũ',N'Nam',Convert(datetime,'2002-03-05'),'0725632112',N'472 Điện Biên Phủ,Phường Thanh Khê Đông,Quận Thanh Khê, Thành phố Đà Nẵng','vuh&m@gmail.com',Convert(datetime,'2020-05-01'),'DN05','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV10',N'Nguyễn',N'Hoàng Long',N'Nam',Convert(datetime,'1997-08-27'),'0896325451',N'151 Điện Biên Phủ,Phường Chính Gián,Quận Thanh Khê, Thành phố Đà Nẵng','hoanglongh&m@gmail.com',Convert(datetime,'2017-01-03'),'DN05','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES
	('NV11',N'Nguyễn',N'Anh Tuấn',N'Nam',Convert(datetime,'2000-07-03'),'0969523102',N'344 Nguyễn Sơn,Phường Phú Thọ Hòa,Quận Tân Phú,Thành phố Hồ Chí Minh','anhtuanh&m@gmail.com',Convert(datetime,'2018-10-30'),'HCM06','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV12',N'Vũ',N'Đức Thiện',N'Nam',Convert(datetime,'2003-03-12'),'0987456321',N' 300 Tân Sơn Nhì,Phường Tân Sơn Nhì,Quận Tân Phú,Thành phố Hồ Chí Minh','ducthienh&m@gmail.com',Convert(datetime,'2021-10-30'),'HCM06','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV13',N'Hoàng',N'Lâm Trang Anh',N'Nữ',Convert(datetime,'2000-08-06'),'0982926544',N'31, Khu phố Mỹ Hoàng,Phường Tân Phong,Quận 7,Thành phố Hồ Chí Minh','tranganhh&m@gmail.com',Convert(datetime,'2019-12-01'),'HCM07','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV14',N'Nguyễn',N'Ngọc Minh Huy',N'Nam',Convert(datetime,'1998-04-27'),'0937856962',N'542 Trần Hưng Đạo,Phường 1,Quận 5,Thành phố Hồ Chí Minh','minhhuyh&m@gmail.com',Convert(datetime,'2020-03-01'),'HCM07','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV15',N'Ngô',N'Thành Dương',N'Nam',Convert(datetime,'2001-09-26'),'0374569223',N'163 Nguyễn Văn Cừ,Phường Nguyễn Cư Trinh,Quận 1,Thành phố Hồ Chí Minh','thanhduongh&m@gmail.com',Convert(datetime,'2020-01-05'),'HCM08','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV16',N'Nguyễn',N'Kiều Cẩm Thơ',N'Nữ',Convert(datetime,'2003-01-14'),'0908223349',N'66 Phó Đức Chính,Phường Nguyễn Thái Bình, Quận 1,Thành phố Hồ Chí Minh','camthoh&m@gmail.com',Convert(datetime,'2021-06-01'),'HCM08','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV17',N'Phạm',N'Anh Quân',N'Nam',Convert(datetime,'1997-02-07'),'0162566674',N'33A Trần Não,Phường Bình An,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','quanaph&m@gmail.com',Convert(datetime,'2018-02-02'),'HCM09','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO NhanVien
VALUES	
	('NV18',N'Lê',N'Trung Thành',N'Nam',Convert(datetime,'1999-10-15'),'0927894523',N'13B Nguyễn Thị Định,Phường An Phú,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','trungthanhh&m@gmail.com',Convert(datetime,'2020-01-01'),'HCM09','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
	


--Bảng 8:
INSERT INTO ChamCong
VALUES
	('Cong001',12,'QL01',260,40000,500000,1000000, 2000000)--làm 26 ngày(có 1 ngày lễ) ngày làm 10 tiếng nên tổng số giờ làm là 260 giờ ,lương 40k/h,PC,thưởng,tạm ứng.
INSERT INTO ChamCong
VALUES	
	('Cong002',12,'Ql02',260,40000,500000,1000000,null)
INSERT INTO ChamCong
VALUES
	('Cong003',12,'QL03',250,40000,null,500000, 1500000)
INSERT INTO ChamCong
VALUES
	('Cong004',12,'QL04',260,40000,500000,1000000,null)
INSERT INTO ChamCong
VALUES
	('Cong005',12,'QL05',250,40000,null,1000000, null)
INSERT INTO ChamCong
VALUES
	('Cong006',12,'QL06',260,40000,500000,1000000, null)
INSERT INTO ChamCong
VALUES
	('Cong007',12,'QL07',250,40000,null,500000, null)
INSERT INTO ChamCong
VALUES
	('Cong008',12,'QL08',250,40000,null,500000, 3500000)
INSERT INTO ChamCong
VALUES
	('Cong009',12,'QL09',260,40000,500000,1000000, null)
INSERT INTO ChamCong
VALUES
	('Cong010',12,'NV01',250,40000,null,null,null)
INSERT INTO ChamCong
VALUES
	('Cong011',12,'NV02',72,22000,null,null,null) --tuần làm 18 giờ=> 4tuan làm 72gio
INSERT INTO ChamCong
VALUES
	('Cong012',12,'NV03',240,40000,null,null, 1500000)
INSERT INTO ChamCong
VALUES
	('Cong013',12,'NV04',250,40000,100000,null,2500000)
INSERT INTO ChamCong
VALUES
	('Cong014',12,'NV05',260,40000,100000,null,1000000)
INSERT INTO ChamCong
VALUES
	('Cong015',12,'NV06',101,22000,100000,null,null)
INSERT INTO ChamCong
VALUES
	('Cong016',12,'NV07',250,40000,null,null,500000)
INSERT INTO ChamCong
VALUES
	('Cong017',12,'NV08',112,22000,100000,null,null)
INSERT INTO ChamCong
VALUES
	('Cong018',12,'NV09',120,22000,100000,null,200000)
INSERT INTO ChamCong
VALUES
	('Cong019',12,'NV10',250,40000,null,null,null)
INSERT INTO ChamCong
VALUES
	('Cong020',12,'NV11',260,40000,100000,null,null)
INSERT INTO ChamCong
VALUES
	('Cong021',12,'NV12',104,22000,100000,null,null)
INSERT INTO ChamCong
VALUES
	('Cong022',12,'NV13',260,40000,100000,null,1500000)
INSERT INTO ChamCong
VALUES
	('Cong023',12,'NV14',184,22000,100000,null,1000000)
INSERT INTO ChamCong
VALUES
	('Cong024',12,'NV15',250,40000,null,null,null)
INSERT INTO ChamCong
VALUES
	('Cong025',12,'NV16',136,22000,100000,null,null)
INSERT INTO ChamCong
VALUES
	('Cong026',12,'NV17',258,40000,100000,null,1000000)
INSERT INTO ChamCong
VALUES
	('Cong027',12,'NV18',132,22000,100000,null,null)

