--viết hàm xem lương của nhân viên khi nhập mã nhân viên
Create function F_Luong (@maNV nchar(10))
returns money
as
begin
	declare @kq money
	set @kq = 0
	select @kq= SoGioLamViec * TienLuongTheoGio + TienPC + TienThuong - TamUng
	from ChamCong
	join NhanVien on NhanVien.MaNV = ChamCong.MaNV
	where NhanVien.MaNV = @maNV
	return @kq
end

print dbo.F_Luong ('QL01')

--tạo function cho biết số lượng nhân viên của một chi nhánh ở H&M
--với mã chi nhánh là tham số truyền vào
create function f_SLNV (@macn nchar(20))
returns int  as
begin
	declare @sl int;
	select @sl = count(NhanVien.MaCN) 
	from NhanVien 
	where @macn = NhanVien.MaCN
	return @sl;
end

print dbo.f_SLNV ('HCM08')
