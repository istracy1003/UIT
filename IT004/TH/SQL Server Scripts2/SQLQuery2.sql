CREATE TABLE baithuchanh1
(
MAKH char(4) primary key,
HOTEN varchar(40),
DCHI varchar(50),
SoDT varchar(20),
NGSINH smalldatetime,
NGDK smalldatetime,
DOANHSO money
)
CREATE TABLE NHANVIEN
(
MANV CHAR(4) primary key,
HOTEN varchar(40),
NGVL SMALLDATETIME,
SODT VARCHAR (20)
)
create table sanpham 
( 
MASP char(4) primary key,
TENSP varchar(40),
DVT varchar (20),
NUOCSX varchar(20),
GIA money
)
create table hoadon
(
SOHD char(4) primary key,
NGHD smalldatetime,
MAKH char(4),
MANV char(4),
TRIGIA money
)
create table CTHD 
(
SOHD char(10),
MASP char(4),
SL char(4),
CONSTRAINT PK_CTHD PRIMARY KEY (SOHD),
CONSTRAINT PK_CTHD_SP FOREIGN KEY (MASP) REFERENCES sanpham (MASP)
)
DROP TABLE CTHD
create table CTHD 
(
SOHD char(10),
MASP char(4),
SL char(4),
CONSTRAINT PK_CTHD PRIMARY KEY (SOHD),
CONSTRAINT PK_CTHD_SP FOREIGN KEY (MASP) REFERENCES sanpham (MASP)
)
DROP TABLE CTHD 
DROP TABLE sanpham 
DROP TABLE hoadon 
create table sanpham 
( 
MASP char(4) primary key,
TENSP varchar(40),
DVT varchar (20),
NUOCSX varchar(40),
GIA money
)
create table hoadon
(
SOHD int primary key,
NGHD smalldatetime,
MAKH char(4),
MANV char(4),
TRIGIA money
)
create table CTHD 
(
SOHD int,
MASP char(4),
SL int,
CONSTRAINT PK_CTHD PRIMARY KEY (SOHD),
CONSTRAINT PK_CTHD_SP FOREIGN KEY (MASP) REFERENCES sanpham (MASP)
)
INSERT INTO baithuchanh1
