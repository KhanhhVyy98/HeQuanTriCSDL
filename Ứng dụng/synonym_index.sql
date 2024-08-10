-- tên bí danh cho bảng NhanVien theo tiếng Anh là staff
create synonym staff for NhanVien


select *
from staff

-- 5 nhân viên có số giờ làm việc lớn nhất được xem là nhân viên ưu tú
create synonym NhanVienUuTu for sp_Top5

exec NhanVienUuTu



--Tạo index trên MaCN của bảng ChiNhanh
create index MaCN on ChiNhanh(MaCN)


select *
from ChiNhanh with (index(MaCN))
where MaCN = 'HN01'


--tạo index số giờ làm việc của bảng ChamCong
create index SoGioLamViec on ChamCong(SoGioLamViec)

select ChamCong.*, NhanVien.HoNV + ' ' + NhanVien.TenNV as HoTenNV
from ChamCong with (index(SoGioLamViec))
join NhanVien on NhanVien.MaNV = ChamCong.MaNV
where SoGioLamViec = 250