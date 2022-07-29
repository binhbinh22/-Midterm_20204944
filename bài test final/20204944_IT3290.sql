--# Date: 28.02.2022
--#Class ID:  VN 02 K65
--#Student ID: 20204944
--#Student Name: Nguyen Khac Thai Binh 
--#Source File: NguyenKhacThaiBinh_20204944_IT3290.sql
CREATE TABLE sanbay (
    maSB varchar(30) Primary key,
    ten varchar(30),
    thanhpho varchar(30),
    quocgia varchar(30)
);
create table chuyen_bay (
    maCB varchar(20) PRIMARY KEY ,
    sb_di varchar(20),
    gio_di varchar(10),
    ngay_di date,
    sb_den varchar(20),
    gio_den varchar(10),
    ngay_den date,
    so_cho int
    );
CREATE TABLE khachhang (
  maKH varchar(30) primary key,
  ten varchar(30),
  diachi varchar(30),
  sdt varchar(30)
 );
 

 CREATE TABLE datcho (
   maCB varchar(20) FOREIGN KEY REFERENCES chuyen_bay(maCB),
   maKH varchar(30) FOREIGN KEY REFERENCES khachhang(maKH),
   thoigiandat DATE,
   PRIMARY KEY(maCB,maKH)
 );
 

Insert into sanbay (maSB, ten, thanhpho, quocgia) 
VALUES
 ('SB001',N'Nội Bài', N'Hà Nội', N'Việt Nam'),
 ('SB002',N'Ukulele', N'Băng Cốc', N'Thái Lan'),
 ('SB003',N'Playku',N'Đăk Lăk',N'Việt Nam'),
 ('SB004',N'Tân Sơn Nhất', N'TP.HCM', N'Việt Nam'),
 ('SB005',N'losAngles',N'losangles',N'My')
 
 insert into chuyen_bay(maCB,sb_di,gio_di,ngay_di,sb_den,gio_den,ngay_den,so_cho) values
('A1','B1','7:00','2022-01-10','B3','11:30','2022-01-10',120),
 ('A2','B1','8:00','2021-02-11','B3','12:30','2021-02-11',120),
 ('A3','B1','9:00','2021-03-12','B3','13:30','2021-03-12',120),
 ('A4','B2','7:30','2020-03-13','B1','11:30','2020-03-13',120),
 ('A5','B2','15:00','2020-05-14','B1','19:30','2020-05-14',120),
 ('A6','B2','19:00','2022-06-15','CB3','23:00','2022-06-15',120),
 ('A7','B3','17:00','2019-07-16','B2','19:30','2019-07-16',120),
 ('A8','B3','13:00','2019-08-17','B1','18:30','2019-08-17',120),
 ('A9','B3','5:00','2018-09-18','B4','11:30','2018-09-18',120),
 ('A10','B4','0:00','2025-10-19','B2','5:30','2022-10-19',120)
 
 INSERT INTO khachhang(maKH,ten,diachi,sdt) VALUES
 ('KH001','Binh','Ha Noi','0983765462'),
 ('KH002','Minh','Ha Noi','0983765456'),
 ('KH003','Dat','Hai Phong','0983758762'),
 ('KH004','Thai','Nam Dinh','0923765462'),
 ('KH005','Mai','Ha Nam','0124765462'),
 ('KH006','Tien','Ha Giang','0983230462'),
 ('KH007','Phuong','Hai Duong','0103765462'),
 ('KH008','Linh','Hue','0929065462'),
 ('KH009','Anh','Da Nang','0982905462'),
 ('KH010','An','Ha Noi','0981567462'),
 ('KH011','Huy','Ha Noi','0190765462'),
 ('KH012','Ha','Thanh Hoa','0928065462'),
 ('KH013','Van','Vinh Phuc','0190765462'),
 ('KH014','Thuy','Hung Yen','0983098462'),
 ('KH015','Chuc','Bac Ninh','0983167482')
 
insert into datcho(maCB,maKH,thoigiandat) values
('KH001', 'A1','2022-01-05'),
('KH002', 'A2','2021-02-06'),
('KH003', 'A3','2021-03-07'),
('KH004', 'A4','2020-03-08'),
('KH005', 'A5','2020-05-11'),
('KH006', 'A6','2022-06-10'),
('KH007', 'A7','2019-07-11'),
('KH008', 'A8','2019-08-12'),
('KH009', 'A9','2018-09-13'),
('KH0010', 'A10','2025-10-14'),
('KH0011', 'A1','2022-01-05'),
('KH0012', 'A2','2021-02-06'),
('KH0013', 'A3','2021-03-07'),
('KH0014', 'A4','2020-03-08'),
('KH0015', 'A5','2020-05-11')
 
 
 --------------------- 2 ---------------------
--- a ---
select chuyen_bay.maCB, chuyen_bay.sb_di, chuyen_bay.gio_di, chuyen_bay.ngay_di,
chuyen_bay.sb_den, chuyen_bay.gio_den, chuyen_bay.ngay_den, chuyen_bay.so_cho 
from chuyen_bay join sanbay on chuyen_bay.sb_di = sanbay.maSB
where sanbay.ten = 'Noi Bai' and chuyen_bay.ngay_di = '06-12-2021';

--- b ---
select sanbay.maSB, sanbay.ten, sanbay.thanhpho, sanbay.quocgia 
from sanbay join chuyen_bay on chuyen_bay.sb_di = sanbay.maSB
where chuyen_bay.ngay_di != '06-12-2021' and chuyen_bay.ngay_den != '06-12-2021';

--- c ---
select khachhang.maKH, khachhang.ten, khachhang.diachi, khachhang.sdt, count(datcho.maKH) as so_shuyen_bay
from khachhang join datcho on khachhang.maKH = datcho.maKH;

--- d ---
select datcho.maCB, count(datcho.maCB) as so_cho_dat from datcho group by datcho.maCB;
 
--------------------- 3 ---------------------
go
create view dbo.chuyen_bay_kh 
with schemabinding
as
( select khachhang.maKH, chuyen_bay.maCB, chuyen_bay.sb_di, chuyen_bay.gio_di, chuyen_bay.ngay_di,
  chuyen_bay.sb_den, chuyen_bay.gio_den, chuyen_bay.ngay_den, chuyen_bay.so_cho 
  from dbo.chuyen_bay join dbo.datcho on chuyen_bay.maCB = datcho.maCB
  join dbo.khachhang on datcho.maKH = khachhang.maKH
);
go

--------------------- 4 ---------------------
select * from chuyen_bay_kh
where year(chuyen_bay_kh.ngay_di) = '2021';
