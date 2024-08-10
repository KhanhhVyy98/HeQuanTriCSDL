-- Tạo login quanly và user QL01
create login quanly with password ='quanly',default_database = [MQvaKV_QLNS_TL]
create user QL01 for login quanly

-- cấp quyền cho QL01 trên các bảng NhanVien,ChamCong
GRANT all -- cấp tất cả quyền trên bảng NhanVien cho quản lý
on NhanVien
To QL01

grant update -- cấp quyền cập nhật thông tin chấm công trên bảng chấm công cho quản lý
on ChamCong
To QL01

--tạo login nhanvien và user NV01 
create login NhanVien with password ='nhanvien',default_database = [MQvaKV_QLNS_TL]
create user NV01 for login NhanVien

--cấp quyền xem cho NV01 trên bảng NhanVien,ChamCong
GRANT select
on NhanVien
to NV01

GRANT select
on ChamCong
to NV01

