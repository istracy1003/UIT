CREATE DATABASE QCB
USE QCB

create table CHUYENBAY
(
	MACB char(7) not null,
	NOIDI varchar(40),
	NOIDEN varchar(50),
	SLGHE int,
	THOIGIAN smalldatetime,
	constraint pk_kh primary key(MACB)
)

create table KHACHHANG(
	MAKH char(7) not null,
	TENKH varchar(40),
	SDT varchar(20),
	NGSINH smalldatetime,
	GIOITINH varchar(20)
	constraint pk_kh primary key(MAKH)
)
create table VE(
	MAVE char(7) not null,
	MACB char(7),
	LOAIVE varchar(40),
	SOGHE varchar(20),
	GIAVE money,
	constraint pk_kh primary key(MAVE)
)
create table MUAVE(
	MAVE char(7),
	MAKH char(7),
	NGMUA smalldatetime,
	constraint pk_kh primary key(MAVE)
)
alter table VE add constraint fk01_ve foreign key(MACB) references CHUYENBAY(MACB)
alter table MUAVE add constraint fk01_muave foreign key(MAVE) references VE(MAVE)
alter table MUAVE add constraint fk02_muave foreign key(MAKH) references KHACHHANG(MAKH)

set dateformat dmy

--Data Chuyen Bay
insert into CHUYENBAY values('VN001','TPHCM',' Ha Noi', '180','22/12/2022')
insert into CHUYENBAY values('VN002','TPHCM','Da Nang', '160','21/12/2022')
insert into CHUYENBAY values('VN003','Da Nang',' Ha Noi', '160','23/12/2022')
insert into CHUYENBAY values('VN004','Da Lat','TPHCM', '150','24/12/2022')

--Data Khach Hang
insert into KHACHHANG values('KH001','Do Nguyen Nhat Thuong','09323526447', '10/12/1992','Nam')
insert into KHACHHANG values('KH002','Nguyen Do Quynh Han','0141546253', '15/12/1992','Nu')
insert into KHACHHANG values('KH003','Nguyen Do','05353623532', '12/12/1994','Nam')
insert into KHACHHANG values('KH004','Do Nguyen','03532525426', '11/12/1992','Nu')

--Data Ve
insert into VE values('V001','VN003','Thuong gia', 'V1','1800000')
insert into VE values('V002','VN002','Pho thong', 'C2','450000')
insert into VE values('V003','VN001','Pho thon', 'C5','430000')
insert into VE values('V004','VN001','Thuong gia', 'V3','1800000')

--Data Mua Ve 
insert into MUAVE values('V001','KH001','23/12/2022')
insert into MUAVE values('V003','KH002','22/12/2022')
insert into MUAVE values('V004','KH003','22/12/2022')
insert into MUAVE values('V002','KH002','22/12/2022')

CREATE TRIGGER INSERTED_VE 
 ON VE
 FOR EACH ROW
 BEGIN 
	SELECT * 
	FROM VE
	WHERE SOGHE ='V'
END

