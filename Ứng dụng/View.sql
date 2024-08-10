--Tạo danh sách nhân viên nữ với các thông tin: Mã nhân viên, Họ, Tên, Ngày sinh, Giới tính, Địa chỉ thuộc các chi nhánh của cửa hàng H&M
create view vw_DSNV_Nu  as
select MaNV, HoNV, TenNV, NgaySinh, GioiTinh, DiaChi
from NhanVien
where GioiTinh = N'Nữ'

--tạo view nhân viên có độ tuổi trên 25 và là nhân viên làm full-time 
create view vw_fulltime as
select NhanVien.MaNV,HoNV + ' ' + TenNV as HoTenNV ,NgaySinh, HinhThucLamViec.MaHTLV
from  NhanVien, HinhThucLamViec
where HinhThucLamViec.MaHTLV = N'Fulltime'

--tạo view cho biết số lượng nhân viên theo từng giới tính ở mỗi chi nhánh
create view vw_SLNV as
select NhanVien.MaNV, GioiTinh, count(MaNV) as Soluongnhanvien
from NhanVien, ChiNhanh
where NhanVien.MaCN = ChiNhanh.MaCN
group by NhanVien.MaNV, GioiTinh, ChiNhanh.MaCN

--Tạo view cho biết nhân viên không thuộc chi nhánh Đà Nẵng
create view vw_DaNang as
select NhanVien.MaNV,HoNV, TenNV, NgaySinh, GioiTinh,DiaChi, Email, NhanVien.MaCN
from NhanVien, ChiNhanh
where NhanVien.MaCN = ChiNhanh.MaCN and NhanVien.MaCN not in (select MaCN from ChiNhanh where DiaChiCN = N'%Đà Nẵng' )
