use QUANLYKHACHSAN
go
create table KHACHHANG(
MaKH char(10) not null primary key,
HOTEN nvarchar(50) not null,
NS date,
GT bit,
CMND char(20),
DT char(10),
DC nvarchar(50))
go 
create table NHANVIEN(
MANV char(10) not null primary key,
HOTEN nvarchar(50) not null,
NS date,
GT bit,
CMND char(20),
MANQL char(10),
MAPB char(10))
go 
create table PHONG(
SOPHONG char(10) not null primary key,
LOAIPHONG nvarchar(10),
GIA numeric(9),
TINHTRANG nvarchar(10))
go
create table PHIEUDATPHONG(
MAPDP char(10) not null primary key,
TGDAT date,
TGNHAN date,
TGTRAPHONG DATE,
TINHTRANGTT NVARCHAR(10),
SOPHONG char(10),
MANV CHAR(10),
MAKH CHAR(10),
MA_PSDDV CHAR(10),
MAPH CHAR(10))
GO 
CREATE TABLE HOADON(
MAHD CHAR(10) NOT NULL PRIMARY KEY,
NGAYLAP DATE ,
GIA_PHONG numeric(9),
GIA_DV numeric(9),
THANHTIEN numeric(9),
TINHTRANGTT NVARCHAR(10),
PHUONGTHUCTT NVARCHAR(10),
MAPDP CHAR(10))
GO 
CREATE TABLE DICHVU(
MADV CHAR(10) NOT NULL PRIMARY KEY,
TENDV NVARCHAR NOT NULL,
GIA numeric(9))
GO 
CREATE TABLE THIETBI(
MATP CHAR(10) PRIMARY KEY,
TEN NVARCHAR(50) NOT NULL,
SOLUONG numeric(3),
TINHTRANG NVARCHAR(10),
SOPHONG char(10),
MAPP CHAR(10))
GO 
CREATE TABLE PHIEUPHAT(
MAPP CHAR(10) PRIMARY KEY,
MAPDP CHAR(10),
LYDO NVARCHAR(50),
MUCPHAT numeric(9))
GO 
CREATE TABLE PHONGBAN(
MAPB CHAR(10) PRIMARY KEY,
TENPB NVARCHAR(50) NOT NULL,
MATP CHAR(10))
GO 
CREATE TABLE DOANHTHU(
NGAY DATE PRIMARY KEY,
THUNHAP numeric(12),
MAHD CHAR(10))
GO
CREATE TABLE HUYDK(
MAPH CHAR(10) PRIMARY KEY,
LYDO NVARCHAR(10),
TG DATE)
GO
CREATE TABLE PHIEU_SDDV(
MAPSDDV CHAR(10) PRIMARY KEY,
SOLUONG INT,
MADV CHAR(10))
GO
go
alter table phieudatphong
alter column sophong char(10)
go
alter table phieu_sddv
add  ma_psddv char(10) primary key
ALTER TABLE NHanvien
add foreign key(mapb) references phongban(mapb)
go

alter table huydk
alter column MAPDP char(10)
go
alter table phieudatphong 
add foreign key(manv) references nhanvien(manv)
go 
alter table phieudatphong 
add foreign key(makh) references khachhang(makh)
go
alter table phieudatphong 
add foreign key(ma_psddv) references phieu_sddv(ma_psddv)
go
alter table phieudatphong 
add foreign key(mapp) references phieuphat(mapp)
go
alter table hoadon
add foreign key(mapdp) references phieudatphong(mapdp)
go 
alter table thietbi
add foreign key (sophong) references phong(sophong)
go
alter table thietbi
add foreign key(mapp) references phieuphat(mapp)
go 
alter table phieuphat
add foreign key(mapdp) references phieudatphong(mapdp)
go
alter table doanhthu
add foreign key(mahd) references hoadon(mahd)
go
alter table phieu_sddv
add foreign key(madv) references dichvu(madv)



go
alter table phieudatphong
add foreign key(sophong) references phong(sophong)
go
alter table Nhanvien
add  DC nvarchar(50)