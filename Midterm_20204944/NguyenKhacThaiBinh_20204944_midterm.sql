-- MSSV: 20204944
-- Ho va ten: Nguyen Khac Thai Binh
CREATE TABLE Giangvien(
  GV# VARCHAR(5) PRIMARY Key  ,
  HoTen varchar(30),
  Namsinh int,
  Diachi varchar(50)
  );
 CREATE TABLE detai(
   DT# VARCHAR(5) PRIMARY Key ,
   tenDT varchar(50),
   Theloai varchar(20)
   );
 CREATE TABLE Sinhvien(
   SV# VARCHAR(5) PRIMARY Key ,
   tensv varchar(30),
   Ngaysinh DATE,
   QUequan varchar(20),
   Lop varchar(20)
   );
CREATE TABLE HuongDan (
	GV# VARCHAR(5)  FOREIGN KEY REFERENCES Giangvien(GV#),
	DT# VARCHAR(5)  FOREIGN KEY REFERENCES detai(DT#),
	SV# VARCHAR(5)  FOREIGN KEY REFERENCES Sinhvien(SV#),
	NamThucHien integer,
	KetQua numeric);
-- tạo dữ liệu:
insert into Giangvien(GV#, Hoten, Namsinh, Diachi) values
('GV001','Nguyen Văn A',1990,'Ha Noi'),
('GV002','Nguyen Khac B',1991,'Ha Nam'),
('GV003','Nguyen Văn Thuy',1993,'Nam Đnh'),
('GV004','Nguyen Thi Hà',1992,'Hai Phong'),
('GV005','Nguyen Văn Dũng',1991,'Hưng Yen'),
('GV006','Nguyen Văn Xuân',1991,'Huế'),
('GV007','Nguyen Xuân Bac',1998,'Hai Dương'),
('GV008','Tran Lam Quan',1992,'Quang Binh'),
('GV009','Nguyen Thi Binh',1989,'Quang Tri'),
('GV010','Tran Văn Nam',1992,'Quang Nam'),
('GV011','Ngô Thi Hao',1996,'Thanh Hoa'),
('GV012','Pham Phương Anh',1994,'Hải Dương')

insert into detai(DT#, tenDT, Theloai) values
('DT001','mat ma','ung dung'),
('DT002','tri tue nhan tao','ung dung'),
('DT003','lap trinh web','phan mem'),
('DT004','lap trinh nhung','phan mem'),
('DT005','nha thong minh','ung dung'),
('DT006','bao mat','ung dung'),
('DT007','phan tich du lieu','ung dung'),
('DT008','chung khoan','ung dung'),
('DT009','bat dong san','phan mem'),
('DT010','quan ly duong di','ung dung')

insert into Sinhvien(SV#, tensv, Ngaysinh,QUequan,Lop) values
('SV001','Lê Minh','2003/11/6','Hai Phong','may tinh'),
('SV002','Nguyen A','2003/12/7','Hai Duong','dien'),
('SV003','Nguyen Xuan Dung','1991/11/13','Ha Noi','may tinh'),
('SV004','Nguyen Van Nam','2000/10/6','Bac Giang','may tinh'),
('SV005','Nguyen Van Nam','1999/11/6','Hai Phong','may tinh'),
('SV006','Nguyen Cuong','1998/2/27','Hai Duong','may tinh'),
('SV007','Lê Binh','1993/11/6','Ha Nam','may tinh'),
('SV008','Lê Bảo','1994/7/6','Nam Dinh','may tinh'),
('SV009','Lê Thi Hao','1995/10/6','Yen Bai','may tinh'),
('SV010','Tran Van Binh','2002/2/28','Hung Yen','may tinh'),
('SV011','Dinh Minh','2002/8/3','Ha Noi','ngoai ngu'),
('SV012','Ngo Linh','2003/11/6','Hai Phong','may tinh'),
('SV013','Nguyen Binh Duong','2003/1/6','Hai Phong','may tinh'),
('SV014','Vo Sau','1993/11/7','Bac Ninh','may tinh'),
('SV015','Pham Bich Phuong','1994/10/10','Bac Ninh','dien tu')

-- dua ra thong tin giang vien co ma "GV001"
SELECT *
FROM Giangvien
WHERE GV# = 'GV001'
-- bao nhieu de tai thuoc "ung dung"
SELECT COUNT(Theloai)
FROM detai
WHERE Theloai = 'ung dung';

SELECT count(*) as SoLuongSV from Sinhvien 
join HuongDan on Sinhvien.SV# = HuongDan.SV#
WHERE HuongDan.GV# = 'GV012' AND Sinhvien.QUequan = N'Hải Phòng';

-- cap nhat ngay sinh
 UPDATE Sinhvien SEt Ngaysinh = '1991/11/12' 
 WHERE tensv = 'Nguyen Xuan Dung' AND QUequan = 'Ha Noi' ;

--xoá thông tin sinh vien "Nguyen van nam" và que quan 'bac giang'
delete from Sinhvien where tensv='Nguyen Van Nam' AND QUequan = 'Bac Giang';

select DeTaiHuongDan.DeTai from DeTaiHuongDan
where NamThucHien = 2022
group by DeTaiHuongDan.DeTai;
--sao lưu và khôi phục









