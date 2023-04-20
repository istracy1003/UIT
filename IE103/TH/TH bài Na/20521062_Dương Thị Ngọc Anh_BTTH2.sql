﻿CREATE DATABASE QLDT
USE QLDT

CREATE TABLE SINHVIEN
(
	MSSV CHAR(8) PRIMARY KEY,
	TENSV NVARCHAR(30) NOT NULL,
	SODT VARCHAR(10),
	LOP CHAR(10) NOT NULL,
	DIACHI NCHAR(30) NOT NULL
)

CREATE TABLE DETAI
(
	MSDT CHAR(6) PRIMARY KEY,
	TENDT NVARCHAR(30) NOT NULL
)

CREATE TABLE HOCVI(
	MSHV INT, 
	TENHV nvarchar(20) NOT NULL,
	PRIMARY KEY(MSHV)
)

CREATE TABLE HOCHAM(
	MSHH int, 
	TENHH nvarchar(20) NOT NULL,
	PRIMARY KEY(MSHH)
)

CREATE TABLE SV_DETAI
(
	MSSV char(8) FOREIGN KEY REFERENCES SINHVIEN(MSSV), 
	MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT),
	PRIMARY KEY(MSSV, MSDT)
)

CREATE TABLE GIAOVIEN(
	MSGV int, 
	TENGV nvarchar(30) NOT NULL, 
	DIACHI nvarchar(50) NOT NULL, 
	SODT varchar(10) NOT NULL, 
	MSHH int FOREIGN KEY REFERENCES HOCHAM(MSHH), 
	NAMHH smalldatetime NOT NULL,
	PRIMARY KEY(MSGV)
)

CREATE TABLE CHUYENNGANH(
	MSCN int, 
	TENCN nvarchar(30) NOT NULL,
	PRIMARY KEY(MSCN)
)

CREATE TABLE GV_HV_CN(
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 
	MSHV int  FOREIGN KEY REFERENCES HOCVI(MSHV), 
	MSCN int  FOREIGN KEY REFERENCES CHUYENNGANH(MSCN), 
	NAM smalldatetime NOT NULL,
	PRIMARY KEY(MSGV, MSHV, MSCN)
)

CREATE TABLE GV_HDDT(
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 
	MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
	DIEM float NOT NULL,
	PRIMARY KEY(MSGV, MSDT)
)

CREATE TABLE GV_PBDT(
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 
	MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
	DIEM float NOT NULL,
	PRIMARY KEY(MSGV, MSDT)
)

CREATE TABLE GV_UVDT(
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV), 
	MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
	DIEM float NOT NULL,
	PRIMARY KEY(MSGV, MSDT)
)

CREATE TABLE HOIDONG(
	MSHD int, 
	PHONG int, 
	TGBD smalldatetime,
	NGAYHD smalldatetime NOT NULL, 
	TINHTRANG nvarchar(30) NOT NULL,
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
	PRIMARY KEY(MSHD)
)

CREATE TABLE HOIDONG_GV(
	MSHD int  FOREIGN KEY REFERENCES HOIDONG(MSHD), 
	MSGV int FOREIGN KEY REFERENCES GIAOVIEN(MSGV),
	PRIMARY KEY(MSHD, MSGV)
)

CREATE TABLE HOIDONG_DT(
	MSHD int  FOREIGN KEY REFERENCES HOIDONG(MSHD), 
	MSDT char(6) FOREIGN KEY REFERENCES DETAI(MSDT), 
	QUYETDINH nchar(10),
	PRIMARY KEY(MSHD, MSDT)
)

SET DATEFORMAT DMY

--A. Bang SINHVIEN
INSERT INTO SINHVIEN VALUES('13520001',N'Nguyễn Văn An','0906762255','SE103.U32',N'THỦ ĐỨC')
INSERT INTO SINHVIEN VALUES('13520002',N'Phan Tấn Đạt','0975672350','IE204.T21',N'QUẬN 1')
INSERT INTO SINHVIEN VALUES('13520003',N'Nguyễn Anh Hải','0947578688','IE205.R12',N'QUẬN 9')
INSERT INTO SINHVIEN VALUES('13520004',N'Phạm Tài','0956757869','IE202.A22',N'QUẬN 1')
INSERT INTO SINHVIEN VALUES('13520005',N'Lê Thúy Hằng','0976668688','SE304.E22',N'THỦ ĐỨC')
INSERT INTO SINHVIEN VALUES('13520006',N'Ưng Hồng Ân','0957475898','IE208.F33',N'QUẬN 2')

---B.BẢNG DETAI
INSERT INTO DETAI VALUES('97001',N'Quản lý thư viện')
INSERT INTO DETAI VALUES('97002',N'Nhận dạng vân tay')
INSERT INTO DETAI VALUES('97003',N'Bán đấu giá trên mạng')
INSERT INTO DETAI VALUES('97004',N'Quản lý siêu thị')
INSERT INTO DETAI VALUES('97005',N'Xử lý ảnh')
INSERT INTO DETAI VALUES('97006',N'Hệ giải toán thông minh')

---C.BẢNG SV_DETAI
INSERT INTO SV_DETAI VALUES('13520001','97004')
INSERT INTO SV_DETAI VALUES('13520002','97005')
INSERT INTO SV_DETAI VALUES('13520003','97001')
INSERT INTO SV_DETAI VALUES('13520004','97002')
INSERT INTO SV_DETAI VALUES('13520005','97003')
INSERT INTO SV_DETAI VALUES('13520006','97005')
--D. BẢNG HOCHAM
INSERT INTO HOCHAM VALUES(1,N'PHÓ GIÁO SƯ')
INSERT INTO HOCHAM VALUES(2,N'GIÁO SƯ')
---E. BẢNG GIAOVIEN
INSERT INTO GIAOVIEN VALUES(00201,N'Trần Trung',N'Bến Tre','35353535',1,'1996')
INSERT INTO GIAOVIEN VALUES(00202,N'Nguyễn Văn An',N'Tiền Giang','67868688',1,'1996')
INSERT INTO GIAOVIEN VALUES(00203,N'Trần Thu Trang',N'Cần Thơ','74758687',1,'1996')
INSERT INTO GIAOVIEN VALUES(00204,N'Nguyễn Thị Loan',N'TP. HCM','56575868',2,'2005')
INSERT INTO GIAOVIEN VALUES(00205,N'Chu Tiến',N'Hà Nội','46466646',2,'2005')
---F.BẢNG HOCVI
INSERT INTO HOCVI VALUES(1,N'Kỹ sư')
INSERT INTO HOCVI VALUES(2,N'Cử Nhân')
INSERT INTO HOCVI VALUES(3,N'Thạc sĩ')
INSERT INTO HOCVI VALUES(4,N'Tiến sĩ')
INSERT INTO HOCVI VALUES(5,N'Tiến sĩ Khoa học')	
---G. BẢNG CHUYENNGANH
INSERT INTO CHUYENNGANH VALUES(1,N'Công nghệ Web')
INSERT INTO CHUYENNGANH VALUES(2,N'Mạng xã hội')
INSERT INTO CHUYENNGANH VALUES(3,N'Quản lý CNTT')
INSERT INTO CHUYENNGANH VALUES(4,N'GIS')
---H. BẢNG GV_HV_CN
INSERT INTO GV_HV_CN VALUES(00201,1,1,'2013')
INSERT INTO GV_HV_CN VALUES(00201,1,2,'2013')
INSERT INTO GV_HV_CN VALUES(00201,2,1,'2014')
INSERT INTO GV_HV_CN VALUES(00202,3,2,'2013')
INSERT INTO GV_HV_CN VALUES(00203,2,4,'2014')
INSERT INTO GV_HV_CN VALUES(00204,3,2,'2014')
---I. BẢNG GV_HDDT
INSERT INTO GV_HDDT VALUES(00201,'97001',8)
INSERT INTO GV_HDDT VALUES(00202,'97002',7)
INSERT INTO GV_HDDT VALUES(00205,'97001',9)
INSERT INTO GV_HDDT VALUES(00204,'97004',7)
INSERT INTO GV_HDDT VALUES(00203,'97005',9)
---J. BẢNG GV_PBDT
INSERT INTO GV_PBDT VALUES(00201,'97005',8)
INSERT INTO GV_PBDT VALUES(00202,'97001',7)
INSERT INTO GV_PBDT VALUES(00205,'97004',9)
INSERT INTO GV_PBDT VALUES(00204,'97003',7)
INSERT INTO GV_PBDT VALUES(00203,'97002',9)
---K. BẢNG GV_UVDT
INSERT INTO GV_UVDT VALUES(00205,'97005',8)
INSERT INTO GV_UVDT VALUES(00202,'97005',7)
INSERT INTO GV_UVDT VALUES(00204,'97005',9)
INSERT INTO GV_UVDT VALUES(00203,'97001',7)
INSERT INTO GV_UVDT VALUES(00204,'97001',9)
INSERT INTO GV_UVDT VALUES(00205,'97001',8)
INSERT INTO GV_UVDT VALUES(00203,'97003',7)
INSERT INTO GV_UVDT VALUES(00201,'97003',9)
INSERT INTO GV_UVDT VALUES(00202,'97003',7)
INSERT INTO GV_UVDT VALUES(00201,'97004',9)
INSERT INTO GV_UVDT VALUES(00202,'97004',8)
INSERT INTO GV_UVDT VALUES(00203,'97004',7)
INSERT INTO GV_UVDT VALUES(00201,'97002',9)
INSERT INTO GV_UVDT VALUES(00204,'97002',7)
INSERT INTO GV_UVDT VALUES(00205,'97002',9)
---L. BẢNG HOIDONG
INSERT INTO HOIDONG VALUES(1,002,'7:00','29/11/2014',N'Thật',00201)
INSERT INTO HOIDONG VALUES(2,102,'7:00','5/12/2014',N'Thật',00202)
INSERT INTO HOIDONG VALUES(3,003,'8:00','6/12/2014',N'Thật',00203)
---M. BẢNG HOIDONG_GV
INSERT INTO HOIDONG_GV VALUES(1,00201)
INSERT INTO HOIDONG_GV VALUES(1,00202)
INSERT INTO HOIDONG_GV VALUES(1,00203)
INSERT INTO HOIDONG_GV VALUES(1,00204)
INSERT INTO HOIDONG_GV VALUES(2,00203)
INSERT INTO HOIDONG_GV VALUES(2,00202)
INSERT INTO HOIDONG_GV VALUES(2,00205)
INSERT INTO HOIDONG_GV VALUES(2,00204)
INSERT INTO HOIDONG_GV VALUES(3,00201)
INSERT INTO HOIDONG_GV VALUES(3,00202)
INSERT INTO HOIDONG_GV VALUES(3,00203)
INSERT INTO HOIDONG_GV VALUES(3,00204)
---N. BẢNG HOIDONG_DT
INSERT INTO HOIDONG_DT VALUES(1,'97001',N'Được')
INSERT INTO HOIDONG_DT VALUES(1,'97002',N'Được')
INSERT INTO HOIDONG_DT VALUES(2,'97001',N'Không')
INSERT INTO HOIDONG_DT VALUES(2,'97004',N'Không')
INSERT INTO HOIDONG_DT VALUES(1,'97005',N'Được')
INSERT INTO HOIDONG_DT VALUES(3,'97001',N'Không')
INSERT INTO HOIDONG_DT VALUES(3,'97002',N'Được')

--- A.STORED PROCEDUREDS VỚI THAM SỐ VÀO
---Câu 1:Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa, nếu chưa thì trả về giá trị 0.
CREATE PROCEDURE THEM_GV1 @MSGV INT, @TENGV NVARCHAR(30), @DIACHI NVARCHAR(50), @SODT VARCHAR(10), @MSHH INT, @NAMHH SMALLDATETIME
AS
BEGIN
	IF EXISTS (SELECT * FROM HOCHAM WHERE MSHH = @MSHH)
	BEGIN
		INSERT INTO GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
	END
	ELSE
		PRINT '0'
END
EXEC THEM_GV1 206, 'Nguyen Van A', 'TPHCM', '12345', 1, 2022


---Câu 2:Tham số vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSGV trong table GIAOVIEN có trùng không, nếu trùng thì trả về giá trị 0.

CREATE PROCEDURE THEM_GV2 @MSGV INT, @TENGV NVARCHAR(30), @DIACHI NVARCHAR(50), @SODT VARCHAR(10), @MSHH INT, @NAMHH SMALLDATETIME
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM GIAOVIEN WHERE MSGV = @MSGV)
	BEGIN
		INSERT INTO GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES(@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
	END
	ELSE
		PRINT '0'
END
EXEC THEM_GV2 207, 'Nguyen Van B', ' QuangTri', '1234', 1, '12/3/2022'


---CÂU 3: Giống (1) và (2) kiểm tra xem MSGV có trùng không? MSHH có tồn tại chưa? Nếu MSGV trùng thì trả về 0. Nếu MSHH chưa tồn tại trả về 1, ngược lại cho insert dữ liệu.
CREATE PROCEDURE THEM_GV3 @MSGV INT, @TENGV NVARCHAR(30), @DIACHI NVARCHAR(50), @SODT VARCHAR(10), @MSHH INT, @NAMHH SMALLDATETIME
AS
BEGIN
	IF EXISTS (SELECT * FROM GIAOVIEN WHERE MSGV= @MSGV)
		PRINT '0'
	ELSE
		IF NOT EXISTS (SELECT * FROM GIAOVIEN WHERE MSHH= @MSHH) AND @MSHH IS NOT NULL
			PRINT '1'
		ELSE
			INSERT INTO GIAOVIEN(MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH) VALUES(@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
END
EXEC THEM_GV3 209, 'PVN', 'NhaTrang', '123456', NULL, '27/4/2022' 

---CÂU 4:. Đưa vào MSDT cũ, TENDT mới. Hãy cập nhật tên đề tài mới với mã đề tài cũ không đổi nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
CREATE PROCEDURE UPDATE_NAME_DT @MSDT CHAR(6), @TENDT NVARCHAR(30)
AS 
BEGIN
	IF EXISTS (SELECT * FROM DETAI WHERE MSDT= @MSDT )
	BEGIN
	UPDATE DETAI
		SET TENDT = @TENDT
		WHERE MSDT=@MSDT;
	PRINT '1'
	END
	ELSE
		PRINT '0'
END
---CÂU 5: Tham số đưa vào MSSV, TENSV mới, DIACHI mới thủ tục dùng để cập nhật sinh viên trên, nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.
CREATE PROCEDURE UPDATE_TENSV_DIACHI @MSSV CHAR(8), @TENSV NVARCHAR(30), @DIACHI NCHAR(30)
AS
BEGIN
	IF EXISTS (SELECT * FROM SINHVIEN WHERE MSSV= @MSSV)
	BEGIN
		UPDATE SINHVIEN
			SET TENSV = @TENSV, DIACHI = @DIACHI
			WHERE MSSV = @MSSV
			PRINT '1'
	END
	ELSE
		PRINT '0'
END


---B STORED PROCEDUREDS VỚI THAM SỐ VÀO VÀ RA
---CÂU 1: Đưa vào TENHV trả ra: Số GV thỏa học vị, nếu không tìm thấy trả về 0.
CREATE PROCEDURE COUNT_GV @TENHV NVARCHAR(20), @SO_GV INT OUTPUT
AS
	SELECT @SO_GV=COUNT(MSGV)
	FROM HOCVI HV JOIN GV_HV_CN GVHVCN ON HV.MSHV=GVHVCN.MSHV
	WHERE TENHV=@TENHV
GO

DROP PROCEDURE COUNT_GV

DECLARE @SO_GV INT
EXEC COUNT_GV @TENHV = N'Cử Nhân', @SO_GV=@SO_GV OUTPUT 
PRINT @SO_GV

---CÂU 2: Đưa vào MSDT cho biết: Điểm trung bình của đề tài, nếu không tìm thấy trả về 0.
CREATE PROCEDURE DIEM_TB_DETAI @MSDT CHAR(6), @DIEM_TB_DETAI INT OUTPUT
AS
	
	SET @DIEM_TB_DETAI=(SELECT AVG(HD.DIEM)
			FROM GV_HDDT HD JOIN GV_PBDT PB ON HD.MSDT=PB.MSDT
				JOIN GV_UVDT UV ON PB.MSDT=UV.MSDT
			WHERE HD.MSDT=@MSDT)
	IF @DIEM_TB_DETAI=0
		PRINT '0'
	--ELSE
		--PRINT @DIEM_TB_DETAI
GO


---CÂU 4:Đưa vào MSHD cho biết: Điểm trung bình các đề tài của hội đồng đó.
CREATE PROCEDURE DIEM_TB_HOIDONG @MSHD INT, @DIEMTB FLOAT OUTPUT 
AS 
BEGIN SELECT @DIEMTB = (SUM(GV_HDDT.DIEM) + SUM(GV_PBDT.DIEM) + SUM(GV_UVDT.DIEM))/(COUNT(GV_HDDT.MSDT) + COUNT(GV_PBDT.MSDT) + COUNT(GV_UVDT.MSDT)) FROM HOIDONG_DT INNER JOIN GV_HDDT ON GV_HDDT.MSDT = HOIDONG_DT.MSDT INNER JOIN GV_PBDT ON GV_PBDT.MSDT = GV_HDDT.MSDT INNER JOIN GV_UVDT ON GV_UVDT.MSDT = GV_HDDT.MSDT WHERE MSHD = @MSHD 
END 

DECLARE @DIEMTB FLOAT 
EXEC DIEM_TB_HOIDONG 3, @DIEMTB OUTPUT 
PRINT @DIEMTB

--- C TRIGGER
---CÂU 1: Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài sẽ xóa các thông tin liên quan.
CREATE TRIGGER DELETE_DT
ON DETAI
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @MSDT CHAR(6)

	SELECT @MSDT = MSDT FROM deleted

	DELETE FROM SV_DETAI
	WHERE MSDT = @MSDT

	DELETE FROM GV_HDDT
	WHERE MSDT = @MSDT

	DELETE FROM GV_PBDT
	WHERE MSDT = @MSDT

	DELETE FROM GV_UVDT
	WHERE MSDT = @MSDT

	DELETE FROM HOIDONG_DT
	WHERE MSDT = @MSDT

	PRINT 'DA XOA THANH CONG'
END
DELETE DETAI
WHERE MSDT= '97004'
---CÂU 2: Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài. Dùng “Group by” có được không? Giải thích.

CREATE TRIGGER TRG_HD_DETAI ON HOIDONG_DT FOR INSERT AS 
BEGIN
	IF (SELECT COUNT(Inserted.MSDT) FROM dbo.HOIDONG_DT 
				INNER JOIN Inserted ON Inserted.MSHD = HOIDONG_DT.MSHD
		) > 10
	BEGIN
	    PRINT N'Mỗi hội đồng không được có quá 10 đề tài!'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT N'Thêm thành công!'
	END
END

INSERT INTO DETAI VALUES('97007',N'Đề tài A')
INSERT INTO DETAI VALUES('97008',N'Đề tài B')
INSERT INTO DETAI VALUES('97009',N'Đề tài C')
INSERT INTO DETAI VALUES('97010',N'Đề tài D')
INSERT INTO DETAI VALUES('97011',N'Đề tài E')
INSERT INTO DETAI VALUES('97012',N'Đề tài F')
INSERT INTO DETAI VALUES('97013',N'Đề tài G')
INSERT INTO DETAI VALUES('97014',N'Đề tài H')
INSERT INTO DETAI VALUES('97015',N'Đề tài H')

INSERT HOIDONG_DT VALUES(1, '97015', N'Được')

--- D FUNCTION
---CÂU 1: Viết hàm tính điểm trung bình của một đề tài. Giá trị trả về là điểm trung bình ứng với mã số đề tài nhập vào
CREATE FUNCTION DIEM_TB_DT (@MSDT CHAR(6))
RETURNS FLOAT
AS
BEGIN
	DECLARE @DTB FLOAT
	SELECT @DTB = ((SUM (GV_HDDT.DIEM) + SUM( GV_UVDT.DIEM) + SUM ( GV_PBDT.DIEM)) / (COUNT (GV_HDDT.MSGV)+COUNT (GV_PBDT.MSGV)+ COUNT(GV_UVDT.DIEM)) )
	FROM DETAI AS A INNER JOIN GV_HDDT ON A.MSDT = GV_HDDT.MSDT
	INNER JOIN GV_UVDT ON A.MSDT=GV_UVDT.MSDT INNER JOIN GV_PBDT ON A.MSDT=GV_PBDT.MSDT
	WHERE A.MSDT = @MSDT
	RETURN @DTB
END
SELECT MSDT, TENDT, dbo.DIEM_TB_DT(MSDT) AS DIEM_TB FROM DETAI


---CÂU 2: Trả về kết quả của đề tài theo MSDT nhập vào. Kết quả là DAT nếu như điểm trung bình từ 5 trở lên, và KHONGDAT nếu như điểm trung bình dưới 5.
CREATE FUNCTION KETQUA (@MSDT INT) RETURNS FLOAT
AS
BEGIN
DECLARE @DTB FLOAT
SELECT @DTB = (SUM(DISTINCT GV_HDDT.DIEM) + SUM(DISTINCT GV_PBDT.DIEM) + SUM(DISTINCT GV_UVDT.DIEM)) / (COUNT(DISTINCT GV_HDDT.MSGV) + COUNT(DISTINCT GV_PBDT.MSGV) + COUNT(DISTINCT GV_UVDT.MSGV))
FROM DETAI INNER JOIN HOIDONG_DT ON HOIDONG_DT.MSDT = DETAI.MSDT 
INNER JOIN GV_HDDT ON GV_HDDT.MSDT = DETAI.MSDT INNER JOIN GV_PBDT ON GV_PBDT.MSDT = DETAI.MSDT INNER JOIN GV_UVDT ON GV_UVDT.MSDT = DETAI.MSDT
WHERE DETAI.MSDT = @MSDT
GROUP BY DETAI.MSDT
IF @DTB >= 5 PRINT N'DAT'
IF @DTB < 5 PRINT N'KHONG DAT'
END

--- E CURSOR
CREATE TABLE DETAI_DIEM(
	MSDT VARCHAR(6) PRIMARY KEY,
	DIEM FLOAT
)

DECLARE p CURSOR FOR SELECT MSDT, dbo.DIEM_TB_DT(MSDT) AS DIEM_TB FROM DETAI

OPEN p
DECLARE @MADT CHAR(6), @DIEM FLOAT

FETCH p INTO @MADT, @DIEM
WHILE (@@FETCH_STATUS = 0)
BEGIN

	
	INSERT INTO DETAI_DIEM (MSDT, DIEM) VALUES (@MADT, ROUND(@DIEM,2))
	FETCH NEXT FROM p INTO @MADT, @DIEM
END

CLOSE p