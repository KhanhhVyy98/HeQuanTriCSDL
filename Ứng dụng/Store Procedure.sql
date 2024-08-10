--1. lập danh sách nhân viên làm part-time làm việc trong ngày lễ
create proc sp_NgayLe as
begin
	select NhanVien.MaNV, HoNV, TenNV, NgaySinh,GioiTinh, DiaChi,HinhThucLamViec.MaHTLV, PhuCap.MaPC
	from NhanVien, HinhThucLamViec, PhuCap
	where  NhanVien.MaHTLV = HinhThucLamViec.MaHTLV and  NhanVien.MaPC = PhuCap.MaPC and PhuCap.MaPC is not null
end

exec sp_NgayLe

--2. Viết SP dùng để cập nhật tên chi nhánh
create proc sp_CapNhatCN(@maCn nchar(20), @tenCn nvarchar(30) )
as
update  ChiNhanh  set TenCN = @tenCn 
where MaCN = @maCn

exec dbo.sp_CapNhatCN'HN01',N'H&M Fashion & Style'

select*
from ChiNhanh

--3. Viết SP xem thông tin của một chi nhánh
create proc sp_CN @ma nchar(20)
as
select*
from ChiNhanh
where MaCN = @ma

exec sp_CN 'HN01'

--4.tạo sp cho biết danh sách 5 nhân viên có số giờ làm việc lớn nhất
create proc sp_Top5 as
begin 
	SELECT TOP (5)NhanVien.MaNV,NhanVien.HoNV,NhanVien.TenNV,NhanVien.GioiTinh,NhanVien.MaCV,NhanVien.MaCN,NhanVien.MaHTLV,ChamCong.SoGioLamViec
	FROM NhanVien
	left join ChamCong on NhanVien.MaNV = ChamCong.MaNV
	ORDER BY SoGioLamViec DESC
end 

exec sp_Top5 

--5.tạo sp cho biết hình thức làm việc và chi nhánh khi biết mã nhân viên 
create proc sp_HTLV_CNNV @ma nchar(10)
as
begin
	select NhanVien.MaNV,NhanVien.HoNV,NhanVien.TenNV,NhanVien.GioiTinh,NhanVien.MaCN,ChiNhanh.DiaChiCN,NhanVien.MaHTLV
	from NhanVien
	left join ChiNhanh on NhanVien.MaCN = ChiNhanh.MaCN
	where NhanVien.MaNV = @ma
end

declare @manhanvien nchar(10)
set @manhanvien = 'QL02'
exec sp_HTLV_CNNV @manhanvien

exec sp_HTLV_CNNV 'NV02'

--6.tạo sp xem số giờ làm việc của 1 nhân viên khi biết mã nhân viên 
create proc sp_ChamCongNV @ma nchar(10)
as
	select NhanVien.MaNV,NhanVien.HoNV,NhanVien.TenNV,NhanVien.GioiTinh,NhanVien.MaCV,NhanVien.MaCN,NhanVien.MaHTLV,ChamCong.SoGioLamViec
	from NhanVien 
	left join ChamCong on NhanVien.MaNV = ChamCong.MaNV
	where NhanVien.MaNV = @ma

declare @manhanvien nchar(10)
set @manhanvien = 'NV13'
exec sp_ChamCongNV @manhanvien
