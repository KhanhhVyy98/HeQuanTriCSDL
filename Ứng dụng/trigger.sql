-- Khi thêm thông tin nhân viên mới vào làm, nhân viên đó phải có MaNV không được trùng với MaNV khác

/* tạo bảng test riêng trigger */
CREATE TABLE test_NhanVien
(
	MaNV nchar(10) not null ,
	HoNV nvarchar(30),
	TenNV nvarchar(30),
	GioiTinh nvarchar(10),
	NgaySinh datetime,
	DienThoai nvarchar(12),
	DiaChi nvarchar(100),
	Email nvarchar(50),
	NgayVaoLam datetime,
	MaCN nvarchar(20) not null ,
	MaCV nchar(10) not null,
	MaHTLV nchar(10) not null ,
	MaLuong nvarchar(10) not null ,
	MaPC nvarchar(20) not null ,
	MaThuong nvarchar(20) not null 
)

INSERT INTO test_NhanVien
VALUES ('QL01',N'Nguyễn',N'Anh Chi',N'Nữ',Convert(datetime,'1989-04-05'),'092989787',N'Lô D,phòng 18,Chung cư Thanh Đa,Thành phố Hà Nội','anhchiqlh&m@gmail.com',Convert(datetime,'2020-10-30'),'HN01','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('QL02',N'Lê',N'Minh Tùng',N'Nam',Convert(datetime,'1985-12-05'),'092678687',N'85 Nguyễn Du,Thành phố Hà Nội','minhtungqlh&m@gmail.com',Convert(datetime,'2019-01-01'),'HN02','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('QL03',N'Nguyễn',N'Minh Vũ',N'Nam',Convert(datetime,'1991-12-30'),'0909875632',N'178/97 An Dương Vương, Thành phố Hà Nội','minhvuqlh&m@gmail.com',Convert(datetime,'2018-06-05'),'HN03','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('QL04',N'Mai',N'Minh Mẫn',N'Nam',Convert(datetime,'1990-07-03'),'098789756',N'78/12/8 Phan Đình Phùng,Thành phố Hà Nội','minhmanqlh&m@gmail.com',Convert(datetime,'2020-05-26'),'HN04','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('QL05',N'Trần',N'Việt Bảo Hoàng',N'Nam',Convert(datetime,'1991-08-25'),'0982456987',N'87/5 Ngô Quyền,Thành phố Đà Nẵng','baohoangqlh&m@gmail.com',convert(datetime,'2018-08-09'),'DN05','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('QL06',N'Phạm',N'Kim Dung',N'Nữ',Convert(datetime,'1979-02-16'),'097586123',N'34 Nguyễn Sơn,Phường Phú Thọ Hòa,Quận Tân Phú, Thành phố Hồ Chí Minh','dungphamqlh&m@gmail.com',convert(datetime,'2019-02-09'),'HCM06','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('QL07',N'Vương',N'Thị Mỹ Huệ',N'Nữ',Convert(datetime,'1981-05-19'),'0354846123',N'480 Nguyễn Thị Thập ,Phường Tân Quy,Quận 7, Thành phố Hồ Chí Minh','myhueqlh&m@gmail.com',convert(datetime,'2017-01-31'),'HCM07','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('QL08',N'Trần',N'Ngọc Huyền',N'Nữ',Convert(datetime,'1983-02-28'),'0356852146',N'40 Phạm Hồng Thái,Phường Bến Thành,Quận 1, Thành phố Hồ Chí Minh','huyentranqlh&m@gmail.com',convert(datetime,'2017-05-04'),'HCM08','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('QL09',N'Nguyễn',N'Đình Thắng',N'Nam',Convert(datetime,'1986-08-29'),'0914569852',N'83 Xa Lộ Hà Nội,Phường Thảo Điền,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','thangnguyenqlh&m@gmail.com',convert(datetime,'2022-05-13'),'HCM09','QL','Fulltime',N'LuongFT',N'Ngày lễ',N'Hoàn thành xuất sắc')
INSERT INTO test_NhanVien
VALUES
	('NV01',N'Nguyễn',N'Đình Hiếu',N'Nam',Convert(datetime,'2000-01-20'),'0862139838',N'29 La Thành,Phường Ô Chợ Dừa,Quận Đống Đa, Thành phố Hà Nội','dinhhieuh&m@gmail.com',Convert(datetime,'2020-10-03'),'HN02','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV02',N'Lê',N'Dương Bảo Lâm',N'Nam',Convert(datetime,'1999-12-09'),'0909092648',N'178 Tây Sơn,Phường Trung Liệt,Quận Đống Đa, Thành phố Hà Nội','baolamh&m@gmail.com',Convert(datetime,'2019-11-30'),'HN02','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV03',N'Kiều',N'Minh Tuấn',N'Nam',Convert(datetime,'2001-08-30'),'02899995555',N'112 đường Lê Lợi,Phường Nguyễn Trãi,Quận Hà Đông,Thành phố Hà Nội','minhtuanh&m@gmail.com',Convert(datetime,'2021-09-02'),'HN01','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV04',N'Nguyễn',N'Thanh Tùng',N'Nam',Convert(datetime,'2000-04-06'),'02462660198',N'197 Quang Trung,Phường Hà Cầu,Quận Hà Đông, Thành phố Hà Nội','thanhtuanh&m@gmail.com',Convert(datetime,'2018-08-15'),'HN01','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV05',N'Nguyễn',N'Thị Ngọc Trinh',N'Nữ',Convert(datetime,'1995-05-26'),'0902880791',N'24 Lê Trọng Tấn,Phường Khương Mai, Quận Thanh Xuân, Thành phố Hà Nội','trinhnguyenh&m@gmail.com',Convert(datetime,'2020-10-01'),'HN03','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV06',N'Nguyễn',N'Việt Hoàng',N'Nam',Convert(datetime,'2003-12-28'),'0923457211',N'81 Lê Văn Lương,Phường Nhân Chính,Quận Thanh Xuân, Thành phố Hà Nội','viethoangh&m@gmail.com',Convert(datetime,'2020-01-10'),'HN03','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV07',N'Trịnh',N'Trần Phương Tuấn',N'Nam',Convert(datetime,'2004-03-03'),'0356889521',N'2A Đại Cồ Việt,Phường Lê Đại Hành, Quận Hai Bà Trưng, Thành phố Hà Nội','phuongtuanh&m@gmail.com',Convert(datetime,'2020-02-03'),'HN04','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV08',N'Trần',N'Minh Hiếu',N'Nam',Convert(datetime,'1999-04-18'),'0236541223',N'18 Tam Trinh,Phường Minh Khai,Quận Hai Bà Trưng, Thành phố Hà Nội','hieutranh&m@gmail.com',Convert(datetime,'2020-01-01'),'HN04','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV09',N'Hoàng',N'Thái Vũ',N'Nam',Convert(datetime,'2002-03-05'),'0725632112',N'472 Điện Biên Phủ,Phường Thanh Khê Đông,Quận Thanh Khê, Thành phố Đà Nẵng','vuh&m@gmail.com',Convert(datetime,'2020-05-01'),'DN05','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV10',N'Nguyễn',N'Hoàng Long',N'Nam',Convert(datetime,'1997-08-27'),'0896325451',N'151 Điện Biên Phủ,Phường Chính Gián,Quận Thanh Khê, Thành phố Đà Nẵng','hoanglongh&m@gmail.com',Convert(datetime,'2017-01-03'),'DN05','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES
	('NV11',N'Nguyễn',N'Anh Tuấn',N'Nam',Convert(datetime,'2000-07-03'),'0969523102',N'344 Nguyễn Sơn,Phường Phú Thọ Hòa,Quận Tân Phú,Thành phố Hồ Chí Minh','anhtuanh&m@gmail.com',Convert(datetime,'2018-10-30'),'HCM06','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV12',N'Vũ',N'Đức Thiện',N'Nam',Convert(datetime,'2003-03-12'),'0987456321',N' 300 Tân Sơn Nhì,Phường Tân Sơn Nhì,Quận Tân Phú,Thành phố Hồ Chí Minh','ducthienh&m@gmail.com',Convert(datetime,'2021-10-30'),'HCM06','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV13',N'Hoàng',N'Lâm Trang Anh',N'Nữ',Convert(datetime,'2000-08-06'),'0982926544',N'31, Khu phố Mỹ Hoàng,Phường Tân Phong,Quận 7,Thành phố Hồ Chí Minh','tranganhh&m@gmail.com',Convert(datetime,'2019-12-01'),'HCM07','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV14',N'Nguyễn',N'Ngọc Minh Huy',N'Nam',Convert(datetime,'1998-04-27'),'0937856962',N'542 Trần Hưng Đạo,Phường 1,Quận 5,Thành phố Hồ Chí Minh','minhhuyh&m@gmail.com',Convert(datetime,'2020-03-01'),'HCM07','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV15',N'Ngô',N'Thành Dương',N'Nam',Convert(datetime,'2001-09-26'),'0374569223',N'163 Nguyễn Văn Cừ,Phường Nguyễn Cư Trinh,Quận 1,Thành phố Hồ Chí Minh','thanhduongh&m@gmail.com',Convert(datetime,'2020-01-05'),'HCM08','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV16',N'Nguyễn',N'Kiều Cẩm Thơ',N'Nữ',Convert(datetime,'2003-01-14'),'0908223349',N'66 Phó Đức Chính,Phường Nguyễn Thái Bình, Quận 1,Thành phố Hồ Chí Minh','camthoh&m@gmail.com',Convert(datetime,'2021-06-01'),'HCM08','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV17',N'Phạm',N'Anh Quân',N'Nam',Convert(datetime,'1997-02-07'),'0162566674',N'33A Trần Não,Phường Bình An,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','quanaph&m@gmail.com',Convert(datetime,'2018-02-02'),'HCM09','NV','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')
INSERT INTO test_NhanVien
VALUES	
	('NV18',N'Lê',N'Trung Thành',N'Nam',Convert(datetime,'1999-10-15'),'0927894523',N'13B Nguyễn Thị Định,Phường An Phú,Thành phố Thủ Đức,Thành phố Hồ Chí Minh','trungthanhh&m@gmail.com',Convert(datetime,'2020-01-01'),'HCM09','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành tốt')


/* tạo trigger */ 
CREATE TRIGGER tg_iMaNV
ON test_NhanVien
FOR insert
AS
BEGIN
	DECLARE @mnv nchar(10)
	select @mnv = MaNV from inserted
	declare @temp int 
	select @temp = count (*) from test_NhanVien Where MaNV = @mnv
	if ((@mnv is null ) or (@temp= 2))
	begin 
		PRINT N' Nhập mã Nhân Viên bị trùng'
		ROLLBACK
	END
END

-- Nhập dữ liệu hợp lệ
INSERT INTO test_NhanVien
VALUES ('NV19',N'Tống',N'Lê Thiên Lộc',N'Nam',Convert(datetime,'2003-10-11'),'0908998843',N'49 Trần Hưng Đạo, Phường Cô Giang, Quận 1,Thành phố Hồ Chí Minh','tongloch&m@gmail.com',Convert(datetime,'2022-10-01'),'HCM09','NV','Parttime',N'LuongPT', N'Ngày lễ',N'Hoàn thành xuất sắc')

select *
from test_NhanVien
where MaNV = 'NV19'

-- Nhập dữ liệu không hợp lệ
INSERT INTO test_NhanVien
VALUES ('QL01',N'Bùi',N'Huy Hoàng',N'Nam',Convert(datetime,'1995-12-02'),'0369744258',N'Số 6 ngõ 71 Trần Quang Diệu, Quận Đống Đa,Thành phố Hà Nội','buihhoangqlh&m@gmail.com',Convert(datetime,'2016-05-01'),'HN01','QL','Fulltime',N'LuongFT', N'Ngày lễ',N'Hoàn thành tốt')

select *
from test_NhanVien
where MaNV = 'QL01'

--Khi xóa thông tin một nhân viên, các thông tin trong bảng chấm công có liên quan cũng bị xóa bỏ.
CREATE TABLE test_ChamCong
(
	MaCong nchar(20) not null,
	Thang int not null,
	MaNV nchar(10) not null, -- Constraint FK_test_ChamCong_MaNV Foreign Key (MaNV) references test_NhanVien(MaNV)
	SoGioLamViec int,
	TienLuongTheoGio float,
	TienPC float,
	TienThuong float,
	TamUng float
)

INSERT INTO test_ChamCong
VALUES
	('Cong001',12,'QL01',260,40000,500000,1000000, 2000000)--làm 26 ngày(có 1 ngày lễ) ngày làm 10 tiếng nên tổng số giờ làm là 260 giờ ,lương 40k/h,PC,thưởng,tạm ứng.
INSERT INTO test_ChamCong
VALUES	
	('Cong002',12,'Ql02',260,40000,500000,1000000,null)
INSERT INTO test_ChamCong
VALUES
	('Cong003',12,'QL03',250,40000,null,500000, 1500000)
INSERT INTO test_ChamCong
VALUES
	('Cong004',12,'QL04',260,40000,500000,1000000,null)
INSERT INTO test_ChamCong
VALUES
	('Cong005',12,'QL05',250,40000,null,1000000, null)
INSERT INTO test_ChamCong
VALUES
	('Cong006',12,'QL06',260,40000,500000,1000000, null)
INSERT INTO test_ChamCong
VALUES
	('Cong007',12,'QL07',250,40000,null,500000, null)
INSERT INTO test_ChamCong
VALUES
	('Cong008',12,'QL08',250,40000,null,500000, 3500000)
INSERT INTO test_ChamCong
VALUES
	('Cong009',12,'QL09',260,40000,500000,1000000, null)
INSERT INTO test_ChamCong
VALUES
	('Cong010',12,'NV01',250,40000,null,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong011',12,'NV02',72,22000,null,null,null) --tuần làm 18 giờ=> 4tuan làm 72gio
INSERT INTO test_ChamCong
VALUES
	('Cong012',12,'NV03',240,40000,null,null, 1500000)
INSERT INTO test_ChamCong
VALUES
	('Cong013',12,'NV04',250,40000,100000,null,2500000)
INSERT INTO test_ChamCong
VALUES
	('Cong014',12,'NV05',260,40000,100000,null,1000000)
INSERT INTO test_ChamCong
VALUES
	('Cong015',12,'NV06',101,22000,100000,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong016',12,'NV07',250,40000,null,null,500000)
INSERT INTO test_ChamCong
VALUES
	('Cong017',12,'NV08',112,22000,100000,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong018',12,'NV09',120,22000,100000,null,200000)
INSERT INTO test_ChamCong
VALUES
	('Cong019',12,'NV10',250,40000,null,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong020',12,'NV11',260,40000,100000,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong021',12,'NV12',104,22000,100000,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong022',12,'NV13',260,40000,100000,null,1500000)
INSERT INTO test_ChamCong
VALUES
	('Cong023',12,'NV14',184,22000,100000,null,1000000)
INSERT INTO test_ChamCong
VALUES
	('Cong024',12,'NV15',250,40000,null,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong025',12,'NV16',136,22000,100000,null,null)
INSERT INTO test_ChamCong
VALUES
	('Cong026',12,'NV17',258,40000,100000,null,1000000)
INSERT INTO test_ChamCong
VALUES
	('Cong027',12,'NV18',132,22000,100000,null,null)

--tạo trigger
create trigger tg_xoaNV
on test_NhanVien
for delete
as
	declare @nv nchar (6)
	select @nv = MaNV from deleted
	delete
	from test_ChamCong
	where MaNV = @nv
	print N'dữ liệu đã được xóa'

-- xóa nv mã QL01
delete test_NhanVien 
where test_NhanVien.MaNV = 'QL01'

--kiểm tra dữ liệu trên bảng test_ChamCong
select * from test_ChamCong where MaNV = 'QL01'

