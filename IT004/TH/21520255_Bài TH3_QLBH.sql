create database QLBH
use QLBH
--PhanI--
--1.--
Create table KHACHHANG(
	MAKH char(4) not null,
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	DOANHSO money,
	NGDK smalldatetime,
	constraint pk_kh primary key(MAKH)
)

create table NHANVIEN(
	MANV char(4) not null,
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime,
	constraint pk_nv primary key(MANV)
)
create table SANPHAM(
	MASP char(4) not null,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money,
	constraint pk_sp primary key(MASP)
)
create table HOADON(
	SOHD int not null,
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money,
	constraint pk_hd primary key(SOHD)
)
create table CTHD(
	SOHD int,
	MASP char(4),
	SL int
)
alter table HOADON add constraint fk01_hd foreign key(MAKH) references KHACHHANG(MAKH)
alter table HOADON add constraint fk02_hd foreign key(MANV) references NHANVIEN(MANV)
alter table CTHD add constraint fk01_cthd foreign key(SOHD) references HOADON(SOHD)
alter table CTHD add constraint fk02_cthd foreign key(MASP) references SANPHAM(MASP)

set dateformat dmy
--2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM 
ADD GHICHU varchar(20)
--3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG
ADD LOAIKH tinyint
--4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU varchar(100)
--5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM
DROP COLUMN GHICHU;
--6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH nvarchar(40);
--7.	Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM
ADD CHECK (DVT IN('cay','hop','cai','quyen','chuc'))
--8.	Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM
ADD CHECK (GIA>=500)
--10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG
ADD CHECK (NGDK>NGSINH)
--PhanII--
--1.--
--Datakhachhang
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','22/10/1960',13060000,'22/07/2006')
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','03/04/1974',280000,'30/07/2006')
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','12/06/1980',3860000,'08/05/2006')
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','09/03/1965',250000,'10/02/2006')
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','10/03/1950',21000,'28/10/2006')
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','31/12/1981',915000,'24/11/2006')
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','06/04/1971',12500,'12/01/2006')
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','10/01/1971',365000,'13/12/2006')
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','03/09/1979',70000,'14/01/2007')
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','02/05/1983',67500,'16/01/2007')
--Datanhanvien
insert into nhanvien values('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')
--Datasanpham
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)
--Datahoadon
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)
--Datacthd
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
--2.	Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
select * into SANPHAM1 from SANPHAM
select * into KHACHHANG1 from KHACHHANG
--3.	Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
update SANPHAM1
set GIA=GIA*1.05
where NUOCSX='Thai Lan'
--4.	Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
update SANPHAM1
set GIA=GIA*0.95
where GIA<=10000 and NUOCSX='Trung Quoc'
--5.	Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
update KHACHHANG1
set LOAIKH='Vip'
where (NGDK<'1/1/2007' and DOANHSO>=10000000) or
(NGDK>='1/1/2007' and DOANHSO>=2000000)

--PhanIII--
--1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'

--2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN('CAY', 'QUYEN')

--3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE'B%01'

--4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP,NUOCSX
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
AND GIA BETWEEN 30000 AND 40000

--5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP, NUOCSX
FROM SANPHAM
WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'THAI LAN') AND GIA BETWEEN 30000 AND 40000

--6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD >= '1/1/2007' AND NGHD <= '1/2/2007'

--7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC

--8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT K.MAKH, HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE NGHD = '1/1/2007'

--9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT SOHD, TRIGIA
FROM HOADON H INNER JOIN NHANVIEN N
ON H.MANV = N.MANV
WHERE NGHD = '10/28/2006'
AND HOTEN = 'NGUYEN VAN B'

--10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
AND EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)

--11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')

--12.  Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select distinct SOHD
from CTHD
where MASP in ('BB01','BB02') and (SL between 10 and 20) 

--13.Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SOHD
from CTHD
where MASP= ('BB01') and (SL>=10 and SL<=20) 
intersect
select SOHD
from CTHD
where MASP=('BB02') and  (SL>=10 and SL<=20)

select CT.SOHD
from CTHD CT, SANPHAM SP
where exists (
select *
from SANPHAM SP
where (SP.MASP='BB01' and CT.SL between 10 and 20)
and SP.MASP=CT.MASP)
 and SP.MASP='BB02' and SL between 10 and 20

--14
select distinct SANPHAM.MASP, TENSP
from SANPHAM,HOADON,CTHD 
where (SANPHAM.NUOCSX='Trung Quoc')or
(SANPHAM.MASP=CTHD.MASP and HOADON.SOHD=CTHD.SOHD and(NGHD='1/1/2007'))


--15
Select SANPHAM.MASP, TENSP
from SANPHAM
where not exists 
(
select *
from CTHD
where SANPHAM.MASP=CTHD.MASP
)

select SP.MASP, TENSP
from SANPHAM SP
except
select CT.MASP, TENSP
from CTHD CT, SANPHAM SP
where CT.MASP=SP.MASP

--16
select SANPHAM.MASP, TENSP
from SANPHAM
where not exists
(
select *
from CTHD,HOADON
where (CTHD.MASP=SANPHAM.MASP) and (HOADON.SOHD=CTHD.SOHD)
and YEAR(NGHD)=2006
)

select SP.MASP, TENSP
from SANPHAM SP
except
select SP.MASP, TENSP
from SANPHAM SP, CTHD CT, HOADON HD
where SP.MASP=CT.MASP and HD.SOHD=CT.SOHD and YEAR(NGHD)=2006
--17
select SANPHAM.MASP, TENSP
from SANPHAM
where NUOCSX='Trung Quoc'and  not exists
(
select *
from CTHD,HOADON
where (CTHD.MASP=SANPHAM.MASP) and (HOADON.SOHD=CTHD.SOHD)
and YEAR(NGHD)=2006
)

--18
select distinct CT.SOHD
from CTHD CT
where not exists
(
	select SP.MASP
	from SANPHAM SP
	where SP.NUOCSX='Singapore'
	except
	select SP1.MASP
	from CTHD CT1, SANPHAM SP1
	where CT1.MASP=SP1.MASP
	and CT1.SOHD=CT.SOHD 
	)

SELECT H.SOHD 
FROM HOADON H
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD AND
C.MASP = S.MASP))

SELECT distinct CT.SOHD 
FROM CTHD CT
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD CT2
WHERE CT2.SOHD = CT.SOHD
AND CT2.MASP = S.MASP))

-- 20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT SOHD, COUNT (SOHD) AS HD_KH
FROM HOADON, KHACHHANG
GROUP BY MAKH,SOHD
HAVING COUT (SOHD) = NULL

-- 21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT MASP, COUNT (MASP) AS SOLUONG
FROM HOADON, CTHD
GROUP BY MASP
HAVING COUT YEAR(NGHD)=2006

--22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT TRIGIA, MIN (TRIGIA) AS MIN_TRIGIA
MAX (TRIGIA) AS MAX_TRIGIA
FROM HOADON
GROUP BY SOHD

--23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT TRIGIA, AVG(TRIGIA) AS TRIGIA_TRUNGBINH
FROM HOADON
GROUP BY SOHD
HAVING YEAR(NGHD)=2006

--24.	Tính doanh thu bán hàng trong năm 2006.
SELECT DOANHSO, SUM(DOANHSO) AS DOANHSO_BANHANG
FROM KHACHHANG,HOADON
GROUP BY MAKH
HAVING YEAR (NGHD)=2006

--25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD, MAX(TRIGIA) AS TRIGIA_CAONHAT
FROM HOADON
GROUP BY SOHD
HAVING YEAR (NGHD)=2006

--26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN, MAX(TRIGIA) AS TRIGIA_CAONHAT 
FROM KHACHHANG,HOADON
GROUP BY MAKH
HAVING YEAR (NGHD)=2006

--27.	In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH,HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

--28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
-- CÁCH 1
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN
(SELECT DISTINCT TOP 3 GIA 
FROM SANPHAM
ORDER BY GIA DESC)

-- CÁCH 2 
SELECT MASP, TENSP
FROM (
SELECT MASP,TENSP, DENSE_RANK() OVER( ORDER BY FROM SANPHAM ) A
WHERE A.RANK <= 3

--29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN
(SELECT DISTINCT TOP 3 GIA 
FROM SANPHAM
ORDER BY GIA DESC)
HAVING NUOCSX='Thái Lan'

-- 30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN
(SELECT DISTINCT TOP 3 GIA 
FROM SANPHAM
HAVING NUOCSX ='Trung Quoc'
ORDER BY GIA DESC)

--31.	* In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
SELECT MAKH
FROM KHACHHANG
WHERE DOANHSO IN 
( SELECT DISTINCT TOP 3 DOANHSO
FROM SANPHAM
ORDER BY DOANHSO DESC )

--32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT MASP, SUM(MASP) AS SUM_SP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
GROUP BY MASP 

--33.	Tính tổng số sản phẩm của từng nước sản xuất.


SELECT MAKH 
FROM HOADON
GROUP BY MAKH 
HAVING COUNT (SOHD) = (
SELECT MAX (SLMH) FROM ( 
SELECT MAKH, COUNT (SOHD) AS SLMH 
FROM HOADON
GROUP BY MAKH) A) ;
--1
SELECT TRIGIA
FROM HOADON
WHERE NOT EXISTS 
		(SELECT * 
		FROM SANPHAM
		WHERE NOT EXISTS 
			( SELECT * 
			FROM CTHD
			WHERE CTHD.SOHD = HOADON.SOHD AND SANPHAM.MASP = CTHD.MASP 
			))
--2 
SELECT HOADON.SOHD
FROM HOADON, NHANVIEN, KHACHHANG
WHERE HOADON.MANV = NHANVIEN.MANV 
		AND HOADON.MAKH = KHACHHANG.MAKH 
		AND (LEFT(NHANVIEN.HOTEN, 6) = 'Nguyen' 
			or LEFT(KHACHHANG.HOTEN, 6) = 'Nguyen')

--3
SELECT SOHD
FROM HOADON, KHACHHANG
WHERE HOADON.MAKH = KHACHHANG.MAKH 
	AND DAY(NGDK) = DAY(NGHD) 
	AND DOANHSO = TRIGIA
--4
SELECT HOTEN
FROM NHANVIEN
WHERE NOT EXISTS 
	( SELECT * 
	FROM HOADON
	WHERE NOT EXISTS 
	( SELECT *
	FROM CTHD
	WHERE CTHD.SOHD = HOADON.SOHD
	AND HOADON.MANV = NHANVIEN.MANV));

SELECT * FROM HOADON
SELECT * FROM CTHD

--5
SELECT SOHD, KHACHHANG.HOTEN
FROM KHACHHANG, HOADON, NHANVIEN
WHERE KHACHHANG.MAKH = HOADON.MAKH
	AND HOADON.MANV = NHANVIEN.MANV

--6 
SELECT MASP,TENSP
FROM SANPHAM
WHERE ( GIA>50000 AND NUOCSX='Viet Nam') 
	or( GIA>200000 AND NUOCSX='Singapore')

--7 
SELECT DISTINCT MASP 
FROM SANPHAM
WHERE MASP NOT IN
	(SELECT MASP
	FROM CTHD JOIN HOADON ON HOADON.SOHD =CTHD.SOHD
	WHERE NGHD > GETDATE() - 30)

Select * from NHANVIEN
SElect * from HOADON