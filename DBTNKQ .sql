create database [TNKQ]
go
Use [TNKQ]
go

---------------------------------------------------------------------------------------------------
/*Functions*/
--Function Bài thi
create function AUTO_IDBThi()
returns varchar(6)
as 
begin
	Declare @ID Varchar(6)
	if(select count(ID_BAITHI) from BAITHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_BAITHI,' ',''),4)) from BAITHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('BT000' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('BT00'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE('BT0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=999 then REPLACE('BT'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Khoa
create function AUTO_IDKHOA()
returns char(5)
as 
begin
	Declare @ID Varchar(5)
	if(select count(ID_KHOA) from KHOA)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_KHOA,' ',''),3)) from KHOA
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('KH00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('KH0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('KH'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function GV
create function AUTO_IDGVIEN()
returns char(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_GVIEN) from GIANGVIEN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_GVIEN,' ',''),4)) from GIANGVIEN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + CONVERT(char,MONTH(GETDATE()),112) +''+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function SV
create function AUTO_IDSVien()
returns char(11)
as 
begin
	Declare @ID char(11)
	if(select count(ID_SVIEN) from SINHVIEN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_SVIEN,' ',''),4)) from SINHVIEN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +'0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +'0'+ CONVERT(char,MONTH(GETDATE()),112) +CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go


--FUNCTION Chi tiết lớp học phần
create function AUTO_IDCTLOPHP()
returns char(10)
as 
begin
	Declare @ID char(10)
	if(select count(ID_CTLHPHAN) from CTLHPHAN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_CTLHPHAN,' ',''),5)) from CTLHPHAN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('CTLOP0000' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID<99 then REPLACE('CTLOP000'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=99 and @ID<999 then REPLACE('CTLOP00'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=999 and @ID<999 then REPLACE('CTLOP0'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=9999 then REPLACE('CTLOP'+ CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Câu hỏi
create function AUTO_IDCAUHOI()
returns varchar(7)
as 
begin
	Declare @ID Varchar(7)
	if(select count(ID_CAUHOI) from CAUHOI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_CAUHOI,' ',''),5)) from CAUHOI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('CH0000' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('CH000'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE('CH00'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=999 and @ID < 9999 then REPLACE('CH0'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=9999 then REPLACE('CH'+ CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function DIEMTHI
create function AUTO_IDDIEMTHI()
returns varchar(6)
as 
begin
	Declare @ID Varchar(6)
	if(select count(ID_KQUA) from KETQUA)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_KQUA,' ',''),4)) from KETQUA
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('KQ000' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('KQ00'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE('KQ0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=999 then REPLACE('KQ'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function DETHI
create function AUTO_IDDETHI()
returns varchar(5)
as 
begin
	Declare @ID Varchar(5)
	if(select count(ID_DETHI) from DETHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_DETHI,' ',''),3)) from DETHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('DT00' + CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('DT0'+ CONVERT(Char,Convert(INT,@ID)+1),' ','')
				When @ID >=99 then REPLACE('DT'+ CONVERT(Char,Convert(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function LOPHOCPHAN
create function AUTO_IDLOPHP()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select count(ID_LOPHP) from LOPHOCPHAN)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_LOPHP,' ',''),4)) from LOPHOCPHAN
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + '000'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + '00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=99 and @ID < 999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) + '0'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=999 then REPLACE(CONVERT(char,YEAR(GETDATE()),112) +CONVERT(char,CONVERT(INT,@ID)+1),' ','')
		end
	return @ID
end
go

--Function LICHTHI
create function AUTO_IDLICHTHI()
returns varchar(11)
as 
begin
	Declare @ID Varchar(11)
	if(select count(ID_LICHTHI) from LICHTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_LICHTHI,' ',''),3)) from LICHTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE(CONVERT(char,GETDATE(),112)+'00'+CONVERT(char,CONVERT(INT,@ID)+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE(CONVERT(char,GETDATE(),112)+'0'+CONVERT(Char,Convert(INT,@ID)+1),' ','')
				When @ID >=99 then REPLACE(CONVERT(char,GETDATE(),112)+CONVERT(Char,Convert(INT,@ID)+1),' ','')
				end
	return @ID
end
go

--Function HOCKY
create function AUTO_IDHOCKY()
returns varchar(10)
as 
begin
	Declare @ID Varchar(10)
	if(select MAX(LEFT(REPLACE(ID_HOCKY,' ',''),4)) from HOCKY)=YEAR(GETDATE())
		Select @ID = REPLACE(CONVERT(char,YEAR(GETDATE()))+'000HK2',' ','')
	else
		Select @ID = REPLACE(CONVERT(char,YEAR(GETDATE()))+'000HK1',' ','')
	return @ID
end
go

--Function Ngân Hàng Câu Hỏi
create function AUTO_IDNHCHOI()
returns varchar(7)
as 
begin
	Declare @ID Varchar(7)
	if(select count(ID_NHCH) from NHCH)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_NHCH,' ',''),3)) from NHCH
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('NHCH00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('NHCH0'+ CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('NHCH'+ CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Funcion Chức vụ
create function AUTO_IDCVU()
returns char(6)
as 
begin
	Declare @ID char(6)
	if(select count(ID_CVU) from CHUCVU)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_CVU,' ',''),3)) from CHUCVU
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('CVU00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('CVU0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('CVU'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Môn học
create function AUTO_IDMONHOC()
returns char(5)
as 
begin
	Declare @ID Varchar(5)
	if(select count(ID_MONHOC) from MONHOC)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MONHOC,' ',''),3)) from MONHOC
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('MH00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 and @ID < 99 then REPLACE('MH0'+CONVERT(Char,@ID+1),' ','')
				When @ID >=99 then REPLACE('MH'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Màn Hình
create function AUTO_IDMANHINH()
returns char(6)
as 
begin
	Declare @ID Varchar(6)
	if(select count(ID_MANHINH) from MANHINH)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MANHINH,' ',''),3)) from MANHINH
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('MHN00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('MHN0'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go

--function mức độ
create function AUTO_IDMUCDO()
returns varchar(5)
as 
begin
	Declare @ID Varchar(5)
	if(select count(ID_MUCDO) from MUCDO)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_MUCDO,' ',''),3)) from MUCDO
		Select @ID = CASE
				When @ID >= 0 and @ID < 4 then REPLACE('MC00' + CONVERT(char,@ID+1),' ','')
		end
	return @ID
end
go

--Function Năm Học
create function AUTO_IDNAMHOC()
returns varchar(6)
as 
begin
	Declare @ID Varchar(6)
	if(select Count(ID_NAMHOC) from NAMHOC) = 0
		Select @ID = REPLACE('NH' + CONVERT(char,YEAR(GETDATE())),' ','')
	else
		select @ID = MAX(left(REPLACE(ID_NAMHOC,' ',''),4)) from NAMHOC
		Select @ID = REPLACE('NH'+CONVERT(char,YEAR(GETDATE())),' ','')
	return @ID
end
go

--FUntion Phòng thi
create function AUTO_IDPHONG()
returns char(4)
as 
begin
	Declare @ID Varchar(4)
	if(select count(ID_PHONGTHI) from PHONGTHI)=0
		Set @ID='0'
	else
		Select @ID = MAX(RIGHT(REPLACE(ID_PHONGTHI,' ',''),3)) from PHONGTHI
		Select @ID = CASE
				When @ID >= 0 and @ID < 9 then REPLACE('P00' + CONVERT(char,@ID+1),' ','')
				When @ID >=9 then REPLACE('P0'+CONVERT(Char,@ID+1),' ','')
		end
	return @ID
end
go


---------------------------------------------------------------------------------------------------
/*Tables*/
--Table BaiThi
create table BAITHI
(	
	ID_BAITHI char(6) not null primary key(ID_BAITHI) constraint PK_BAITHI default dbo.AUTO_IDBThi() ,
	ID_DETHI char(5)not null,
	CAUTL nvarchar(500),
	TINHTRANG int,
	TGBDau datetime,
	TGKT datetime,
	TIMING nchar(10) NULL,
);
--Table Chi tiet de thi
Create table CTDTHI
(
	ID_CTDTHI int not null ,
	ID_DTHI char(5) not null,
	HINH char(20),
	CAUHOI nvarchar(MAX),
	A nvarchar (MAX),
	B nvarchar (MAX),
	C nvarchar (MAX),
	D nvarchar (MAX),
	DapAn nvarchar(200),
	primary key(ID_CTDTHI,ID_DTHI)
);
--table CTLHPhan
create table CTLHPHAN(
	ID_CTLHPHAN char(10) not null primary key(ID_CTLHPHAN) constraint PK_CTLHPHAN default dbo.AUTO_IDCTLOPHP(),
	ID_SVIEN char(11) not null,
	ID_LOPHP char(8) not null,
);
--Table Câu hỏi
create table CAUHOI(
	ID_CAUHOI char(7) not null primary key(ID_CAUHOI) constraint PK_CAUHOI default dbo.AUTO_IDCAUHOI(),
	NOIDUNGCH nvarchar(MAX),
	HINH char(20),
	DAPAN nvarchar(200),
	A nvarchar(MAX),
	B nvarchar(MAX),
	C nvarchar(MAX),
	D nvarchar(MAX),
	CHUONG int,
	TTrang nvarchar(50),
	ID_MUCDO char(5) not null,
	ID_NHCH char(7) not null,
);
--Table Chức Vụ
 create table CHUCVU(
	ID_CVU char(6) not null primary key(ID_CVU) constraint PK_CVU default DBO.AUTO_IDCVU(),
	TENCVU nvarchar(50), 
 );
 --Table Đề Thi
 create table DETHI(
	ID_DETHI char(5) not null primary key(ID_DETHI) constraint PK_DTHI default DBO.AUTO_IDDETHI(),
	TENDETHI nvarchar(50),
	SLCAU int,
	TGLamBai int,
	GhiChu nvarchar(50),
	TinhTrang char(5),
	ID_NHCH char(7) not null,
	ID_GVIEN char(10) not null,
	ID_NAMHOC char(6) not null,
 );
 --Table Điểm Thi
 Create table KETQUA(
	ID_KQUA char(6) not null primary key(ID_KQUA) constraint PK_DIEMTHI default dbo.AUTO_IDDIEMTHI(),
	DIEMTHI float,
	SLCAUDUNG int,
	ID_BAITHI char(6) not null,
 );
 --Table Giảng Viên
 Create table GIANGVIEN(
	ID_GVIEN char(10) not null primary key(ID_GVIEN) constraint PK_GIANGVIEN default DBO.AUTO_IDGVIEN(),
	PASSGV nvarchar(30),
	TENGV nvarchar(50),
	HINHGV nvarchar(100),
	NAMSINH date,
	GIOITINH nvarchar(5),
	CHUYENMON nvarchar(50),
	TDHOCVAN nvarchar(50),
	ID_KHOA char(5) not null,
)
--Table Giảng viên chức vụ
create table GVIENCHUCVU(
	ID_CVU char(6) not null,
	ID_GVIEN char(10) not null,
	CONSTRAINT PK_NNND PRIMARY KEY(ID_CVU, ID_GVIEN),
	CONSTRAINT FK_NNND_ND FOREIGN KEY (ID_GVIEN) REFERENCES GIANGVIEN(ID_GVIEN),
	CONSTRAINT FK_NNND_NND FOREIGN KEY (ID_CVU) REFERENCES CHUCVU(ID_CVU)
);
--Table KocKy
create table HOCKY
(	
	ID_HOCKY char(10) not null primary key(ID_HOCKY) constraint PK_HOCKY default dbo.AUTO_IDHOCKY() ,
	TENHK nvarchar(50), 
);
--Table Khoa
create table KHOA(
	ID_KHOA char(5) not null primary key(ID_KHOA) constraint PK_KHOA default DBO.AUTO_IDKHOA(),
	TENKHOA nvarchar(50),
	DIADIEM nvarchar(200),
);
--Table Lịch thi
create table LICHTHI(
	ID_LICHTHI char(11)not null primary key(ID_LICHTHI) constraint PK_LICHTHI default DBO.AUTO_IDLICHTHI(),
	TENLICHTHI nvarchar(50),
	NGAYTAO datetime,
	NGAYTHI date,
	TietBĐ int,
	TietKT int,
	ID_GVIEN char(10) not null,
	ID_MONHOC char(5) not null,
	ID_NAMHOC char(6) not null,
	ID_HOCKY char(10) not null,
);
--Table Lớp
create table LOPHOCPHAN(
	ID_LOPHP char(8) not null primary key(ID_LOPHP) constraint PK_LOPHP default DBO.AUTO_IDLOPHP(),
	TENLOP nvarchar(50),
	SISO int ,
	DIADIEM nvarchar(20),
	TIETHOC nchar(10),
	ID_MONHOC char(5) not null,
	ID_GVIEN char(10) not null,
	ID_HOCKY char(10) not null,
	ID_NAMHOC char(6) not null,
);

--Table Môn học
create table MONHOC(
	ID_MONHOC char(5) not null primary key(ID_MONHOC) constraint PK_MONHOC default DBO.AUTO_IDMONHOC(),
	TENMONHOC nvarchar(50),
	TChi int,
	TONGCHUONG int,
	ID_KHOA char(5) not null,
);
--Table Mức độ
create table MUCDO(
	ID_MUCDO char(5) not null primary key(ID_MUCDO) constraint PK_MUCDO default dbo.AUTO_IDMUCDO(),
	TENMUCDO nvarchar(20),
);
--table Màn hình
create table MANHINH(
	ID_MANHINH char(6) not null primary key(ID_MANHINH) constraint PK_MANHINH default Dbo.Auto_IDMANHINH(),
	TENMANHINH nvarchar(100)
);
--Table Ngân hàng câu hỏi
create table NHCH(
	ID_NHCH char(7) not null primary key(ID_NHCH) constraint PK_NHCH default DBO.AUTO_IDNHCHOI(),
	TGCAPNHAT datetime,
	SLCAUHOI int,
	ID_GVIEN char(10),
	ID_MONHOC char(5) not null
);
--Table Năm Học
create table NAMHOC(
	ID_NAMHOC char(6) not null primary key(ID_NAMHOC) constraint PK_NAMHOC default DBO.AUTO_IDNAMHOC(),
	TENNAM nvarchar(30), 
);
--Table Sinh viên
create table SINHVIEN(
	ID_SVIEN char(11) not null primary key(ID_SVIEN) constraint PK_SINHVIEN default DBO.AUTO_IDSVien(),
	PASSSVIEN nvarchar(30),
	TENSV nvarchar(50),
	HINHSV Nvarchar(100),
	NAMSINH datetime,
	GIOITINH nvarchar(5),
	SDT char(12),
	DIACHI nvarchar(100),
	CMND nchar(15),
	QUEQUAN nvarchar(100),
	ID_KHOA char(5) not null,
);
--Table Tham gia thi
create table TGTHI(
	ID_TGTHI int not null,
	TTRANG int,
	ID_LICHTHI char(11)not null,
	ID_SVIEN char(11) not null,
	ID_BAITHI char(6) ,
	ID_PHONGTHI char(4) not null,
	constraint PK_TGTHI primary key(ID_TGTHI)
);
--Table Phòng thi
create table PHONGTHI(
	ID_PHONGTHI char(4) not null primary key(ID_PHONGTHI) constraint PK_PHONGTHI default dbo.AUTO_IDPHONG(),
	TENPHONG nvarchar(30),
	SL int
);
--table Phân quyền
CREATE TABLE PHANQUYEN
(
			ID_CVU			CHAR(6) NOT NULL,
			ID_MANHINH		char(6) not null,
			COQUYEN			BIT,
			CONSTRAINT PK_PHANQUYEN PRIMARY KEY(ID_CVU, ID_MANHINH),
			CONSTRAINT FK_PQ_MH FOREIGN KEY (ID_MANHINH) REFERENCES MANHINH(ID_MANHINH),
			CONSTRAINT FK_PQ_NNDA FOREIGN KEY (ID_CVU) REFERENCES CHUCVU(ID_CVU)
);

------------------------------------------------------------------------------------------------------------
/*Foreign*/
--Foreign Bài thi với Đề Thi
alter table BAITHI
Add constraint FK_BT_DETHI foreign key(ID_DETHI) references DETHI(ID_DETHI)
--Foreign Chi tiết đề thi với đề thi
alter table CTDTHI
add constraint FK_CTDTHI_DETHI foreign key(ID_DTHI) references DETHI(ID_DETHI)
--Foreign Chi tiết lớp học phần với sinh viên
alter table CTLHPHAN
add constraint FK_CTLHPHAN_SINHVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
--foreign chi tiết lớp học phần với lớp học phần
alter table CTLHPHAN
add constraint FK_CTLHPHAN_LOPHP foreign key(ID_LOPHP) references LOPHOCPHAN(ID_LOPHP)
--Foreign câu hỏi với mức độ
alter table CAUHOI
add constraint FK_CAUHOI_MUCDO foreign key(ID_MUCDO) references MUCDO(ID_MUCDO)
--foreign câu hỏi với ngân hàng câu hỏi
alter table CAUHOI
add constraint FK_CAUHOI_NHCH foreign key(ID_NHCH) references NHCH(ID_NHCH)
--foreign đề thi với ngân hàng câu hỏi
alter table DETHI
add constraint FK_DETHI_NHCH foreign key(ID_NHCH) references NHCH(ID_NHCH)
--foreign đề thi với giảng viên
alter table DETHI
add constraint FK_DETHI_GIANGVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--foreign kết quả với bài thi
alter table KETQUA
add constraint FK_KETQUA_BAITHI foreign key(ID_BAITHI) references BAITHI(ID_BAITHI)
--foreign giảng viên với khoa
alter table GIANGVIEN
add Constraint FK_GVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Lịch Thi với Nhân viên
alter table LICHTHI
add constraint FK_LichThi_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--foreign Lịch thi với Năm học********
alter table LICHTHI
add constraint FK_LICHTHI_NAMHOC foreign key(ID_NAMHOC) references NAMHOC(ID_NAMHOC)
--foreign Lịch thi với Môn học********
alter table LICHTHI
add constraint FK_LICHTHI_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--foreign Lịch thi với Học kìc********
alter table LICHTHI
add constraint FK_LICHTHI_HOCKY foreign key(ID_HOCKY) references HOCKY(ID_HOCKY)
--foreign lớp với Giảng viên
alter table LOPHOCPHAN
add constraint FK_LOP_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--Foreign lớp học phần với học kỳ
alter table LOPHOCPHAN
add constraint FK_LOPHOCPHAN_HOCKY foreign key(ID_HOCKY) references HOCKY(ID_HOCKY)
--Foreign Lớp học phần với Môn học
alter table LOPHOCPHAN
add constraint FK_LOPHOCPHAN_MONHOC foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)
--Foreign môn học với ngân hàng câu hỏi**************
alter table NHCH
add constraint FK_MONHOC_NHCH foreign key(ID_MONHOC) references MONHOC(ID_MONHOC)

--foreign môn học với khoa
alter table MONHOC
add constraint FK_MONHOC_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)

--Foreign ngân hàng câu hỏi với nhân viên
alter table NHCH
add constraint FK_NHCH_GVIEN foreign key(ID_GVIEN) references GIANGVIEN(ID_GVIEN)
--Foreing Sinh viên với khoa
alter table SINHVIEN
add constraint FK_SVIEN_KHOA foreign key(ID_KHOA) references KHOA(ID_KHOA)
--foreign Tham gia thi với lịch thi
alter table TGTHI
add constraint FK_TGTHI_LICHTHI foreign key(ID_LICHTHI) references LICHTHI(ID_LICHTHI)
--foreign tham gia thi với sinh viên
alter table TGTHI
add constraint FK_TGTHI_SVIEN foreign key(ID_SVIEN) references SINHVIEN(ID_SVIEN)
--foreign Tham gia thi với Bài thi
alter table TGTHI
add constraint FK_TGTHI_BAITHI foreign key(ID_BAITHI) references BAITHI(ID_BAITHI)
--foreign Tham gia thi với phòng thi
alter table TGTHI
add constraint FK_TGTHI_PHONGTHI foreign key(ID_PHONGTHI) references PHONGTHI(ID_PHONGTHI)
--foreign Lớp học phần với năm học
alter table LOPHOCPHAN
add constraint FK_LHPHAN_NAMHOC foreign key(ID_NAMHOC) references NAMHOC(ID_NAMHOC)
go

---------------------------------------------------------------------------------------------------
/*Trigger*/
--trigger Bài thi
create trigger tr_NextIDNBaiThi on BAITHI
for insert
as
begin
declare @lastID varchar(6)
set @lastID=(select top 1 ID_BAITHI from BAITHI
			order by ID_BAITHI desc)
Update BAITHI set ID_BAITHI=dbo.AUTO_IDBThi() where ID_BAITHI=''
end
go

--trigger Khoa
create trigger tr_NextIDKhoa on KHOA
for insert
as
begin
declare @lastID varchar(5)
set @lastID=(select top 1 ID_KHOA from KHOA
			order by ID_KHOA desc)
Update KHOA set ID_KHOA =dbo.AUTO_IDKHOA() where ID_KHOA=''
end
go

--trigger Giảng viên
create trigger tr_NextIDGVien on GIANGVIEN
for insert
as
begin
declare @lastID varchar(10)
set @lastID=(select top 1 ID_GVIEN from GIANGVIEN
			order by ID_GVIEN desc)
Update GIANGVIEN set ID_GVIEN =dbo.AUTO_IDGVIEN() where ID_GVIEN=''
end 
go

--trigger Sinh viên
create trigger tr_NextIDSVIEN on SINHVIEN
for insert
as
begin
declare @lastID varchar(11)
set @lastID=(select top 1 ID_SVIEN from SINHVIEN
			order by ID_SVIEN desc)
Update SINHVIEN set ID_SVIEN =dbo.AUTO_IDSVien() where ID_SVIEN=''
end 
go


--trigger Lớp học phần
create trigger tr_NextID_CTLHPHAN on CTLHPHAN
for insert
as
begin
declare @lastID varchar(10)
set @lastID=(select top 1 ID_CTLHPHAN from CTLHPHAN
			order by ID_CTLHPHAN desc)
Update CTLHPHAN set ID_CTLHPHAN =dbo.AUTO_IDCTLOPHP() where ID_CTLHPHAN=''
end 
go

--trigger Câu hỏi
create trigger tr_NextIDCauHoi on CAUHOI
for insert
as
begin
declare @lastID varchar(5)
set @lastID=(select top 1 ID_CAUHOI from CAUHOI
			order by ID_CAUHOI desc)
Update CAUHOI set ID_CAUHOI =dbo.AUTO_IDCAUHOI() where ID_CAUHOI=''
end 
go

--trigger Kết quả
create trigger tr_NextIDKetQua on KETQUA
for insert
as
begin
declare @lastID varchar(6)
set @lastID=(select top 1 ID_KQUA from KETQUA
			order by ID_KQUA desc)
Update KETQUA set ID_KQUA =dbo.AUTO_IDDIEMTHI() where ID_KQUA=''
end 
go

--trigger Đề thi
create trigger tr_NextIDDeThi on DETHI
for insert
as
begin
declare @lastID varchar(5)
set @lastID=(select top 1 ID_DETHI from DETHI
			order by ID_DETHI desc)
Update DETHI set ID_DETHI =dbo.AUTO_IDDETHI() where ID_DETHI=''
end 
go

--trigger Lớp học phần
create trigger tr_NextIDLHPHAN on LOPHOCPHAN
for insert
as
begin
declare @lastID varchar(10)
set @lastID=(select top 1 ID_LOPHP from LOPHOCPHAN
			order by ID_LOPHP desc)
Update LOPHOCPHAN set ID_LOPHP =dbo.AUTO_IDLOPHP() where ID_LOPHP=''
end 
go

--trigger Lịch thi
create trigger tr_NextIDLichThi on LICHTHI
for insert
as
begin
declare @lastID varchar(11)
set @lastID=(select top 1 ID_LICHTHI from LICHTHI
			order by ID_LICHTHI desc)
Update LICHTHI set ID_LICHTHI =dbo.AUTO_IDLICHTHI() where ID_LICHTHI=''
end 
go

--trigger Học kỳ
create trigger tr_NextIDHocKy on HOCKY
for insert
as
begin
declare @lastID varchar(10)
set @lastID=(select top 1 ID_HOCKY from HOCKY
			order by ID_HOCKY desc)
Update HOCKY set ID_HOCKY =dbo.AUTO_IDHOCKY() where ID_HOCKY=''
end 
go

--trigger Ngân hàng câu hỏi
create trigger tr_NextIDNHCH on NHCH
for insert
as
begin
declare @lastID varchar(7)
set @lastID=(select top 1 ID_NHCH from NHCH
			order by ID_NHCH desc)
Update NHCH set ID_NHCH =dbo.AUTO_IDNHCHOI() where ID_NHCH=''
end 
go

--trigger Chức vụ
create trigger tr_NextIDCVU on CHUCVU
for insert
as
begin
declare @lastID varchar(6)
set @lastID=(select top 1 ID_CVU from CHUCVU
			order by ID_CVU desc)
Update CHUCVU set ID_CVU =dbo.AUTO_IDCVU() where ID_CVU=''
end 
go

--trigger Môn học
create trigger tr_NextIDMonHoc on MONHOC
for insert
as
begin
declare @lastID varchar(5)
set @lastID=(select top 1 ID_MONHOC from MONHOC
			order by ID_MONHOC desc)
Update MONHOC set ID_MONHOC =dbo.AUTO_IDMONHOC() where ID_MONHOC=''
end 
go

--trigger Màn hình
create trigger tr_NextIDManHinh on MANHINH
for insert
as
begin
declare @lastID varchar(6)
set @lastID=(select top 1 ID_MANHINH from MANHINH
			order by ID_MANHINH desc)
Update MANHINH set ID_MANHINH =dbo.AUTO_IDMANHINH() where ID_MANHINH=''
end 
go

--trigger Môn học
create trigger tr_NextIDMucDo on MUCDO
for insert
as
begin
declare @lastID varchar(5)
set @lastID=(select top 1 ID_MUCDO from MUCDO
			order by ID_MUCDO desc)
Update MUCDO set ID_MUCDO =dbo.AUTO_IDMUCDO() where ID_MUCDO=''
end 
go

--trigger Năm học
create trigger tr_NextIDNamHoc on NAMHOC
for insert
as
begin
declare @lastID varchar(6)
set @lastID=(select top 1 ID_NAMHOC from NAMHOC
			order by ID_NAMHOC desc)
Update NAMHOC set ID_NAMHOC =dbo.AUTO_IDNAMHOC() where ID_NAMHOC=''
end 
go

--trigger Phòng thi
create trigger tr_NextIDPhong on PHONGTHI
for insert
as
begin
declare @lastID varchar(4)
set @lastID=(select top 1 ID_PHONGTHI from PHONGTHI
			order by ID_PHONGTHI desc)
Update PHONGTHI set ID_PHONGTHI =dbo.AUTO_IDPHONG() where ID_PHONGTHI=''
end 
go


---------------------------------------------------------------------------------------------------
/*Values*/
--Set dmy
SET DATEFORMAT DMY
--Học kỳ
INSERT INTO HOCKY(TENHK)
VALUES(N'Học kỳ 1')
INSERT INTO HOCKY(TENHK)
VALUES(N'Học kỳ 2')

--Khoa
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Thông tin',N'Tầng trệt, dãy nhà A,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Thực phẩm',N'Tầng trệt, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Sinh học',N'Tầng 1, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Thủy sản',N'Tầng trệt, dãy nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Hóa học',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')    ----5
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Môi trường - Tài nguyên và Biến đổi Khí hậu',N'B104, Tòa nhà B,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ cơ khí',N'31 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP. HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ Điện - Điện tử',N'31 Chế Lan Viên, Phường Tây Thạnh, Quận Tân Phú, TP. HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Công nghệ May và Thời trang',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Tài chính - Kế toán',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')         ----10
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Quản trị Kinh doanh',N'Tầng 3 nhà C,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Du lịch và Ẩm thực',N'Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Khoa học ứng dụng',N'Lầu 3, khu nhà C,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Chính trị - Luật',N'C301,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Ngoại ngữ',N'D.101,Trường Đại học Công nghiệp Thực phẩm Tp.HCM')       ----15
INSERT INTO KHOA (TENKHOA, DIADIEM)
VALUES (N'Giáo dục thể chất và Quốc phòng An ninh',N'72 NGUYỄN ĐỖ CUNG, P.TÂY THẠNH, Q.TÂN PHÚ, TP.HCM')

--Chức vụ
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Ban chủ nhiệm khoa')
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Trưởng bộ môn')
INSERT INTO CHUCVU (TENCVU)
VALUES (N'Giảng viên')
insert into CHUCVU(TENCVU)
values(N'Nhân viên khảo thí')

--Giảng viên
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lâm Thị Họa Mi',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Vũ Thanh Nguyên',NULL,NULL,N'Nam',N'',N'PGS.TS','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Nguyễn Huy Phương',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thanh Long',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Bích Ngân',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Vũ Đức Thịnh',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Văn Thịnh',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Dương Hà',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Văn Thế Thành',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Thị Châu Lan',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')   -----10
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123','Trần Đình Toàn',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hải Yến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Dương Thị Mộng Thùy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đinh Nguyễn Trọng Nghĩa',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Định',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Phương Hạc',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đinh Thị Mận',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thanh Thủy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thùy Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thu Tâm',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')   ----20
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Như Ý',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)		
VALUES ('123',N'Nguyễn Văn Tùng','10.png',NULL,N'Nam',N'',N'Thạc sĩ','KH001')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Nguyễn Đoan Duy',NULL,NULL,N'Nam',N'',N'PGS.TS','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thảo Minh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Lan Nhi',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thùy Dương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Dương Hữu Huy',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Minh Tâm',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phan Thế Duy',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Đình Thị Như Nguyện',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hữu Quyền',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Duy Anh Triết',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đặng Thị Yến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phan Thị Hồng Liên',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH002')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Minh Tuấn',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Văn Lộc',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Thị Kim Anh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lại Đình Biên',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Hoàng Dũng',NULL,NULL,N'Nam',N'',N'PGS.TS','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Hiền',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Quỳnh Hoa',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Quốc Huy',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Minh Phương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đào Thị Mỹ Linh',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Quỳnh Mai',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Tuyết Nhung',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Thị Anh Thoa',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Thị Thúy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Phạm Thị Phương Thùy',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Thị Hoàng Tuyến',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thu Huyền',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Nam Phương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Phạm Hương Huyền',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trịnh Thị Hương',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Phan Phương Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trịnh Xuân Ngọ',NULL,NULL,N'Nam',N'',N'PGS.TS','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Hoàng Ngâu',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Viết Thế',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hoàng XuânThế',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH003')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Ngô Thanh An',NULL,NULL,N'Nam',N'',N'PGS.TS','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đặng Văn Sử',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Bảo Long',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Lưu Dũng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đỗ Hữu Hoàng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Bùi Tấn Nghĩa',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Văn Tiến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Phạm Phương Trang',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Bùi Thu Hà',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đào Thanh Khê',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Tấn Thành',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Văn Sim',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thị Thanh Hiền',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Tấn Nhật',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Lê Thị Ngọc Hạnh',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Văn Phúc',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trương Bách Chiến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Tán Văn Hậu',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH016')        ---77
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N' Nguyễn Thị Lương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Đoàn Thị Minh Phương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Huỳnh Lê Huy Cường',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH014')  --- 80
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Trần Nguyễn An Sa',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Thúc Bội Huyên ',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Giang Ngọc Hà',NULL,NULL,N'Nữ',N'',N'Tiến sĩ','KH014')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Học Thắng',NULL,NULL,N'Nam',N'',N'Tiến sĩ','KH016')    ---84
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Hồ Thị Ngọc Sương',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Võ Thị Nhã Uyên',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Hưng Thủy',NULL,NULL,N'Nữ',N'',N'Thạc sĩ','KH005')
INSERT INTO GIANGVIEN(PASSGV, TENGV, HINHGV, NAMSINH,GIOITINH,CHUYENMON,TDHOCVAN,ID_KHOA)
VALUES ('123',N'Nguyễn Ngọc Kim Tuyến',NULL,NULL,N'Nam',N'',N'Thạc sĩ','KH005')

--Môn học
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',2,9,'KH014')
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Giáo dục quốc phòng - an ninh 1',3,18,'KH016') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Giáo dục quốc phòng - an ninh 2',3,10,'KH016') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Pháp luật đại cương',2,10,'KH014')
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',3,9,'KH014') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Kiến trúc máy tính',2,5,'KH001') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Tư tưởng Hồ Chí Minh',2,7,'KH014') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',3,8,'KH014') 
INSERT INTO MONHOC(TENMONHOC,TChi,TONGCHUONG,ID_KHOA)
VALUES(N'Hệ điều hành',3,6,'KH001') 

--Năm học
INSERT INTO NAMHOC(TENNAM)
VALUES('2021-2022')

--Lớp học phần
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021120025','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021120030','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021120027','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021120019','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 1',50,'MH001','2021120024','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH002','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH002','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH002','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH002','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 1',50,'MH002','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH003','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH003','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH003','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH003','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Giáo dục quốc phòng - an ninh 2',50,'MH003','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH004','2021120079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH004','2021120079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH004','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH004','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Pháp luật đại cương',50,'MH004','2021120079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH006','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH006','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH006','2021120081','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH006','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Những nguyên lý cơ bản của chủ nghĩa Mác-Lênin 2',50,'MH006','2021120082','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH005','2021120006','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH005','2021120007','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH005','2021120008','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH005','2021120009','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Kiến trúc máy tính',50,'MH005','2021120011','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH007','2021120082','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH007','2021120082','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH007','2021120083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH007','2021120083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Tư tưởng Hồ Chí Minh',50,'MH007','2021120083','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH008','2021120023','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH008','2021120022','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH008','2021120021','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH008','2021120020','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Hệ điều hành',50,'MH008','2021120019','2021000HK1','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH009','2021120079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH009','2021120079','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH009','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH009','2021120080','2021000HK2','NH2021')
INSERT INTO LOPHOCPHAN(TENLOP,SISO,ID_MONHOC,ID_GVIEN,ID_HOCKY,ID_NAMHOC)
VALUES(N'Đường lối cách mạng của Đảng Cộng sản Việt Nam',50,'MH009','2021120080','2021000HK2','NH2021')

--Value PHÒNG THI
insert into PHONGTHI(TENPHONG,SL)
values(N'A101',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A102',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A103',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A104',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A105',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A106',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A107',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A108',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A109',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A110',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A201',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A202',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A203',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A204',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A205',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A206',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A207',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A208',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A209',25)
insert into PHONGTHI(TENPHONG,SL)
values(N'A210',25)

--- values mức độ
insert into MUCDO(TENMUCDO)
values(N'Dễ')
insert into MUCDO(TENMUCDO)
values(N'Trung Bình')
insert into MUCDO(TENMUCDO)
values(N'Khó')

--values Giảng viên chức vụ
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120002','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120003','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120004','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120022','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120023','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120024','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120034','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120035','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120059','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120060','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120005','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120006','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120007','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120008','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120025','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120030','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120031','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120032','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120033','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120042','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120061','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120072','CVU002')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120079','CVU001')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120001','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120009','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120010','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120011','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120012','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120013','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120014','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120015','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120016','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120017','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120018','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120019','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120020','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120021','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120026','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120027','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120028','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120029','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120036','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120037','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120038','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120039','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120040','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120041','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120043','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120044','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120045','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120046','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120047','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120048','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120049','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120050','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120051','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120052','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120053','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120054','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120055','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120056','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120057','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120058','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120064','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120062','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120065','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120066','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120067','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120069','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120070','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120071','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120073','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120074','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120075','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120076','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120077','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120078','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120080','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120081','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120082','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120083','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120084','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120085','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120086','CVU003')
insert into GVIENCHUCVU(ID_GVIEN,ID_CVU)
values('2021120087','CVU003')


--values Sinh viên
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Thơ','svNu5.PNG','12/12/2000',N'Nữ','0937487645','','072100001396',N'Tây Ninh','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Võ Thị Cẩm Tú','svNu5.PNG','5/12/2000',N'Nữ','0931237645','','072100001397',N'TP.HCM','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Tạ Thị Minh Nhựt','svNu5.PNG','12/1/2000',N'Nữ','0931231236','','072100001399',N'Long An','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Hiếu','svNam4.PNG','12/2/2000',N'Nam','0937487123','','072100001393',N'TP.HCM','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Huy Hoàng','svNam5.PNG','1/7/2000',N'Nam','0912387645','','072100001394',N'Đòng Nai','KH001')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Ngọc Hoàng','svNam3.PNG','2/9/2000',N'Nam','0937123445','','072100001392',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Văn Vinh','svNam2.PNG','2/2/2000',N'Nam','0937412345','','072100001395',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thanh Tùng','svNam1.PNG','12/8/2000',N'Nam','095665645','','072100001391',N'Bình Dương','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Vũ Linh','svNam4.PNG','11/10/2000',N'Nam','0937499645','','072100001390',N'TP.HCM','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Huỳnh Thắng','svNam5.PNG','11/10/2000',N'Nam','0937487222','','072100001386',N'Tây Ninh','KH002')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Huyền Thoại','svNam1.PNG','3/8/2000',N'Nam','0937487345','','072100001387',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Hân','svNu4.PNG','9/1/2000',N'Nữ','0937487771','','072100001389',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Trang Trang','svNu3.PNG','2/7/2000',N'Nữ','0937787645','','072100001384',N'Đòng Nai','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Bích Thùy','svNu2.PNG','6/3/2000',N'Nữ','0937787645','','072100001383',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Ngọc Đạt','svNam1.PNG','5/2/2000',N'Nam','0937487655','','072100001385',N'TP.HCM','KH003')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đoàn Huy Hải','svNam2.PNG','8/11/2000',N'Nam','0937456645','','072100001380',N'Tiền Giang','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thanh Hoàng','svNam3.PNG','11/5/2000',N'Nam','0937687645','','072100001381',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Ngọc Đạt','svNam4.PNG','12/8/2000',N'Nam','0937487645','','072100001378',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thơ Thơ','svNu1.PNG','8/12/2000',N'Nữ','0932487645','','072100001379',N'TP.HCM','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Chí Hùng','svNam5.PNG','9/12/2000',N'Nam','03999187645','','072100001376',N'Tây Ninh','KH004')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Hiếu','svNam4.PNG','10/12/2000',N'Nam','0932417645','','072100001375',N'TP.HCM','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Vũ','svNam3.PNG','4/2/2000',N'Nam','0937487997','','072100001377',N'TP.HCM','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thanh Thảo','svNu2.PNG','2/4/2000',N'Nữ','0937487654','','072100001374',N'Đòng Nai','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Đức Đông','svNam2.PNG','12/7/2000',N'Nam','0937487635','','072100001373',N'Tây Ninh','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Hồ Văn Cường','svNam1.PNG','2/8/2000',N'Nam','0937487621','','072100001372',N'Tiền Giang','KH005')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Xuân Thi','svNu3.PNG','12/3/2000',N'Nữ','0936767645','','072100001371',N'Long An','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đặng Thị Thủy','svNu4.PNG','2/2/2000',N'Nữ','0937447645','','072100001368',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc My','svNu5.PNG','1/9/2000',N'Nữ','0938487645','','072100001366',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Bá Đức','svNam1.PNG','3/8/2000',N'Nam','0937487445','','072100001369',N'TP.HCM','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Huy Hoàng','svNam2.PNG','6/6/2000',N'Nam','0937488645','','072100001367',N'Bình Dương','KH007')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Cẩm Tiền','svNu1.PNG','5/7/2000',N'Nữ','0937488646','','072100001365',N'Đòng Nai','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Hoang','svNu2.PNG','9/9/2000',N'Nữ','0937488647','','072100001366',N'TP.HCM','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Văn Đức','svNam3.PNG','8/3/2000',N'Nam','0937488648','','072100001364',N'Tiền Giang','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Tú','svNam4.PNG','12/2/2000',N'Nam','0937488649','','072100001363',N'Tây Ninh','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Đông Quân','svNam5.PNG','12/9/2000',N'Nam','0936789645','','072100001361',N'Tây Ninh','KH008')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Tuyết','svNu3.PNG','2/1/2000',N'Nữ','0936789646','','072100001362',N'TP.HCM','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Hải Nam','svNam2.PNG','2/8/2000',N'Nam','0936789647','','072100001360',N'Long An','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Hải Nam','svNam1.PNG','12/8/2000',N'Nam','0936789648','','072100001359',N'Tây Ninh','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Đức','svNam3.PNG','1/4/2000',N'Nam','0936789649','','072100001357',N'Bình Dương','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thị Thủy','svNu4.PNG','1/6/2000',N'Nữ','0938887645','','072100001358',N'Tiền Giang','KH009')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Xuân Thi','svNu5.PNG','12/7/2000',N'Nữ','0938887646','','072100001356',N'Đòng Nai','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Cường','svNam4.PNG','12/9/2000',N'Nam','0937225645','','072100001355',N'TTP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Đức Đông','svNam5.PNG','12/3/2000',N'Nam','0938887647','','072100001354',N'TP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Ngọc Đạt','svNam1.PNG','12/9/2000',N'Nam','0938887648','','072100001353',N'TP.HCM','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thanh Tú','svNu2.PNG','12/2/2000',N'Nữ','0933347645','','072100001352',N'Bình Dương','KH010')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Vân','svNu1.PNG','12/1/2000',N'Nữ','0938887649','','072100001351',N'Tây Ninh','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Mỹ Vân','svNu5.PNG','12/12/2000',N'Nữ','0938887650','','072100001350',N'Long An','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Thanh Sang','svNam4.PNG','12/11/2000',N'Nam','0938887651','','072100001349',N'TP.HCM','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Nguyễn Văn Sang','svNam3.PNG','12/10/2000',N'Nam','0937421345','','072100001348',N'TTP.HCM','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Đức Tuấn','svNam2.PNG','1/10/2000',N'Nam','0938887652','','072100001347',N'Bình Dương','KH011')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Trần Thành Danh','svNam1.PNG','1/11/2000',N'Nam','0938887653','','072100001346',N'TP.HCM','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Đỗ Thị Nhanh','svNu4.PNG','2/7/2000',N'Nữ','0937489345','','072100001345',N'Đòng Nai','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Văn Danh','svNam4.PNG','1/9/2000',N'Nam','0938887654','','072100001344',N'Long An','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Thị Thi','svNu1.PNG','1/12/2000',N'Nữ','0938887655','','072100001343',N'TP.HCM','KH012')
INSERT INTO SINHVIEN(PASSSVIEN,TENSV,HINHSV,NAMSINH,GIOITINH,SDT,DIACHI,CMND,QUEQUAN,ID_KHOA)
VALUES('123',N'Lê Tuấn Sang','svNam2.PNG','12/1/2000',N'Nam','0938887656','','072100001342',N'TP.HCM','KH012')

--values Chi tiết Lớp Học Phần
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210021')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120001','20210016')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210016')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210021')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210027')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120002','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210001')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210006')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210016')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120003','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210007')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210026')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120004','20210041')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210007')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210012')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210027')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210037')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120005','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120006','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120007','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120008','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120009','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210024')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120010','20210038')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120011','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120012','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120013','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120014','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210005')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210015')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210020')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210025')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210035')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120015','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120016','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120017','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120018','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120019','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210017')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210032')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120020','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120021','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120022','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120023','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120024','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210002')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210011')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210022')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210031')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120025','20210040')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120026','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120027','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120028','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120029','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210003')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210013')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210033')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120030','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120031','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120032','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120033','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120034','20210043')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210004')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210014')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210018')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210023')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210034')
INSERT INTO CTLHPHAN(ID_SVIEN,ID_LOPHP)
VALUES('20210120035','20210043')

--- Ngân hàng câu hỏi
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('2/3/2021',40,'2021120079','MH001')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('10/3/2021',30,'2021120080','MH002')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',20,'2021120081','MH003')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',20,'2021120082','MH004')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',50,'2021120083','MH005')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',40,'2021120084','MH006')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',40,'2021120022','MH007')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',40,'2021120002','MH008')
INSERT INTO NHCH (TGCAPNHAT,SLCAUHOI,ID_GVIEN, ID_MONHOC)
VALUES ('7/3/2021',70,'2021120003','MH009')
GO
--- Câu hỏi
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Từ năm 1905 đến năm 1910, Nguyễn Tất Thành học tại trường nào?','',N'Trường Quốc học, Huế',N'Quốc Tử giám, Hà Nội',N'Trường làng, Nghệ An',N'Trường Quốc học, Huế',N'Trường Dục Thanh, Phan Thiết',1,N'Đã duyệt','MC002','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tác phẩm nào của Hồ Chí Minh là sự tập hợp những bài giảng của Hồ Chí Minh cho đội ngũ cán bộ cốt cán đầu tiên của Việt Nam nhằm tuyên truyền chủ nghĩa Mác – Lênin để chuẩn bị cho sự ra đời một chính đảng vô sản kiểu mới ở Việt Nam?','',N'Đường Kách mệnh',N'Người cùng khổ',N'Đường Kách mệnh',N'Vấn đề dân bản xứ',N'Bản án chế độ thực dân Pháp',1,N'Đã duyệt','MC003','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Vì sao Hồ Chí Minh hoàn toàn tin theo Lênin và Quốc tế III?','',N'Vì họ bênh vực cho các dân tộc bị áp bức',N'Vì thắng lợi của Cách mạng Tháng Mười Nga',N'Vì đây là phương hướng mới',N'Vì họ bênh vực cho các dân tộc bị áp bức',N'Vì họ chiếm số động trên thế giới',1,N'Đã duyệt','MC002','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bạn hãy cho biết Hồ Chí Minh có bao nhiêu tên gọi, bút danh, bí danh?','',N'152',N'150',N'151',N'152',N'153',1,N'Đã duyệt','MC002','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Tất cả các dân tộc trên thế giới đều sinh ra bình đẳng, dân tộc nào cũng có quyền sống, quyền sung sướng và quyền tự do”. Câu trên trích từ tác phẩm nào của Hồ Chí Minh?','',N'Tuyên ngôn độc lập',N'Tuyên ngôn độc lập',N'Bản án chế độ thực dân Pháp',N'Chính cương sách lược vắn tắt',N'Đường cách mệnh',1,N'Đã duyệt','MC002','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị của bản tuyên ngôn độc lập của nước Việt Nam mới được đánh giá là','',N'Có giá trị lịch sử to lớn',N'Có giá trị bình thường',N'Có giá trị lịch sử to lớn',N'Có giá trị lịch sử đặc biệt',N'Là bản thiên cổ hùng văn',1,N'Đã duyệt','MC002','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thực chất của vấn đề dân tộc thuộc địa trong tư tưởng Hồ Chí Minh là gì?','',N'Đấu tranh giải phóng dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền bình đẳng giữa các dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền tự do dân chủ cho nhân dân, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đòi quyền tự trị dân tộc dưới sự bảo hộ của ngoại bang, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',N'Đấu tranh giải phóng dân tộc, thành lập nhà nước dân tộc độc lập, trong đó nhân dân là chủ thể tối cao của quyền lực nhà nước',2,N'Đã duyệt','MC003','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Cách mạng là phá cái cũ đổi ra cái mới, cái xấu đổi ra cái tốt”. Câu trên được trích từ tác phẩm nào của Hồ Chí Minh?','',N'Đạo đức cách mạng',N'Sửa đổi lề lối làm việc',N'Bản án chế độ thực dân Pháp',N'Đường Cách mệnh',N'Đạo đức cách mạng',2,N'Đã duyệt','MC003','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung cốt lõi của tư tưởng Hồ Chí Minh là','',N'Độc lập dân tộc gắn liền với chủ nghĩa xã hội',N'Chủ nghĩa yêu nước',N'Độc lập dân tộc gắn liền với chủ nghĩa xã hội',N'Chủ nghĩa xã hội',N'Chủ nghĩa nhân đạo chiến đấu',3,N'Đã duyệt','MC001','NHCH008')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“… toàn Đảng, toàn dân ta đoàn kết phấn đấu, xây dựng nước Việt Nam hoà bình, thống nhất, độc lập, dân chủ và giàu mạnh, và góp phần xứng đáng vào sự nghiệp cách mạng thế giới”. Đoạn văn trên được trích trong văn kiện nào của Hồ Chí Minh?','',N'Di chúc',N'Đường Kách mệnh',N'Di chúc',N'Lời kêu gọi ngày 17/7/1966',N'Báo cáo Chính trị tại Đại hội III của Đảng năm 1960',5,N'Đã duyệt','MC003','NHCH008')

INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thiết bị nào không phải là thiết bị nhập dữ liệu vào máy tính:','',N'Loa',N'Bàn phím',N'Loa',N'Chuột',N'Máy quét',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Máy vi tính không làm được việc gì','',N'Tự động nâng cấp tốc độ và khả năng xử lý',N'Truy cập dữ liệu từ xa thông qua mạng internet',N'Xử lý dữ liệu theo yêu cầu',N'Tính toán số liệu',N'Tự động nâng cấp tốc độ và khả năng xử lý',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Máy vi tính đọc dữ liệu nhanh nhất từ đâu:','',N'Đĩa cứng',N'Đĩa mềm',N'Đĩa cứng',N'Qua mạng internet',N'Đĩa CD ROM',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ trong của máy tính gồm','',N'RAM',N'Đĩa mềm, đĩa CD',N'ROM',N'Ổ đĩa cứng',N'RAM',3,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đĩa mềm hiện nay phổ biến có dung lượng là','',N'1.44 MB',N'1.2 MB',N'1.38 MB',N'1.44 MB',N'1.48 MB',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Dữ liệu trong thiết bị nhớ nào sẽ mất khi mất điện:','',N'RAM',N'Đĩa cứng',N'Đĩa mềm',N'RAM',N'ROM',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Dữ liệu trong bộ nhớ, thiết bị lưu trữ nào mất khi tắt máy tính:','',N'RAM',N'Đĩa cứng',N'RAM',N'ROM',N'Đĩa CDROM',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ điều hành Windows, chương trình nào quản lý tập tin, thư mục','',N'Windows Explorer',N'Windows Explorer',N'Internet Explorer',N'Control Panel',N'Caculator',5,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Bộ nhớ ngoài bao gồm','',N'Đĩa cứng',N'Đĩa cứng',N'RAM',N'ROM',N'CPU',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Bộ nhớ nào trong các bộ nhớ sau chứa các lệnh và dữ liệu của chương trình đang thực hiện:','',N'RAM',N'ROM',N'Đĩa từ',N'RAM',N'Băng từ',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Từ nào dưới đây không liên quan đến cấu trúc mạng máy tính?','',N'Token',N'Bus',N'Ring',N'Token',N'Star',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong máy tính thiết bị nào dùng để lưu trữ các thông tin cài đặt phần cứng (bộ nhớ, đĩa cứng, đĩa mềm, cache,…)','',N'CMOS',N'CMOS',N'BIOS',N'ROM',N'CPU',5,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'UPS (Uninterruptible Power Supply) là thiết bị dùng để','',N'Làm nguồn thay thế tạm thời trong thời gian ngắn cho máy tính khi mất nguồn điện chính',N'Làm nguồn điện bổ sung cho máy tính',N'Làm nguồn điện dùng cho máy tính ở những nơi không có điện',N'Nắn dòng nguồn điện cho máy tính',N'Làm nguồn thay thế tạm thời trong thời gian ngắn cho máy tính khi mất nguồn điện chính',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Một máy vi tính có thể có:','',N'Tối đa 02 ổ đĩa mềm',N'Tối đa 01 ổ đĩa mềm',N'Tối đa 02 ổ đĩa mềm',N'Tối đa 03 ổ đĩa mềm',N'Nhiều hơn 03 ổ đĩa mềm',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Quạt CPU dùng để:','',N'Làm mát cho chip CPU',N'Tạo xung nhịp cho chip CPU',N'Làm mát cho bo mạch chủ',N'Làm mát cho chip CPU',N'Chống bụi cho chip CPU',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong môi trường windows bạn có thể chạy cùng lúc :','',N'Chạy nhiều trình ứng dụng khác nhau',N'Hai chương trình',N'Chỉ chạy một chương trình',N'Chạy nhiều trình ứng dụng khác nhau',N'Tất cả các câu trên đều sai',1,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows cho phép đặt tên tối đa dài là……ký tự kể cả khoảng trống','',N'255',N'255',N'12',N'64',N'32',1,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)           -----10
VALUES(N'Muốn khởi động chương trình Windows Explorer, ta thực hiện:','',N'Nhấn phải chuột trên My Computer, Explorer',N'Nhấn phải chuột trên My Computer, Explorer',N'Ctrl + E',N'Nhấn vào biểu tượng chữ E trên màn hình',N'Tất cả đều đúng',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)           -----10
VALUES (N'Trong Windows Explorer, để tạo một tập tin mới ta vào','',N'File\New\Folder',N'File\New\Directory',N'File\New\Folder',N'Ba câu trên đều sai',N'File\Create Dir',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để đổi tên một tập tin đã đánh dấu ta vào:','',N'File\Rename',N'File\Rename',N'Edit\Rename',N'File\RD',N'Ba câu trên đều sai',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, muốn xoá một tập tin đã chọn vào:','',N'File\Delete…',N'File\Move…',N'File\Delete…',N'File\Delete directory',N'Ba câu trên đều sai',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để di chuyển một tập tin đã chọn ta vào:','',N'Ba câu trên đều sai',N'Edit\ chọn Cut',N'File\ chọn Delete',N'File\ chọn Move…',N'Ba câu trên đều sai',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để sao chép đĩa (đĩa mềm) ta thực hiện:','',N'Nhấp phải chuột trên đĩa mềm \ Copy Disk',N'Nhấp phải chuột trên đĩa mềm \ Copy Disk',N' Disk \ Format',N'Disk \ Make System Disk',N'Ba câu trên đều sai',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để tìm một tập tin ta thực hiện:','',N'File\ Search',N'File\ Find',N'File\ Search',N' Edit\ Find',N'Ba câu trên đều sai',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, muốn chọn (đánh dấu chọn) một nhóm các tập tin nằm rời rạc cách nhau ta:','',N'Nhấn phím Ctrl rồi Click chọn các tập tin muốn chọn',N'Nhấn phím Alt rồi Click chọn các tập tin muốn chọn',N'Nhấn phím Shift rồi Click chọn các tập tin muốn chọn',N'Nhấn phím Ctrl rồi Click chọn các tập tin muốn chọn',N'Không cách nào đúng',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để cài đặt thuộc tính một tập tin đã chọn ta vào:','',N'File\Properties\Attribute',N'File\Properties\Attribute',N'Edit\Properties\Attribute',N'File\Attribute',N'File\Rename',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Đâu là hệ điều hành :','',N'MISCROSOFT WINDOWS 2000',N'MISCROSOFT EXCEL',N'MISCROSOFT WINDOWS 2000',N'MISCROSOFT WORD',N'MISCROSOFT PAINT',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thuộc tính nào là thuộc tính ẩn của tập tin:','',N'Hidden',N'Archive',N'Read-only',N'Hidden',N'System',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây sẽ không thực hiện được với 1 cửa sổ đang ở chế độ cực đại kích thước?','',N'Di chuyển',N'Di chuyển',N'Đóng',N'Phục hồi kích thước cửa sổ',N'Tất cả các thao tác trên',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi xem thuộc tính của một File hoặc Folder, thông tin nào trong các thông tin sau giúp người dùng phân biệt được File hoặc Folder?','',N'Contains',N'Attribute',N'Location',N'Contains',N'Size',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong cửa sổ ListView của Windows Explorer, kiểu hiển thị nào cho phép người sử dụng có thể biết được kích thước của một File có chứa trong cửa sổ đó?','',N'Details',N'Tiles',N'Icons',N'List',N'Details',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Kiểu hiển thị nào sau đây trong cửa sổ ListView của Windows Explorer có thể cho người sử dụng biết được kiểu của File hoặc Folder?','',N'Details',N'Tiles',N'Icons',N'List',N'Details',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào trong các thao tác sau có thể thực hiện được trên cả hai cửa sổ TreeView và ListView của Windows Explorer?','',N'Nới rộng hoặc thu hẹp 1 cấp Folder',N'Sắp xếp Folder hoặc File',N'Nới rộng hoặc thu hẹp 1 cấp Folder',N'Trở lên trên 1 cấp Folder',N'Thay đổi kiểu hiển thị',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows Explorer, bấm Ctrl+A chỉ có tác dụng trên cửa sổ','',N'List View',N'List View',N'Tree View',N'Cả hai cửa sổ đều có tác dụng',N'Cả hai cửa sổ đều không có tác dụng',3,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, khi nhắp phải chuột tại vùng trống trên cửa sổ List View, chọn mục nào sau đây có thể sắp xếp được File hoặc Folder trong cửa sổ đó?','',N'View',N'Copy',N'View',N'Cut',N'Properties',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Dùng chuột kéo và thả một File từ Folder này sang Folder khác đồng thời bấm giữ phím CTRL, đó là thao tác :','',N'Sao Chép',N'Xoá',N'Di Chuyển',N'Sao Chép',N'Đổi Tên',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Dùng chuột kéo và thả một File từ Folder này sang Folder khác, đó là thao tác :','',N'Di Chuyển',N'Sao Chép',N'Xoá',N'Đổi Tên',N'Di Chuyển',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Muốn tạo một Folder trên Desktop của Windows, ta nhắp phải chuột tại vùng trống trên Desktop và chọn:','',N'New -> Folder',N'New Folder',N'Properties -> Folder',N'New -> Folder',N'Properties -> New Folder',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây để sắp xếp các cửa sổ trên Desktop theo hàng ngang:','',N'Nhắp phải chuột trên vùng trống của thanh TaskBar chọn Windows Tile Horizontally',N'Nhắp phải chuột trên vùng trống Desktop, chọn Arrange Windows',N'Chọn Start -> Program -> Arrange Windows',N'Nhắp phải chuột trên Start -> chọn Arrange Windows',N'Nhắp phải chuột trên vùng trống của thanh TaskBar chọn Windows Tile Horizontally',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi màu nền của Desktop, ta thực hiện :','',N'Nhắp phải chuột tại vùng trống của Desktop, chọn Properties -> Change Color',N'Nhắp phải chuột tại vùng trống của Desktop, chọn Properties -> Change Color',N'Nhắp phải chuột tại vùng trống của Desktop, chọn Properties -> Background',N'Nhắp phải chuột tại vùng trống của Desktop, chọn Properties -> Change Background',N'Nhắp phải chuột tại vùng trống của Desktop, chọn Properties -> Appearance',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi biểu tượng của ShortCut, ta thực hiện :','',N'Nhắp phải chuột tại ShortCut, chọn Properties -> Change Icon',N'Change ShortCut Icon',N'Nhắp phải chuột tại ShortCut chọn Change Icon',N'Nhắp phải chuột tại ShortCut, chọn Properties -> Change Icon',N'Nhắp phải chuột tại ShortCut, chọn Properties -> ShortCut -> Change Icon',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để tạo một Folder mới trong Windows Explorer, ta chọn Folder cha ở cửa sổ bên trái (TreeView) và thao tác như sau:','',N'Chọn File -> New -> Folder',N'Chọn Edit -> New Folder',N'Chọn File -> New Folder',N'Chọn Edit -> New -> Folder',N'Chọn File -> New -> Folder',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong một cửa sổ tệp hồ sơ, bấm Ctrl+A là để:','',N'Chọn tất cả các tệp hồ sơ và tập tin có trong tệp hồ sơ đó',N'Chọn tất cả các tệp hồ sơ và tập tin có trong tệp hồ sơ đó',N'Xoá tất cả các tệp hồ sơ và tập tin có trong tệp hồ sơ đó',N'Đổi tên tất cả các tệp hồ sơ và tập tin có trong tệp hồ sơ đó',N'Sao chép tất cả các tệp hồ sơ và tập tin có trong tệp hồ sơ đó sang nơi khác',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nhắp phải chuột tại một biểu tượng trên Desktop và chọn mục Copy là  tương đương với thao tác:','',N'Bấm tổ hợp phím Ctrl + C',N'Bấm tổ hợp phím Ctrl + M',N'Bấm tổ hợp phím Ctrl + V',N'Bấm tổ hợp phím Ctrl + C',N'Bấm tổ hợp phím Ctrl + X',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows cho phép đặt tên (File, Folder hoặc ShortCut) kể cả ký tự trắng (khoảng trống) với độ dài tối đa :','',N'255 ký tự',N'64 ký tự',N'16 ký tự',N'32 ký tự',N'255 ký tự',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows, ta có thể chạy(run) cùng lúc :','',N'Nhiều chương trình ứng dụng khác nhau',N'Chỉ một chương trình',N'Hai chương trình',N'Nhiều chương trình ứng dụng khác nhau',N'Tối đa 10 chương trình',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Windows là một hệ điều hành','',N'Đa nhiệm',N'Đơn nhiệm',N'Đa nhiệm',N'Cả A và B đều đúng',N'Cả A và B đều sai',5,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để khởi động Explorer ta thực hiện :','',N'Right click chuột vào biểu tượng My Computer rồi chọn Explore',N'Right click chuột vào biểu tượng My Computer rồi chọn Explore',N'Double click chuột vào biểu tượng My Computer',N'Double click chuột vào biểu tượng My Document',N'Tất cả đều đúng',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để khởi động Explorer ta thực hiện :','',N'Bấm tổ hợp Windows + E',N'Bấm tổ hợp phím ALT + Spacebar',N'Bấm tổ hợp Windows + E',N'Double Click chuột vào nút lệnh Start',N'Bấm tổ hợp phím ALT +A',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Explorer là chương trình :','',N'Quản Lý File và Folder',N'Dùng làm trình duyệt Internet',N'Dùng để soạn thảo văn bản',N'Quản Lý File và Folder',N'Dùng để tính toán các bảng lương, vật tư...',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để tìm kiếm một tập tin hay một Folder, ta thực hiện :','',N'Click chuột vào nút Start -> Find -> Files or Folders',N'Click chuột vào nút Start -> Programs',N'Click chuột vào nút Start -> Find -> Files or Folders',N'Bấm tổ hợp phím Ctrl + A',N'Nhắp phải chuột tại biểu tượng My Computer và chọn Explorer',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để di chuyển một cửa sổ hiện hành trong môi trường Windows, ta thực hiện thao tác nào sau đây trên thanh tiêu đề của cửa sổ ?','',N'Drag',N'Double click chuột',N'Click chuột',N'Drag',N'Right Click chuột',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để tự động ẩn thanh TaskBar ta thực hiện :','',N'Chọn Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Auto Hide -> Apply -> OK',N'Chọn Start -> Programs -> Explorer',N'Chọn Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Auto Hide -> Apply -> OK',N'Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Always On Top -> Apply -> OK',N'Tất cả đều sai',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để hiện thị đồng hồ trên thanh TaskBar ta thực hiện :','',N'Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Show Clock -> Apply -> OK',N'Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Show Clock -> Apply -> OK',N'Start -> Setting -> TaskBar & Start Menu -> TaskBar Option -> Always On Top -> Apply -> OK',N'Right click chuột vào chổ trống trên TaskBar -> Cascade Windows',N'Right click chuột vào chỗ trống trên TaskBar -> ToolBars -> Address',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để chuyển đổi qua lại giữa các trình ứng dụng đang được kích hoạt, ta sử dụng :','',N'Tổ hợp phím Alt + Tab',N'Tổ hợp phím Alt + Tab',N'Tổ hợp phím Ctrl + Tab',N'Tổ hợp phím Shift + Tab',N'Tổ hợp phím Ctrl + C',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để hiển thị tập tin và thư mục bị ẩn, tại cửa sổ của Windows Explorer ta thực hiện :','',N'Tools -> Folder Options -> View -> Chọn Show Hidden File and folders -> Apply -> OK',N'Chọn Tools -> Folder Options -> View -> Bỏ chọn Hide File Extension For Known File Types -> Apply -> OK',N'Tools -> Folder Options -> View -> Chọn Show Hidden File and folders -> Apply -> OK',N'Tools -> Folder Options -> View -> chọn Hide File Extension For Known File Types -> Apply -> OK',N'Tất cả các câu trên đều đúng',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi làm việc với Windows Explorer để sắp xếp các File hoặc Folder trên cửa sổ ListView, ta thực hiện :','',N'Chọn View -> Arrange Icons',N'Chọn View -> Arrange Icons',N'Chọn View ->  Customize This Folder',N'Chọn File ->  Properties',N'Chọn View ->  As Web Page',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi Right Click chuột vào biểu tượng tập tin và chọn Copy là để :','',N'Sao chép tập tin',N'Sao chép tập tin',N'Xoá tập tin',N'Đổi tên tập tin',N'Di chuyển tập tin',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi Right Click chuột vào biểu tượng tập tin và chọn Cut là để :','',N'Di chuyển tập tin',N'Sao chép tập tin',N'Xoá tập tin',N'Đổi tên tập tin',N'Di chuyển tập tin',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi Right Click chuột vào biểu tượng tập tin và chọn Delete là để :','',N'Xoá tập tin',N'Sao chép tập tin',N'Xoá tập tin',N'Đổi tên tập tin',N'Di chuyển tập tin',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để xoá một File hay một Folder ta thực hiện :','',N'Tất cả các câu đều đúng',N'Right click chuột vào biểu tượng File hoặc Folder rồi chọn Delete',N'Chọn File hoặc Folder và bấm phím Delete',N'Đánh dấu chọn File hay Folder cần xoá rồi Click chuột tại vào File chọn Delete trên thanh công cụ',N'Tất cả các câu đều đúng',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi làm việc với Windows Explorer ta chọn View -> Status Bar là để :','',N'Hiển thị thanh trạng thái Status Bar',N'Hiển thị thanh địa chỉ Address Bar',N'Hiển thị thanh trạng thái Status Bar',N'Hiển thị thanh công cụ chuẩn Standard Buttons',N'Tất cả đều sai',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong cửa sổ Windows Explorer, kích thước của các tập tin được chọn sẽ hiển thị trên :','',N'Thanh trạng thái - Status Bar',N'Thanh địa chỉ - Address Bar',N'Thanh trạng thái - Status Bar',N'Thanh công cụ chuẩn - Standard Buttons',N'Tất cả câu đều đúng',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi thuộc tính của tập tin thì ta thực hiện :','',N'Tất cả các cách đều đúng',N'Right Click chuột vào biểu tượng tập tin và chọn Properties',N'Đánh dấu chọn tập tin, chọn menu File và chọn Properties',N'Tất cả các cách đều đúng',N'Tất cả các cách đều sai',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để mở hộp ControlBox của một cửa sổ, ta bấm tổ hợp phím :','',N'Alt + Space Bar',N'Ctrl+Tab',N'Alt + Space Bar',N'Alt + Tab',N'Ctrl + Alt',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để xoá hẳn một File mà không đưa vào Recycle Bin, ta chọn File đó rồi nhấn :','',N'Shift + Delete',N'Shift + Delete',N'Shift + Ctrl',N'Shift + Alt',N'Ctr + Delete',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để xoá sạch tất cả File hoặc Folder trong Recycle Bin thì ta thực hiện :','',N'Right click chuột vào biểu tượng  Recycle Bin -> Empty Recycle bin',N'Right click chuột vào biểu tượng Recycle Bin -> Properties',N'Right click chuột vào biểu tượng  Recycle Bin -> Empty Recycle bin',N'Right click chuột vào biểu tượng  Recycle Bin -> Explore',N'Tất cả đều sai',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer khi ta ấn tổ hợp phím Alt + <- (Mũi tên qua trái)  thì tương ứng với việc Click chuột vào nút gì trên thanh công cụ ?','',N'Back',N'Up',N'Forward',N'Cut',N'Back',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer khi ta ấn tổ hợp phím Alt + -> (Mũi tên qua phải) thì tương ứng với việc Click chuột vào nút gì trên thanh công cụ ?','',N'Forward',N'Up',N'Forward',N'Cut',N'Back',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi màn hình nền Desktop thì ta thực hiện :','',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Desktop',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Desktop',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Background',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Screen saver',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Appearance',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi chế độ bảo vệ  màn hình thì ta thực hiện :','',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Screen saver',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Setting',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Background',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Screen saver',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Appearance',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi chế độ hiển thị màu thì ta thực hiện :','',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Desktop- Color',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Desktop- Color',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Background',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Screen saver',N'Right click chuột tại chỗ trống trên Desktop -> Properties -> Appearance',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác Right Click chuột tại chỗ trống trên Desktop -> Properties tương ứng với các thao tác nào sau đây ?','',N'Start -> Settings -> Control Panel  Display',N'Start -> Settings -> Control Panel  Display',N'Start -> Settings -> Control Panel  Date/Time',N'Start -> Settings -> Control Panel  System',N'Start -> Settings -> Control Panel -> Add New Hardware',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi cách thể hiện thông tin ngày tháng năm, ta chọn Start -> Settings -> Control Panel rồi chọn :','',N'Regional Settings',N'Display',N'Regional Settings',N'Date/Time',N'Mouse',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác Right click chuột vào biểu tượng My Computer -> Properties tương ứng với việc Double Click chuột vào biểu tượng nào trong cửa sổ Control Panel?','',N'System',N'Display',N'Date/Time',N'System',N'Regional Settings',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi xoá một ShortCut thì :','',N'File nguồn không bị xoá',N'File nguồn cũng bị xoá',N'File nguồn không bị xoá',N'File bị di chuyển sang một Folder khác',N'Tất cả đều đúng',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để chọn các biểu tượng nằm cách nhau trên màn hình nền Desktop, ta dùng chuột nhắp chọn từng biểu tượng một đồng thời bấm giữ phím :','',N'CTRL',N'ALT',N'CTRL',N'ENTER',N'SHIFT',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để cực đại hoá kích thớc cửa sổ, ta thực hiện :','',N'Kích vào nút Maximize',N'Kích vào nút Maximize',N'Mở ControlBox và chọn Maximize',N'Double Click vào Title Bar của cửa sổ',N'Các cách trên đều được',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Tại màn hình Windows, để hiển thị giờ hệ thống trên thanh TaskBar, ta thực hiện :','',N'Kích chuột phải trên thanh TaskBar, chọn Properties và đánh dấu chọn Show the Clock',N'Kích chuột phải trên nền Desktop, chọn Properties và đánh dấu chọn Show the Clock',N'Kích chuột phải trên thanh TaskBar, chọn Properties và đánh dấu chọn Show the Clock',N'Chọn Start -> Setting -> Control Panel, chọn Date/Time',N'Tất cả các câu đều đúng',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong cửa sổ Windows Explorer, để tìm tên Folder hoặc File ta bấm tổ hợp phím :','',N'Ctrl+F',N'Ctrl+F',N'Ctrl+G',N'Ctrl+A',N'Ctrl+H',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong cửa sổ Windows Explorer, để thiết lập thuộc tính cho các Folder đã được chọn ta thực hiện lệnh :','',N'File - Properties',N'File - Properties',N'View - Properties',N'Edit - Properties',N'Tất cả các câu đều đúng',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi làm việc với Windows Explorer ta chọn View -> ToolBars -> Standard Buttons là để :','',N'Hiển thị thanh công cụ chuẩn Standard Buttons',N'Hiển thị thanh địa chỉ Address Bar',N'Hiển thị thanh trạng thái Status Bar',N'Hiển thị thanh công cụ chuẩn Standard Buttons',N'Tất cả các câu đều sai',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để tự động sắp xếp đều các ShortCut trên màn hình nền, ta thực hiện thao tác nào trong các thao tác sau :','',N'Nhắp chuột phải tại vùng trống trên Desktop, chọn Arrange Icons và chọn Auto Arrange',N'Nhắp chuột phải tại vùng trống trên Desktop, chọn Arrange Icons và chọn Auto Arrange',N'Bấm chuột trái trên màn hình nền và chọn AutoSort',N'Bấm chuột trái trên màn hình nền, chọn Arrange Icons và chọn AutoSort',N'Bấm chuột phải trên màn hình nền và chọn Auto Arrange Icons',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để thay đổi các biểu tượng chuẩn của Windows như : My Computer, Recycle Bin ta thực hiện như sau :','',N'Tất cả các câu đều sai',N'Nhắp phải chuột tại biểu tượng, chọn Properties và chọn Change Icon',N'Nhắp phải chuột trên màn hình nền, chọn Properties và chọn Effect, tiếp tục đánh dấu chọn biểu tượng cần thay đổi và chọn tiếp Change Icons',N'Nhắp chuột tại biểu tượng và chọn Change Icons',N'Tất cả các câu đều sai',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để hiển thị nhãn của các nút lệnh trên thanh công cụ thì ta thực hiện :','',N'Tất cả đều sai',N'Chọn File -> Properties',N'Chọn View -> As Web Page',N'Chọn View -> ToolBars -> Text Lables',N'Tất cả đều sai',1,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để khởi động Explorer ta thực hiện :','',N'Tất cả các câu đều đúng',N'Kích chọn Start -> Programs -> Accessories-Windows Explorer',N'Nhấp phải chuột tại nút Start chọn Explore',N'Nhấp phải chuột tại biểu tượng My Computer trên Desktop, chọn Explore',N'Tất cả các câu đều đúng',1,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây dùng để sắp xếp các cửa sổ trên Desktop theo hàng dọc :','',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Tile Windows Vertically',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Tile Windows Horizontally',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Tile Windows Vertically',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Cascade Windows',N'Tất cả các thao tác đều sai',1,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây dùng để sắp xếp các cửa sổ trên Desktop theo kiểu xếp ngói :','',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Cascade Windows',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Tile Windows Horizontally',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Tile Windows Vertically',N'Nhắp phải chuột trên vùng trống của thanh TaskBar -> chọn Cascade Windows',N'Tất cả các câu đều sai',1,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Ta có thể chép một tập tin có kích thớc 2MB lên đĩa mềm hay không ?','',N'Không',N'Có',N'Không',N'Chỉ chép được khi nội dung tập tin đó chỉ chứa văn bản',N'Chỉ chép được khi nội dung tập tin đó chỉ chứa hình ảnh',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong hộp thoại ShutDown Windows, khi chọn Restart the Computer, có nghĩa là :','',N'Khởi động lại máy và vào hệ điều hành Windows',N'Thoát khỏi Windows',N'Khởi động lại máy và vào hệ điều hành Windows',N'Khởi động lại máy và vào hệ điều hành DOS',N'Tất cả các câu đều sai',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows Explorer, để xem dung lượng, phần mở rộng của các tập tin, ta thực hiện :','',N'Chọn View - Details',N'Chọn View - List',N'Chọn View - Details',N'Chọn File - Properties',N'Chọn File - ReName',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây dùng để sắp xếp các cửa sổ trên Desktop theo hàng dọc?','',N'Nhắp phải chuột trên vùng trống của thanh TaskBar, chọn Tile Windows Vertically',N'Nhắp phải chuột trên vùng trống Desktop, chọn Arrange Windows',N'Chọn Start -> Programs -> Arrange Windows',N'Nhắp phải chuột trên Start -> Chọn Arrange Windows',N'Nhắp phải chuột trên vùng trống của thanh TaskBar, chọn Tile Windows Vertically',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây dùng để sắp xếp các cửa sổ trên Desktop theo hàng ngang?','',N'Nhắp phải chuột trên vùng trống của thanh TaskBar - chọn Tile Windows Horizontally',N'Nhắp phải chuột trên vùng trống của thanh TaskBar - chọn Cascade Windows',N'Nhắp phải chuột trên vùng trống của thanh TaskBar - chọn Tile Windows Horizontally',N'Nhắp phải chuột trên vùng trống của thanh TaskBar - chọn Tile Windows Vertically',N'Cả 3 thao tác đều sai',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để mở hộp thoại tìm kiếm của Windows, tại màn hình Desktop ta nhấn tổ hợp phím :','',N'Phím Windows + F',N'Ctrl+F',N'Ctrl+Alt+F',N'Phím Windows + F',N'Không có tổ hợp phím nào đúng',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong Windows, ký tự phân cách hàng ngàn là','',N'Dấu chấm (.)',N'b. Dấu phẩy (,)',N'Dấu chẩm phẩy (;)',N'Dấu chấm (.)',N'Không có câu trả lời đúng',1,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác nào sau đây không thực hiện được trên cửa sổ TreeView của Windows Explorer?','',N'Sắp xếp các Folder',N'Nới rộng 1 cấp Folder',N'Thu hẹp 1 cấp Folder',N'Sắp xếp các Folder',N'Trở lên trên 1 cấp Folder',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thao tác nào trong các thao tác sau có thể thực hiện được trên cả hai cửa sổ TreeView và ListView của Windows Explorer?','',N'Mở 1  Folder',N'Thay đổi kiểu hiển thị',N'Mở 1  Folder',N'Nới rộng hoặc thu hẹp 1 cấp Folder',N'Sắp xếp Folder hoặc File',2,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Thao tác sắp xếp Folder hoặc File có thể thực hiện trên cửa sổ nào của Windows Explorer?','',N'ListView',N'TreeView',N'ListView',N'TreeView và ListView',N'Không có câu trả lời đúng',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong Windows, ký tự phân cách số thập phân là :','',N'Tuỳ thuộc vào ký tự do người dùng quy định trong Control Panel',N'Dấu chấm (.)',N'Dấu phẩy (,)',N'Dấu chẩm phẩy (;)',N'Tuỳ thuộc vào ký tự do người dùng quy định trong Control Panel',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Kiểu hiển thị ngày tháng năm trong Windows là :','',N'Tuỳ thuộc vào kiểu hiển thị do người dùng quy định trong Control Panel',N'DD/MM/YYYY',N'MM/DD/YYYY',N'DD/MM/YYYY',N'Tuỳ thuộc vào kiểu hiển thị do người dùng quy định trong Control Panel',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong phần mềm thư điện tử Outlook, ý nghĩa của biểu tượng ″Kẹp giấy″ xuất hiện bên cạnh các email mà bạn nhận được là','',N'Có tập tin đính kèm thư đó',N'Bạn bắt buộc phải trả lới email ngay khi đọc',N'Có tập tin đính kèm thư đó',N'Email có thông tin quan trọng',N'Cẩn thận, có virus gắn kèm email đó',5,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giao thức để truyền các tập tin trên mạng Internet giữa các máy tính với nhau là','',N'FTP: File Transfer Protocol',N'SNMP: Simple Network Management Protocol',N'SMTP: Simple Mail Transfer Protocol',N'FTP: File Transfer Protocol',N'HTTP: HyperText Transfer Protocol',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Giao thức mạng nào có thể được dùng để sao chép tệp về (download) nhưng không thể đưa lên mạng (upload) được?','',N'Cả 3 phương án đều sai',N'HTML',N'HTTP',N'FTP',N'Cả 3 phương án đều sai',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)           -----20
VALUES (N'Trong các mệnh đề sau mô tả chức năng của mạng Internet, mệnh đề nào đúng','',N'Internet là một mạng máy tính cài đặt nhiều dịch vụ khác nhau cùng dựa trên nền giao thức TCP/IP',N'Trên mạng Internet ngoài TCP/IP còn có thể sử dụng nhiều giao thức khác nhau',N'Internet là mạng máy tính toàn cầu cung cấp dịch vụ TCP/IP cho các mạng con khác',N'Internet là mạng máy tính bao gồm các ″mạng con″ được kết nối với nhau bởi các ″cầu nối″',N'Internet là một mạng máy tính cài đặt nhiều dịch vụ khác nhau cùng dựa trên nền giao thức TCP/IP',5,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong địa chỉ Internet: www.vnn.vn đâu là tên miền:','',N'vnn.vn',N'www.vnn',N'vnn.vn',N'www.vnn.vn',N'Cả 3 mệnh đề đều sai',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Để tìm kiếm cụm từ ″Hà Nội″ trong Website http:// vnexpress.net trên các Website tìm kiếm phổ biến, bạn phải dùng từ khoá nào để tìm được thông tin chính xác nhất:','',N'″Hà Nội″ site:vnexpress.net',N'″Hà Nội″ site:vnexpress.net',N'″Hà Nội″ in vnexpress.net',N'″Hà Nội″ + vnexpress.net',N'″Hà Nộ″ Website:vnexpress.net',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu kết nối Internet của bạn chậm, nguyên nhân chính là gì? (Chọn câu đúng nhất)','',N'Do nhiều người cùng truy cập làm cho tốc độ đường truyền bị giảm và thường hay bị nghẽn mạch',N'Do chưa trả phí Internet',N'Do Internet có tốc độ chậm',N'Do nhiều người cùng truy cập làm cho tốc độ đường truyền bị giảm và thường hay bị nghẽn mạch',N'Do người dùng chưa biết sử dụng Internet',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Khi đang truy cập Internet, phím tắt nào sau đây sẽ giúp bạn mở một cửa sổ mới mỗi khi click vào một liên kết:','',N'Nhấn và giữ phím Shift',N'Nhấn và giữ phím N',N'Nhấn và giữ phím Ctrl',N'Nhấn và giữ phím Shift',N'Nhấn và giữ phím Alt',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'TCP/IP là gì?','',N'Giao thức truyền tin trên mạng',N'Phần mềm quản lý truyền tin',N'Giao thức truyền tin trên mạng',N'Phần mềm tiện ích Internet',N'Cấu trúc liên kết mạng',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho biết tên thiết bị truyền thông cho phép máy tính truyền thông tin qua một đường truyền điện thoại chuẩn?','',N'Modem',N'Card mạng',N'Modem',N'Getway',N'Các ý trên đều sai',3,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Cho biết các mệnh đề sau mệnh đề nào đầy đủ và chính xác?','',N'HTTP là phương pháp truyền tải các trang WEB qua mạng',N'HTTP là tên bắt đầu của các trang WEB',N'HTTP là phương pháp truyền tải các trang WEB qua mạng',N'HTTP là hệ soạn thảo các trang WEB',N'HTTP là phương thức truy cập, tim kiếm các trang WEB',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong các thiết bị dưới đây, thiết bị nào không tham gia cấu tạo nên mạng cục bộ LAN','',N'Modem',N'Repeater',N'Hub',N'Bridge',N'Modem',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Giao thức để truyền các tập tin trên mạng Internet giữa các máy tính với nhau là','',N'FTP: File Transfer Protocol',N'SMTP: Simple Mail Transfer Protocol',N'FTP: File Transfer Protocol',N'HTTP: HyperText Transfer Protocol',N'SNMP: Simple Network Management Protocol',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong loại mạng nào dưới đây các máy tính nối mạng đều có vai trò như nhau?','',N'Peer to Peer',N'Client/Server',N'Internet',N'Mainframe',N'Peer to Peer',4,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Giao thức để truyền các tệp tin trên mạng Internet giữa các máy tính với nhau là:','',N'FTP: File Transfer Protocol',N'SMTP: Simple Mail Transfer Protocol',N'FTP: File Transfer Protocol',N'TCP: Transmission Control Protocol',N'IP: Internet Protocol',3,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Từ nào dưới đây không liên quan đến cấu trúc mạng máy tính?','',N'Token',N'Bus',N'Ring',N'Star',N'Token',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong máy tính thiết bị nào dùng để lưu trữ các thông tin cài đặt phần cứng (bộ nhớ, đĩa cứng, đĩa mềm, cache,…)','',N'CMOS',N'BIOS',N'CMOS',N'ROM',N'CPU',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để tạo một website cho riêng mình thì việc làm nào sau đây là không cần thiết','',N'Đăng ký là thuê bao Internet của một ISP',N'Tạo nội dung trang web',N'Thuê Hosting',N'Đăng ký là thuê bao Internet của một ISP',N'Đăng ký tên miền',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Loại kết nối mạng nào mà ở đó mỗi máy trạm có chức năng như một máy chủ?','',N'Peer-to-peer',N'Clien/Server',N'Server/Server',N'Quad-node Network',N'Peer-to-peer',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong các thiết bị sau các thiết bị nào kết nối với máy tính qua cổng nối tiếp:','',N'Modem',N'Màn hình',N'Card mạng',N'Modem',N'Bàn phím',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Mạng máy tính là:','',N'tập hợp các máy tính được nối với nhau bằng các thiết bị mạng và tuân theo một quy ước truyền thông',N'tập hợp các máy tính',N'mạng internet',N'mạng LAN',N'tập hợp các máy tính được nối với nhau bằng các thiết bị mạng và tuân theo một quy ước truyền thông',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trong các thiết bị dưới đây, thiết bị nào không phải là thiết bị mạng?','',N'Webcam',N'Vỉ mạng',N'Hub',N'Modem',N'Webcam',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mạng cục bộ là mạng','',N'kết nối một số lượng nhỏ máy tính gần nhau',N'kết nối một số lượng nhỏ máy tính gần nhau',N'có từ 10 máy trở xuống',N'kết nối các máy tính',N'của một gia đình hay của một phòng ban trong một cơ quan',1,N'Đã duyệt','MC002','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Mạng diện rộng là','',N'mạng liên kết các mạng cục bộ bằng các thiết bị kết nối',N'mạng có từ 100 máy trở lên',N'mạng liên kết các mạng cục bộ bằng các thiết bị kết nối',N'mạng internet',N'mạng của một quốc gia',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Câu nào trong các câu sau là phát biểu chính xác nhất về mạng Internet?','',N'là môi trường truyền thông toàn cầu dựa trên kĩ thuật máy tính',N'là mạng của các mạng, có qui mô toàn cầu',N'là mạng sử dụng cho mọi người, có rất nhiều dữ liệu phong phú',N'là mạng có quy mô toàn cầu hoạt động dựa trên giao TCP/IP',N'là môi trường truyền thông toàn cầu dựa trên kĩ thuật máy tính',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mô hình Client-server là mô hình','',N'xử lý phân tán ở nhiều máy, trong đó máy chủ cung cấp tai nguyên và các dịch vụ theo yêu từ máy khách',N'xử lý phân tán ở nhiều máy, trong đó máy chủ cung cấp tai nguyên và các dịch vụ theo yêu từ máy khách',N'b.xử lý được thực hiện ở một máy gọi là máy chủ. Máy trạm đơn thuần chỉ cung cấp quyền sử dụng thiết bị ngoại vi từ xa cho máy chủ',N'c.mọi máy trong mạng đều có khả năng cung cấp dịch vụ cho máy khác',N'máy chủ cung cấp thiết bị ngoại vi cho máy trạm. Máy trạm có thể dùng máy in hay ổ đĩa của máy chủ',5,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'WWW là viết tắt của cụm từ nào sau đây?','',N'World Wide Web',N'World Wide Web',N'World Win Web',N'World Wired Web',N'Windows Wide Web',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'E-mail là viết tắt của cụm từ nào sau đây?','',N'Electronic Mail',N'Else Mail',N'Electronic Mail',N'Electrical Mail',N'Exchange Mail',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Trình duyệt (Brower) dùng để truy cập trang web là loại phần mềm','',N'Ứng dụng',N'Ứng dụng',N'hệ thống',N'giải trí',N'văn phòng',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phần mềm nào dưới đây không phải là trình duyệt web','',N'Microsoft FrontPage',N'Cả 3 loại trên',N'Internet Explorer',N'Microsoft FrontPage',N'Netcape Navigator',4,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngôn ngữ nào sau đây được chuyên dùng để tạo ra các tài liệu văn bản xem được bằng trình duyệt web?','',N'HTML',N'HTML',N'Java',N'C',N'Pascal',2,N'Đã duyệt','MC001','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'phát biểu nào về E-mail dưới đây là đúng nhất?','',N'sau khi gửi, e-mail đến máy chủ e-mail của người nhận gần như tức thời',N'sau khi gửi, e-mail đến tay người nhận gần như tức thời',N'sau khi gửi, e-mail đến máy người nhận gần như tức thời',N'sau khi gửi, e-mail đến máy chủ e-mail của người nhận gần như tức thời',N'sau khi gửi, e-mail đến máy của người nhận ngay sau đó máy được kết nối Internet',2,N'Đã duyệt','MC003','NHCH009')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES(N'Phát biểu nào sau đây về E-mail  là phù hợp nhất?','',N'Chỉ gửi được một tệp bất kỳ có kích thước nhỏ',N'Chỉ gửi được một tệp văn bản',N'Chỉ gửi được một tệp ảnh khi nó đính kèm trong một văn bản',N'Gửi được một tệp bất kỳ ngoại trừ chương trình mã máy',N'Chỉ gửi được một tệp bất kỳ có kích thước nhỏ',2,N'Đã duyệt','MC003','NHCH009')


INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Máy tính đầu tiên ENIAC sử dụng linh kiện nào trong số các linh kiện sau?','',N'Đèn điện tử',N'Đèn điện tử',N'IC bản dẫn',N'Transistor trường',N'Transistor lưỡng cực',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các phát biểu sau, phát biểu nào đúng?','',N'Phần cứng của máy tính bao gồm các đối tượng vật lý như: bản mạch chính, bộ nhớ RAM, ROM, đĩa cứng, màn hình',N'Phần cứng của máy tính bao gồm các đối tượng như: bản mạch chính, bộ nhớ RAM, bộ nhớ ROM, đĩa cửng, màn hình và chương trình được cải đặt trong ROM',N'Phần cứng của máy tính là chương trình được cải đặt trong bộ nhớ ROM',N'Phần cứng của máy tính chính là bộ xử lý trung tâm',N'Phần cứng của máy tính bao gồm các đối tượng vật lý như: bản mạch chính, bộ nhớ RAM, ROM, đĩa cứng, màn hình',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các thành phần cơ bản của một máy tính gồm','',N'Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi',N'Bộ nhớ trong, CPU và khối phối ghép vào ra ',N'Bộ nhớ trong, CPU và thiết bị ngoại vi',N'Bộ nhớ trong, CPU, khối phối ghép vào ra và thiết bị ngoại vi',N'Bộ nhớ trong, CPU, bộ nhớ ngoài, bộ phối ghép vào ra và thiết bị ngoại vi',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phần dẻo (Firmeare) trong máy tính là gì?','',N'Phần mềm được đặt vào bên trong các mạch điện tử trong quá trình sản xuất',N'Phần mềm được đặt vào bên trong các mạch điện tử trong quá trình sản xuất',N'Hệ điều hành',N'Các Drive cho các thiết bị phần cứng và các mạch hỗ trợ phối ghép vào ra cho máy tính',N'Phần mềm máy tính',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một ví dụ về phần dẻo (Firmeare) trong máy tính là:','',N'Chương trình điều khiển trong ROM BIOS',N'Hệ điều hành MS DOS',N'Chương trình điều khiển trong ROM BIOS',N'Chương trình Drive cho Card màn hình của máy tính',N'Phần mềm ứng dụng của người dùng',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc trao đổi dữ liệu giữa thiết bị ngoại vi và máy tính được thực hiện qua:','',N'Một cổng',N'Một thanh ghi điều khiển',N'Một cổng',N'Thanh ghi AX',N'Thanh ghi cờ',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phần mềm của máy tính là:','',N'Chương trình được cải đặt trong bộ nhớ ROM',N'Các bộ điều phối thiết bị giúp cho việc ghép nối và ra được thực hiện một cách linh hoạt',N'Cơ cấu trao đổi dữ liệu giữa các thiết bị phần cứng trong máy tính',N'Chương trình được cải đặt trong bộ nhớ ROM',N'Bộ vi xử lý và các vi mạch hỗ trợ cho nó',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm:','',N'Đơn vị phối ghép vào ra',N'Đơn vị phối ghép vào ra',N'Khối số học và logic',N'Tập các thanh ghi đa năng',N'Khối điều khiển',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các bộ phận sau, bộ phận nào không thuộc bộ xử lý trung tâm','',N'Bộ nhớ trong',N'Bộ nhớ trong',N'Khối số học và logic',N'Tập các thành ghi đa năng',N'Khối điều khiển để thi hành lệnh một cách tuần tự và tác động lên các mạch chức năng nhằm thì hành lệnh',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các bộ phận sau, bộ phận nào thuộc bộ xử lý trung tâm:','',N'Tập các thanh ghi đa năng',N'Bộ nhớ trong',N'Đơn vị phối ghép vào ra',N'Tập các thanh ghi đa năng',N'Khối điều khiển Bus hệ thống',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tại sao bộ nhớ trong của máy tính được gọi là bộ nhớ truy cập ngẫu nhiên?','',N'Thời gian truy cập vào một ô nhớ bất kỷ là như nhau',N'Giá trị các ô nhớ là ngẫu nhiên',N'Thời gian truy cập vào một ô nhớ bất kỷ là như nhau',N'Bộ nhớ gồm các module có thứ tự sắp xếp ngẫu nhiên',N'Thời gian truy cập vào một ô nhớ bất kỳ là ngẫu nhiên',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ đồng hồ hệ thống được đo bằng đơn vị gì?','',N'Hz',N'Bits',N'Baud',N'Byte',N'Hz',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Người ta đánh giá sự phát triển của máy tính điện tử số qua các giải đoạn dựa vào tiêu chí nào trong các tiêu chí sau đây?','',N'Cả 3 tiêu chi trên',N'Tốc độ tính toán của máy tính',N'Mức độ tích hợp của các vi mạch điện tử trong máy tính',N'Chức năng của máy tính',N'Cả 3 tiêu chi trên',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn một phương án đúng trong các phương án sau','',N'Máy Turing gồm một bộ điều khiển trạng thái hữu hạn, một băng ghi và một dầu đọc ghi',N'Máy Turing gồm một bảng ghi (tape) và một bộ xử lý trung tâm',N'Máy Turing gồm một bộ điều khiển trạng thái hữu hạn, một băng ghi và một dầu đọc ghi',N'Máy Turing gồm một bộ xử lý trung tâm và một cơ cấu lưu trữ Hồm tại KC nhỏ',N'Máy Turing gồm một dấu dọc ghi, một bộ xử lý trung tâm, và một băng ghi',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong các nội dung của nguyên lý Von Newmann là:','',N'Máy tính có thể hoạt động theo một chương trình đã được lưu trữ',N'Máy tính có thể hoạt động theo một chương trình đã được lưu trữ',N'Máy tính có thể điều khiển mọi hoạt động bằng một chương trình',N'Bộ nhớ máy tính không thể địa chỉ hóa được duy nhất',N'Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các phát biểu sau, phát biểu nào không thuộc nội dung của nguyên lý Von Newmann?','',N'Mỗi câu lệnh phải có một vùng nhờ chứa địa chỉ lệnh tiếp theo',N'Máy tính có thể hoạt động theo một chương trình đã được lưu trữ',N'Máy tính sử dụng một bộ đểm chương trình để chỉ ra vị trí câu lệnh kể tiếp',N'Bộ nhớ của máy tính được địa chi hóa',N'Mỗi câu lệnh phải có một vùng nhờ chứa địa chỉ lệnh tiếp theo',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các phát biểu sau, phát biểu nào thuộc nội dung của nguyên lý Von Newmann?','',N'Máy tính sử dụng một bộ đểm chương trình để chỉ ra vị trí câu lệnh kế tiếp',N'Máy tính sử dụng một bộ đểm chương trình để chỉ ra vị trí câu lệnh kế tiếp',N'Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất',N'Bộ nhớ máy tính không thể địa chỉ hóa được',N'Mỗi câu lệnh phải có một vùng nhớ chứa địa chỉ lệnh tiếp theo',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phát biểu sau đây thuộc nội dung của nguyên lý Von Newmann?','',N'Bộ nhớ của máy tính được địa chỉ hóa',N'Các chương trình chỉ được nạp khi thực hiện',N'Máy tính có thể điều khiển mọi hoạt động bằng một chương trình duy nhất',N'Bộ nhở máy tính không thể địa chỉ hóa được',N'Bộ nhớ của máy tính được địa chỉ hóa',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo nguyên lý Von Newmann, để thay đổi thứ tự các lệnh được thực hiện, ta chỉ cần:','',N'Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp',N'Thay đổi nội dung thanh ghi con trỏ lệnh bằng địa chỉ lệnh cần thực hiện tiếp',N'Thay đổi nội dung trong vùng nhớ chứa địa chỉ chương trình đang thực hiện',N'Thay đổi nội dung thanh ghi mảng mã lệnh',N'Thay đổi nội dung thanh ghi mảng dữ liệu',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo nguyên lý Von Newmann, để truy cập một khỏi dữ liệu, ta cần:','',N'Xác định địa chỉ của khối dữ liệu',N'Xác định địa chi và trạng thái của khối dữ liệu',N'Xác định địa chỉ của khối dữ liệu',N'Xác định trạng thái của khối dữ liệu',N'Xác định nội dung của khối dữ liệu',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thông tin được lưu trữ vả truyền bên trong máy tinh dưới dạng:','',N'Nhị phân',N'Nhị phân',N'Mã ASSCII',N'Thập phân',N'Kết hợp chữ cái và chữ số',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo nguyên lý Von Newmann, việc cải đặt dữ liệu vào máy tính được thực hiện bằng:','',N'Xung điện',N'Đục lỗ trên băng giấy',N'Đục lỗ trên bia và đưa vào bằng tay',N'Xung điện',N'Xung điện tử',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chỉ ra khẳng định sai trong các khẳng định sau:','',N'Mỗi hệ đếm được xây dựng trên một tập ký số vô hạn',N'Hệ đếm là tập hợp các ký hiệu và qui tắc sử dụng tập ký hiệu đỏ để biểu diễn và xác định giá trị các số',N'Tổng số kỷ số của mỗi hệ đếm được gọi là cơ số',N'Mỗi hệ đếm được xây dựng trên một tập ký số vô hạn',N'Hệ dểm La mã là hệ đếm không có trọng số',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hệ đếm là gi?','',N'Tập hợp các ký hiệu và qui tắc sử dụng nó để biểu diễn và xác định giá trị các số',N'Hệ thống các kí hiệu để biểu diễn các số',N'Hệ thống các qui tắc và phép tính để biểu biểu diễn các số',N'Tập hợp các ký hiệu và qui tắc sử dụng nó để biểu diễn và xác định giá trị các số',N'Tập hợp các ký hiệu để biểu diễn các qui tắc đếm',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ dễm thập phân, giá trị của mỗi con số phụ thuộc vào:','',N'Bản thân chữ số đó và vị trí của nó',N'Bản thân chữ số đó',N'Vị trí của nó',N'Bản thân chữ số đó và vị trí của nó',N'Mối quan hệ với các chữ số trước và sau nó',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm La Mã, giá trị của mỗi chữ số phụ thuộc vào:','',N'Bản thân chữ số đó',N'Bản thân chữ số đó',N'Vị trí của nó',N'Bản thân chữ số đỏ và vị trí của nó',N'Mối quan hệ với các chữ số trước và sau nó',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm nhị phần, giá trị của mỗi con số phụ thuộc vào','',N'Bản thân chữ số đỏ và vị trí của nó',N'Mối quan hệ với các chữ số trước và sau nó',N'Bản thân chữ số đó',N'Vị trí của nó',N'Bản thân chữ số đỏ và vị trí của nó',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong số dấu chấm động biểu diễn dạng 32 bit trong máy tính, thành phân định trị có độ dài bao nhiêu bit?','',N'24 bit',N'16 bit',N'18 bit',N'20 bit',N'24 bit',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong số dấu chấm động biểu diễn dạng 32 bit trong máy tính, thành phần định trị có độ dài bao nhiêu bit','',N'1 bit',N'1 bit',N'2 bit',N'3 bit',N'5 bit',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong số dấu chấm động biểu diễn dạng 32 bit trong máy tính, thành phần số mũ có độ dài bao nhiêu bit?','',N'7 bit',N'6 bit',N'7 bit',N'8 bit',N'9 bit',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chữ số L trong hệ đếm La mả tương ứng với giá trị nào trong các giá trị sau đây:','',N'50',N'50',N'100',N'500',N'1000',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chữ số C trong hệ đếm La mã tương ứng với giá trị thập phần nào trong các giá trị sau đây:','',N'100',N'20',N'100',N'200',N'500',1,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chữ số D trong hệ đểm La mã tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'500',N'100',N'200',N'500',N'1000',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chữ số M trong hệ đêm La mã tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'1000',N'50',N'1000',N'200',N'500',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số CD nhận giả trị thập phân nào trong các giá trị sau','',N'400',N'600',N'400',N'200',N'500',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số DC nhận giá trị thập phần nào trong các giá trị sau','',N'600',N'600',N'400',N'500',N'200',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số LD nhận giá trị thập phân nào trong các giá trị sau đây:','',N'450',N'350',N'450',N'550',N'650',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số MD nhận giá trị thập phần nào trong các giá trị sau đây:','',N'1500',N'1400',N'1500',N'1600',N'1700',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số CM nhận giá trị thập phân nào trong các giá trị sau đây:','',N'900',N'1600',N'1500',N'1100',N'900',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mà số MCL nhận giá trị thập phân nào trong các giá trị sau đây:','',N'1150',N'1150',N'1050',N'950',N'650',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số MCC nhận giá trị thập phân nào trong các giá trị sau đây:','',N'1200',N'600',N'700',N'1100',N'1200',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số MLD nhận giá trị thập phân nào trong các giá trị sau đây:','',N'1450',N'1150',N'1050',N'1450',N'1650',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số DLL nhận giá trị thập phân nào trong các giá trị sau đây:','',N'600',N'400',N'600',N'800',N'1200',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số MCD nhận giá trị thập phân nào trong các giá trị sau đây:','',N'1400',N'1400',N'1450',N'1600',N'1650',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ La mã số MMCMLXXVI nhận giả trị thập phân nào trong các giá trị sau đây:','',N'2976',N'2756',N'1846',N'2866',N'2976',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 11101.11 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'29,75',N'26,75',N'29,75',N'29,65',N'26,65',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 10101.11 tương ứng với giả trị thập phân nào trong các giá trị sau đây:','',N'21.75',N'21.75',N'23.75',N'21.65',N'23.65',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 10101.01 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'21,25',N'23.75',N'21.75',N'21,25',N'23.25',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 11101.01 tương ứng với giá trị thập phần nào trong các giá trị sau đây:','',N'29.25',N'27.75',N'29.75',N'27.25',N'29.25',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 10111.1 tương ứng với giả trị thập phân nào trong các giá trị sau đây','',N'23.5',N'23.5',N'23.25',N'25.5',N'25.25',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 11001.01 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'27.75',N'27.75',N'25.25',N'27.25',N'25.75',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ nhị phân số 11001.11 tương ứng với giá trị thập phân nảo trong các giá trị sau đây:','',N'25.75',N'27.75',N'29.75',N'25.75',N'29.25',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm bát phân, số 235.64 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'157.8125',N'157.8125',N'165.8125',N'157.825',N'165.825',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm bát phân số 237.64 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'159.8125',N'157.8125',N'159.8125',N'157.825',N'159.825',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm bát phân số 237.04 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'159.0625',N'157.0625',N'157.8125',N'159.0625',N'159.8125',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đểm bát phân số 235.04 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'157.0625',N'157.0125',N'159.0125',N'159.0625',N'157.0625',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm bát phản số 237.04 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'159.0625',N'157.0625',N'157.8125',N'159.0625',N'159.8125',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đểm thập lục phân số 34F5 tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'13557',N'13557',N'15775',N'15459',N'13267',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm thập lục phân số 345F tương ứng với giá trị thập phân nào trong các giá trị sau đây:','',N'13407',N'13557',N'13407',N'15459',N'13267',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ đếm thập lục phân (Hexa) số 3CF5 tương ứng với giá trị thập phần nào trong các giá trị sau đây:','',N'15605',N'13537',N'15725',N'15605',N'13287',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 267 tương ứng với giá trị nhị phân nào trong các giá trị sau đây:','',N'100001011',N'100001011',N'101001011',N'100101011',N'100101011',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 247 tương ứng với giá trị nhị phân nào trong các giá trị sau đây:','',N'11110111',N'10001011',N'11100111',N'11110111',N'11010111',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 285 tương ứng với giá trị nhị phân nào trong các giá trị sau đây:','',N'100011101',N'100001011',N'100011101',N'100101011',N'100101001',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 277 tương ứng với giá trị nhị phân nào trong các giá trị sau đây:','',N'100010101',N'100001001',N'100011011',N'100101011',N'100010101',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 899 tương ứng với giá trị bát phân nào trong các giá trị sau đây:','',N'1603',N'1505',N'1603',N'1607',N'1705',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 859 tương ứng với giá trị bát phân nào trong các giá trị sau đây:','',N'1533',N'1533',N'1633',N'1637',N'1733',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 799 tương ứng với giá trị bát phần nào trong các giá trị sau đây:','',N'1437',N'1545',N'1403',N'1437',N'1565',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 785 tương ứng với giá trị bát phân nào trong các giá trị sau đây:','',N'14218',N'1471',N'1461',N'1451',N'14218',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 865 tương ứng với giá trị bát phân nào trong các giá trị sau đây:','',N'1541',N'1541',N'1551',N'1561',N'1571',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số 841 tương ứng với giá trị bát phân nào trong các giá trị sau đây:','',N'1511',N'1505',N'1511',N'1531',N'1551',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tổng hai số nhị phân 1010101 và 1101011 bằng số nhị phân nào trong các số sau:','',N'11000000',N'11000000',N'10100000',N'10010000',N'10001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tổng hai số nhị phân 1010101 và 1100011 bằng số nhị phân nào trong các số sau:','',N'10111000',N'11000000',N'10111000',N'10011000',N'10001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tổng hai số nhị phân 1010101 và 1101001 bằng số nhị phân nào trong các số sau:','',N'10111110',N'10011000',N'10101000',N'10111110',N'10111010',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tổng hai số nhị phân 1011101 và 1101011 bằng số nhị phân nào trong các số sau:','',N'11001000',N'10011000',N'11100000',N'11010000',N'11001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kết quả cộng hai số nhị phân 1010111 và 1101011 bằng số nhị phân nào trong các số sau:','',N'11000010',N'10011000',N'11000010',N'10010000',N'10001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tổng hai số nhị phân 1001101 và 1101001 bằng nhị phân nào trong các số sau:','',N'10110110',N'10010010',N'10100000',N'10110110',N'10001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích hai số nhị phân 110 và 1011, bằng số nhị phân nào trong các số sau:','',N'1000010',N'1000010',N'1010000',N'1010110',N'1001000',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích hai số nhị phân 1110 và 1011 bằng số nhị phân nào trong các số sau','',N'10011010',N'10000110',N'10011010',N'10101010',N'10010010',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích hai số nhị phân 1101 và 1011 bằng số nhị phần nào trong các số sau:','',N'10001111',N'10000111',N'10100111',N'10001111',N'10010111',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích hai số nhị phân 1110 và 1010 bằng số nhị phân nào trong các số sau:','',N'10001100',N'10000100',N'10100100',N'10101100',N'10001100',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích hai số nhị phân 1101 và 1010 bằng số nhị phần nào trong các số sau:','',N'10000010',N'10000110',N'10000010',N'10100110',N'10010010',1,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ mã ASSCII mở rộng gồm bao nhiều kí tự?','',N'256',N'128',N'256',N'512',N'1024',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ mã ASSCII cơ sở gồm bao nhiều kí tự?','',N'128',N'128',N'256',N'512',N'1024',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ mã ASSCII cơ sở gồm các ki tự được mã hóa bằng bao nhiêu','',N'7 bit',N'6 bit',N'7 bit',N'8 bit',N'9 bit',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các kí tự được bổ sung trong bộ mà ASSCII mở rộng là các kí tự gì?','',N'Kí tự đồ họa',N'Kí tự điều khiển',N'Kí tự đồ họa',N'Kí tự chữ cái',N'Kí tự chữ số',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã NBCD biểu diễn mỗi chữ số thập phân bằng bao nhiêu bit','',N'4 bit',N'3 bit',N'4 bit',N'6 bit',N'8 bit',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã EBCDIC biểu diễn mỗi kí tự bằng bao nhiêu bit','',N'8 bit',N'4 bit',N'5 bit',N'6 bit',N'8 bit',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã NBCD là gì?','',N'Mã sử dụng các bit nhị phân để biểu diễn các chữ số hệ thập phân',N'Mã sử dụng các bit nhị phân để biểu diễn các chữ số hệ thập phân',N'Mã sử dụng các bit nhị phân để biểu diễn các chữ số hexa',N'Mà sử dụng các hit nhị phân để biểu diễn các chữ số hệ bát phân',N'Mã sử dụng các bit nhị phân để biểu diễn các kí tự ASSCH',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã ASSCII của chữ số 0 bằng bao nhiêu?','',N'30H',N'25H',N'30H',N'36H',N'40H',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã ASSCII của chữ số 9 bằng bao nhiêu?','',N'39H',N'25H',N'36H',N'39H',N'40H',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã ASSCII của chữ cái A bằng bao nhiêu?','',N'41H',N'35H',N'37H',N'39H',N'41H',1,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus hệ thống của máy tinh bao gồm:','',N'Bus dữ liệu, Bus địa chỉ và Bus điều khiển',N'Bus dữ liệu',N'Bus dữ liệu và Bus địa chỉ',N'Bus dữ liệu và Bus điều khiển',N'Bus dữ liệu, Bus địa chỉ và Bus điều khiển',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của hệ thống Bus trong máy tính là gì?','',N'Liên kết các thành phần trong máy tính',N'Mở rộng chức năng giao tiếp của máy tính',N'Liên kết các thành phần trong máy tính',N'Điều khiển các thiết bị ngoại vi',N'Biến dổi dạng tín hiệu trong máy tính',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus nào trong máy tính có nhiệm vụ là đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian?','',N'Bus bộ vi xử lý',N'Bus trong bộ vi xử lý',N'Bus bộ vi xử lý',N'Bus ngoại vi',N'Bus hệ thống',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus nào trong máy tinh có nhiệm vụ là đường truyền dẫn giữa các khối của bộ vi xử lý?','',N'Bus trong bộ vi xử lý',N'Bus trong bộ vi xử lý',N'Bus bộ vi xử lý',N'Bus ngoại vi',N'Bus hệ thống',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus nào trong máy tính có nhiệm vụ kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache','',N'Bus hệ thống',N'Bus trong bộ vi xử lý',N'Bus bộ vi xử lý',N'Bus ngoại vi',N'Bus hệ thống',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của Bus hệ thống trong máy tính là gì?','',N'Kết nối bộ vi xử lý với bộ nhở chỉnh, bộ nhớ Cache và các bộ điều khiển ghép nổi vào ra',N'Là đường truyền dẫn giữa các khối của bộ vi xử lý',N'Kết nối bộ vi xử lý với bộ nhở chỉnh, bộ nhớ Cache và các bộ điều khiển ghép nổi vào ra',N'Kết nối hệ thống vào ra với bộ vi xử lý',N'Đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm quan trọng của Bus đồng bộ là gì?','',N'Có tín hiệu đồng hồ chung điều khiển hoạt động',N'Dữ liệu được truyền đồng thời',N'Dữ liệu được truyền không đồng thời',N'Có tín hiệu đồng hồ chung điều khiển hoạt động',N'Không có tín hiệu đồng hỗ chung điều khiển hoạt động',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong các đặc điểm của Bus đồng bộ là','',N'Mọi thao tác được thực hiện trong những khoảng thời gian là bội số của chu kỷ Bus',N'Chu kỳ Bus thay đổi với từng cặp thiết bị trao đổi dữ liệu',N'Dữ liệu được truyền liên tục trong mọi chu kỳ Bus',N'Mọi thao tác được thực hiện trong những khoảng thời gian là bội số của chu kỷ Bus',N'Tần số tín hiệu đồng hổ chung thay đổi tùy theo điều kiện của hệ thống',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm quan trọng của Bus không đồng bộ là gi?','',N'Dữ liệu được truyền đồng thời',N'Dữ liệu được truyền không đồng thời',N'Có tin hiệu đồng hồ chung điều khiển hoạt động',N'Không có tin hiệu đồng hồ chung điều khiển hoạt động',N'Dữ liệu được truyền đồng thời',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các đặc điểm sau, đặc điểm nào không phải của Bus đồng bộ','',N'Việc trao đổi dữ liệu giữa các thiết bị cần có tín hiệu handshake',N'Chu kỳ Bus không thay đổi với mọi cặp thiết bị trao dồi dữ liệu',N'Hệ thống được định thời một cách gián đoạn',N'Mọi thao tác được thực hiện trong những khoảng thời gian là bội số của chu kỳ Bus',N'Việc trao đổi dữ liệu giữa các thiết bị cần có tín hiệu handshake',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tại sao trong thực tế Bus đồng bộ được sử dụng rộng rãi hơn Bus không đồng bộ?','',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Tận dụng tốt thời gian xử lý của CPU',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Dễ tận dụng các tiến bộ của công nghệ',N'Cho phép thay đổi chu kỳ Bus một cách mềm dẻo',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong trường hợp nào nên sử dụng Bus không đồng bộ','',N'Khi hệ thống có nhiều thiết bị với tốc độ chênh lệch nhau rất lớn',N'Khi hệ thống có nhiều thiết bị với tốc độ chênh lệch nhau rất lớn',N'Khi hệ thống có nhiều thiết bị với tốc độ chênh lệch nhau rất nhỏ',N'Mọi thao tác hầu hết có thời gian xử lý bằng bội số của chu kỳ Bus',N'Yêu cầu dễ dàng trong việc điều khiển hoạt động của máy tính',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong trường hợp nào nên sử dụng Bus đồng bộ?','',N'Mọi thao tác hầu hết có thời gian xử lý bằng bội số của chu kỳ Bus',N'Khi hệ thống có nhiều thiết bị với tốc độ chênh lệch nhau rất lớn',N'Yêu cầu chu kỳ Bus có thể thay đổi với từng cặp thiết bị trao đổi dữ liệu',N'Mọi thao tác hầu hết có thời gian xử lý bằng bội số của chu kỳ Bus',N'Yêu cầu tận dụng tốt thời gian xử lý của CPU',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus nào trong máy tính có nhiệm vụ kết nối các thiết bị vào ra với bộ vi xử lý','',N'Bus ngoại vi',N'Bus trong bộ vi xử lý',N'Bus bộ vi xử lý',N'Bus ngoại vi',N'Bus hệ thống',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của Bus ngoại vi trong máy tinh là gì?','',N'Kết nối hệ thống vào ra với bộ vi xử lý',N'Là dường truyền dẫn giữa các khối của bộ vi xử lý',N'Kết nối bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache',N'Kết nối hệ thống vào ra với bộ vi xử lý',N'Đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của Bus bộ vi xử lý trong máy tính là gi?','',N'Đường truyền dẫn giữa CPU và các vi mạch hỗ trợ',N'Là đường truyền dẫn giữa các khối của bộ vi xử lý',N'Kết nổi bộ vi xử lý với bộ nhớ chính và bộ nhớ Cache',N'Kết nối hệ thống vào ra với bộ vi xử lý',N'Đường truyền dẫn giữa CPU và các vi mạch hỗ trợ',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của Bus trong bộ vi xử lý của máy tính là gì?','',N'Là đường truyền dẫn giữa các khối của bộ vi xử lý',N'Là đường truyền dẫn giữa các khối của bộ vi xử lý',N'Kết nổi bộ vi xử lý với bộ nhớ chính và bộ nhỏ Cache',N'Kết nối hệ thống vào ra với bộ vi xử lý',N'Đường truyền dẫn giữa CPU và các chip hỗ trợ trung gian',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'So với Bus không đồng bộ, Bus đồng bộ có đặc điểm là:','',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Việc điều khiển hoạt động của máy tính khó khăn hơn',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Thiết kế hệ thống Bus khó khăn hơn',N'Dễ tận dụng tiến bộ của công nghệ chế tạo trong chế tạo Bus',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'So với Bus đồng bộ, Bus không đồng bộ có đặc điểm là:','',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Việc điều khiển hoạt động của máy tính khó khăn hơn',N'Việc điều khiển hoạt động của máy tính dễ dàng hơn',N'Thiết kế hệ thống Bus dễ dàng hơn',N'Khó tận dụng tiến bộ của công nghệ chế tạo trong chế tạo hệ thống Bus',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong trưởng hợp sử dụng Bus đồng bộ, nếu một thao tác có thời gian hoàn thành bằng 3,2 chu kỳ thi trong thực tế nó sẽ được thực hiện trong mấy chu kỳ?','',N'4',N'3',N'3,2',N'4',N'4,2',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong trường hợp sử dụng Bus không đồng bộ, nếu một thao tác có thời gian hoàn thành bằng 3,2 chu kỷ thì trong thực tế nó sẽ được thực hiện trong mấy','',N'3,2',N'3',N'3,2',N'4',N'4,2',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Độ rộng của Bus dược xác định bởi:','',N'Số đường dây dữ liệu của Bus',N'Số đường dây dữ liệu của Bus',N'Số thành phần được kết nối tới Bus',N'Số Byte dữ liệu được truyền trong một đơn vị thời gian',N'Số Bit dữ liệu được truyền trong một đơn vị thời gian',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tần số Bus đặc trưng cho:','',N'Tốc độ truyền dữ liệu trên Bus',N'Tốc độ điều khiển các thành phần của máy tính',N'Tốc độ truyền dữ liệu trên Bus',N'Tốc độ phân phối tài nguyên trong máy tính',N'Tốc độ cấp phát bộ nhớ cho các thành phần trong máy tính',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dải thông Bus được xác định bởi:','',N'Số lượng Byte chuyển qua Bus trong một đơn vị thời gian',N'Số lượng Byte chuyển qua Bus trong một chu kỳ xung nhịp',N'Số lượng Bit chuyển qua Bus trong một chu kỳ xung nhịp',N'Số lượng Byte chuyển qua Bus trong một đơn vị thời gian',N'Số lượng Bit chuyển qua Bus trong một đơn vị thời gian',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tham số nào đặc trưng cho tốc độ truyền dữ liệu trên Bus','',N'Tần số của Bus',N'Dải thông của Bus',N'Tần số của Bus',N'Độ rộng của Bus',N'Cả ba tham số trên',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tham số nào cho biết số lượng Byte chuyển qua Bus trong một đơn vị thời gian?','',N'Dải thông của Bus',N'Dải thông của Bus',N'Tần số của Bus',N'Độ rộng của Bus',N'Cả ba tham số trên',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tham số nào của Bus cho biết đường dây của nó?','',N'Độ rộng của Bus',N'Dải thông của Bus',N'Tần số của Bus',N'Độ rộng của Bus',N'Cả ba tham số trên',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các Bus sau, Bus nào là Bus một chiều?','',N'Bus địa chỉ',N'Bus dữ liệu bên trong bộ vi xử lý',N'Bus dữ liệu giữa bộ vi xử lý và bộ nhớ',N'Bus địa chỉ',N'Bus diều khiển',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus dữ liệu trong máy tính là:','',N'Bus hai chiều với từng đường dây',N'Bus một chiều',N'Bus hai chiều với từng đường dây',N'Bus một chiếu với từng dương dẫy nhưng là hai chiều với toàn bộ Bus',N'Bus có độ rộng thay đổi',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus địa chỉ trong máy tính là:','',N'Bus một chiều',N'Bus một chiều',N'Bus hai chiếu với từng đường dây',N'Bus một chiều với từng đường dây nhưng là hai chiều với toàn bộ Bus',N'Bus có độ rộng thay đổi',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus điểu khiển trong máy tính là:','',N'Bus một chiều với từng đường dây, là hai chiều với toàn bộ Bus',N'Bus một chiều',N'Bus hai chiều với từng đường dây',N'Bus một chiều với từng đường dây, là hai chiều với toàn bộ Bus',N'Bus có độ rộng thay đổi',2,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các Bus sau, Bus nào là Bus hai chiều đối với mỗi đường','',N'Bus dữ liệu',N'Bus dữ liệu',N'Bus địa chỉ cho bộ nhớ',N'Bus địa chỉ cho ngoại vi',N'Bus điều khiển',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus ISA có tần số là 8MHz, độ rộng Bus bằng 16 bit, thời gian truyền một khối 16 bit cần 2 chu kỳ. Khi đó dải thông của Bus bằng:','',N'8 MB/s',N'4 MB/s',N'8 MB/s',N'16 MB/s',N'32 MB/s',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus PCI có tần số là 33MHz. độ rộng Bus bằng 32 bit, thời gian truyền một khối 32 bit cần 2 chu kỳ. Khi đó dải thông của Bus bằng:','',N'66 MB/s',N'8 MB/s',N'16 MB/s',N'33 MB/s',N'66 MB/s',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trọng tải Bus có chức năng gi?','',N'Giải quyết vấn đề tranh chấp làm chủ Bus',N'Giải quyết vấn đề tranh chấp làm chủ Bus',N'Giải quyết vấn đề cấp phát bộ vi xử lý cho các thao tác',N'Giải quyết điều khiển bộ vi xử lý thực hiện các thao tác trao đổi với các thiết bị ngoại vi nổi tới Bus',N'Giải quyết vấn để cấp phải bộ nhỏ cho các thao tác của các thiết bị ngoại vi nổi tới Bus',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của trọng tài Bus tập trung:','',N'Việc phân chia quyển sử dụng Bus do một đơn vị trọng tài Bus duy nhất đảm nhiệm',N'Việc phân chia quyển sử dụng Bus do một đơn vị trọng tài Bus duy nhất đảm nhiệm',N'Việc phân chia quyền sử dụng Bus do các thiết bị ngoại vi tự thực hiện',N'Đơn vị trọng tài Bus đồng thời làm chủ Bus',N'Đơn vị trọng tải Bus nằm ở vị trí trung tâm của máy tính',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của trọng tải Bus không tập trung với multibus:','',N'Việc phân chia quyền sử dụng Bus không cần một đơn vị trọng tải Bus riêng biệt',N'Việc phân chia quyền sử dụng Bus do các thiết bị ngoại vĩ tự thực hiện',N'Việc phân chia quyền sử dụng Bus không cần một đơn vị trọng tải Bus riêng biệt',N'Đơn vị trọng tài Bus đồng thời làm chủ Bus',N'Đơn vị trọng tài Bus không nằm ở vị trí trung tâm của máy tính',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của trọng tài Bus tập trung một mức:','',N'Các thiết bị ngoại vi dùng chung một đường dây yêu cầu Bus',N'Các thiết bị nối với đơn vị trọng tài Bus bằng một dãy duy nhất',N'Các thiết bị ngoại vi dùng chung một đường dây yêu cầu Bus',N'Các thiết bị ngoại vi dùng chung một đường dây cho phép sử dụng Bus',N'Mỗi thiết bị ngoại vi có một dường dây yêu cầu Bus riêng',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của trọng tài Bus tập trung nhiều mức','',N'Các thiết bị ngoại vi được nổi tới các đường dây yêu cầu Bus khác nhau',N'Các thiết bị nối với đơn vị trọng tải Bus bằng một dãy duy nhất',N'Các thiết bị ngoại vi được nổi tới các đường dây yêu cầu Bus khác nhau',N'Các thiết bị ngoại vi được nổi tới tất cả các đường dây yêu cầu Bus',N'Mỗi thiết bị ngoại vi có một đường dây yêu cầu Bus riêng',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong kiểu trọng tải Bus nào thì việc phân chia quyển sử dụng Bus do một đơn vị trọng tải Bus duy nhất đảm nhiệm?','',N'Trọng tải Bus tập trung',N'Trọng tài Bus không tập trung',N'Trọng tải Bus tập trung',N'Tất cả các kiểu',N'Không có kiểu nào trong hai kiểu trên',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong kiểu trọng tài Bus nào thì việc phân chia quyền sử dụng Bus không cần một đơn vị trọng tài Bus riêng biệt','',N'Trọng tài Bus không tập trung',N'Trọng tài Bus không tập trung',N'Trọng tải Bus tập trung',N'Trọng tài Bus tập trung một mức',N'Trọng tải Bus tập trung nhiều mức',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong kiểu trọng tài Bus nào thì các thiết bị ngoại vi dùng chung một đường dây yêu cầu Bus','',N'Trọng tài Bus tập trung một mức',N'Trọng tải Bus không tập trung',N'Trọng tải Bus tập trung',N'Trọng tài Bus tập trung một mức',N'Trọng tài Bus tập trung nhiều mức',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong kiểu trọng tải Bus nào thì các thiết bị ngoại vi được nối với các dường dây yêu cầu Bus khác nhau?','',N'Trọng tải Bus tập trung nhiều mức',N'Trọng tài Bus không tập trung',N'Trọng tải Bus tập trung',N'Trọng tài Bus tập trung một mức',N'Trọng tải Bus tập trung nhiều mức',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thành phần nào có thể đóng vai trò chủ Bus (Bus Master)?','',N'CPU hoặc các chip vào ra IO đều có thể đóng vai trò chủ Bus',N'Chi CPU có thể đóng vai trò chu Bus',N'Chỉ các chip vào ra IO có thể đóng vai trò chủ Bus',N'CPU hoặc các chip vào ra IO đều có thể đóng vai trò chủ Bus',N'Chỉ một chip vào ra IO duy nhất được chỉ định đóng vai trò chủ Bus',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus dữ liệu của bộ vi xử lý Intel 8088 có bao nhiêu đường?','',N'8 đường',N'8 đường',N'16 đường',N'20 đường',N'24 đường',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây IOR, IOW trong các máy tính sử dụng bộ vi xử lý 8086/8088 thuộc vào Bus nào?','',N'Bus điều khiển',N'Bus bộ vi xử lý',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây D0-D7 trong các máy tính sử dụng bộ vi xử lý Intel 8086/8088 thuộc vào Bus nào?','',N'Bus dữ liệu',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây IOCHCHK, IOCHRDY trong các máy tính sử dụng bộ vi xử lý 8086/8088 thuộc vào Bus nào?','',N'Bus điều khiển',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây A0-A19 trong các máy tính sử dụng bộ vi xử lý 8086/8088 thuộc vào Bus nào?','',N'Bus địa chỉ',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây DACKO-DACK3 trong các máy tính sử dụng bộ vi xử lý 8086/8088 thuộc vào Bus nào?','',N'Bus điều khiển',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu ALE trong Bus IBM PC có chức năng gì?','',N'Chốt địa chỉ',N'Chốt dữ liệu',N'Chốt địa chỉ',N'Chốt tín hiệu điều khiển',N'Chốt tín hiệu yêu cầu ngắt',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu AEN trong Bus IBM PC thuộc vào Bus nào?','',N'Bus điều khiển',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các dưởng TRỌ trong các Bus máy tính IBM PC có chức năng gi?','',N'Các yêu cầu ngắt',N'Các yêu cầu sử dụng Bus',N'Các yêu cầu DMA',N'Các yêu cầu truy nhập bộ nhớ',N'Các yêu cầu ngắt',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường DRQ trong các Bus máy tinh IBM PC có chức năng gi?','',N'Các yêu cầu truy nhập bộ nhớ trực tiếp DMA',N'Các yêu cầu sử dụng Bus',N'Các yêu cầu truy nhập bộ nhớ trực tiếp DMA',N'Các yêu cầu truy nhập bộ nhớ',N'Các yêu cầu ngắt',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus EISA có tần số là 8MHz, độ rộng Bus bằng 32 bit, thời gian truyền một khối 32 bit cần 2 chu kỳ. Khi đó dải thông của Bus bằng:','',N'16 MB/s',N'4 MB/s',N'8 MB/s',N'16 MB/s',N'32 MB/s',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus MCA có tần số là 10Mllz, độ rộng Bus bằng 32 bit, thời gian truyền một khối 32 bit cần 2 chu kỳ. Khi đó dải thông của Bus bằng:','',N'20 MB/s',N'5 MB/s',N'10 MB/s',N'20 MB/s',N'40 MB/s',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus USB là gì?','',N'Bus tuần tự đa năng',N'Bus tuần tự tiên tiến',N'Bus tuần tự mở rộng',N'Bus tuần tự đa năng',N'Bus tuần tự kết hợp',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giao diện Bus USB có bao nhiêu đường dây','',N'4 đường',N'2 đường',N'4 đường',N'6 đường',N'8 đường',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus USB có bao nhiêu dây truyền dữ liệu?','',N'2 đường',N'2 đường',N'4 đường',N'6 đường',N'8 đường',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của Bus USB','',N'Truyền dữ liệu theo phương pháp vi sai',N'Truyền dữ liệu theo phương pháp vi sai',N'Truyền dữ liệu theo phương pháp song song',N'Truyền dữ liệu theo cấp chuẩn IDE',N'Truyền dữ liệu theo cấp chuẩn RS-232',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chuẩn USB 2.0 cả tốc độ truyền dữ liệu bằng bao nhiêu?','',N'Khoảng 360 – 480 Mbit/s',N'Khoảng 110 — 180 Mbit/s',N'Khoảng 200 – 320 Mbit/s',N'Khoảng 360 – 480 Mbit/s',N'Khoảng 500 - 640 Mbit/s',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Có thể có tối đa bao nhiêu thiết bị USB nối tới một USB Hub','',N'127',N'63',N'127',N'255',N'511',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus IBM PC cho máy tính IBM PC/AT sử dụng bộ vi xử lý nào sau đây của Intel?','',N'8088',N'8085',N'8088',N'80386',N'80486',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các đường dây MEMR, MEMW trong các máy tinh sử dụng bộ vi xử lý 8086/8088 thuộc vào Bus nào?','',N'Bus điều khiển',N'Bus địa chỉ',N'Bus dữ liệu',N'Bus điều khiển',N'Bus bộ vi xử lý',2,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus địa chỉ của bộ vi xử lý 8088 có bao nhiêu đường?','',N'20 đường',N'8 đường',N'16 đường',N'20 đường',N'24 đường',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của tín hiệu RESET trong Bus IBM PC là gì?','',N'Khởi động lại bộ vi xử lý và thiết bị I/O',N'Khởi động lại bộ vi xử lý',N'Khởi động lại thiết bị I/O',N'Khởi động lại bộ vi xử lý và thiết bị I/O',N'Khởi động lại vi mạch 8284A',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các chip 74LS373 trong Bus IBM PC có chức năng gi?','',N'Chốt địa chỉ',N'Đệm dữ liệu',N'Chốt địa chỉ',N'ChốT tín hiệu điều khiển',N'Tạo tín hiệu chốt địa chỉ',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chip 74LS245 trong Bus IBM PC có chức năng gì?','',N'Đệm dữ liệu',N'Đệm dữ liệu',N'Chốt địa chỉ',N'Đệm tín hiệu điều khiển',N'Tạo tín hiệu chốt địa chỉ',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chip 8259A trong Bus IBM PC có chức năng gi?','',N'Điều khiển ngắt',N'Đệm tín hiệu điều khiển',N'Tạo dao động',N'Bộ đếm và định thời',N'Điều khiển ngắt',2,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khái niệm truy xuất ngẫu nhiên đối với bộ nhớ cỏ ý nghĩa như thế nào?','',N'Dữ liệu trong bộ nhớ không được đọc hay ghi một cách tuần tự',N'Dữ liệu trong bộ nhớ được đọc hay ghi vào các thời điểm ngẫu nhiên',N'Dữ liệu trong bộ nhớ được định địa chỉ một cách ngẫu nhiên',N'Dữ liệu trong bộ nhớ không được đọc hay ghi một cách tuần tự',N'Dữ liệu trong bộ nhớ có giá trị ngẫu nhiên',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các bộ nhớ nào sau đây cho phép truy nhập ngẫu nhiên','',N'Tất cả đều đúng',N'DRAM',N'ROM',N'Cache',N'Tất cả đều đúng',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ Cache là','',N'Chi phí thấp',N'Dung lượng lớn',N'Thời gian truy nhập lớn',N'Thời gian truy nhập nhỏ',N'Chi phí thấp',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ Cache là:','',N'Cho phép truy nhập nhanh hơn so với bộ nhớ DRAM',N'Có dung lượng lớn hơn bộ nhớ RAM',N'Cho phép truy nhập nhanh hơn so với bộ nhớ DRAM',N'Cho phép truy nhập nhanh hơn so với các thanh ghi của CPU',N'Là bộ nhớ cố định',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của tín hiệu Chip Enable trong IC bộ nhớ là gì?','',N'Cho phép IC bộ nhớ hoạt động',N'Cho phép đọc dữ liệu trong IC bộ nhớ',N'Cho phép ghi dữ liệu vào KC bộ nhớ',N'Cho phép IC bộ nhớ hoạt động',N'Cho phép đọc, ghi đồng thời đối với IC bộ nhớ',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ ROM:','',N'Chỉ cho phép dọc dữ liệu',N'Cho phép ghi dữ liệu',N'Chỉ cho phép dọc dữ liệu',N'Bị mất dữ liệu khi không có nguồn cấp',N'Cho phép ghi dọc dữ liệu đồng thời tại một vị trí nhớ',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ RAM nói chung','',N'Cho phép ghi dữ liệu',N'Cho phép ghi dữ liệu',N'Chỉ cho phép đọc dữ liệu',N'Không bị mất dữ liệu khi không cỏ nguồn cấp',N'Cho phép ghi dọc dữ liệu đồng thời tại một vị trí nhớ',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ SRAM','',N'Không phải làm tươi theo chu kỳ',N'Phải được làm tươi theo chu kỳ',N'Không phải làm tươi theo chu kỳ',N'Thời gian truy nhập lớn',N'Chi phi trên một bit nhớ thấp',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ DRAM','',N'Phải được làm tươi theo chu kỳ',N'Thời gian truy nhập nhỏ',N'Chi phi trên một bit nhớ cao',N'Không phải làm tươi theo chu kỳ',N'Phải được làm tươi theo chu kỳ',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ Cache được cấu trúc từ loại bộ nhớ nào trong số các bộ nhớ sau đây?','',N'SRAM',N'SRAM',N'DRAM',N'ROM',N'Flash ROM',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của bộ nhớ Cache trong máy tính là gi?','',N'Lưu giữ dữ liệu mà bộ vi xử lý thường xuyên sử dụng',N'Giúp mở rộng dung lượng bộ nhớ',N'Chứa các toán hạng là hằng số',N'Lưu giữ dữ liệu mà bộ vi xử lý thường xuyên sử dụng',N'Lưu giữ các tham số hệ thống',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đường dây Read Write trong IC bộ nhớ có chức năng là gi?','',N'Cho biết thao tác được thực hiện là đọc hay ghi',N'Cho biết bộ nhớ có cho phép đọc và ghi hay không',N'Cho biết bộ nhớ có thể đọc và ghi đồng thời hay không',N'Cho biết thao tác được thực hiện là đọc hay ghi',N'Cho biết bộ nhỏ câm hay cấm ghi',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các bộ nhớ sau, bộ nhớ nào yêu cầu làm tươi theo chu kỳ?','',N'DRAM',N'SRAM',N'DRAM',N'PROM',N'EPROM',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các bộ nhỏ SRAM và DRAM, loại nào tiêu thụ nguồn nuôi lớn hơn','',N'SRAM',N'SRAM',N'DRAM',N'Bằng nhau',N'Không so sánh được',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ ROM là:','',N'Nội dung không bị thay đổi',N'Cho phép truy nhập nhanh hơn bộ nhớ RAM',N'Nội dung không bị thay đổi',N'Lưu trữ được nhiều thống tin hơn bộ nhỏ RAM',N'Được sử dụng làm bộ nhớ Cache',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phát biểu nào sau đây đúng?','',N'Bộ nhớ SRAM được sử dụng cho bộ nhớ Cache',N'Bộ nhớ SRAM rẻ hơn bộ nhớ DRAM',N'Bộ nhớ SRAM được sử dụng chỉ tại thời điểm khởi động máy tính',N'Bộ nhớ SRAM được sử dụng cho bộ nhớ Cache',N'Bộ nhớ SRAM có thời gian truy nhập lớn hơn DRAM',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mạch chọn địa chỉ hàng và mạch chọn địa chỉ cột tạo thành mạch gi?','',N'Mạch giải mà địa chỉ',N'Mạch tạo địa chi bộ nhớ',N'Mạch giải mà địa chỉ',N'Mạch đọc ghi dữ liệu bộ nhớ',N'Mạch cho phép chốt địa chỉ bộ nhớ',3,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cấu tạo của một ô nhớ DRAM như thế nào?','',N'Gồm một tụ điện và một Transistor',N'Gồm hai tụ diện và một Transistor',N'Gồm một tụ điện và một Transistor',N'Gồm hai tụ điện và hai Transistor',N'Gồm hai tụ điện và hai Transistor',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cấu tạo của một ô nhỏ SRAM như thế nào?','',N'Gồm sáu Transistor',N'Gồm hai tụ điện và ba Transistor',N'Gồm ba tụ điện và hai Transistor',N'Gồm bốn tụ điện và hai Transistor',N'Gồm sáu Transistor',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ truy nhập của bộ nhớ SRAM so với bộ nhớ DRAM như thế nào?','',N'Nhanh hơn',N'Chậm hơn',N'Nhanh hơn',N'Bằng nhau',N'Không xác định được',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ nhớ truy nhập ngẫu nhiên, điều nào sau đây không đúng?','',N'Dữ liệu trong bộ nhớ không được đọc hay ghi một cách tuần tự theo địa chỉ của bộ nhớ',N'Để truy nhập vào bất kỳ ngăn nhớ nào trong bộ nhớ, ta chỉ cần ác định địa chỉ của nó',N'Thời gian truy nhập vào bất kỳ ngăn nhớ nào trong bộ nhớ đều bằng nhau',N'Địa chỉ các ngăn nhớ bao gồm địa chỉ hàng và địa chỉ cột',N'Dữ liệu trong bộ nhớ không được đọc hay ghi một cách tuần tự theo địa chỉ của bộ nhớ',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ nhớ SRAM, điều nào sau đây đúng?','',N'Thời gian truy nhập nhỏ',N'Phải được làm tươi theo chu kỳ',N'Thời gian truy nhập lớn',N'Thời gian truy nhập nhỏ',N'Chi phi trên một bit nhớ thấp',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ nhớ SRAM, điều nào sau đây không dùng?','',N'Thời gian truy nhập lớn',N'Không phải làm tươi theo chu kỳ',N'Thời gian truy nhập lớn',N'Được dùng làm bộ nhớ Cache',N'Chi phí trên một bit nhớ cao',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ nhớ ROM, điểu nào sau đây đúng?','',N'Là bộ nhớ truy nhập ngẫu nhiên',N'Là bộ nhớ truy nhập ngẫu nhiên',N'Cho phép ghi dữ liệu',N'Luôn có dung lượng lớn hơn bộ nhớ RAM',N'Có thể được sử dụng làm bộ nhớ Cache',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ nhớ ROM, điều nào sau đây không đúng?','',N'Luôn có dung lượng lớn hơn bộ nhớ RAM',N'Là bộ nhớ truy nhập ngẫu nhiên',N'Chỉ cho phép dọc dữ liệu',N'Luôn có dung lượng lớn hơn bộ nhớ RAM',N'Không được sử dụng làm bộ nhớ Cache',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các phát biểu sau, phát biểu nào đúng','',N'Bộ nhớ Cache có tốc độ cao hơn bộ nhớ trong',N'Bộ nhớ ROM không phải là bộ nhớ truy nhập ngẫu nhiên',N'Bộ nhớ trong có dung lượng lớn hơn bộ nhớ ngoài',N'Bộ nhớ Cache có tốc độ cao hơn bộ nhớ trong',N'Bộ nhớ RAM luôn có dung lượng nhỏ hơn bộ nhớ Cache',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chương trinh BIOS được lưu trữ trong bộ nhớ thuộc loại nào','',N'ROM',N'RAM',N'ROM',N'Ở đĩa cứng',N'Cache',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dung lượng của bộ nhớ được xác định bởi:','',N'Số lượng bit hoặc tử mà bộ nhớ có thể lưu trữ',N'Số lượng dây dữ liệu trên Bus dữ liệu truy nhập bộ nhớ',N'Số lượng bit hoặc tử mà bộ nhớ có thể lưu trữ',N'Số lượng Module nhở có trong bộ nhớ',N'Số lượng bit dữ liệu được bộ nhớ trao đổ trong một đen vị thời gian',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thời gian truy nhập bộ nhớ được tỉnh bằng:','',N'Thời gian từ khi nhận lệnh tởi khi nhận được dữ liệu từ bộ nhớ',N'Thời gian từ lúc khơi động chương trình tới khi nhận được dữ liệu tử bộ nhớ',N'Thời gian từ khi nhận lệnh tởi khi nhận được dữ liệu từ bộ nhớ',N'Thời gian từ khi có tín hiệu Chip Enable tới khi nhận được dữ liệu',N'Thời gian tồn tại của dữ liệu trên Bus hệ thống',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus địa chỉ 20 bit cho phép quản lý bộ nhớ với dung lượng tối đa bằng bao nhiêu?','',N'1 MegaByte',N'1 MegaByte',N'4 MegaByte',N'8 MegaByte',N'16 MegaByte',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus địa chỉ 32 bit cho phép quản lý bộ nhớ với dung lượng tối đa bằng bao nhiêu?','',N'4 GigaByte',N'16 GigaByte',N'64 GigaByte',N'1 GigaByte',N'4 GigaByte',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus dịa chỉ 24 bit cho phép quản lý bộ nhớ với dung lượng tối đa bằng bao nhiêu?','',N'16 MegaByte',N'8 MegaByte',N'16 MegaByte',N'32 MegaByte',N'64 MegaByte',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chương trình BIOS trong các máy tính hiện đại thưởng được lưu trữ trong bộ nhớ loại nào?','',N'EEPROM',N'PROM',N'EPROM',N'EEPROM',N'Flash ROM',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của ROM mặt nạ (Maskable ROM) là gì?','',N'Được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay đổi dữ liệu',N'Được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay đổi dữ liệu',N'Người dùng có thể nạp dữ liệu bằng thiết bị đổi ROM. Dữ liệu đã được nạp thì không thể thay đổi được nữa',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng thiết bị sử dụng tia cực tím',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng điện',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của PROM là gì?','',N'Người dùng có thể nạp dữ liệu bằng thiết bị dốt ROM. Dữ liệu đã được nạp i không thể thay đổi được nửa thi',N'Được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay đổi dữ liệu',N'Người dùng có thể nạp dữ liệu bằng thiết bị dốt ROM. Dữ liệu đã được nạp i không thể thay đổi được nửa thi',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng thiết bị sử dụng tia cực tím',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng điện',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của EPROM là gì?','',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng thiết bị sử dụng tia cực tím',N'Được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay dỗi dữ liệu',N'Người dùng có thể nạp dữ liệu bằng thiết bị đổi ROM. Dữ liệu đã được nạp thì không thể thay đổi được nữa',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng thiết bị sử dụng tia cực tím',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng điện',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của EEPROM là gì?','',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng diện',N'Được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay đổi dữ liệu',N'Người dùng có thể nạp dữ liệu bằng thiết bị dốt ROM. Dữ liệu đã được nạp thì không thể thay đổi được nữa',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng thiết bị sử dụng tia cực tím',N'Người dùng có thể nạp hoặc xóa dữ liệu bằng diện',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Loại ROM nào mà người dùng có thể nạp dữ liệu bằng thiết bị đốt ROM?','',N'PROM',N'ROM mặt nạ',N'PROM',N'EPROM',N'EEPROM',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Loại ROM nào đã được nhà sản xuất nạp sẵn dữ liệu, người dùng không thể thay đổi dữ liệu?','',N'ROM mặt nạ',N'ROM mặt nạ',N'PROM',N'EPROM',N'EEPROM',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Loại ROM nào mà dùng có thể nạp dữ liệu bằng thiết bị sử dụng tia cực tím?','',N'EPROM',N'ROM mặt nạ',N'PROM',N'EPROM',N'EEPROM',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Loại ROM nào mà dùng có thể nạp dữ liệu bằng diện?','',N'EEPROM',N'ROM mặt nạ',N'PROM',N'EPROM',N'EEPROM',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các máy tính hiện đại, thiết bị nhớ nào trong số các loại bộ nhớ sau thường có dung lượng nhỏ nhất?','',N'Cache',N'ROM',N'RAM',N'Cache',N'Ở đĩa cứng',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các máy tính hiện đại, thiết bị nhớ nào trong số các loại bộ nhớ sau thường có dung lượng lớn nhất?','',N'Ở đĩa cứng',N'ROM',N'RAM',N'Cache',N'Ở đĩa cứng',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các máy tính hiện đại, thiết bị nhớ nào trong số các loại bộ nhỏ sau có thời gian truy nhập nhỏ nhất?','',N'Cache',N'ROM',N'RAM',N'Cache',N'Ở đĩa cứng',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các máy tính hiện đại, thiết bị nhớ nào trong số các loại bộ nhớ sau có tốc độ truy nhập thấp nhất?','',N'Ở đĩa cứng',N'ROM',N'RAM',N'Cache',N'Ở đĩa cứng',3,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chương trình BIOS lưu trong ROM CMOS được gọi là:','',N'Hệ thống vào ra cơ sở',N'Hệ thống điều hành phần cứng cơ sở',N'Hệ thống vào ra cơ sở',N'Hệ thống kiểm tra máy tính khi khởi động',N'Hệ thống quản lý phối ghép vào ra cơ sở',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ OFFSET trong bộ vi xử lý Intel 8086 có kích thước bằng bao nhiêu?','',N'16 bit',N'8 bit',N'16 bit',N'24 bit',N'32 bit',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dung lượng bộ nhớ Cache của máy tính sử dụng Bộ vi xử lý 80386 bằng bao nhiêu?','',N'Khoảng dưới 1 Mbyte',N'Khoảng dưới 1 Mbyte',N'Khoảng trên 1 MByte',N'Khoảng dưới 10 MByle',N'Khoảng trên 10 MByte',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phát biểu nào sau đây đúng?','',N'Bộ nhớ DRAM có giá thành thấp hơn SRAM',N'Bộ nhớ DRAM được sử dụng làm Cache trong máy tính',N'Bộ nhớ DRAM có giá thành cao hơn SRAM',N'Bộ nhớ DRAM có giá thành thấp hơn SRAM',N'Bộ nhớ DRAM chỉ được sử dụng vào thời điểm khởi động máy tính',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phát biểu nào sau dây dúng?','',N'Bộ nhớ SRAM có giá thành cao hơn DRAM',N'Bộ nhớ SRAM chỉ được sử dụng làm Cache trong máy tính',N'Bộ nhớ SRAM có giá thành cao hơn DRAM',N'Bộ nhớ SRAM có thời gian truy nhập lớn hơn DRAM',N'Bộ nhớ SRAM chỉ được sử dụng vào thời điểm khởi động máy tính',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ SRAM lưu trữ thông tin bằng gì?','',N'Flip-Flop',N'Tụ điện',N'Flip-Flop',N'Mạch lưỡng cực',N'Mạch MOS',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ DRAM cần các mạch bên ngoài để thực hiện chức năng gì?','',N'Làm tươi đi',N'Giải mã hàng',N'Giải mã cột',N'Làm tươi đi',N'Giải mã ô nhớ',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một bộ nhớ 64 Kbit có thể được tổ chức theo kiểu nào?','',N'Tất cả các kiểu đều đúng',N'64K x 1',N'8K × 8',N'16K x 4',N'Tất cả các kiểu đều đúng',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tại sao bộ nhỏ DRAM phải được làm tươi?','',N'Nếu không, nguồn cấp cho tụ điện sẽ hết và dữ liệu sẽ bị mất',N'Nếu không, các tụ điện sẽ bị đánh thủng',N'Nếu không, nguồn cấp cho tụ điện sẽ hết và dữ liệu sẽ bị mất',N'Nếu không, mạch điện sẽ tiêu thụ nhiều năng lượng hơn',N'Nếu không. các ô nhỏ sẽ bị định địa chỉ nhầm',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tại sao với các hệ thống bộ nhớ dung lượng rất nhỏ, người ta không sử dụng bộ nhớ loại DRAM mà thường dùng loại SRAM?','',N'Vì bộ nhớ DRAM đòi hỏi mạch làm tươi nên sẽ không kinh tế khi dùng với bộ nhớ có dung lượng nhỏ',N'Vì bộ nhớ DRAM đòi hỏi mạch làm tươi nên sẽ không kinh tế khi dùng với bộ nhớ có dung lượng nhỏ',N'Vì bộ nhớ DRAM chỉ cho phép xây bộ nhớ với dung lượng lớn',N'Vì bộ nhớ DRAM có thời gian truy nhập tăng lên khi dung lượng bộ nhớ',N'Vì bộ nhớ SRAM có thời gian truy nhập nhỏ hơn DRAM chỉ khi dùng cho bộ nhớ dung lượng nhỏ',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ nhớ DRAM lưu trữ thông tin bằng gì?','',N'Tụ điện',N'Tụ điện',N'Flip-Flop',N'Mạch lưỡng cực',N'Mạch MOS',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ chế quản lý bộ nhớ ao trong máy tính sử dụng các bộ sử lý Intel 80x86 cho phép thực hiện các diễu sau, loại trừ:','',N'Cho phép tăng tốc độ xử lý của bộ vi xử lý',N'Quản lý không gian nhớ lớn hơn bộ nhớ vật lý',N'Cho phép nhiều tiến trinh cùng chia sẻ bộ nhỏ vật lý',N'Cho phép tăng tốc độ xử lý của bộ vi xử lý',N'Cho phép bảo vệ các tiến trình thực hiện đồng thời',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chế độ địa chỉ ảo, bộ vi xử lý Intel 80286 có thể quản lý được không gian nhớ có dung lượng bằng bao nhiêu?','',N'1 Gbyte',N'128 Gbyte',N'256 Gbyte',N'512 Gbyte',N'1 Gbyte',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chế độ địa chỉ ảo của các bộ vi xử lý Intel 80x86, việc truy nhập dữ liệu trên các bộ nhớ ngoài có dung lượng vượt quả bộ nhớ thực của máy tính dược thực hiện nhờ:','',N'Việc trao đổi dữ liệu trên bộ nhớ ngoài với các mang nhớ của bộ nhớ trong',N'Việc chuyển dữ liệu tử bộ nhớ ngoài tới bộ vi xử lý qua các cổng vào ra',N'Việc trao đổi dữ liệu trên bộ nhớ ngoài với các mang nhớ của bộ nhớ trong',N'Sử dụng cơ chế truy nhập DMA',N'Sử dụng cơ chế ngắt',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chế độ địa chỉ ảo của các bộ vi xử lý Intel 80x86, dữ liệu cần truy nhập trên các bộ nhớ ngoài được tráo đối với:','',N'Các mảng nhớ ít được sử dụng nhất trong RAM',N'Các mảng nhớ đầu tiên trong RAM',N'Các mảng nhở cuối cùng trong RAM',N'Các mảng nhớ ít được sử dụng nhất trong RAM',N'Các mảng nhỏ hay được sử dụng nhất trong RAM',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các bộ nhớ RAM-ROM khác với các bộ nhớ ngoài ở những điều sau, ngoại trừ:','',N'Các vị trí nhớ dùng để lưu trữ các bit nhị phân',N'Cách mã hóa các bit',N'Cách tổ chức bộ nhớ',N'Cách truy nhập dữ liệu trên các phần tử của bộ nhớ',N'Các vị trí nhớ dùng để lưu trữ các bit nhị phân',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chỉ ra khẳng định sai trong các khẳng định sau đây','',N'Thời gian truy cập vào mỗi ổ nhớ trong bộ nhớ trong là ngẫu nhiên',N'Bộ nhớ trong là tập hợp các ô nhỏ, mỗi ô nhớ có một số bit nhất định và chứa một thông tin được mã hoá thành số nhị phân mà không quan tâm đến kiểu của dữ liệu mà nó đang chứa',N'Mỗi ô nhớ trong bộ nhớ trong đều tương ứng với một địa chỉ',N'Thời gian truy cập vào mỗi ổ nhớ trong bộ nhớ trong là ngẫu nhiên',N'Bộ nhớ trong cỏn được gọi là bộ nhớ truy cập ngẫu nhiên',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của bộ nhớ ngoài so với bộ nhớ trong của máy tinh là:','',N'Không mất dữ liệu khi mất nguồn',N'Tốc độ truy cập bộ nhớ thưởng rất cao',N'Dung lượng nhỏ',N'Không mất dữ liệu khi mất nguồn',N'Giá thành cao',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một ưu điểm của bộ nhớ ngoài so với bộ nhớ trong của máy tính là:','',N'Dung lượng lớn',N'Tốc độ truy cập nhanh',N'Dung lượng lớn',N'Kích thước nhỏ gọn',N'Cấu tạo đơn giản',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'So với bộ nhớ trong, bộ nhớ ngoài của máy tính có ưu điểm là:','',N'Cấu tạo đơn giản mất nguồn',N'Tốc độ truy cập nhanh',N'Không bị mất dữ liệu khi',N'Kích thước nhỏ gọn',N'Cấu tạo đơn giản mất nguồn',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để lưu trữ số hexa FF cần sử dụng tối thiểu bao nhiêu Flip-Flop?','',N'8',N'2',N'4',N'8',N'19',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đơn vị quản lý bộ nhớ trong máy tính có thể là:','',N'Bộ vi xử lý vả bộ diễu khiển truy nhập DMA',N'Bộ vi xử lý',N'Bộ điều khiển truy nhập DMA',N'Bộ vi xử lý vả bộ diễu khiển truy nhập DMA',N'Bộ điều khiển Bus',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý nào sau đây của Intel hỗ trợ chế độ quản lý bộ nhớ ảo?','',N'80286',N'8085',N'8086',N'8088',N'80286',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý nào sau đây của Intel không hỗ trợ chế độ quản lý bộ nhớ ảo?','',N'8086',N'8086',N'80286',N'80386',N'80486',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chế độ địa chỉ thực, bộ vi xử lý Intel 80286 quản lý địa chỉ vật lý bao nhiêu bit?','',N'20',N'16',N'20',N'24',N'30',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chế độ địa chỉ ảo, bộ vi xử lý Intel 80286 quản lý địa chỉ logic bao nhiều bit?','',N'30',N'16',N'20',N'24',N'30',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi quản lý quản lý mang nhớ trong bộ vi xử lý Intel 8086 có độ rộng bằng bao nhiêu?','',N'16 bit',N'8 bit',N'16 bit',N'24 bit',N'32 bit',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ OFFSET của bộ vi xử lý Intel 8086 có độ rộng gồm bao nhiêu bit?','',N'16 bit',N'8 bit',N'16 bit',N'24 bit',N'32 bit',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối điều khiển bộ nhớ Cache (Cache Memory Controller) có chức năng là:','',N'Điều khiển việc truyền dữ liệu giữa bộ nhớ Cache và bộ nhỏ RAM',N'Điều khiển việc truyền dữ liệu giữa bộ nhớ Cache và thiết bị ngoại vi',N'Điều khiển việc truyền dữ liệu giữa bộ nhớ Cache và bộ nhớ ROM',N'Điều khiển việc truyền dữ liệu giữa bộ nhớ Cache và bộ nhỏ RAM',N'Điều khiển việc truyền dữ liệu giữa bộ nhớ Cache và khối ALU',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một mảng nhớ trong bộ xi xử lý 8086 8088 do các thanh ghi mang quản lý có kích thước bằng bao nhiều bằng bao nhiêu?','',N'64 KByte',N'16 KByte',N'32 KByte',N'64 KByte',N'128 KByte',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ điều khiển DMA (DMAC) tham gia quản lý bộ nhớ trong trường hợp nào?','',N'Trong việc truyền số liệu giữa bộ điều khiển ổ đĩa và bộ nhớ',N'Trong việc truyền số liệu giữa bộ điều khiển ổ đĩa và bộ nhớ',N'Trong việc truyền số liệu giữa khối ALU và bộ nhớ',N'Trong việc truyền số liệu giữa các thanh ghi và bộ nhớ',N'Xác lập các tham số của BIOS',3,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các khôi sau, khôi nào không thuộc hệ thống hỗ trợ vào ra?','',N'Các thanh ghi đa năng',N'Bộ điều khiển ở đĩa',N'Bộ phổi ghép màn hình',N'Bộ điều khiển bàn phím',N'Các thanh ghi đa năng',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các thiết bị sau, thiết bị nào không phải là thiết bị ngoại vi:','',N'RAM',N'Màn hình',N'RAM',N'Đĩa cứng',N'Bàn phím',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các thành phần sau, thành phần nảo thuộc hệ thống hỗ trợ phối ghép vào ra?','',N'Giao tiếp cổng USB',N'Cache',N'Cáp nguồn ổ cứng',N'Giao tiếp cổng USB',N'Các thanh ghi đa năng',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng nào sau đây không phải là chức năng của hệ thống hỗ trợ vào ra?','',N'Điều khiển cấp phát bộ vi xử lý cho các thao tác trong môi trường đa nhiệm',N'Phối ghép các thiết bị ngoại vi với các thành phần khác của máy tính',N'Đảm bảo việc chuyển dữ liệu giữa máy tính và thiết bị ngoại vi',N'Điều khiển cấp phát bộ vi xử lý cho các thao tác trong môi trường đa nhiệm',N'Hỗ trợ việc truyền dữ liệu giữa các thiết bị ngoại vi và bộ nhớ',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của hệ thống hỗ trợ vào ra là:','',N'Đảm bảo việc trao đổi dữ liệu giữa máy tính và các thiết bị ngoại vi',N'Chuyển đổi dữ liệu tử môi trường bên ngoài thành dạng số và đưa vào máy tính',N'Đảm bảo việc trao đổi dữ liệu giữa máy tính và các thiết bị ngoại vi',N'Tiếp nhận các ngắt tử các thiết bị vào ra dữ liệu',N'Hỗ trợ thiết lập việc truyền dữ liệu giữa các máy tính',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của thiết bị lưu trữ ngoài là:','',N'Không mất dữ liệu khi mất nguồn',N'Tốc độ truy cập nhanh',N'Dung lượng nhỏ',N'Không mất dữ liệu khi mất nguồn',N'Giá thành cao',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên tắc lưu trữ của thiết bị lưu trữ ngoài thường là:','',N'Bộ nhớ từ, quang hoặc quang từ',N'Bộ nhớ bán dẫn',N'Bộ nhớ từ, quang hoặc quang từ',N'Hiện tượng tử trễ',N'Hiệu ứng dòng Fuco',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên lý của việc ghi dữ liệu trên đĩa mềm là gì?','',N'Các bit 1 và 0 tương ứng với các trạng thái nhiễm từ khác nhau của vật liệu từ',N'Các bit 1 và 0 tương ứng với các trạng thái nhiễm từ khác nhau của vật liệu từ',N'Các bit 1 và 0 tương ứng với các giá trị điện áp khác nhau trên vật liệu từ',N'Các bit 1 và 0 tương ứng với các momen lực từ khác nhau tác động lên đầu đọc',N'Các bit 1 và 0 tương ứng với tốc độ di chuyển khác nhau của các điện tử trong vật liệu tử',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi nói đĩa mềm loại 3.5 inches thì giá trị 3.5 inches là:','',N'Đường kinh của phần đĩa tử trong đĩa mềm',N'Diện tích của phần đĩa từ trong đĩa mềm',N'Đường kinh của phần đĩa tử trong đĩa mềm',N'Chu vi của dĩa mềm',N'Chiều rộng của đĩa mềm',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các giá trị sau, giá trị nào có thể là kích thước của đĩa mềm?','',N'3.5 inches',N'2.25 inches',N'2.75 inches',N'3.5 inches',N'4.25 inches',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các giá trị sau. giá trị nào có thể là kích thước của đĩa mềm','',N'5.25 inches',N'3.25 inches',N'3.75 inches',N'4.5 inches',N'5.25 inches',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mỗi sector trong đìa mềm chứa bao nhiêu byte dữ liệu:','',N'512',N'128',N'256',N'512',N'1024',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các giá trị sau, giá trị nào có thể là kích thước của đĩa mềm?','',N'5.25 inches',N'5.25 inches',N'5.75 inches',N'6.5 inches',N'7.25 inchest',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các giá trị sau, giá trị nào có thể là kích thước của đĩa mềm','',N'5.25 inches',N'4.25 inches',N'4.75 inches',N'5.25 inches',N'6.25 inches',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một đĩa mềm một mặt có 40 track, mỗi track chia thành 8 sector thì dung lượng đĩa là bao nhiêu?','',N'160 KB',N'80 KB',N'160 KB',N'320 KB',N'640 KB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một đĩa mềm một mặt có 40 track, mỗi track chia thành 9 sector thi dụng lượng đĩa là bao nhiêu?','',N'180 KB',N'180 KB',N'270 KB',N'360 KB',N'90 KB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một đĩa mềm hai mặt có 40 track, mỗi track chia thành 8 sector thi dung lượng đĩa là bao nhiêu?','',N'320 KB',N'80 KB',N'160 KB',N'320 KB',N'640 KB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một dĩa mềm hai mặt có 40 track, mỗi track chia thành 9 sector thi dung lượng đĩa là bao nhiêu?','',N'360 KB',N'90 KB',N'180 KB',N'270 KB',N'360 KB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một đĩa mềm hai mặt có 80 track, mỗi track chia thành 15 sector thì dung lượng đĩa là bao nhiêu?','',N'1.2 MB',N'0.6 MB',N'0.9 MB',N'1.2 MB',N'1.8 MB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một dĩa mềm hai mặt có 80 track, mỗi track chia thành 9 sector thì dung lượng đĩa là bao nhiêu?','',N'720 KB',N'720 KB',N'360 KB',N'0.9 MB',N'1.8 MB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một đĩa mềm hai mặt có 80 track, mỗi track chia thành 36 sector thi dung lượng đĩa là bao nhiêu?','',N'2.88 MB',N'0.9 MB',N'1.44 MB',N'1.8 MB',N'2.88 MB',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ki hiệu HD trong đĩa mềm loại 3.5" DS HD có ý nghĩa là gi?','',N'Mật độ cao',N'Kích thước nhỏ',N'Kích thước lớn',N'Mật độ cao',N'Mật độ trung bình',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mỗi Sector trong đĩa mềm chứa dữ liệu với dung lượng bằng bao nhiêu?','',N'512 Byte',N'128 Byte',N'256 Byte',N'512 Byte',N'1024 Byte',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kí hiệu DD trong đĩa mềm loại 5.25" DS DD có ý nghĩa là gì?','',N'Mật độ gấp đôi',N'Đĩa mềm được ghi theo hai mặt',N'Kích thước lớn',N'Mật độ gấp đôi',N'Mật độ trung bình',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kí hiệu DS trong địa mềm loại 3.5" DS/HD có ý nghĩa là gì?','',N'Đĩa mềm được ghi theo hai mặt',N'Đĩa mềm được ghi theo hai mặt',N'Kích thước lớn',N'Mật độ cao',N'Mặt độ trung binh',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ quay của động cơ điều khiển ổ đĩa mềm thường bằng:','',N'300 vòng/phút',N'250 vòng/phút',N'300 vòng/phút',N'350 vòng/phút',N'400 vòng/phút',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ quay của động cơ điều khiển ổ đĩa mềm thường bằng:','',N'360 vòng/phút',N'280 vòng/phút',N'320 vòng/phút',N'360 vòng/phút',N'400 vòng/phút',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi đọc dữ liệu trên đĩa mềm- yếu tố nào tạo nên tín hiệu dữ liệu?','',N'Sự biến thiên của từ thông của phần tư lưu trữ tạo thành điện thể cảm ứng ở hai đầu ra của cuộn dây',N'Sự biến thiên của từ thông của phần tư lưu trữ tạo thành điện thể cảm ứng ở hai đầu ra của cuộn dây',N'Sự biển thiên của lực tử tác động lên đầu đọc tạo nên diện thể cảm ứng ở hai đầu ra của cuộn dây',N'Sự biến thiên của điện trường trên đầu đọc tạo thành dòng điện cam ứng ở hai đầu ra của cuộn dây',N'Sự biến thiên của lực tác động tử động cơ bước tạo nên sức diện động cảm ứng ở hai đầu ra của cuộn dây',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi ghi dữ liệu lên đĩa mềm, yếu tố nào tạo nên các mức 0 và 1?','',N'Cuộn dây sẽ phát ra từ trường qua khe để từ hóa bột Ôxit sắt trên mặt đĩa tạo nên các trạng thái tương ứng với các mức dữ liệu 0 và 1',N'Cuộn dây sẽ phát ra điện trưởng làm biển thiên từ thông của phần tử lưu trữ tạo thành các trạng thái tương ứng với các mức dữ liệu 0 và 1',N'Cuộn dây sẽ phát ra từ trường qua khe để từ hóa bột Ôxit sắt trên mặt đĩa tạo nên các trạng thái tương ứng với các mức dữ liệu 0 và 1',N'Cuộn dây sẽ phát ra điện trưởng trên đầu đọc tạo thành dòng điện cảm ứng tạo nên các trạng thái tương ứng với các mức dữ liệu 0 và 1',N'Cuộn dây sẽ phát ra tử trưởng gây ra lực tử tác động lên phần tử lưu trữ tạo nên các trạng thái tương ứng với các mức dữ liệu 0 và 1',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mạch điều khiển ổ đĩa mềm thưởng được nối với?','',N'Một khe cắm riêng trên ban mạch chính',N'Cổng truyền thông nối tiếp trên bản mạch chính',N'Cổng truyền thông song song trên bản mạch chính',N'Một khe cắm riêng trên ban mạch chính',N'Một khe cắm PCI trên bản mạch chính',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ quay của ổ đĩa cứng có thể lấy giá trị nào trong số các giá trị sau dây?','',N'7200 vòng/phút',N'500 vòng/phút',N'7200 vòng/phút',N'54000 vòng/phút',N'72000 vòng/phút',4,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên lý của việc ghi dữ liệu trên đĩa cứng là gì?','',N'Các bit 1 và 0 tương ứng với các trạng thái nhiễm tử khác nhau của vật liệu',N'Các bit 1 và 0 tương ứng với các trạng thái nhiễm tử khác nhau của vật liệu',N'Các bit và 0 tương ứng với tốc độ di chuyển khác nhau của các điện tử trong vật liệu từ',N'Các bit 1 và 0 tương ứng với các giá trị điện áp khác nhau trên vật liệu từ',N'Các bit 1 và 0 tương ứng với các momen lực từ khác nhau tác động lên đầu đọc',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Với đĩa từ, đặc điểm nào trong các đặc điểm sau đây thuộc kỹ thuật ghi mật độ không đều:','',N'Tất cả các rãnh đều có cùng số cung',N'Dung lượng của đĩa lớn',N'Dung lượng của đĩa nhỏ',N'Tất cả các rãnh đều có cùng số cung',N'Các rãnh khác nhau có số cung khác nhau',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Với đĩa tử, đặc điểm nào trong các đặc điểm sau đây thuộc kỹ thuật mật độ đều:','',N'Các rãnh ở xa trục quay sẽ có số cung lớn hơn',N'Dung lượng của đĩa lớn',N'Dung lượng của đĩa nhỏ',N'Tất cả các rãnh đều có cùng số cung',N'Các rãnh ở xa trục quay sẽ có số cung lớn hơn',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mỗi Sector trong đĩa cứng chứa dữ liệu với dung lượng bằng bao nhiêu?','',N'512 Byte',N'128 Byte',N'256 Byte',N'512 Byte',N'1024 Byte',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ quay của ổ đĩa cứng có thể lấy giá trị nào trong số các giá trị sau đây?','',N'5400 vòng/phút',N'500 vòng/phút',N'5400 vòng/phút',N'72000 vòng/phút',N'54000 vòng/phút',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các thiết bị lưu trữ dạng tử, giá trị 1 logie và 0 logic khác được phân biệt như thế nào?','',N'Giá trị 1 tương ứng trạng thái tử tỉnh với các cực xác định theo một hướng còn giá trị 0 tương ứng với trạng thái từ tính với các cực xác định theo hướng ngược lại',N'Giá trị 1 tương ứng với vật liệu nhựa còn giá trị 0 tương ứng với vật liệu từ tính',N'Giá trị 1 tương ứng với trạng thái có từ tỉnh còn giá trị 0 tương ứng với trạng thải không có từ tính',N'Giá trị 1 tương ứng với vùng có từ tính mạnh còn giá trị 0 tương ứng với vùng có tử tính yếu',N'Giá trị 1 tương ứng trạng thái tử tỉnh với các cực xác định theo một hướng còn giá trị 0 tương ứng với trạng thái từ tính với các cực xác định theo hướng ngược lại',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các loại đĩa từ (đĩa cứng và đìa mềm) trước khi được sử dụng để lưu trữ dữ liệu nó cần phải được:','',N'Định dạng',N'Từ hóa',N'Định dạng',N'Khử từ',N'Tạo sector',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quá trình đọc thông tin trên đĩa CDROM dựa trên hiện tượng gì?','',N'Sự phản chiếu của các tỉa laser năng lượng thấp tử lớp lưu trữ dữ liệu',N'Sự phản chiếu của các tỉa laser năng lượng thấp tử lớp lưu trữ dữ liệu',N'Sự phản chiếu của các tia laser năng lượng cao từ lớp lưu trữ dữ liệu',N'Sự khác nhau về giá trị dòng quang điện khi ánh sáng phản xạ tử lớp lưu trữ dữ liệu',N'Sự khác nhau về giá trị dòng quang điện khi ánh sáng phản từ lớp bề mặt đĩa',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc phân biệt các vị trí được khắc trên đĩa CDROM được thực hiện như thể nào?','',N'Bộ phận tiếp nhận ánh sáng của thiết bị đọc sẽ nhận biết được những điểm',N'Đầu đọc có thiết bị dò tim các vị trí bị khắc hay không bị khắc trên đĩa',N'Bộ phận tiếp nhận ánh sáng của thiết bị đọc sẽ nhận biết được những điểm tại đó tia laser bị phản xạ mạnh hay biến mất',N'Đầu đọc có thiết bị cam nhận sự thay đổi dòng quang điện do tia laser tạo ra',N'Bộ phận tiếp nhận ảnh sáng của thiết bị dọc có khả năng phân biệt các vị trí có vết khắc',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi bộ nhận biết ảnh sáng của thiết bị đọc CDROM nhận biết các điểm có vết khắc trên đĩa, các tia phản xạ mạnh tương ứng với:','',N'Điểm không khắc lỗ',N'Điểm khắc lỗ',N'Điểm không khắc lỗ',N'Điểm không ghi dữ liệu',N'Điểm vành ngoài địa',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dữ liệu trên CDROM được sắp xếp dạng:','',N'Theo từng khối',N'Theo từng bit',N'Theo từng byte',N'Theo từng khối',N'Theo từng từ 16 bit',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ chuẩn 1x của đĩa CDROM tương ứng với','',N'150 KB/s',N'15 KB/s',N'150 KB/s',N'1.5 MB/s',N'15 MB/s',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Rành trên địa CDROM được khắc như thế nào:','',N'Theo một dưởng xoắn ốc',N'Theo một dưởng xoắn ốc',N'Theo các đường tròn đồng tâm',N'Theo các hình vuông cùng trọng tâm',N'Không theo hình nào trong các hình trên',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dữ liệu ghi trên rãnh trong đĩa CDROM được bắt đầu từ đâu?','',N'Từ trong ra ngoài',N'Từ ngoài vào trong',N'Từ trong ra ngoài',N'Từ giữa',N'Từ một vị trí ngẫu nhiên',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chỉ ra khẳng định đúng trong các khẳng định sau đây:','',N'Dữ liệu được ghi trên đĩa CD theo từng khối có kích thước đồng nhất',N'Dữ liệu được ghi trên đĩa CD theo từng rãnh (track)',N'Dữ liệu được ghi trên đĩa CD theo từng cung (sector)',N'Dữ liệu được ghi trên đĩa CD theo từng khối có kích thước bất kỳ',N'Dữ liệu được ghi trên đĩa CD theo từng khối có kích thước đồng nhất',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kích thước của mỗi khối dữ liệu trên đĩa CD là bao nhiêu?','',N'2352 byte',N'2352 byte',N'2212 byte',N'2132 byte',N'2048 byte',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc diểm của dĩa CD-R là gì?','',N'Cho phép ghi dữ liệu một lần',N'Cho phép ghi dữ liệu nhiều lần',N'Không cho phép xóa dữ liệu',N'Cho phép ghi dữ liệu một lần',N'Dung lượng nhỏ hơn đĩa CDROM',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của đìa CD-R là gì?','',N'Dữ liệu không thể bị xóa',N'Cho phép ghi vả xóa dữ liệu nhiều lần',N'Dung lượng lớn gấp đôi đĩa CDROM',N'Cho phép ghi và xóa dữ liệu đồng thời',N'Dữ liệu không thể bị xóa',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của đĩa CD-RW là gì?','',N'Cho phép ghi và xóa dữ liệu nhiều lần',N'Cho phép ghi và xóa dữ liệu nhiều lần',N'Dung lượng lớn gấp đôi đĩa CD-R',N'Cho phép ghi và xóa dữ liệu đồng thời',N'Dữ liệu không thể bị xóa',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của đĩa DVD là gì?','',N'Cho phép ghi dữ liệu trên hai lớp',N'Cho phép ghi dữ liệu trên hai lớp',N'Dung lượng nhỏ hơn đĩa CDROM',N'Cho phép ghi và xóa dữ liệu một lần đồng thời',N'Dữ liệu không thể bị xóa',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ chuẩn Ix của đĩa DVD tương ứng với:','',N'1.3 MB/s',N'13 KB/s',N'130 KB/s',N'1.3 MB/s',N'13 MB/s',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Dung lượng ghi tối đa trên một mặt đĩa DVD-R và đĩa DVD-RW là:','',N'4.7 GB',N'2.7 GB',N'4.7 GB',N'6.7 GB',N'8.7 GB',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ưu điểm của thiết bị lưu trữ ngoài là:','',N'Dung lượng lớn',N'Tốc độ truy cập nhanh',N'Dung lượng lớn',N'Kích thước nhỏ',N'Dễ chế tạo hơn',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một ưu điểm của thiết bị lưu trữ ngoài so với bộ nhớ trong của máy tính là:','',N'Không bị mất dữ liệu khi mất nguồnn',N'Thời gian truy cập nhỏ',N'Không bị mất dữ liệu khi mất nguồn',N'Tiêu thụ nguồn it',N'Cấu tạo đơn giản',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cấu trúc SDU của việc truyền dữ liệu từ bản phim vào máy tính có bao nhiêu bit dữ liệu?','',N'8 bit',N'6 bit',N'7 bit',N'8 bit',N'9 bit',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cấu trúc SDU của việc truyền dữ liệu từ bản phim vào máy tính, bit Stop có đặc điểm gì?','',N'Luôn bằng 0',N'Luôn bằng 0',N'Luôn bằng 1',N'Chuyển từ 0 sang 1',N'Chuyển tử 1 sang 0',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cấu trúc SDU của việc truyền dữ liệu tử bản phím vào máy tính, bit Start có đặc điểm gì?','',N'Luôn bằng 0',N'Luôn bằng 0',N'Luôn bằng 1',N'Chuyển từ 0 sang 1',N'Chuyển tử 1 sang 0',4,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một cấu trúc SDU của việc truyền dữ liệu từ bản phim vào máy tính có tổng số bao nhiêu bit?','',N'11 bit',N'6 bit',N'8 bit',N'9 bit',N'11 bit',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mã quét bàn phím có độ dài bao nhiêu bit?','',N'8 bit',N'6 bit',N'8 bit',N'16 bit',N'24 bit',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc xử lý phân biệt một phim được nhấn nhiều lần hay một lần nhưng được giữ trong một khoảng thời gian do:','',N'Phần cứng và phần mềm xử lý bản phim thực hiện',N'Phần cứng mạch ghép nổi bản phím của máy tính thực hiện',N'Phần cứng và phần mềm xử lý bản phim thực hiện',N'Phần cúng khối xử lý bàn phím thực hiện',N'Phần mềm cải trong mạch ghép nối bản phim của máy tinh thực hiện',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn nuôi cho bản phim được lấy từ đâu?','',N'Từ máy tính',N'Từ một pin nhỏ bên trong bàn phím',N'Trực tiếp tử bộ nguồn',N'Nhờ bộ biến đổi tiến hiệu thu từ máy tính thành nguồn cấp',N'Từ máy tính',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc xử lý khử nhiều rung cơ khi khi một phim của bản phim máy tính được nhấn do:','',N'Phần cứng và phần mềm xử lý bản phim thực hiện',N'Phần cứng và phần mềm xử lý bản phim thực hiện',N'Phần cứng khối xử lý bản phim và mạch ghép nối bản phim của máy tính thực hiện',N'Phần mềm cái trong khối xử lý bản phim thực hiện',N'Phần mềm cải trong mạch ghép nổi bản phím của máy tính thực hiện',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đầu cắm bàn phím dạng PS 2 cỏ mấy chân?','',N'6',N'5',N'6',N'7',N'8',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giao tiếp bàn phím dạng PS 2 có mấy đường dữ liệu?','',N'1',N'1',N'2',N'3',N'4',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc truyền dữ liệu từ bản phim tới máy tính thường theo nguyên tắc nào?','',N'Nối tiếp',N'Song song',N'Nối tiếp',N'Song công',N'Bán song công',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để nhận ra phim nào được nhấn, chip xử lý bản phim thực hiện như thế nào?','',N'Liên tục kiểm tra trạng thái của ma trận quét và ghi một mã tương ứng vào bộ đệm bên trong bản phim rồi truyền nổi tiếp tới mạch ghép nổi bản phim trong PC',N'Liên tục kiểm tra trạng thái của ma trận quét và ghi một mã tương ứng vào bộ đệm bên trong bản phim rồi truyền nổi tiếp tới mạch ghép nổi bản phim trong PC',N'Liên tục kiểm tra trạng thái của ma trận quét và truyền theo phương thức nổi tiếp tới mạch ghép nổi bàn phím trong PC',N'Liên tục kiểm tra trạng thái từng phím và truyền theo phương thức nối tiếp tới mạch ghép nổi bàn phím trong PC',N'Liên tục kiểm tra trạng thái của từng phím và ghi một mà tương ứng vào bộ đệm bên trong bản phim rồi truyền nối tiếp tới bộ vi xử lý trong PC',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của hai đĩa gắn với các thanh đặt vuông góc bên trong chuột máy tính là gi?','',N'Có các lỗ nhỏ liên tục đóng ngắt hai chùm sáng tới các sensor nhạy sáng dễ tạo các xung điện',N'Có các lỗ nhỏ liên tục đóng ngắt hai chùm sáng tới các sensor nhạy sáng dễ tạo các xung điện',N'Biển chuyển động quay thành moment từ của nam châm điện, nhờ đỏ tạo ra các xung điện',N'Biển chuyển động quay thành moment từ của nam châm điện, nhờ đó tạo ra các sức điện động cảm ứng',N'Có các lỗ nhỏ liên tục đóng ngắt chuyển mạch cấp điện cho một nam châm điện, nhờ đó tạo ra các xung điện',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các xung diện tạo ra trong mạch điện chuột nhờ:','',N'Các lỗ nhỏ trên hai đĩa quay liên tục đóng và ngắt hai chùm sáng tới các sensor nhạy sáng',N'Chuyển động quay của hai đĩa được biến thành moment tử của nam châm điện',N'Các lỗ nhỏ trên hai đĩa quay liên tục đóng và ngắt hai chùm sáng tới các sensor nhạy sáng',N'Chuyển động quay của hai dĩa được biển thành các sức diện động cảm ứng',N'Các lỗ nhỏ liên tục đóng ngắt chuyển mạch cấp điện cho một nam châm điện',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số xung điện tạo ra trong chuột nhờ các lỗ nhỏ trên hai đĩa quay đóng ngắt các sensor nhạy sáng tỉ lệ với','',N'Lượng chuyển động của chuột theo các hướng X và Y',N'Giá trị nguồn cấp cho chuột',N'Số lượng lỗ nhỏ có trên hai đĩa quay của chuột',N'Kích thước của viên bị trung tâm của chuột',N'Lượng chuyển động của chuột theo các hướng X và Y',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn nuôi cho chuột được lấy từ đâu?','',N'Từ máy tính',N'Từ một pin nhỏ bên trong chuột',N'Từ máy tính',N'Trực tiếp từ bộ nguồn',N'Nhờ bộ biến đổi tiền hiệu thu từ máy tính thành nguồn cấp',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các hàm 091 và 0AH trong ngắt 3311 cỏ chức năng gì?','',N'Định nghĩa loại và dạng con trỏ chuột',N'Xác lập độ dài khối dữ liệu truyền từ chuột',N'Định nghĩa loại và dạng con trỏ chuột',N'Vô hiệu hóa và kích hoạt chuột',N'Thay đổi chức năng các phim bẩm trên chuột',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc truyền dữ liệu tử chuột tới máy tính thưởng theo nguyên tắc nào?','',N'Nối tiếp',N'Nối tiếp',N'Song song',N'Song công',N'Bán song công',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hai thanh nhỏ vuông góc với nhau bên trong chuột máy tính có chức năng gi?','',N'Biển chuyển động của chuột theo hai hướng X và Y thành chuyển động quay của hai đĩa tương ứng gắn với nó',N'Biển chuyển động của chuột theo hai hướng X và V thành các xung điện đưa về khối xử lý chuột của máy tính',N'Biển chuyển động của chuột theo hai hướng X và Y thành chuyển động quay của hai đĩa tương ứng gắn với nó',N'Biển chuyển động quay của các địa tương ứng gắn với nó thành các xung điệm',N'Biển chuyển động quay của con lăn của chuột thành các xung điện',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các thiết bị sau vừa có thể coi là thiết bị ngoại vi, vừa là thiết bị nhớ ngoài, loại trừ:','',N'Máy in',N'Thẻ nhớ',N'Ổ đĩa cứng',N'Đĩa mềm',N'Máy in',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng nào sau đây không phải là của ổ đĩa cứng?','',N'Chứa các tham số hệ thống',N'Lưu trữ dài hạn các tập tin',N'Thiết lập một cấp bộ nhớ bên dưới bộ nhớ trong để làm bộ nhớ ảo',N'Chứa dữ liệu các chương trình ứng dụng của người dùng',N'Chứa các tham số hệ thống',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp DMA cho phép:','',N'Trao đổi dữ liệu trực tiếp giữa ngoại vi và bộ nhớ trong',N'Trao đổi dữ liệu trực tiếp giữa ngoại vi và bộ nhớ trong',N'Trao đổi dữ liệu trực tiếp giữa bộ nhớ trong và bộ nhớ Cache',N'Trao đổi dữ liệu trực tiếp giữa bộ nhớ ngoài và bộ nhớ Cache',N'Trao đổi dữ liệu trực tiếp giữa ngoại vi và bộ nhớ ngoài',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các thiết bị sau, thiết bị nào là thiết bị ngoại vi?','',N'Máy in',N'RAM',N'Cache',N'Máy in',N'Mainboard',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ điều khiển DMA (DMAC) tham gia điều khiển quá trình nào trong số các quá trình sau','',N'Trong việc truyền số liệu giữa bộ điểu khiển ổ đĩa và bộ nhớ',N'Trong việc truyền số liệu giữa khối ALU và bộ nhớ',N'Trong việc truyền số liệu giữa bộ điểu khiển ổ đĩa và bộ nhớ',N'Trong việc truyền số liệu giữa các thanh ghi và bộ nhớ',N'Trong quá trình xác lập các tham số hệ thống trong BIOS',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giao tiếp RS-232 là:','',N'Một giao tiếp nối tiếp',N'Một giao tiếp song song',N'Một giao tiếp nối tiếp',N'Một giao tiếp máy in',N'Một giao tiếp modem',4,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của bộ vi xử lý trong máy tính là gi?','',N'Đọc dữ liệu từ bộ nhớ, xử lý theo từng câu lệnh và ghi kết quả vào bộ nhớ hay thiết bị ngoại vi',N'Điều khiển hoạt động của các thiết bị ngoại vi',N'Đọc dữ liệu từ bộ nhớ, xử lý theo từng câu lệnh và ghi kết quả vào bộ nhớ hay thiết bị ngoại vi',N'Đọc dữ liệu từ các thiết bị ngoại vi và ghi vào bộ nhớ',N'Đọc dữ liệu từ các thiết bị ngoại vi và ghi vào bộ nhớ',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các bộ vi xử lý 80x86 được cấu thành từ các khối cơ bản nào?','',N'EU, BIU, AU và IU',N'EU, BIU, AU và CU',N'EU, BIU, AU và IU',N'ALU, AU, IU và CU',N'ALU, IU, CU và EU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thành phần nào sau đây không phải là một bộ phận của bộ vi xử lý?','',N'Bus hệ thống',N'ALU',N'CU',N'Các thanh ghi',N'Bus hệ thống',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối EU trong bộ vi xử lý gồm các thành phần nào?','',N'ALU, CU và các thanh ghi',N'ALU, CU và các thanh ghi',N'ALU, CU và hàng nhận lệnh',N'ALU và hàng nhận lệnh',N'ALU và CU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của khối EU trong bộ vi xử lý là gi?','',N'Thực hiện lệnh',N'Nhận lệnh',N'Thực hiện lệnh',N'Giải mã lệnh',N'Biên dịch lệnh',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý 32 bit có:','',N'Các thanh ghi và Bus 32 bit',N'32 thanh ghi',N'32 thiết bị vào ra',N'32 Megabyte RAM',N'Các thanh ghi và Bus 32 bit',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các bộ vi xử lý kiểu CISC có đặc điểm là:','',N'Sử dụng các lệnh có kích thước khác nhau',N'Có số lượng các lệnh ít hơn so với các bộ vi xử lý kiểu RISC',N'Sử dụng nhiều RẠM hơn so với các bộ vi xử lý kiểu RISC',N'Có tốc độ đồng hồ trung bình',N'Sử dụng các lệnh có kích thước khác nhau',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các bộ vi xử lý kiểu RISC điển hình có đặc điểm là:','',N'Thưởng thực hiện mỗi lệnh trong một xung nhịp Clock',N'Có các bộ nhớ Cache với dung lượng lớn hơn so với các kiểu CISC',N'Có ít thanh ghi hơn so với các bộ vị xử lý kiểu CISC',N'Kém tin cậy hơn so với các bộ vi xử lý kiểu CISC',N'Thưởng thực hiện mỗi lệnh trong một xung nhịp Clock',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối địa chi trong bộ xử lý 80286 được viết tắt là gì?','',N'AU',N'ALU',N'AU',N'EU',N'IU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối thực hiện lệnh trong bộ xử lý 80286 được viết tắt là gi?','',N'EU',N'ALU',N'AU',N'EU',N'IU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đơn vị lệnh trong bộ xử lý 80286 được viết tắt là gi?','',N'IU',N'ALU',N'AU',N'EU',N'IU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối tính toán số học-logic trong bộ xử lý 80286 được viết tắt là gì?','',N'ALU',N'ALU',N'AU',N'EU',N'IU',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ vi xử lý, đối với bộ xử lý 80286 thi kênh địa chỉ có hướng như thế nào?','',N'Là kênh đường ra',N'Là kênh đường ra',N'Là kênh đường vào',N'Là kênh hai chiều',N'Không cố định, tuỳ thuộc vào cấu trúc của hệ vi xử lý',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý 8086 là bộ vi xử lý bao nhiêu bit?','',N'16 bit',N'8 bit',N'16 bit',N'32 bit',N'64 bit',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ vi xử lý, đối với bộ xử lý 80286 thỉ kênh dữ liệu có hưởng như thế nào?','',N'Là kênh hai chiều',N'Là kênh đường ra',N'Là kênh đường vào',N'Là kênh hai chiều',N'Không xác định, tuỳ thuộc vào cấu trúc của hệ vi xử lý',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong hệ vi xử lý, đối với bộ xử lý 80286 thì kênh điều khiển có hướng như thế nào?','',N'Không xác định, tuỳ thuộc vào từng tín hiệu điều khiển',N'Là kênh đường ra',N'Là kênh đường vào',N'Là kênh hai chiều',N'Không xác định, tuỳ thuộc vào từng tín hiệu điều khiển',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tất cả các thanh ghi và dường truyền dữ liệu trong 80286 có độ dài bao nhiêu?','',N'16 bit',N'8 bit',N'16 bit',N'32 bit',N'24 bit',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Không gian nhớ thực tối đa mả bộ vi xử lý 80286 có thể quản lý được là bao nhiêu?','',N'16 bit',N'8 bit',N'16 bit',N'32 bit',N'12 bit',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Số dưởng địa chỉ trong 80286 là bao nhiêu?','',N'24',N'8',N'12',N'16',N'24',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tần số đồng hồ cực đại của 80286 là bao nhiêu?','',N'16 MHz',N'12 MHz',N'16 MHz',N'24 MHz',N'32 MHz',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ chế xử lý đường ống (pipeline) của bộ vi xử lý 80286 có tác dụng gì?','',N'Cho phép bộ vi xử lý tận dụng thời gian thực hiện lệnh trước dễ dọc lệnh tiếp nhỏ',N'Làm tăng tốc độ truy cập bộ nhớ RAM',N'Làm tăng tốc độ truy cập bộ nhớ ROM',N'Cho phép truy cập đồng thời cả ROM và RAM',N'Cho phép bộ vi xử lý tận dụng thời gian thực hiện lệnh trước dễ dọc lệnh tiếp nhỏ',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của vi mạch 8284 là:','',N'Tạo tín hiệu xung nhịp đồng hồ',N'Tạo tín hiệu Reset bộ vi xử lý',N'Tạo tín hiệu xung nhịp đồng hồ',N'Tạo tín hiệu điều khiển hệ thống Bus',N'Tạo tín hiệu điều khiển hệ thống vào ra',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý 8086 có bao nhiều thanh ghi 8 bit?','',N'8',N'2',N'4',N'6',N'8',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ truy nhập của các thanh ghi so với bộ nhớ RAM thì:','',N'Nhanh hơn',N'Nhanh hơn',N'Chậm hơn',N'Xấp xi nhau',N'Không so sánh được',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi muốn đọc lệnh tiếp theo từ ROM thì trước hết nội dung thanh ghi nào cần tăng lên?','',N'IP',N'IP',N'IP và SI',N'DI',N'SP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây thuộc nhóm thanh ghi con tro:','',N'BP',N'DI',N'CX',N'DS',N'BP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây thuộc nhóm thanh ghi chỉ số:','',N'DI',N'DI',N'CX',N'DS',N'BP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây thuộc nhóm thanh ghi dữ liệu:','',N'DX',N'DI',N'DX',N'DS',N'BP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây thuộc nhóm thanh ghi đoạn:','',N'DS',N'DI',N'DX',N'DS',N'BP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây là thanh ghi đếm?','',N'CX',N'DI',N'CS',N'IP',N'CX',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây là thanh ghi đoạn ngăn xếp?','',N'SS',N'SP',N'CS',N'SS',N'DS',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây là thanh ghi chỉ số nguồn?','',N'SI',N'SI',N'CS',N'DI',N'SP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây là thanh ghi chỉ số địch:','',N'DI',N'DI',N'SI',N'DS',N'IP',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào trong các thanh ghi sau đây là thanh ghi con trở ngăn xếp?','',N'SP',N'SI',N'SP',N'IP',N'SS',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi IP cho biết thông tin gi?','',N'Địa chỉ offset của lệnh kế tiếp sẽ được thực hiện',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ segment của lệnh kế tiếp sẽ được thực hiện',N'Địa chỉ offset của lệnh kế tiếp sẽ được thực hiện',N'Địa chi dữ liệu dạng chuỗi phục vụ cho chương trình hiện hành',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi CS cho biết thông tin gì?','',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ bắt đầu của đoạn dữ liệu phục vụ cho chương trình hiện hành',N'Địa chỉ bắt đầu của đoạn ngăn xếp trong bộ nhớ',N'Địa chỉ dữ liệu dạng chuỗi phục vụ cho chương trình hiện hành',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi DS cho biết thông tin gia','',N'Địa chỉ bắt đầu của đoạn dữ liệu chứa các biến của chương trình hiện hành',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ bắt đầu của đoạn dữ liệu chứa các biến của chương trình hiện hành',N'Địa chỉ bắt đầu của đoạn ngăn xếp trong bộ nhớ',N'Địa chi dữ liệu dạng chuỗi phục vụ cho chương trình hiện hành',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi SS cho biết thông tin gi?','',N'Địa chỉ bắt dầu của đoạn ngăn xếp trong bộ nhớ',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ bắt đầu của đoạn dữ liệu phục vụ cho chương trình hiện',N'Địa chỉ bắt dầu của đoạn ngăn xếp trong bộ nhớ',N'Địa chi dữ liệu dạng chuỗi phục vụ cho chương trình hiện hành',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi ES cho biết thông tin gì?','',N'Địa chỉ đoạn dữ liệu mở rộng phục vụ cho chương trình hiện hành',N'Địa chỉ bắt đầu của đoạn chương trình hiện hành trong bộ nhớ',N'Địa chỉ kết thúc của đoạn dữ liệu phục vụ cho chương trình hiện hành',N'Địa chỉ bắt đầu của đoạn ngăn xếp trong bộ nhớ',N'Địa chỉ đoạn dữ liệu mở rộng phục vụ cho chương trình hiện hành',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cặp thanh ghi CSIP cho biết thông tin gi','',N'Địa chỉ của lệnh kế tiếp sẽ được thực hiện',N'Địa chỉ bắt đầu của đoạn dữ liệu dành cho chương trình hiện hành trong bộ nhớ',N'Địa chỉ của lệnh vửa được thực hiện',N'Địa chỉ của lệnh kế tiếp sẽ được thực hiện',N'Địa chỉ bắt đầu của đoạn ngăn xếp trong bộ nhớ',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu giá trị thanh ghi CS=2D4511 và IP010811 thì lệnh kế tiếp được đặt ở địa chỉ nào trong bộ nhớ','',N'2D558H',N'2D358H',N'2D558H',N'3D458H',N'3D358H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu giá trị thanh ghi CS–3A45H và IP–0206H thì lệnh kế tiếp được đặt ở địa chỉ nào trong bộ nhớ','',N'3A656H',N'2A356H',N'3A656H',N'3B456H',N'3B356H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu giả trị thanh ghi các CS-3A45H, IP–0206H và bộ xử lý thực hiện một lệnh dải 2 byte thì giá trị của thanh ghi IP sẽ bằng bao nhiêu?','',N'0208H',N'3A47H',N'3A43H',N'0208H',N'0204H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu giá trị thành ghi các CS=3A45H, IP–0206H và bộ vi xử lý thực hiện một lệnh dải I byte thì giá trị của thanh ghi CS sẽ bằng bao nhiêu?','',N'3A45H',N'3A46H',N'3A45H',N'0207H',N'0205H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào được dùng để lưu trữ địa chỉ công vào ra khi bộ vi xử lý thao tác với các thiết bị ngoại vi?','',N'DX',N'AX',N'BX',N'CX',N'DX',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào được dùng để khai báo số lần thực hiện các vòng lặp của ngôn ngữ Assembly?','',N'CX',N'AX',N'BX',N'CX',N'DX',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghi nào được dùng để khai bảo số bit được dịch trong các lệnh dịch của ngôn ngữ Assembly?','',N'CL',N'AH',N'AL',N'BH',N'CL',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thanh ghỉ cở (F) của 80286 có bao nhiêu bit','',N'16 bit',N'8 bit',N'12 bit',N'16 bit',N'24 bit',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu lấy tổng của hai toán hạng 8 bit mà kết quả vượt quả 255 thì sẽ tác động đến nội dung của cờ nào trong các cờ sau đây:','',N'CF',N'CF',N'AF',N'OF',N'ZF',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu kết quả của một thao tác cho ta giá trị bằng 0 thì sẽ tác động đến nội dung của cờ nào trong các cở sau đây?','',N'ZF',N'CF',N'ZF',N'SF',N'PF',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu ta đem cộng hai toán hạng (là số không dầu) có giá trị lần lượt là 10001011(B) và 01101101(B) thì sau phép cộng sẽ đặt nội dung của cờ nào trong các cở sau đây bằng 1?','',N'AF',N'CF',N'SF',N'AF',N'OF',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu ta đem trừ toán hạng có giá trị 10001001(B) cho toán hạng có giá trị 11011000(B) thi sau phép trử nội dung của cở nào trong các cờ sau đây sẽ được đặt lên 1?','',N'SF',N'OF',N'AF',N'ZF',N'SF',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kích thước nhỏ nhất của một mã lệnh của bộ vi xử lý 8086 bằng bao nhiêu?','',N'1 byte',N'1 byte',N'2 byte',N'3 byte',N'4 byte',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Kích thước lớn nhất của một mà lệnh của bộ vi xử lý 8086 bằng bao nhiêu?','',N'15 byte',N'5 byte',N'10 byte',N'15 byte',N'20 byte',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ vi xử lý 8086, hãy chỉ ra khẳng định đúng trong các khẳng định sau:','',N'Một địa chỉ vật lý có thể tương ứng với nhiều địa chỉ logic',N'Một địa chỉ vật lý có thể tương ứng với nhiều địa chỉ logic',N'Một địa chỉ logic có thể tương ủng với nhiều địa chỉ vật lý',N'Một địa chỉ logic chỉ tương ứng với một địa chỉ vật lý duy nhất',N'Một địa chỉ logic chỉ tương ứng với một địa chỉ vật lý theo một luật ánh xạ nhất định',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tưởng ứng với địa chỉ logic IF36H: ODA5H','',N'20105H',N'20BO5H',N'20105H',N'20C15H',N'40D05H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tương ứng với địa chỉ logic ID3AH: ODATH','',N'1E141H',N'ICB01H',N'10101H',N'1E141H',N'20D05H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tưởng ứng với địa chỉ logic TF48H: 0CA5H','',N'20125H',N'20B05H',N'20105H',N'20C15H',N'20125H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tương ứng với địa chỉ logic 1A32H: 02A9H','',N'1ASC9H',N'1ASC9H',N'1B1C9H',N'20C19H',N'20105H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tưởng ứng với địa chỉ logic 2FA6H: 0DB5H','',N'30815H',N'30B05H',N'30815H',N'30C15H',N'40D05H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tương ứng với địa chỉ logic 2F31H: DAA2H','',N'2FDB2H',N'2FB02H ',N'2F102H',N'2FDB2H',N'30D02H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính địa chỉ vật lý tưởng ứng với địa chỉ logic 2A,30H: 8D35H','',N'33035H',N'30BO5H',N'331A5H',N'30C15H',N'33035H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ vật lý 3.3034H tương ứng với địa chỉ logic nào dưới đây?','',N'2A30H:8D34H',N'2A30H:8D34H',N'2A20H:8C34H',N'3A32H:8E32H',N'2A31H:9D34H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ vật lý B30B411 tương ứng với địa chỉ logic nào dưới đây?','',N'AA39H:8D24H',N'AA39H:8D24H',N'BA20H:8C34H',N'3A32H:8E32H',N'2A31H:9D34H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ vật lý 3B032H tương ứng với địa chỉ logic nào dưới đây?','',N'3A20H:0E32H',N'2A30H:8D34H',N'3A20H:0E32H',N'3A02H:2E32H',N'2A31H:9D34H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ vật lý 93034H tương ứng với địa chỉ logic nào dưới đây?','',N'8A30H:8D34H',N'8A30H:8D34H',N'8A2011:8C34H',N'7A32H:8E32H',N'7A31H:8D34H',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của chế độ MIN đối với bộ vi xử lý 8086 là:','',N'CPU tự phát ra các tín hiệu điều khiên cho hệ thống Bus',N'CPU tự phát ra các tín hiệu điều khiên cho hệ thống Bus',N'CPU chỉ phát ra các tín hiệu trạng thái tới chip điều khiển Bus',N'CPU đồng thời phát ra tín hiệu điều khiển tới cả Bus và chip điều khiển Bus',N'CPU phát ra tín hiệu trạng thải tới chip diều khiển Bus trước, sau đó phát tín hiệu điều khiển các Bus sau',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của chế độ MAX đối với bộ vi xử lý 8086 là:','',N'CPU chỉ phát ra các tín hiệu trạng thái tới chip điều khiển Bus',N'CPU tự phát ra các tín hiệu điều khiển cho các Bus',N'CPU chỉ phát ra các tín hiệu trạng thái tới chip điều khiển Bus',N'CPU đồng thời phát ra tín hiệu diểu khiển tới cả Bus và chip diễu khiển Bus',N'CPU phát ra tín hiệu trạng thái tới chip điều khiển Bus trước, sau đó phát tín hiệu điều khiển các Bus sau',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để truyền dữ liệu 16 bit D15-DO qua kênh dữ liệu của bộ vi xử lý 8086 thị tổ hợp chân (/BHE,A0) phải được đặt như thế nào?','',N'(0.0)',N'(0.0)',N'(0.1)',N'(1.0)',N'(1.1)',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để truyền dữ liệu 8 bit D7-D0 qua kênh dữ liệu của bộ vi xử lý 8086 thi tổ hợp chân (/BHE. AD) phải được đặt như thế nào?','',N'(1.0)',N'(0.0)',N'(0.1)',N'(1.0)',N'(1.1)',5,N'Đã duyệt','MC001','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của chân READY trong bộ vi xử lý 8086 là:','',N'Chân đầu vào để bộ nhớ và ngoại vì thông báo cho bộ vi xử lý là chúng đã sẵn sàng làm việc',N'Chân đầu ra thông bảo cho ngoại vi là bộ vi xử lý dã sẵn sàng',N'Chân đầu ra thông bảo cho bộ nhớ là bộ vi xử lý đã sẵn sàng',N'Chân đầu ra thông báo cho bộ nhỏ và ngoại vi là bộ vi xử lý đã sẵn sàng',N'Chân đầu vào để bộ nhớ và ngoại vì thông báo cho bộ vi xử lý là chúng đã sẵn sàng làm việc',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chỉ ra phương án đúng trong các phương án sau:','',N'Ngắt tử chân INTR có thể che được tử cử ngắt, còn ngắt từ chân NMI không thể che được từ cờ ngắt',N'Ngắt tử chân INTR có thể che được tử cử ngắt, còn ngắt từ chân NMI không thể che được từ cờ ngắt',N'Ngắt từ chân INTR không thể che được tử cở ngắt, còn ngắt từ chân NMI có thể che được từ cử ngắt',N'Cả hai ngắt tử chân INTR và NMI đều có thể che được từ cờ ngắt',N'Cả hai ngắt tử chân INTR và NMI đều không thể che được từ cờ ngắt',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bộ vi xử lý 8086 có thể quản lý không gian địa chỉ công ngoại vi 8 bit có kích thước bằng bao nhiêu?','',N'64K (65536)',N'64K (65536)',N'32K (32768)',N'16K (16384)',N'8K (8192)',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối với bộ vi xử lý 8086, nếu chân ALL có mức 1 thì:','',N'Cho phép bộ chốt chốt địa chi tù CPU gửi trên Bus',N'Địa chỉ của bộ nhớ hoặc ngoại vi được chốt trong CPU',N'Cho phép bộ chốt chốt địa chi tù CPU gửi trên Bus',N'Không cho CPU chốt địa chỉ của bộ nhớ hoặc ngoại vi',N'Không cho bộ chối chối địa chỉ tử CPU gửi trên Bus',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu nào sau đây của 8288 nếu ở mức tích cực sẽ cho phép đọc dữ liệu từ bộ nhớ vào CPU?','',N'MRDC',N'IORC',N'DEN',N'MRDC',N'MWDC',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu nào sau đây của 8288 nếu ở mức tích cực sẽ cho phép ghi dữ liệu tử CPU vào bộ nhớ?','',N'MWDC',N'TORC',N'DEN',N'MRDC',N'MWDC',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu nào sau đây của 8288 nếu ở mức tích cực sẽ cho phép ghi dữ liệu tử CPU vào cổng vào ra?','',N'IOWC',N'IORC',N'IOWC',N'MRDC',N'MWDC',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu nào sau đây của 8288 nếu ở mức tích cực sẽ cho phép đọc dữ liệu từ công vào ra vào CPUY','',N'IOWC',N'IORC',N'DEN',N'MRDC',N'MWDC',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tín hiệu nào sau đây 8288 nếu ở mức tích cực sẽ thông 8288 biết là CPU ghi nhận yêu cầu ngắt?','',N'INTA',N'IORC',N'DEN',N'INTA',N'MCE',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi cờ (FLAGS) nhận giá trị nào trong các giá trị sau đây:','',N'02H',N'02H',N'03H',N'07H',N'08H',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi IP nhận giá trị nào trong các giá trị sau đây:','',N'FFF0H',N'F000H',N'FF00H',N'FFF0H',N'FFFFH',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi CS nhận giá trị nào trong các giá trị sau đây:','',N'F000H',N'F000H',N'FF00H',N'FFF0H',N'FFFFH',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi DS nhận giả trị nào trong các giá trị sau đây:','',N'0000H',N'F000H',N'FF00H',N'FFF0H',N'0000H',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi FS nhận giá trị nào trong các giá trị sau đây:','',N'0000H',N'F000H',N'FF00H',N'FFF0H',N'0000H',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, thanh ghi SS nhận giá trị nào trong các giá trị sau đây:','',N'0000H',N'F000H',N'FF00H',N'FFF0H',N'0000H',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, cặp thanh ghi CS:IP nhận giá trị nào trong các giá trị sau đây:','',N'F000H:FFF0H',N'F000H:FFF0H',N'0F00H:F0F0H',N'FFF0H:FFF0H',N'FFFFH:0F00H',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong quá trình xử lý ngắt, thanh ghi nào trong các thanh ghi sau đây chắc chắn sẽ phải thay đổi nội dung?','',N'IP',N'SI',N'DI',N'ES',N'IP',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau khi Reset bộ vi xử lý 8086, lệnh nào được thực hiện đầu tiên?','',N'Lệnh tại địa chỉ FOOOH:FFFOH',N'Lệnh tại địa chỉ FOOOH:FFFOH',N'Lệnh kiểm tra phiên bản hệ điều hành',N'Lệnh tại địa chỉ FFOOH:FFFOH',N'Lệnh tại địa chỉ FFOOH:FOFOH',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi gặp một ngắt, bộ vi xử lý thực hiện như thể nào?','',N'Thực hiện xong lệnh đang thực hiện dở rồi quay ra phục vụ ngắt nêu ngắt là hợp lệ',N'Chạy hết chương trinh đang thực hiện dở rồi phục vụ ngắt',N'Bỏ qua lệnh dang thực hiện và quay ra phục vụ ngắt ngay lập tức nếu ngắt là hợp lệ',N'Thực hiện xong lệnh đang thực hiện dở rồi quay ra phục vụ ngắt nêu ngắt là hợp lệ',N'Bỏ qua ngắt nếu bộ vi xử lý đang thực hiện dở một chương trình khác',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Địa chỉ quay về chương trình chính từ chương trình con phục vụ ngắt được lưu vào đâu trước khi chương trình con phục vụ ngắt được thực hiện?','',N'Vùng nhớ ngăn xếp',N'Bảng vecto ngắt',N'Vùng nhớ dành riêng cho chương trình',N'Vùng nhớ ngăn xếp',N'Cặp thanh ghi CS:IP',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt mà được gọi bởi một lệnh trong chương trình ngôn ngữ máy thi được gọi là ngắt gì trong các loại ngắt sau đây:','',N'Ngắt mềm',N'Ngặt cứng che được bằng cở ngặt',N'Ngặt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh từ chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt phát sinh từ thiết bị ngoại vi thì được gọi là ngắt gì trong các loại ngắt sau đây:','',N'Ngắt cứng che được bằng cử ngắt',N'Ngắt cứng che được bằng cử ngắt',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh từ chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt phát sinh do hỏng hóc phần cứng nghiêm trọng ngắt gì trong các loại ngắt sau đây:','',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt cứng che được bằng cờ ngắt',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lễ phát sinh từ chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt phát sinh do lỗi chia cho 0 trong chương trình thi ngắt gì trong các loại ngắt sau đây:','',N'Ngoại lệ phát sinh tử chính CPU',N'Ngắt cứng cho được bằng cử ngắt',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh tử chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt phát sinh do trận bộ nhớ của bộ đồng xử lý thi được gọi là ngắt gì trong các loại ngắt sau đây:','',N'Ngoại lệ phát sinh tử chính CPU',N'Ngắt cứng cho được bằng cử ngắt',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh tử chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ngắt phát sinh do mã toán không hợp lệ thì được gọi là các loại ngắt sau đây:','',N'Ngoại lệ phát sinh tử chính CPU',N'Ngắt cứng cho được bằng cử ngắt',N'Ngắt cứng không che được bằng cờ ngắt',N'Ngắt mềm',N'Ngoại lệ phát sinh tử chính CPU',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ chế DMA là gi?','',N'Truy cập bộ nhớ trực tiếp',N'Truy cập ngoại vi trực tiếp',N'Truy cập bộ nhớ trực tiếp',N'Điều khiển thiết bị ngoại vi thông qua qua bộ nhớ',N'Điểu khiển hệ thống bộ nhớ thông qua thiết bị ngoại vi',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'DMA là viết tắt của:','',N'Direct Memory Access',N'Direct Management Access',N'Direct Memory Application Access',N'Direct Memory Access',N'Direct Mainboard Administration',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ chế DMA cho phép thực hiện điều gì?','',N'Truyền dữ liệu trực tiếp giữa bộ nhớ và các thiết bị ngoại vi',N'Truyền dữ liệu trực tiếp giữa bộ nhớ và các thiết bị ngoại vi',N'Truyền dữ liệu trực tiếp giữa bộ nhớ và các thanh ghi trong bộ vi xử lý',N'Truyền dữ liệu trực tiếp giữa các thiết bị ngoại vi',N'Truyền dữ liệu trực tiếp giữa các thành phần trong hệ thống bộ nhớ',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp nào sau đây là một trong các phương pháp thực hiện DMA?','',N'Lấy cắp chu kỳ',N'Ngắt không che được',N'Lấy cắp chu kỳ',N'Ngắt che được',N'Tham dò ngoại vi',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp nào sau đây là một trong các phương pháp thực hiện DMA?','',N'Điều khiển để CPU tự treo',N'Ngắt mềm',N'Điều khiển để CPU tự treo',N'Ngắt không che được',N'Tham đỗ ngoại vi',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'DMAC gửi tín hiệu yêu cầu CPU tự treo dễ thực hiện DMA qua chân nào?','',N'HOLD',N'DREQ',N'HOLD',N'HOLDA',N'DACK',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi CPU chấp nhận yêu cầu tự treo để thực hiện DMA thì nó sẽ báo cho DMAC qua chân nào?','',N'HOLDA',N'DREQ',N'HOLD',N'HOLDA',N'DACK',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi chip DMCA đang đọc dữ liệu từ ngoại vi qua địa chỉ công thì chân nào trong các chân sau dây phải ở mức tích cực:','',N'TOR',N'TOR',N'IOW',N'/MEMR',N'/MEMW',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi chip DMCA đang chuyển dữ liệu tới ngoại vi qua công thì tương ủng với chân nào trong các chân sau đây phải ở mức tích cực:','',N'IOW',N'TOR',N'IOW',N'/MEMR',N'/MEMW',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi chip DMCA đang đọc dữ liệu từ bộ nhớ thì tương ứng với chân nào trong các chân sau đây phải ở mức tích cực:','',N'/MEMR',N'TOR',N'IOW',N'/MEMR',N'/MEMW',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi chip DMCA đang ghi dữ liệu vào bộ nhớ thị tương ứng với chân nào trong các chân sau đây phải ở mức tích cực:','',N'/MEMW',N'TOR',N'IOW',N'/MEMR',N'/MEMW',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi CPU hoặc Bus master báo cho DMCA biết nó đã rời khỏi Bus và nhưởng quyền điều khiển cho DMCA thì chân nào trong các chân sau đây của DMCA phải ở mức tích cực?','',N'HLDA',N'HLDA',N'ADSTB',N'AEN',N'HRQ',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi DMAC cần kích hoạt để chốt địa chỉ thì chân nào trong các chân sau đây của DMCA phải ở mức tích cực:','',N'AEN',N'HLDA',N'ADSTB',N'AEN',N'HRQ',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chân nào là chân chọn chip trong các chân sau đây của DMAC:','',N'CS',N'CLK',N'CS',N'HRO',N'AEN',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chân nào là lối vào của xung nhịp trong các chân sau đây của DMAC:','',N'CLK',N'CLK',N'CS',N'HRO',N'AEN',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chân nào là chân bảo chấp nhận DMA trong các chân sau dây của DMAC:','',N'DACK',N'AEN',N'DREQ',N'HRQ',N'DACK',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chân nào là chân báo đòi hỏi DMA tử thiết bị ngoại vi trong các chân sau đây của DMAC:','',N'DREQ',N'AEN',N'DREQ',N'HRQ',N'DACK',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus dữ liệu của DMAC 8237 có bao nhiêu bit?','',N'8',N'4',N'8',N'16',N'32',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bus địa chỉ của DMAC 8237 gồm bao nhiêu bit','',N'8',N'8',N'12',N'16',N'20',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chân nào trong các chân sau đây báo kết thúc xử lý DMA?','',N'EOP',N'AEN',N'DREQ',N'HRQ',N'EOP',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ đồng hồ của một máy tinh có thể đạt giá trị khoảng','',N'500 MHz',N'500 Hz',N'500 KHz',N'500 MHz',N'500 GHz',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi chương trình con được gọi, địa chỉ quay về được cắt vào:','',N'Ngăn xếp',N'Ngăn xếp',N'Thanh ghỉ con trở ngăn xếp',N'Cặp thanh ghi CS:IP',N'Bộ đếm chương trình',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thông thưởng khi một chương trình con phục vụ ngắt được thực hiện xong','',N'Chương trình bị tạm dừng sẽ được tiếp tục thực hiện',N'Bộ vi xử lý phải được khởi động lại',N'Một yêu cầu ngắt xuất hiện',N'Chương trình bị tạm dừng sẽ được tiếp tục thực hiện',N'Hệ thống bị dừng (Halt)',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một tín hiệu vào của bộ vi xử lý làm cho nó tạm dừng chương trình dang thực hiện thì được gọi là:','',N'Ngắt (Interrupt)',N'Nghỉ (Break)',N'Ngắt (Interrupt)',N'Dừng (Stop)',N'Đợi (Wait)',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các ngắt mà bộ vi xử lý có thể bỏ qua được gọi là:','',N'Có thể che được',N'Ưu tiên cao',N'Có thể che được',N'Nhiều mức',N'Không thể bị che',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cấu trúc ngăn xếp kiểu LIFO, dữ liệu được cắt vào đầu tiên được lấy ra:','',N'Cuối cùng',N'Đầu tiên',N'Cuối cùng',N'Từ thanh ghi con trỏ ngăn xếp',N'Tử thanh ghi cở',5,N'Đã duyệt','MC002','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của câu lệnh Assembly sau là gi: OUT 30H, AL','',N'Gửi nội dung thanh ghi AL. ra cổng ngoại vi có địa chỉ là 30H',N'Gửi nội dung thanh ghi AL. ra cổng ngoại vi có địa chỉ là 30H',N'Gửi giá trị 30H ra cống ngoại vi có địa chỉ là nội dung thanh ghi',N'Gửi giá trị 30H ra công ngoại vi cỏ địa chỉ là 48',N'Thu một byte từ công có địa chỉ là 30H và đặt vào thanh ghi AL',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chức năng của câu lệnh Assembly sau là gì? IN AL, 31H','',N'Thu một byte từ công có địa chỉ là 31H, đặt vào thanh ghi AL',N'Gửi nội dung thanh ghì AL ra cổng ngoại vi có địa chỉ là 31H',N'Gửi giải trị 31H ra công ngoại vi có địa chỉ là nội dung thanh ghi AL',N'Thu giá trị 31H tử một công ngoại vi và đặt vào thanh ghi AL',N'Thu một byte từ công có địa chỉ là 31H, đặt vào thanh ghi AL',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các câu lệnh Assembly sau, câu lệnh nào không hợp lệ','',N'add AL',N'MoV AX, 30000',N'add AL',N'aNd BX, 30H',N'ADD AX, 30',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho đoạn lệnh sau: MOV AH, 10H; MOV AL, 16H; XCHG AL, AH; Hỏi kết quả cuối cùng thanh ghi AH bằng bao nhiêu?','',N'16H',N'26H',N'16H',N'06H',N'10H',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho đoạn lệnh: MOV AH, OAOH; ADD AL, AH; MOV AL, 16H; Hỏi kết quả cuối cùng thanh ghi AL bằng bao nhiêu?','',N'0B6H',N'26H',N'84H',N'0B6H',N'16H',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho đoạn lệnh: MOV AH, 90H; MOV AL, 3611; ADD AL, AH; Hỏi kết quả cuối cùng thanh ghi AL bằng bao nhiêu?','',N'0C6H',N'6AH',N'64H',N'OB6H',N'0C6H',5,N'Đã duyệt','MC003','NHCH006')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cho đoạn lệnh: MOV AH, OAOH: MOV AL, 0A6H; ADD AL, AH; Hỏi kết quả cuối cùng thanh ghi All bằng','',N'0A0H',N'OASH',N'0A6H',N'0A0H',N'0A8H',5,N'Đã duyệt','MC003','NHCH006')

INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sức mạnh chiến đấu của quân đội nhân dân Việt Nam theo tư tưởng Hồ Chí Minh :','',N'Là sức mạnh tổng hợp, trong đó yếu tố chính trị , tinh thần giữ vai trò quyết định',N'Là sức mạnh của yếu tố con người và vũ khí trang bị hiện đại',N'Là sức mạnh của nhiều yếu tố kết hợp lại trong đó quân sự là chủ chốt',N'Là sức mạnh tổng hợp, trong đó yếu tố chính trị , tinh thần giữ vai trò quyết định',N'Là sức mạnh của yếu tố con người và tiềm lực quốc phòng',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những chức năng của quân đội nhân dân Việt Nam theo tư tưởng Hồ Chí Minh là :','',N'Đội quân công tác',N'Đội quân chiến đấu bảo vệ đất nước',N'Đội quân công tác',N'Đội quân tuyên truyền ,giác ngộ nhân dân',N'Đội quân bảo vệ chính quyền của giai cấp công nông',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo Tư tưởng Hồ Chí Minh,Quân đội nhân dân Việt Nam có những chức năng:','',N'Chiến đấu , công tác , lao động sản xuất',N'Chiến đấu sẵn sàng chiến đấu',N'Chiến đấu , lao động sản xuất, tuyên truyền',N'Chiến đấu , công tác , lao động sản xuất',N'Chiến đấu và tham gia giữ gìn hòa bình khu vực',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Là sức mạnh của cả dân tộc và sức mạnh quốc phòng toàn dâ','',N'Là sức mạnh tổng hợp của cả dân tộc, cả nước, kết hợp với sức mạnh thời đại',N'Là sức mạnh của cả dân tộc và sức mạnh quốc phòng toàn dân',N'Là sức mạnh tổng hợp của cả dân tộc, cả nước, kết hợp với sức mạnh thời đại',N'Là sức mạnh toàn dân , lấy lực lượng vũ trang làm nòng cốt',N'Là sức mạnh của lực lượng vũ trang nhân dân , sức mạnh của toàn dân',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ba chức năng cơ bản của quân đội nhân dân Việt Nam được Hồ Chí Minh xác định , thể hiện vấn đề gì trong quá trình xây dựng quân đội?','',N'Thể hiện bản chất, truyền thống tốt đẹp của quân đội ta',N'Thể hiện bản chất  và kinh nghiệm của quân đội ta',N'Thể hiện sức mạnh của quân đội ta',N'Thể hiện bản chất, truyền thống tốt đẹp của quân đội ta',N'Thể hiện quân đội ta là  quân đội cách mạng',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung tư tưởng Hồ Chí Minh về bảo vệ Tổ quốc là gì ?','',N'Bảo vệ Tổ quốc XHCN là tất yếu , khách quan , thể hiện ý chí quyết tâm của nhân dân ta',N'Bảo vệ Tổ quốc gắn liền với nhiệm vụ bảo vệ chế độ XHCN',N'Bảo vệ Tổ quốc XHCN là nhiệm vụ trong sự nghiệp xây dựng CNXH',N'Bảo vệ Tổ quốc XHCN là truyền thống của quốc gia , dân tộc,là ý chí của toàn dân',N'Bảo vệ Tổ quốc XHCN là tất yếu , khách quan , thể hiện ý chí quyết tâm của nhân dân ta',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung tư tưởng Hồ Chí Minh về bảo vệ Tổ quốc XHCN, thể hiện ý chí của Người như thế nào?','',N'Ý chí quyết tâm giải phóng dân tộc , bảo vệ Tổ quốc là tư tưởng xuyên suốt trong cuộc đời hoạt động của chủ tịch Hồ Chí Minh',N'Ý chí quyết tâm giải phóng dân tộc , bảo vệ Tổ quốc là tư tưởng xuyên suốt trong cuộc đời hoạt động của chủ tịch Hồ Chí Minh',N'Ý chí giữ nước của chủ tịch Hồ Chí Minh rất kiên định và triệt để',N'Ý chí bảo vệ Tổ quốc của Chủ tịch Hồ Chí Minh là liên tục tiến công',N'Ý chí bảo vệ Tổ quốc của Chủ tịch Hồ Chí Minh rất kiên định ,triệt để',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chủ tịch Hồ Chí Minh phát động phong trào toàn quốc kháng chiến chống thực dân Pháp vào ngày tháng năm nào?','',N'Ngày 19 tháng 12 năm 1946',N'Ngày 22 tháng 12 năm 1944',N'Ngày 19 tháng 12 năm 1946',N'Ngày 19 tháng  8 năm 1945',N'Ngày  22 tháng 12 năm 1946',1,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chủ tich Hồ Chí Minh xác định yếu tố con người có vai trò quan trọng như thế nào trong xây dựng quân đội nhân dân ?','',N'Con người có giác ngộ giữ vai trò quan trọng nhất , chi phối các yếu tố khác',N'Con người có giác ngộ giữ vai trò quan trọng nhất , chi phối các yếu tố khác',N'Con người với trình độ chính trị cao giữ vai trò quyết định',N'Con người là quan trọng cùng với yếu tố quân sự là quyết định',N'Con người với trình độ quân sự cao giữ vai trò quyết định',1,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hồ Chí Minh khẳng định phải dùng bạo lực cách mạng để giành chính quyền và giữ chính quyền, vì một trong những lý do gì?','',N'Chế độ thực dân , tự thân nó đã là một hành động bạo lực',N'Chủ nghĩa thực dân bóc lột , cai trị nhân dân bằng bạo lực',N'Chế độ thực dân , tự thân nó đã là một hành động bạo lực',N'Kẻ thù luôn dùng bạo lực để duy trì quyền thống trị',N'Làm cách mạng là phải dùng bạo lực cách mạng',1,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để phát huy nhân tố con người trong xây dựng quân đội, Hồ Chí Minh rất coi trọng vấn đề gì?','',N'Công tác giáo dục chính trị trong quân đội',N'Công tác tư tưởng, tổ chức và rèn luyện tính kỷ luật',N'Rèn luyện đạo đức trình độ kỹ chiến thuật',N'Công tác giáo dục chính trị trong quân đội',N'Công tác tổ chức và rèn luyện bản lĩnh chiến đấu',1,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hồ Chí Minh xác định vai trò của Đảng trong sự nghiệp bảo vệ Tổ quốc XHCN như thế nào?','',N'Đảng cộng sản Việt Nam lãnh đạo sự nghiệp bảo vệ Tổ quốc Việt Nam XHCN',N'Đảng cộng sản Việt Nam chỉ đạo trực tiếp sự nghiệp bảo vệ Tổ quốc',N'Đảng cộng sản Việt Nam là người đi tiên phong trong sự nghiệp bảo vệ Tổ quốc',N'Đảng cộng sản Việt Nam là người kêu gọi mọi tầng lớp nhân dân đứng lên bảo vệ đất nước',N'Đảng cộng sản Việt Nam lãnh đạo sự nghiệp bảo vệ Tổ quốc Việt Nam XHCN',1,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để bảo vệ Tổ quốc XHCN,Chủ tịch Hồ Chí Minh đặc biệt coi trọng yếu tố nào?','',N'Sức mạnh toàn dân tộc, sức mạnh toàn dân',N'Sức mạnh toàn dân tộc, sức mạnh toàn dân',N'Sự đoàn kết nhất trí của nhân dân, của Đảng và chính phủ',N'Sự đoàn kết nhất trí của toàn dân tộc và lực lượng vũ trang nhân dân',N'Sức mạnh của Lực lượng vũ trang nhân dân',1,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hồ Chí Minh khẳng định mục đích chính trị cuộc chiến tranh xâm lược của thực dân Pháp là gì?','',N'Cướp nước, nô dịch và thống trị các dân tộc thuộc địa',N'Thống trị, bóc lột các dân tộc thuộc địa',N'Cướp nước, nô dịch và thống trị các dân tộc thuộc địa',N'Đặt ách thống trị áp bức bóc lột dân tộc Việt Nam',N'Cướp nước, bóc lột các dân tộc thuộc địa',1,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư tưởng Hồ Chí Minh về kháng chiến lâu dài như thế nào?','',N'Lấy thời gian làm lực lượng, chuyển hoá so sánh dần dần thế và lực của ta, giành thắng lợi hoàn toàn, kết thúc chiến tranh càng sớm càng tốt',N'Xây dựng lực lượng, tạo và giành thời cơ kết thúc chiến tranh càng sớm càng tốt',N'Lấy thời gian làm lực lượng, chuyển hoá so sánh dần dần thế và lực của ta, giành thắng lợi hoàn toàn, kết thúc chiến tranh càng sớm càng tốt',N'Xây dựng lực lượng quân sự đủ mạnh, tiến lên giành thắng lợi quyết định, rút ngắn thời gian chiến tranh',N'Tìm kiếm thời cơ và sự hỗ trợ của các lực lượng tiến bộ từ phía bên ngoài, kết thúc chiến tranh càng sớm càng tốt',1,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hồ Chí Minh xác định tính chất xã hội của chiến tranh như thế nào?','',N'Chiến tranh chính nghĩa và chiến tranh phi nghĩa',N'Chiến tranh chính nghĩa và chiến tranh phi nghĩa',N'Chiến tranh cách mạng và phản cách mạng',N'Chiến tranh là một hiện tượng mang tính xã hội',N'Tất cả các câu đều đúng',1,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hồ Chí Minh khẳng định mục đích của chiến tranh chống xâm lược là :','',N'Bảo vệ độc lập dân tộc , chủ quyền quốc gia',N'Bảo vệ nhân dân, bảo vệ chế độ, bảo vệ Tổ quốc',N'Bảo vệ đất nước và chống ách đô hộ của thực dân , đế quốc',N'Bảo vệ độc lập dân tộc , chủ quyền quốc gia',N'Bảo vệ tính mạng , tài sản của nhân dân, của chế độ XHCN',1,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo tư tưởng Hồ Chí Minh lực lượng vũ trang nhân dân Việt Nam gồm   những thứ quân nào?','',N'Bộ đội chủ lực, Bộ đội địa phương, Dân quân tự vệ',N'Bộ đội chủ lực, Bộ đội biên phòng, Bộ đội địa phương',N'Bộ đội chính qui, công an nhân dân, Bộ đội địa phương và Dân quân tự vệ',N'Bộ đội chủ lực, Bộ đội địa phương, Dân quân tự vệ',N'Bộ đội chủ lực, Bộ đội biên phòng, Bộ đội địa phương, Công an nhân dân và Dân quân tự vệ',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo tư tưởng Hồ Chí Minh, sử dụng bạo lực cách mạng là để:','',N'Giành chính quyền và giữ chính quyền',N'Lật đổ chế độ cũ, xây dựng chế độ mới',N'Xây dựng và bảo vệ chính quyền cách mạng, xây dựng chế độ mới',N'Giành chính quyền và giữ chính quyền',N'Tiêu diệt các lực lượng phản cách mạng và lật đổ chính quyền phản động',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo quan điểm của Chủ nghĩa Mác Lê nin, chiến tranh là:','',N'Một hiện tượng chính trị - xã hội',N'Một hành vi bạo lực nhằm lật đổ một chế độ xã hội',N'Một hành vi bạo lực nhằm bảo vệ chính quyền cách mạng, xây dựng chế độ mới',N'Giải quyết mâu thuẫn xã hội của mối quan hệ người với người',N'Một hiện tượng chính trị - xã hội',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo quan điểm của Chủ nghĩa Mác Lê nin, nguồn gốc kinh tế của chiến tranh là:','',N'Sự xuất hiện và tồn tại của chế độ chiếm hữu tư nhân về tư liệu sản xuất',N'Một hành vi bạo lực nhằm lật đổ một chế độ xã hội',N'Sự xuất hiện và tồn tại của chế độ chiếm hữu tư nhân về tư liệu sản xuất',N'Giải quyết mâu thuẫn xã hội của mối quan hệ người với người',N'Sự xuất hiện và tồn tại của giai cấp và đối kháng giai cấp',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo quan điểm của Chủ nghĩa Mác Lê nin, nguồn gốc xã hội của chiến tranh là : ','',N'Sự xuất hiện và tồn tại của giai cấp và đối kháng giai cấp',N'Một hành vi bạo lực nhằm lật đổ một chế độ xã hội',N'Sự xuất hiện và tồn tại của chế độ chiếm hữu tư nhân về tư liệu sản xuất',N'Giải quyết mâu thuẫn xã hội của mối quan hệ người với người',N'Sự xuất hiện và tồn tại của giai cấp và đối kháng giai cấp',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chủ tịch Hồ Chí Minh khẳng định phải kháng chiến lâu dài, dựa vào sức mình là chính. Vì sao?','',N'Đất nước nghèo, kinh tế kém phát triển,vừa giành được độc lập, kẻ thù là bọn thực dân ,đế quốc có tiềm lực kinh tế ,quân sự hơn ta nhiều lần',N'Đất nước nghèo, phải chiến đấu chống lại kẻ thù có tiềm lực kinh tế, quân sự hùng mạnh',N'Đất nước nghèo, kinh tế kém phát triển,vừa giành được độc lập, kẻ thù là bọn thực dân ,đế quốc có tiềm lực kinh tế ,quân sự hơn ta nhiều lần',N'Đất nước nghèo, lực lượng vũ trang ta chưa thể đánh thắng kẻ thù ngay được',N'Đất nước nghèo, phải chiến đấu chống lại kẻ thù có tiềm lực kinh tế ,quân sự',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo tư tưởng Hồ Chí Minh, nhân tố quyết định thắng lợi trong chiến tranh là:','',N'Sức mạnh của toàn dân, lấy lực lượng vũ trang làm nòng cốt được đặt dưới sự lãnh đạo của Đảng',N'Sức mạnh của toàn dân, lấy lực lượng vũ trang làm nòng cốt được đặt dưới sự lãnh đạo của Đảng',N'Sức mạnh của toàn dân, sức mạnh của vũ khí, sức mạnh của quân đội và sự ủng hộ của nhân dân thế giới',N'Sức mạnh của chính nghĩa, sức mạnh của quân đội, sức mạnh của nền kinh tế',N'Tất cả đều sai',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền thân của Quân đội nhân dân Việt Nam là :','',N'Đội Việt Nam tuyên truyền giải phóng quân',N'Đoàn Vệ quốc quân',N'Đội Việt Nam cứu quốc quân',N'Việt Nam giải phóng quân',N'Đội Việt Nam tuyên truyền giải phóng quân',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lý luận của chủ nghĩa Mac-Lê Nin về bản chất giai cấp của quân đội là gì?','',N'Mang bản chất giai cấp nhà nước đã tổ chức nuôi dưỡng và sử dụng quân đội',N'Mang bản chất từ thành phần xuất thân của lực lượng vũ trang',N'Mang bản chất quần chúng nhân dân lao động',N'Mang bản chất giai cấp nhà nước đã tổ chức nuôi dưỡng và sử dụng quân đội',N'Là lực lượng bảo vệ đất nước, không mang bản chất chính trị',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan niệm của chủ nghĩa Mac- Lê Nin về bản chất của chiến tranh là gì?','',N'Bản chất của chiến tranh là sự kế tục chính trị bằng bạo lực.',N'Bản chất của chiến tranh là sự kế tục chính trị bằng bạo lực.',N'Bản chất của chiến tranh  là sự tranh giành vị trí thống trị trên thế giới',N'Bản chất của chiến tranh  là sự tranh giành về quyền lợi kinh tế trong xã hội',N'Bản chất của chiến tranh  là thủ đoạn để đạt được mục tiêu chính trị của một giai cấp',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan niệm của chủ nghĩa Mac- Lê Nin về nguồn gốc của chiến tranh là:','',N'Chiến tranh bắt nguồn từ sự xuất hiện chế độ tư hữu, giai cấp và nhà nước',N'Chiến tranh bắt nguồn ngay từ khi xuất hiện loài người',N'Chiến tranh bắt nguồn từ sự xuất hiện chế độ tư hữu, giai cấp và nhà nước',N'Chiến tranh bắt nguồn từ sự phát triển tất yếu khách quan của loài người',N'Chiến tranh bắt nguồn từ khi xuất hiện các hình thức tôn giáo',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo tư tưởng Hồ Chí Minh : Mục tiêu bảo vệ Tổ quốc là:','',N'Độc lập dân tộc và chủ nghĩa xã hội, là nghĩa vụ và trách nhiệm của mọi công dân',N'Nghĩa vụ  và trách nhiệm của người dân',N'Nghĩa vụ thiêng liêng cao quí của mỗi người dân',N'Giữ gìn sự thống nhất và toàn vẹn lãnh thổ',N'Độc lập dân tộc và chủ nghĩa xã hội, là nghĩa vụ và trách nhiệm của mọi công dân',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Theo tư tưởng Hồ Chí Minh : Sức mạnh bảo vệ Tổ quốc là:','',N'Sức mạnh của cả dân tộc , cả nước , kết hợp với sức mạnh thời đại',N'Sức mạnh của sự đoàn kết , của ý chí và truyền thống dân tộc',N'Sức mạnh của lòng yêu nước nồng nàn kết hợp với sức mạnh của tinh thần đoàn kết  toàn dân tộc',N'Sức mạnh tổng hợp của cả dân tộc',N'Sức mạnh của cả dân tộc , cả nước , kết hợp với sức mạnh thời đại',1,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng thế trận quốc phòng toàn dân là:','',N'Phân vùng chiến lược gắn với bố trí lực lượng quân sự vững mạnh',N'Phân vùng chiến lược gắn với xây dựng các vùng kinh tế, dân cư',N'Phân vùng chiến lược gắn với xây dựng hậu phương chiến lược',N'Phân vùng chiến lược gắn với bố trí lực lượng quân sự vững mạnh',N'Phân vùng chiến lược gắn với xây dựng các tuyến phòng thủ',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Xây dựng thế trận quốc phòng toàn dân , tập trung vào mấy điểm?','',N'Tập trung vào 4 điểm',N'Tập trung vào 2 điểm',N'Tập trung vào 3 điểm',N'Tập trung vào 4 điểm',N'Tập trung vào 6 điểm',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc trưng của nền quốc phòng toàn dân và an ninh nhân dân là:','',N'Nền quốc phòng toàn dân gắn chặt với nền an ninh nhân dân',N'Nền quốc phòng toàn dân gắn chặt với nền an ninh nhân dân',N'Nền quốc phòng toàn dân và nền an ninh nhân dân là một',N'Nền an ninh nhân dân hỗ trợ cho nền quốc phòng toàn dân',N'Nền an ninh nhân dân và nền quốc phòng toàn dân thực hiện nhiệm vụ độc lập về an ninh quốc phòng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc trưng của nền quốc phòng toàn dân và an ninh nhân dân là:','',N'Nền quốc phòng toàn dân, an ninh nhân dân có mục đich duy nhất là tự vệ chính đáng',N'Nền quốc phòng toàn dân, an ninh nhân dân có mục đich duy nhất là tự vệ chính đáng',N'Nền quốc phòng toàn dân và nền an ninh nhân dân là một',N'Nền an ninh nhân dân hỗ trợ cho nền quốc phòng toàn dân',N'Nền an ninh nhân dân và nền quốc phòng toàn dân đều dựa vào vũ khí và phương tiện chiến tranh',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung đặc trưng của nền quốc phòng toàn dân và an ninh nhân dân là:
            1. Nền quốc phòng toàn dân, an ninh nhân dân có mục đích duy nhất là tự vệ chính đáng.
            2. Nền an ninh nhân dân hỗ trợ cho nền quốc phòng toàn dân.
            3. Nền an ninh nhân dân và nền quốc phòng toàn dân đều dựa vào vũ khí và phương tiện chiến tranh.
            4.  Nền quốc phòng, an ninh vì dân, của dân và do toàn thể nhân dân tiến hành.','',N'Nội dung 1 và 4 đúng',N'Nội dung 2 và 3 đúng',N'Nội dung 1 và 4 đúng',N'Nội dung 2 và 4 đúng',N'Nội dung 1 và 3 đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung đặc trưng của nền quốc phòng toàn dân và an ninh nhân dân là:
            1. Nền quốc phòng toàn dân, an ninh nhân dân có mục đích duy nhất là tự vệ chính đáng.
            2.  Nền quốc phòng, an ninh có sức mạnh tổng hợp do nhiều yếu tố tạo thành.
            3.  Nền an ninh nhân dân và nền quốc phòng toàn dân đều dựa vào vũ khí và phương tiện chiến tranh.
            4.  Nền quốc phòng, an ninh vì dân, của dân, do toàn thể nhân dân tiến hành.','',N'Nội dung 1, 2  và 4 đúng',N'Nội dung 1,2 và 3 đúng',N'Nội dung  2, 3  và 4 đúng',N'Nội dung 1, 2  và 4 đúng',N'Tất cả đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung về mục đích xây dựng nền quốc phòng toàn dân và an ninh nhân dân hiện nay là:
            1/  Tạo sức mạnh tổng hợp cho đất nước về chính trị, quân sự, an ninh, kinh tế văn hóa, xã hội
            2/  Tạo thế chủ động cho sự nghiệp xây dựng và bảo vệ Tổ quốc
            3/  Giữ vững ổn định chính trị, môi trường hòa bình, phát triển đất nước    
                 theo định hướng XHCN
            4/  Bảo vệ lợi ích quốc gia, dân tộc','',N'Tất cả đều đúng',N'Nội dung 1, 2 và 3 đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 1, 2 và 4 đúng',N'Tất cả đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ phù hợp nhất cho khái niệm tiềm lực quốc phòng, an ninh: “Tiềm lực quốc phòng, an ninh là khả năng về……………”.','',N'nhân lực, vật lực, tài chính có thể huy động để thực hiện nhiệm vụ quốc phòng, an ninh',N'vũ khí, phương tiện chiến tranh có thể huy động để thực hiện nhiệm vụ quốc phòng, an ninh',N'lực lượng chính trị và lực lượng vũ trang, vũ khí, phương tiện có thể huy động để thực hiện nhiệm vụ quốc phòng, an ninh',N'nguồn lực xã hội đáp ứng cho yêu cầu quốc phòng, an ninh',N'nhân lực, vật lực, tài chính có thể huy động để thực hiện nhiệm vụ quốc phòng, an ninh',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung của xây dựng tiềm lực quốc phòng an ninh ngày nay là:
            1/  Xây dựng tiềm lực quân sự, an ninh
            2/  Xây dựng tiềm lực khoa học, công nghệ
            3/  Xây dựng tiềm lực tác chiến trên không, trên bộ và trên biển
            4/  Xây dựng tiềm lực tài chính và vũ khí quốc gia','',N'Nội dung 1 và 2 đúng',N'Nội dung 2 và 3 đúng',N'Nội dung 1 và 4 đúng',N'Nội dung 1 và 3 đúng',N'Nội dung 1 và 2 đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung của xây dựng tiềm lực quốc phòng an ninh ngày nay là:
            1/  Xây dựng tiềm lực kinh tế
            2/  Xây dựng tiềm lực khoa học, công nghệ
            3/  Xây dựng tiềm lực tác chiến trên không, trên bộ và trên biển
            4/  Xây dựng tiềm lực chính trị, tinh thần','',N'Nội dung 1, 2 và 4 đúng',N'Tất cả 1, 2, 3 và 4 đều đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 1, 2 và 4 đúng',N'Nội dung 1, 3 và 4 đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ phù hợp nhất cho khái niệm tiềm lực kinh tế: “tiềm lực kinh tế của nền quốc phòng, an ninh là khả năng về kinh tế của đất nước có thể . . .nhằm phục vụ cho quốc phòng, an ninh”','',N'khai thác, huy động',N'khai thác, huy động',N'lãnh đạo thực hiện',N'quản lý điều hành',N'tổ chức triển khai',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điền cụm từ phù hợp nhất cho khái niệm tiềm lực chính trị, tinh thần: “Tiềm lực chính trị, tinh thần được biểu hiện ở năng lực . . .”','',N'lãnh đạo của Đảng, quản lý điều hành của Nhà nước',N'huy động vũ khí, phương tiện chiến tranh để thực hiện nhiệm vụ quốc phòng,an ninh',N'lãnh đạo lực lượng vũ trang để thực hiện nhiệm vụ quốc phòng, an ninh',N'lãnh đạo của Đảng, quản lý điều hành của Nhà nước',N'huy động nhân lực, vật lực, tài chính để thực hiện nhiệm vụ quốc phòng, an ninh',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ phù hợp nhất cho khái niệm tiềm lực chính trị, tinh thần: “tiềm lực chính trị, tinh thần là nhân tố cơ bản tạo nên sức mạnh của . . .,có tác động to lớn đến hiệu quả sử dụng các nguồn tiềm lực khác”','',N'quốc phòng, an ninh',N'Đảng',N'quốc phòng, an ninh',N'quân đội, vũ khí và phương tiện chiến tranh',N'quân đội',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng tiềm lực chính trị, tinh thần của nền quốc phòng toàn dân, an ninh nhân dân là:','',N'Xây dựng tình yêu quê hương đất nước, niềm tin đối với sự lãnh đạo của Đảng, quản lý của Nhà nước, đối với chế độ XHCN',N'Xây dựng và huy động nguồn nhân lực, vật lực, tài chính cho quân đội',N'Phát triển vũ khí, phương tiện chiến tranh để thực hiện nhiệm vụ quốc phòng,an ninh',N'Xây dựng tình yêu quê hương đất nước, niềm tin đối với sự lãnh đạo của Đảng, quản lý của Nhà nước, đối với chế độ XHCN',N'Phát triển quân đội',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung xây dựng tiềm lực kinh tế của nền quốc phòng, an ninh là:
1/  Đẩy mạnh công nghiệp hóa, hiện đại hóa đất nước, xây dựng nền kinh tế độc lập, tự chủ
2/  Xây dựng các quân binh chủng tác chiến trên mọi chiến trường cả thời bình và thời chiến
3/  Phát triển công nghiệp quốc phòng, trang bị kỹ thuật hiện đại cho quân đội và công an
4/  Xây dựng hậu phương vững chắc đáp ứng các nhu cầu phục vụ chiến tranh','',N'Nội dung 1 và 3 đúng',N'Nội dung 3 và 4 đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 1 và 3 đúng',N'Nội dung 1 và 4 đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung xây dựng tiềm lực kinh tế của nền quốc phòng, an ninh là:
1/  Đẩy mạnh công nghiệp hóa, hiện đại hóa đất nước, xây dựng nền kinh tế độc lập, tự chủ
2/  Xây dựng các quân binh chủng tác chiến trên mọi chiến trường cả thời bình và thời chiến
3/  Phát triển công nghiệp quốc phòng, trang bị kỹ thuật hiện đại cho quân đội và công an
4/  Kết hợp xây dựng cơ sở hạ tầng kinh tế với cơ sở hạ tầng quốc phòng','',N'Nội dung 1, 3 và 4 đúng',N'Nội dung 1, 3 và 4 đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 1, 2 và 4 đúng',N'Tất cả 1, 2, 3 và 4 đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ phù hợp nhất cho khái niệm tiềm lực quân sự, an ninh: “tiềm lực quân sự, an ninh nhân dân là khả năng . . .có thể huy động tạo thành sức mạnh phục vụ cho nhiệm vụ quân sự, an ninh, cho chiến tranh”','',N'về vật chất và tinh thần',N'nguồn tài nguyên tái tạo',N'về vật chất và tinh thần',N'quản lý điều hành chiến tranh',N'nhân lực, vật lực , tài lực',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung biểu hiện của tiềm lực quân sự, an ninh là:
            1/  Khả năng duy trì và không ngừng phát triển trình độ công nghiệp hóa, hiện đại hóa đất nước, xây dựng nền kinh tế độc lập, tự chủ
            2/  Nguồn dự trữ sức người, sức của trên các lĩnh vực đời sống xã hội và nhân dân có thể huy động để phục vụ cho nhiệm vụ quân sự, an ninh, cho chiến tranh
            3/  Khả năng phát triển trình độ quân sự trên bộ, trên không, trên biển
            4/  Khả năng duy trì và không ngừng phát triển trình độ sẵn sàng chiến đấu, năng lực và sức mạnh chiến đấu của các lực lượng vũ trang nhân dân','',N'Nội dung 2 và 4 đúng',N'Nội dung 1 và 4 đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 2 và 4 đúng',N'Tất cả 1, 2, 3 và 4 đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiềm lực quân sự, an ninh được xây dựng trên một số nền tảng nào?
            1/  Tiềm lực kinh tế của nền quốc phòng, an ninh 
            2/  Trình độ công nghiệp hóa, hiện đại hóa đất nước, xây dựng nền kinh tế độc lập, tự chủ
            3/  Khả năng phát triển trình độ quân sự trên bộ, trên không, trên biển
            4/  Tiềm lực khoa học công nghệ','',N'Nội dung 1 và 4 đúng',N'Nội dung 1 và 4 đúng',N'Nội dung 2, 3 và 4 đúng',N'Nội dung 2 và 4 đúng',N'Tất cả 1, 2, 3 và 4 đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ phù hợp nhất cho khái niệm thế trận quốc phòng toàn dân, an ninh nhân dân: “ thế trận quốc phòng, an ninh là . . .theo yêu cầu của quốc phòng, an ninh, bảo vệ tổ quốc VNXHCN”','',N'sự tổ chức, bố trí lực lượng, tiềm lực mọi mặt của đất nước và của toàn dân trên toàn bộ lãnh thổ , theo yêu cầu của quốc phòng , an ninh,bảo vệ Tổ quốc Việt Nam XHCN',N'khả năng huy động nguồn tài nguyên thiên nhiên phục vụ cho công tác quốc phòng, an ninh, bảo vệ Tổ quốc Việt Nam XHCN',N'sự tổ chức, bố trí lực lượng, tiềm lực mọi mặt của đất nước và của toàn dân trên toàn bộ lãnh thổ , theo yêu cầu của quốc phòng , an ninh,bảo vệ Tổ quốc Việt Nam XHCN',N'khả năng quản lý điều hành công tác quốc phòng, an ninh trên toàn bộ lãnh thổ,bảo vệ Tổ quốc Việt Nam XHCN',N'khả năng tổ chức, huy động nguồn nhân lực, vật lực, tài lực cho đất nước để bảo đảm công tác quốc phòng , an ninh',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung xây dựng thế trận quốc phòng toàn dân, an ninh nhân dân gồm: 
            1/  Xây dựng khu vực phòng thủ tỉnh (thành phố)
            2/  Tổ chức, bố trí lực lượng toàn dân trên toàn bộ lãnh thổ
            3/  Phân vùng chiến lược quốc phòng, an ninh kết hợp với vùng kinh tế
            4/  Xây dựng khối đại đoàn kết quân dân để bảo đảm công tác quốc phòng, an ninh','',N'Nội dung 1 và 3 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 1 và 3 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung xây dựng thế trận quốc phòng toàn dân, an ninh nhân dân gồm: 
            1/   Xây dựng khu vực phòng thủ tỉnh (thành phố)
            2/  Xây dựng hậu phương tạo chỗ dựa vững chắc cho thế trận quốc phòng, an ninh
            3/  Phân vùng chiến lược quốc phòng, an ninh kết hợp với vùng kinh tế
            4/  Xây dựng khối đại đoàn kết quân dân để bảo đảm công tác quốc phòng, an ninh','',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Tất cả nội dung 1,2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số biện pháp xây dựng nền quốc phòng toàn dân, an ninh nhân dân hiện nay gồm: 
            1/   Nâng cao ý thức, trách nhiệm công dân cho sinh viên trong xây dựng nền quốc phòng toàn dân, an ninh nhân dân.
            2/  Xây dựng hậu phương tạo chỗ dựa vững chắc cho thế quốc phòng toàn dân, an ninh nhân dân.
            3/  Thường xuyên thực hiện giáo dục quốc phòng an ninh.
            4/  Tăng cường sự lãnh đạo của Đảng, sự quản lý của nhà nước, trách nhiệm triển khai thực hiện của các cơ quan, tổ chức và nhân dân đối với nền quốc phòng toàn dân, an ninh nhân dâ','',N'Nội dung 1, 3 và 4  đúng',N'Nội dung 1, 2 và 3 đúng',N'Nội dung 2, 3 và 4 đúng',N'Tất cả nội dung 1,2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4  đúng',2,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm cơ bản xây dựng nền quốc phòng toàn dân là :','',N'Xây dựng Chủ nghĩa xã hội phải kết hợp chặt chẽ với nhiệm vụ bảo vệ Tổ quốc Xã hội chủ nghĩa',N'Kết hợp chặt chẽ phát triển kinh tế xã hội với xây dựng quốc phòng an ninh, bảo vệ Tổ quốc',N'Xây dựng Chủ nghĩa xã hội phải kết hợp chặt chẽ với nhiệm vụ bảo vệ Tổ quốc Xã hội chủ nghĩa',N'Kết hợp xây dựng kinh tế với quốc phòng , an ninh',N'Bảo vệ Tổ quốc là nhiệm vụ hàng đầu của toàn dân tộc',3,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung xây dựng tiềm lực quốc phòng,an ninh ngày càng vững mạnh tập trung vào mấy nội dung?','',N'Tập trung vào 4 nội dung',N'Tập trung vào 3 nội dung',N'Tập trung vào 4 nội dung',N'Tập trung vào 5 nội dung',N'Tâp trung vào 6 nội dung',3,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy cho biết đâu là biện pháp  để xây dựng nề quốc phòng toàn dân, an ninh nhân dân  hiện nay:','',N'Tất cả các phương án đều đúng',N'Thường xuyên thực hiện công tác giáo dục quốc phòng, an ninh',N'Tăng cường sự lãnh đạo của Đảng, sự quản lý của nhà nước, trách nhiệm triển khai thực hiện của các cơ quan tổ chức và nhân dân đối với xây dựng nền quốc phòng toàn dân, an ninh nhân dân',N'Nâng cao ý thức, trách nhiệm công dân cho sinh viên trong xây dựng nền quốc phòng toàn dân, an ninh nhân dân',N'Tất cả các phương án đều đúng',3,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Bổ sung cụm từ đúng nhất vào câu sau: Xây dựng lực lượng quốc phòng, an ninh là xây dựng . . .đáp ứng yêu cầu của quốc phòng , an ninh, bảo vệ Tổ quốc Việt Nam xã hội chủ nghĩa','',N'lực lượng chính trị và lực lượng vũ trang nhân dân',N'lực lượng chính trị',N'lực lượng chính trị và lực lượng vũ trang nhân dân',N'lực lượng vũ trang nhân dân',N'lực lượng vũ trang gồm ba thứ quân',3,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khái niệm về chiến tranh nhân dân bảo vệ Tổ quốc là gì?','',N'Là quá trình sử dụng tiềm lực của đất nước, nhất là tiềm lực quốc phòng an ninh, nhằm đánh bại ý đồ xâm lược lật đổ của kẻ thù đối với cách mạng nước ta',N'Là quá trình sử dụng tiềm lực của đất nước để xây dựng và đi lên CNXH',N'Là quá trình sử dụng tiềm lực quốc phòng an ninh để xây dựng đất nước, đẩy mạnh công nghiệp hoá, hiện đại hoá',N'Là quá trình sử dụng tiềm lực quốc phòng an ninh để ứng phó với mọi tình huống chiến tranh',N'Là quá trình sử dụng tiềm lực của đất nước, nhất là tiềm lực quốc phòng an ninh, nhằm đánh bại ý đồ xâm lược lật đổ của kẻ thù đối với cách mạng nước ta',3,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung về mục đích của chiến tranh nhân dân bảo vệ Tổ quốc là :  
1/  Bảo vệ vững chắc độc lập, chủ quyền, thống nhất, toàn vẹn lãnh thổ, bảo vệ an ninh quốc gia, trật tự an toàn xã hội
2/  Bảo vệ sự nghiệp đổi mới, công nghiệp hóa, hiện đại hóa đất nước
3/  Bảo vệ giai cấp, chế độ và biên giới, hải đảo, vùng trời, vùng biển
4/  Bảo vệ Đảng, Nhà nước, nhân dân và chế độ XHCN','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1,2,3  và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',3,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung về mục đích của chiến tranh nhân dân bảo vệ Tổ quốc là:
            1/  Giữ vững ổn định chính trị và môi trường hòa bình, phát triển đất nước theo định hướng xã hội chủ nghĩa
            2/  Bảo vệ sự an ninh chính trị, trật tự an toàn xã hội và nền văn hóa
            3/  Bảo vệ Giai cấp, chế độ và biên giới, hải đảo, vùng trời, vùng biển
            4/  Bảo vệ lợi ích quốc gia, dân tộc','',N'Nội dung 1,2 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1,2,3  và 4 đều đúng',N'Nội dung 1,2 và 4 đều đúng',3,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối tượng tác chiến của chiến tranh nhân dân bảo vệ Tổ quốc là gì?
            1/  Chủ nghĩa đế quốc
            2/  Các thế lực phản động có hành động phá hoại, xâm lược lật đổ cách mạng
            3/  Chủ nghĩa khủng bố và ly khai cực đoan
            4/  Chủ nghĩa dân tộc hẹp hòi và chủ nghĩa nước lớn','',N'Nội dung 1 và 2 đều đúng',N'Nội dung 1 và 2 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 3 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',3,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:','',N'Tiến hành chiến tranh nhân dân, toàn dân đánh giặc lấy lực lượng vũ trang nhân dân làm nòng cốt. Kết hợp tác chiến của lực lượng vũ trang địa phương với tác chiến của các binh đoàn chủ lực',N'Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài',N'Tiến hành chiến tranh nhân dân, toàn dân đánh giặc lấy lực lượng vũ trang nhân dân làm nòng cốt. Kết hợp tác chiến của lực lượng vũ trang địa phương với tác chiến của các binh đoàn chủ lực',N'Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài',N'Đưa đất nước lên thế phòng ngự chiến tranh, tạo thuận lợi đánh địch ngay từ đầu và lâu dài',3,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:','',N'Chuẩn bị trên cả nước cũng như từng khu vực để đủ sức đánh được lâu dài, ra sức thu hẹp không gian, rút ngắn thời gian của chiến tranh giành thắng lợi càng sớm càng tốt',N'Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài',N'Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài',N'Đưa đất nước lên thế phòng ngự chiến tranh, tạo thuận lợi đánh địch ngay từ đầu và lâu dài',N'Chuẩn bị trên cả nước cũng như từng khu vực để đủ sức đánh được lâu dài, ra sức thu hẹp không gian, rút ngắn thời gian của chiến tranh giành thắng lợi càng sớm càng tốt',3,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:','',N'Kết hợp đấu tranh quân sự với bảo đảm an ninh chính trị, giữ gìn an ninh trật tự an toàn xã hội, trấn áp kịp thời mọi âm mưu và hành động phá hoại gây bạo loạn',N'Kết hợp đấu tranh quân sự với bảo đảm an ninh chính trị, giữ gìn an ninh trật tự an toàn xã hội, trấn áp kịp thời mọi âm mưu và hành động phá hoại gây bạo loạn',N'Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài',N'Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài',N'Đưa đất nước lên thế phòng ngự chiến tranh, tạo thuận lợi đánh địch ngay từ đầu và lâu dài',3,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:','',N'Kết hợp sức mạnh dân tộc với sức mạnh thời đại, phát huy tinh thần tự lực tự cường, tranh thủ sự giúp đỡ của quốc tế, sự đồng tình ủng hộ của nhân dân tiến bộ trên thế giới',N'Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài',N'Kết hợp sức mạnh dân tộc với sức mạnh thời đại, phát huy tinh thần tự lực tự cường, tranh thủ sự giúp đỡ của quốc tế, sự đồng tình ủng hộ của nhân dân tiến bộ trên thế giới',N'Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài',N'Đưa đất nước lên thế phòng ngự chiến tranh, tạo thuận lợi đánh địch ngay từ đầu và lâu dài',3,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:
            1/  Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài
            2/  Kết hợp sức mạnh dân tộc với sức mạnh thời đại, phát huy tinh thần tự lực tự cường, tranh thủ sự giúp đỡ của quốc tế, sự đồng tình ủng hộ của nhân dân tiến bộ trên thế giới
            3/  Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài
            4/  Kết hợp đấu tranh quân sự với bảo đảm an ninh chính trị, giữ gìn an ninh trật tự an toàn xã hội, trấn áp kịp thời mọi âm mưu và hành động phá hoại gây bạo loạn','',N'Nội dung 2 và 4 đều đúng',N'Nội dung 1 và 2 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 3 đều đúng',N'Nội dung 2 và 4 đều đúng',4,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N' Một số quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốclà:
            1/  Quá trình xây dựng và đi lên CNXH phải chủ động đánh địch ngay từ đầu và lâu dài
            2/  Xây dựng thế trận quốc phòng, an ninh nhân dân ngày càng được củng cố vững chắc, có điều kiện phát huy sức mạnh tổng hợp chủ động đánh địch ngay từ đầu và lâu dài
            3/  Chuẩn bị trên cả nước cũng như từng khu vực để đủ sức đánh được lâu dài, ra sức thu hẹp không gian, rút ngắn thời gian của chiến tranh giành thắng lợi càng sớm càng tốt
            4/  Tiến hành chiến tranh toàn diện, kết hợp chặt chẽ giữa đấu tranh quân sự, chính trị, ngoại giao, kinh tế, văn hóa tư tưởng, lấy đấu tranh quân sự là chủ yếu, lấy thắng lợi trên chiến trường là yếu tố quyết định để giành thắng lợi trong chiến tranh','',N'Nội dung 3 và 4 đều đúng',N'Nội dung 1 và 2 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 3 đều đúng',N'Nội dung 2 và 4 đều đúng',4,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số quan điểm của Đảng về chiến tranh nhân dân bảo vệ Tổ quốc là:
            1/  Tiến hành chiến tranh nhân dân, toàn dân đánh giặc lấy lực lượng vũ trang nhân dân làm nòng cốt. Kết hợp tác chiến của lực lượng vũ trang địa phương với tác chiến của các binh đoàn chủ lực
            2/  Kết hợp sức mạnh dân tộc với sức mạnh thời đại, phát huy tinh thần tự lực tự cường, tranh thủ sự giúp đỡ của quốc tế, sự đồng tình ủng hộ của nhân dân tiến bộ trên thế giới
            3/  Chuẩn bị trên cả nước cũng như từng khu vực để đủ sức đánh được lâu dài, ra sức thu hẹp không gian, rút ngắn thời gian của chiến tranh giành thắng lợi càng sớm càng tốt
            4/  Tiến hành chiến tranh toàn diện, kết hợp chặt chẽ giữa đấu tranh quân sự, chính trị, ngoại giao, kinh tế, văn hóa tư tưởng, lấy đấu tranh quân sự là chủ yếu, lấy thắng lợi trên chiến trường là yếu tố quyết định để giành thắng lợi trong chiến tran','',N'Nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 2, 3  và 4 đều đúng',N'Nội dung 1, 2, 3 và 4 đều đúng',4,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung chủ yếu của chiến tranh nhân dân bảo vệ Tổ quốc là:
            1/  Tổ chức thế trận chiến tranh nhân dân
            2/  Tổ chức lực lượng chiến tranh nhân dân
            3/  Phối hợp chặt chẽ chống quân địch tấn công từ bên ngoài vào và bạo loạn lật đổ từ bên trong
            4/  Xây dựng thế trận quốc phòng, an ninh vững chắc, phát huy sức mạnh tổng hợp, chủ động đánh địch ngay từ đầu','',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 2, 3  và 4 đều đúng',N'Nội dung 1, 2, 3 và 4 đều đúng',4,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung chủ yếu của chiến tranh nhân dân bảo vệ Tổ quốc là:
            1/  Phối hợp chặt chẽ chống quân địch tấn công từ bên ngoài vào và bạo loạn lật đổ từ bên trong
            2/  Tổ chức lực lượng chiến tranh nhân dân
            3/  Xây dựng thế trận quốc phòng, an ninh vững chắc, phát huy sức mạnh tổng hợp, chủ động đánh địch ngay từ đầu
            4/  Tổ chức thế trận chiến tranh nhân dân','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 2, 3  và 4 đều đúng',N'Nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',4,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đối tượng tác chiến của chiến tranh nhân dân bảo vệ Tổ quốc là :','',N'Chủ nghĩa Đế quốc và các thế lực phản động có hành động phá hoại, xâm lược , lật đổ cách mạng',N'Chủ nghĩa Đế quốc mà đứng đầu là Đế quốc Mỹ',N'Chủ nghĩa Đế quốc và các thế lực phản động có hành động phá hoại, xâm lược , lật đổ cách mạng',N'Các thế lực phản động bên ngoài và bên trong quốc gia',N'Chủ nghĩa Đế quốc và thực dân phản động, muốn biến nước ta thành thuộc địa của chúng',4,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Âm mưu thủ đoạn chủ yếu của kẻ thù khi tiến hành xâm lược nước ta là:','',N'Tất cả các câu đều đúng',N'Thực hiện đánh nhanh, thắng nhanh',N'Kết hợp tiến công quân sự từ bên ngoài với hoạt động lật đổ từ bên trong',N'Sử dụng các biện pháp phi vũ trang',N'Tất cả các câu đều đúng',4,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm chiến tranh nhân dân bảo vệ Tổ quốc có mấy nội dung:','',N'Có 4 nội dung',N'Có 3 nội dung',N'Có 4 nội dung',N'Có 5 nội dung',N'Có 6 nội dung',4,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những tính chất của chiến tranh nhân dân bảo vệ Tổ quốc là :','',N'Chiến tranh chính nghĩa, tự vệ cách mạng',N'Chiến tranh chống lại kẻ thù xâm lược bảo vệ Tổ quốc',N'Chiến tranh cách mạng giành độc lập',N'Chiến tranh chính nghĩa, tự vệ cách mạng',N'Cuộc chiến tranh bảo vệ xã hội Xã hội chủ nghĩa',4,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu chiến tranh xảy ra, ta đánh giá quân địch có điểm yếu nào là cơ bản?','',N'Phải đương đầu với dân tộc Việt Nam có truyền thống yêu nước , chống xâm lược,kiên cường bất khuất',N'Vấp phải ý chí kiên cường , chiến đấu vì độc lập tự do của dân tộc ta',N'Phải đương đầu với dân tộc Việt Nam có truyền thống yêu nước , chống xâm lược,kiên cường bất khuất',N'Phải đối phó với cách đánh năng động, sáng tạo của  quân đội ta',N'Phải đương đầu với một dân tộc có lòng yêu nước nồng nàn',4,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thế trận chiến tranh nhân dân là gì?','',N'Là sự tổ chức,bố trí lực lượng để tiến hành chiến tranh và hoạt động tác chiến',N'Là sự tổ chức,bố trí lực lượng để tiến hành chiến tranh và hoạt động tác chiến',N'Là tổ chức , bố trí lực lượng vũ trang',N'Là sự tổ chức bố trí lực lượng để phòng thủ đất nước',N'Là tổ chức , bố trí lực lượng vũ trang trong ý đồ chiến lược',4,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những mục đích của chiến tranh nhân dân bảo vệ Tổ quốc là :','',N'Bảo vệ vững chắc độc lập,chủ quyền,thống nhất và toàn vẹn lãnh thổ',N'Bảo vệ vững chắc độc lập chủ quyền, thống nhất  của Tổ quốc',N'Bảo vệ sự toàn vẹn của Tổ quốc',N'Bảo vệ vững chắc độc lập,chủ quyền,thống nhất và toàn vẹn lãnh thổ',N'Bảo vệ vững chắc độc lập chủ quyền của Tổ quốc',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc điểm của chiến tranh nhân dân bảo vệ Tổ quốc là :','',N'Hình thái đất nước được chuẩn bị sẵn sàng,thế trận quốc phòng an ninh ngày càng được củng cố vững chắc',N'Đất nước thống nhất , đi lên CNXH',N'An ninh quốc phòng được tăng cường, củng cố vững chắc',N'Hình thái đất nước được chuẩn bị sẵn sàng,thế trận quốc phòng an ninh ngày càng được củng cố vững chắc',N'Các tuyến phòng thủ chiến lược được củng cố vững chắc',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những tính chất của chiến tranh nhân dân bảo vệ Tổ quốc là gì?','',N'Là cuộc chiến tranh toàn dân, toàn diện , lực lượng vũ trang làm nòng cốt,dưới sự lãnh đạo của Đảng',N'Là cuộc chiến tranh toàn dân. Lực lượng vũ trang làm nòng cốt',N'Là cuộc chiến tranh toàn dân, toàn diện , lực lượng vũ trang làm nòng cốt,dưới sự lãnh đạo của Đảng',N'Là cuộc đấu tranh của nhân dân mà quân sự đóng vai trò quyết định',N'Là cuộc chiến tranh cách mạng chống lại các thế lực phản cách mạng',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiến hành chiến tranh nhân dân bảo vệ Tổ quốc, cần quán triệt mấy quan điểm chỉ đạo?','',N'6 quan điểm chỉ đạo',N'6 quan điểm chỉ đạo',N'5 quan điểm chỉ đạo',N'4  quan điểm chỉ đạo',N'3  quan điểm chỉ đạo',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu chiến tranh xảy ra, cùng với bọn Đế quốc, lực lượng nào là đối tượng tác chiến của quân dân ta?','',N'Lực lượng phản động gây bạo loạn , lật đổ, gây xung đột vũ trang, chiến tranh xâm lược',N'Lực lượng khủng bố và xâm lược',N'Lực lượng phản động gây bạo loạn , lật đổ, gây xung đột vũ trang, chiến tranh xâm lược',N'Lực lượng phản động  bạo loạn , lật đổ và  các thế lực sử dụng sức mạnh quân sự xâm lược nước ta',N'Lực lượng phản động tiến hành  bạo loạn , lật đổ phá hoại thành quả cách mạng của nhân dân ta',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nếu chiến tranh xảy ra, ta đánh giá địch có điểm yếu cơ bản nào?','',N'Là cuộc chiến tranh phi nghĩa, chắc chắn bị nhân loại phản đối',N'Là cuộc chiến tranh hiếu chiến , tàn ác , sẽ bị nhân loại phản đối',N'Là cuộc chiến tranh xâm lược , sẽ bị thế giới lên án',N'Là cuộc chiến tranh phi nghĩa, chắc chắn bị nhân loại phản đối',N'Là cuộc chiến tranh phi nhân đạo , sẽ bị nhân dân thế giới lên án',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiến hành chiến tranh xâm lược , địch sẽ có điểm mạnh nào sau đây:
            1/  Có ưu thế tuyệt đối về sức mạnh quân sự , kinh tế và tiềm lực khoa học công nghệ
            2/  Có khả năng về vũ khí công nghệ cao
            3/  Có thể câu kết với lực lượng phản động nội địa , thực hiện trong đánh ra, Ngoài đánh vào
            4/  Có sự hậu thuẫn của quân đồng minh hùng mạnh','',N'Nội dung 1 và 3 đúng',N'Nội dung 1, 2 và 3 đúng',N'Nội dung 1 và 3 đúng',N'Nội dung  1, 3 và 4 đúng',N'Nội dung  1 và 2 đúng',5,N'Đã duyệt','MC001','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung chủ yếu của chiến tranh nhân dân bảo vệ Tổ quốc là :','',N'Tổ chức thế trận chiến tranh nhân dân',N'Tổ chức thế trận toàn dân đánh giặc',N'Tổ chức thế trận chiến tranh nhân dân',N'Tổ chức bố trí cách đánh giặc',N'Tổ chức thế trận phòng thủ của chiến tranh nhân dân',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính chất của chiến tranh nhân dân Việt Nam bảo vệ Tổ quốc là:','',N'Tất cả các phương án đều đúng',N'Là cuộc chiến tranh  nhân dân toàn dân toàn diện',N'Là cuộc chiến tranh chính nghĩa , tự vệ cách mạng',N'Là cuộc chiến tranh mang tính hiện đại',N'Tất cả các phương án đều đúng',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn một phương án để điền vào chỗ trống trong khái niệm sau: “Chiến tranh nhân dân Việt Nam là quá trình . . ., nhằm đánh bại ý đồ xâm lược lật đổ của kẻ thù đối với cách mạng nước ta.”','',N'sử dụng tiềm lực của đất nước , nhất là tiềm lực quốc phòng  an ninh',N'sử dụng sức mạnh quân sự được huy động trên cả nước',N'sử dụng tiềm lực của đất nước , nhất là tiềm lực quốc phòng  an ninh',N'huy động  lực lượng vũ trang toàn dân',N'huy động  lực lượng vũ trang kết hợp với toàn dân',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chọn cụm từ đúng nhất tương ứng vị trí (1) và (2) để làm rõ khái niệm sau: “Lực lượng vũ trang nhân dân là . . .(1) . . .và . . .(2) . . .do Đảng cộng sản VN lãnh đạo, Nhà nước CHXHCNVN quản lý “.','',N'tiềm lực quốc phòng (1); thế trận quốc phòng (2)',N'các tổ chức vũ trang (1); bán vũ trang (2)',N'các lực lượng vũ trang (1); bán vũ trang (2)',N'tiềm lực vũ trang (1); tiềm lực bán vũ trang (2)',N'tiềm lực quốc phòng (1); thế trận quốc phòng (2)',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nhiệm vụ chủ yếu của Lực lượng vũ trang nhân dân là:','',N'Bảo vệ an ninh quốc gia, trật tự an toàn xã hội, bảo vệ nhân dân, bảo vệ chế độ XHCN và những thành quả cách mạng',N'Bảo vệ an ninh quốc gia, trật tự an toàn xã hội, bảo vệ nhân dân, bảo vệ chế độ XHCN và những thành quả cách mạng',N'Xây dựng tiềm lực quốc phòng và thế trận quốc phòng vững chắc',N'Tổ chức lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân',N'Tổ chức lực lượng quần chúng rộng rãi xây dựng nền quốc phòng toàn dân, an ninh nhân dân',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nhiệm vụ chủ yếu của lực lượng vũ trang nhân dân là:
            1/  Bảo vệ an ninh quốc gia, trật tự an toàn xã hội, bảo vệ nhân dân, bảo vệ chế độ XHCN và những thành quả cách mạng
            2/  Chiến đấu giành và giữ độc lập, chủ quyền thống nhất và toàn vẹn lãnh thổ của Tổ quốc
            3/  Tổ chức lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân
            4/  Cùng toàn dân xây dựng đất nước','',N'Nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1 và 4 đều đúng',N'Nội dung 2 và 4 đều đúng',N'Nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc điểm liên quan đến xây dựng lực lượng vũ trang nhân dân là:','',N'Xây dựng dựng lực lượng vũ trang nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Bảo vệ chế độ XHCN và những thành quả cách mạng trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng dựng lực lượng vũ trang nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng đất nước và xây dựng nền quốc phòng toàn dân trong điều kiện quốc tế đã thay đổi',5,N'Đã duyệt','MC002','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc điểm liên quan đến xây dựng lực lượng vũ trang nhân dân là:','',N'Sự nghiệp đổi mới ở nước ta đã đạt được nhiều thành tựu to lớn, đất nước đang bước sang thời kỳ công nghiệp hóa - hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn',N'Sự nghiệp đổi mới ở nước ta đã đạt được nhiều thành tựu to lớn, đất nước đang bước sang thời kỳ công nghiệp hóa - hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn',N'Bảo vệ chế độ XHCN và những thành quả cách mạng trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng đất nước và xây dựng nền quốc phòng toàn dân trong điều kiện quốc tế đã thay đổi',5,N'Đã duyệt','MC003','NHCH003')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N' Một trong những đặc điểm liên quan đến xây dựng lực lượng vũ trang nhân dân là:
            1/  Sự nghiệp đổi mới ở nước ta đã đạt được nhiều thành tựu to lớn, đất nước đang bước sang thời kỳ công nghiệp hóa - hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn
            2/  Bảo vệ chế độ XHCN và những thành quả cách mạng trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp
            3/  Xây dựng lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp
            4/  Cả nước đang thực hiện hai nhiệm vụ chiến lược xây dựng và bảo vệ Tổ quốc XHCN, trong khi chủ nghĩa đế quốc và các thế lực thù địch chống phá ta quyết liệt','',N'Nội dung 1 và 4 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 3 đều đúng',N'Nội dung 2 và 4 đều đúng',N'Nội dung 1 và 4 đều đúng',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những đặc điểm liên quan đến xây dựng lực lượng vũ trang nhân dân là:
            1/  Xây dựng lực lượng chiến tranh nhân dân và thế trận chiến tranh nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp
            2/  Sự nghiệp đổi mới ở nước ta đã đạt được nhiều thành tựu to lớn, đất nước đang bước sang thời kỳ công nghiệp hóa - hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn
            3/  Cả nước đang thực hiện hai nhiệm vụ chiến lược xây dựng và bảo vệ Tổ quốc XHCN, trong khi chủ nghĩa đế quốc và các thế lực thù địch chống phá ta quyết liệt
            4/  Thực trạng lực lượng vũ trang nhân dân đã có những bước trưởng thành lớn mạnh về chính trị, chất lượng tổng hợp, trình độ chính quy, sức mạnh chiến dấu, song vẫn còn phải tháo gỡ một số vấn đề về chính trị, trình độ chính quy, trang bị còn lạc hậu, thiếu đồng bộ','',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1, 3  và 4 đều đúng',N'Nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm, nguyên tắc xây dựng lực lượng vũ trang nhân dân trong thời kỳ mới là:
1/  Bảo đảm cho lực lượng vũ trang nhân dân luôn trong tư thế sẵn sàng chiến đấu và chiến đấu thắng lợi
2/  Thực hiện xây dựng và bảo vệ Tổ quốc XHCN trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp
3/  Giữ vững và tăng cường sự lãnh đạo của Đảng CSVN đối với lực lượng vũ trang nhân dân
4/  Xây dựng lực lượng vũ trang nhân dân trong thời kỳ công nghiệp hóa –hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn','',N'Nội dung 1 và 3 đều đúng',N'Nội dung  2 và 3 đều đúng',N'Nội dung 2 và 4 đều đúng',N'Nội dung 1 và 3 đều đúng',N'Nội dung 1 và 4 đều đúng',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm, nguyên tắc xây dựng lực lượng vũ trang nhân dân trong thời kỳ mới là:
            1/ Bảo đảm cho lực lượng vũ trang nhân dân luôn trong tư thế sẵn sàng chiến đấu và chiến đấu thắng lợi
            2/ Tự lực tự cường xây dựng lực lượng vũ trang
            3/ Giữ vững và tăng cường sự lãnh đạo của Đảng CSVN đối với lực lượng vũ trang nhân dân
            4/  Xây dựng lực lượng vũ trang nhân dân trong thời kỳ công nghiệp hóa – hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn','',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Tất cả nội dung 1,2, 3 và 4 đều đúng',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những quan điểm, nguyên tắc xây dựng lực lượng vũ trang nhân dân trong thời kỳ mới là:','',N'Xây dựng lực lượng vũ trang nhân dân lấy chất lượng là chính, lấy xây dựng chính trị làm cơ sở',N'Xây dựng lực lượng vũ trang nhân dân lấy chất lượng là chính, lấy xây dựng chính trị làm cơ sở',N'Xây dựng lực lượng vũ trang nhân dân trong thời kỳ công nghiệp hóa - hiện đại hóa và hội nhập kinh tế thế giới toàn diện hơn',N'Xây dựng lực lượng vũ trang nhân dân có những bước trưởng thành lớn mạnh về chính trị, chất lượng tổng hợp, trình độ chính quy, sức mạnh chiến đấu',N'Xây dựng lực lượng vũ trang nhân dân trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những phương hướng xây dựng lực lượng vũ trang nhân dân trong giai đoạn mới là:','',N'Xây dựng quân đội nhân dân theo hướng cách mạng chính quy, tinh nhuệ, từng bước hiện đại',N'Xây dựng lực lượng vũ trang nhân dân theo hướng chính quy cách mạng',N'Xây dựng quân đội nhân dân theo hướng cách mạng chính quy, tinh nhuệ, từng bước hiện đại',N'Xây dựng lực lượng vũ trang nhân dân luôn trong tư thế sẳn sàng chiến đấu trong điều kiện quốc tế đã thay đổi, có nhiều diễn biến phức tạp',N'Xây dựng và bảo đảm cho lực lượng vũ trang nhân dân luôn trong tư thế sẳn sàng chiến đấu và chiến đấu thắng lợi',1,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những phương hướng xây dựng lực lượng vũ trang nhân dân trong giai đoạn mới là:
1/  Xây dựng lực lượng vũ trang nhân dân theo hướng chính quy cách mạng
2/  Xây dựng quân đội nhân dân theo hướng cách mạng chính quy, tinh nhuệ, từng bước hiện đại  
3/  Xây dựng lực lượng dự bị động viên
4/  Xây dựng và bảo đảm cho lực lượng vũ trang nhân dân luôn trong tư thế sẵn sàng chiến đấu và chiến đấu thắng lợi','',N'Nội dung 2 và 3 đều đúng',N'Nội dung 2 và 4 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 3 đều đúng',N'Nội dung 1 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những phương hướng xây dựng lực lượng vũ trang nhân dân trong giai đoạn mới là:
            1/  Xây dựng lực lượng vũ trang nhân dân theo hướng chính quy cách mạng
            2/  Xây dựng quân đội nhân dân theo hướng cách mạng chính quy, tinh nhuệ, từng bước hiện đại
            3/   Xây dựng lực lượng dự bị động viên
            4/  Xây dựng lực lượng dân quân tự vệ','',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội cách mạng là:
            1/  Xây dựng lực lượng vũ trang nhân dân rộng rãi và dân chủ
            2/  Xây dựng lực lượng dự bị động viên tốt
            3/  Có tinh thần đoàn kết quân dân, đoàn kết nội bộ, đoàn kết quốc tế tốt
            4/  Kỷ luật tự giác nghiêm minh, dân chủ rộng rãi','',N'Nội dung 3 và 4 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung  2 và 3 đều đúng',N'Nội dung 1 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội cách mạng là:
            1/  Có tinh thần đoàn kết quân dân, đoàn kết nội bộ, đoàn kết quốc tế tốt
            2/  Trước diễn biến tình hình phải phân biệt được đúng sai
            3/  Xây dựng lực lượng dự bị động viên tốt
            4/  Kỷ luật tự giác nghiêm minh, dân chủ rộng rãi','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội cách mạng là:
            1/  Xây dựng bản chất giai cấp công nhân cho quân đội, làm cho lực lượng này tuyệt đối trung thành với Đảng, với Tổ quốc, với nhân dân
            2/  Trước diễn biến tình hình phải phân biệt được đúng sai
            3/  Kiên định mục tiêu lý tưởng XHCN, vững vàng trước mọi khó khăn thử thách, hoàn thành tốt mọi nhiệm vụ được giao
            4/  Kỷ luật tự giác nghiêm minh, dân chủ rộng rãi','',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội chính quy là:
            1/  Thống nhất về xây dựng bản chất giai cấp cho quân đội
            2/  Thống nhất về bản chất cách mạng, mục tiêu chiến đấu, ý chí quyết tâm, nguyên tắc xây dựng quân đội, tổ chức biên chế trang bị
            3/  Thống nhất về quan điểm tư tưởng quân sự, nghệ thuật quân sự, phương pháp huấn luyện giáo dục
            4/  Thống nhất về xây dựng lực lượng dự bị động viên tốt','',N'Nội dung  2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  3 và 4 đều đúng',N'Nội dung  2 và 3 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội chính quy là:
            1/  Thống nhất về tổ chức thực hiện chức trách nề nếp chế độ chính quy, quản lý bộ đội,công an,về tổ chức biên chế trang bị
            2/  Thống nhất về bản chất cách mạng, mục tiêu chiến đấu, ý chí quyết tâm, nguyên tắc xây dựng quân đội, tổ chức biên chế trang bị
            3/  Thống nhất về quan điểm tư tưởng quân sự, nghệ thuật quân sự, phương pháp huấn luyện giáo dục
            4/  Thống nhất về xây dựng lực lượng dự bị động viên tốt','',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  3 và 4 đều đúng',N'Nội dung  1, 2 và 3 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội tinh nhuệ là:
            1/  Tinh nhuệ về tổ chức
			2/  Tinh nhuệ về chính trị
			3/  Tinh nhuệ về văn hóa, đời sống
			4/  Tinh nhuệ về kỹ chiến thuật','',N'Nội dung  1, 2 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung  1, 2 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng quân đội tinh nhuệ là:','',N'Tinh nhuệ về chính trị, tổ chức, kỹ chiến thuật',N'Tinh nhuệ về tổ chức, giáo dục và văn hóa',N'Tinh nhuệ về chính trị, tổ chức, kỹ chiến thuật',N'Tinh nhuệ về văn hóa, đời sống',N'Tinh nhuệ về kỹ luật, pháp luật, quy định pháp luật',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung xây dựng lực lượng dân quân tự vệ là:','',N'Xây dựng cả chất lượng và số lượng, lấy chất lượng lá chính, tổ chức biên chế phù hợp',N'Xây dựng cả chất lượng và số lượng, lấy chất lượng lá chính, tổ chức biên chế phù hợp',N'Xây dựng cả chất lượng và số lượng, cả chính quy và phi chính quy, cả chủ lực và địa phương',N'Xây dựng lực lượng dân quân tự vệ phù hợp và theo kịp với lực lượng vũ trang nhân dân theo hướng chính quy',N'Xây dựng lực lượng dân quân tự phù hợp với quân đội nhân dân theo hướng cách mạng chính quy, tinh nhuệ, từng bước hiện đại',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những biện pháp chủ yếu xây dựng lực lượng vũ trang nhân dân là:
            1/  Từng bước giải quyết các yêu cầu về vũ khí, trang bị kỹ thuật của lực lượng vũ trang nhân dân
            2/  Thực hiện nghiêm túc và đầy đủ các chính sách của Đảng, Nhà nước đối với lực lượng vũ trang nhân dân
            3/  Xây dựng đội ngũ cán bộ lực lượng vũ trang nhân dân có phẩm chất, có năng lực tốt
            4/  Xây dựng lực lượng vũ trang nhân dân theo kịp với lực lượng vũ trang nhân dân các nước trong khu vực','',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những biện pháp chủ yếu xây dựng lực lượng vũ trang nhân dân là:
            1/  Nâng cao chất lượng huấn luyện, giáo dục, xây dựng và phát triển khoa học quân sự Việt Nam
            2/  Xây dựng đội ngũ cán bộ lực lượng vũ trang nhân dân có phẩm chất, có năng lực tốt
            3/  Xây dựng lực lượng vũ trang nhân dân theo kịp với lực lượng vũ trang các nước trong khu vực
            4/  Từng bước giải quyết yêu cầu về vũ khí, trang bị kỹ thuật của các lực lượng vũ trang nhân dân','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',1,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những biện pháp chủ yếu xây dựng lực lượng vũ trang nhân dân là :','',N'Từng bước giải quyết yêu cầu về vũ khí, trang bị kỹ thuật của các lực lượng vũ trang nhân dân',N'Từng bước giải quyết các yêu cầu về cơ sở vật chất cho lực lượng vũ trang',N'Từng bước trang bị vũ khí hiện đại cho lực lượng vũ trang',N'Từng bước giải quyết yêu cầu về vũ khí, trang bị kỹ thuật của các lực lượng vũ trang nhân dân',N'Nhanh chóng trang bị vũ khí hiện đại cho lực lượng vũ trang đáp ứng yêu cầu của chiến tranh hiện đại',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương hướng xây dựng lực lượng vũ trang nhân dân trong giai đoạn mới gồm mấy nội dung:','',N'3 nội dung',N'2 nội dung',N'3 nội dung',N'4 nội dung',N'5 nội dung',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhiệm vụ của lực lượng vũ trang nhân dân Việt Nam là:','',N'Tất cả các phương án đều đúng',N'Chiến đấu giành và giữ độc lập, chủ quyền thống nhất và toàn vẹn lãnh thổ',N'Bảo vệ an ninh quốc gia, trật tự an toàn xã hội, bảo vệ nhân dân, bảo vệ chế độ xã hội chủ nghĩa và những thành quả cách mạng',N'Cùng toàn dân xây dựng đất nước',N'Tất cả các phương án đều đúng',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chọn cụm từ đúng nhất tương ứng vị trí (1) và (2) trong câu nói sau: “Quốc phòng là công việc giữ nước của một quốc gia, bao gồm tổng thể các hoạt động đối ngoại và đối nội trên tất cả các lĩnh vực: . . .(1). . .,nhằm mục đích bảo vệ vững chắc . . .(2) . . .,tạo môi trường thuận lợi để xây dựng đất nước','',N'Kinh tế, chính trị, quân sự, văn hóa, xã hội(1); độc lập chủ quyền và toàn vẹn lãnh thổ (2)',N'Chiến đấu và sẵn sàng chiến đấu, xây dựng đất nước (1); chủ quyền và toàn vẹn lãnh thổ (2)',N'Quốc phòng, an ninh (1); kinh tế - xã hội (2)',N'Xây dựng quốc phòng, an ninh (1); chủ quyền và toàn vẹn lãnh thổ (2)',N'Kinh tế, chính trị, quân sự, văn hóa, xã hội(1); độc lập chủ quyền và toàn vẹn lãnh thổ (2)',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chọn cụm từ đúng nhất tương ứng vị trí (1) và (2) trong câu nói sau: “Trong giai đoạn hiện nay, Đảng ta đã xác định  để thực hiện thắng lợi hai nhiệm vụ chiến lược của cách mạng VN, chúng ta phải:  . . .(1). . .với. . .(2) . . .trong một chỉnh thể thống nhất','',N'kết hợp phát triển kinh tế - xã hội (1); tăng cường củng cố quốc phòng , an ninh (2)',N'kết hợp chiến đấu và sẵn sàng chiến đấu, xây dựng đất nước (1); kết hợp phát triển kinh tế - xã hội (2)',N'kết hợp phát triển kinh tế - xã hội (1); xây dựng chủ quyền và toàn vẹn lãnh thổ (2)',N'kinh tế, chính trị, quân sự, văn hóa, xã hội(1); độc lập chủ quyền và toàn vẹn lãnh thổ (2)',N'kết hợp phát triển kinh tế - xã hội (1); tăng cường củng cố quốc phòng , an ninh (2)',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hãy chọn câu đúng nhất trong những phương án sau:','',N'Bản chất của chế độ kinh tế xã hội quyết định đến bản chất của quốc phòng an ninh',N'Bản chất của chế độ kinh tế xã hội quyết định đến bản chất của quốc phòng an ninh',N'Bản chất của nền quốc phòng an ninh quyết định bản chất của chế độ kinh tế xã hội',N'Bản chất của chế độ xã hội quyết định bản chất của nền kinh tế',N'Bản chất của nền độc lập chủ quyền và toàn vẹn lãnh thổ quyết định bản chất kinh tế, chính trị, quân sự, văn hóa, xã hội',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chính xác Ăng-ghen đã nói như thế nào?','',N'“Thắng lợi hay thất bại của chiến tranh đều phụ thuộc vào điều kiện kinh tế”',N'“Thắng lợi hay thất bại của chiến tranh đều phụ thuộc vào điều kiện kinh tế”',N'“Bản chất xã hội của chiến tranh quyết định bản chất xã hội của nền kinh tế”',N'“Thắng lợi hay thất bại của chiến tranh quyết định thắng lợi hay thất bại của nền kinh tế”',N'“Bản chất của chiến tranh quyết định bản chất kinh tế, chính trị, quân sự, văn hóa, xã hội',2,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan điểm “Trong xây dựng kinh tế, phải thấu suốt nhiệm vụ phục vụ quốc phòng, cũng như trong củng cố quốc phòng phải khéo sắp xếp cho ăn khớp với công cuộc xây dựng kinh tế” được Đảng ta đề ra trong :','',N'Đại hội Đảng lần thứ III',N'Đại hội Đảng lần thứ II',N'Đại hội Đảng lần thứ III',N'Đại hội Đảng lần thứ IV',N'Đại hội Đảng lần thứ V',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:','',N'Kết hợp trong xác định chiến lược phát triển kinh tế xã hội',N'Kết hợp trong xác định chiến lược phát triển kinh tế xã hội',N'Kết hợp trong xây dựng hậu phương với xây dựng thế trận quốc phòng, an ninh',N'Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế',N'Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:','',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng , an ninh trong phát triển các vùng lãnh thổ',N'Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng , an ninh trong phát triển các vùng lãnh thổ',N'Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Kết hợp trong xây dựng hậu phương với xây dựng thế trận quốc phòng, an ninh',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:','',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong các ngành, các lĩnh vực kinh tế chủ yếu',N'Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong các ngành, các lĩnh vực kinh tế chủ yếu',N'Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế',N'Kết hợp trong xây dựng hậu phương với xây dựng thế trận quốc phòng, an ninh',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:','',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong thực hiện nhiệm vụ chiến lược bảo vệ Tổ quốc',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong thực hiện nhiệm vụ chiến lược bảo vệ Tổ quốc',N'Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế',N'Kết hợp trong xây dựng hậu phương với xây dựng thế trận quốc phòng, an ninh',N'Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:','',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong hoạt động đối ngoại',N'Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong hoạt động đối ngoại',N'Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế',N'Kết hợp trong xây dựng hậu phương với xây dựng thế trận quốc phòng, an ninh',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:
            1/  Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh
            2/ Kết hợp trong phân vùng chiến lược với xây dựng các vùng kinh tế
            3/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong hoạt động đối ngoại
            4/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong thực hiện nhiệm vụ chiến lược bảo vệ Tổ quốc','',N'Nội dung 3 và 4 đều đúng',N'Nội dung 1 và 4 đều đúng',N'Nội dung  2 và 3 đều đúng',N'Nội dung 3 và 4 đều đúng',N'Nội dung 2 và 4 đều đúng',2,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:
            1/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong các ngành, các lĩnh vực kinh tế chủ yếu
            2/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong hoạt động đối ngoại
            3/  Kết hợp trong xác định chiến lược phát triển kinh tế xã hội
            4/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng ,an ninh trong phát triển các vùng lãnh thổ','',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Tất cả nội dung 1, 2, 3 và 4 đều đúng',2,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh và đối ngoại ở nước ta hiện nay là:
            1/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong các ngành, các lĩnh vực kinh tế chủ yếu
            2/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng ,an ninh trong phát triển các vùng lãnh thổ
            3/  Kết hợp phát triển kinh tế - xã hội với tăng cường củng cố quốc phòng, an ninh trong hoạt động đối ngoại
            4/  Kết hợp trong xây dựng các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh','',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',2,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh trong phát triển các vùng lãnh thổ diễn ra trên các khu vực nào?
            1/  Các ngành, các lĩnh vực kinh tế chủ yếu
            2/  Các vùng kinh tế trọng điểm
            3/  Các vùng núi, biên giới
            4/  Các vùng biển đảo','',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',2,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh trong trong các ngành, các lĩnh vực kinh tế chủ yếu diễn ra trên các lĩnh vực nào?
            1/  Công nghiệp
            2/  Các ngành nông, lâm, ngư nghiệp
            3/  Các ngành khoa học - công nghệ, giáo dục và xây dựng cơ bản
            4/  Các ngành giao thông vận tải, bưu điện, y tế','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung  1, 2 và 3 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',2,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng, an ninh ở nước ta hiện nay là:','',N'Củng cố kiện toàn và phát huy vai trò tham mưu của các cơ quan chuyên trách quốc phòng, an ninh các cấp',N'Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Phát huy sức mạnh chiến lược với kết hợp xây dựng các vùng kinh tế',N'Tăng cường củng cố quốc phòng, an ninh trong các cơ quan quyền lực chủ yếu của nhà nước',N'Củng cố kiện toàn và phát huy vai trò tham mưu của các cơ quan chuyên trách quốc phòng, an ninh các cấp',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay là:','',N'Hoàn chỉnh hệ thống pháp luật, cơ chế chính sách có liên quan đến thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh trong tình hình mới',N'Tăng cường củng cố quốc phòng, an ninh trong các cơ quan quyền lực chủ yếu của nhà nước',N'Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Hoàn chỉnh hệ thống pháp luật, cơ chế chính sách có liên quan đến thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh trong tình hình mới',N'Phát huy sức mạnh chiến lược với kết hợp xây dựng các vùng kinh tế',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay là:','',N'Xây dựng chiến lược tổng thể kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh trong thời kỳ mới',N'Phát huy sức mạnh chiến lược với kết hợp xây dựng các vùng kinh tế',N'Xây dựng chiến lược tổng thể kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh trong thời kỳ mới',N'Tăng cường củng cố quốc phòng, an ninh trong các cơ quan quyền lực chủ yếu của nhà nước',N'Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay là:','',N'Bồi dưỡng nâng cao kiến thức, kinh nghiệm kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh cho các đối tượng',N'Phát huy sức mạnh chiến lược với kết hợp xây dựng các vùng kinh tế',N'Tăng cường củng cố quốc phòng, an ninh trong các cơ quan quyền lực chủ yếu của nhà nước',N'Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',N'Bồi dưỡng nâng cao kiến thức, kinh nghiệm kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh cho các đối tượng',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay là:','',N'Tăng cường sự lãnh đạo của Đảng và hiệu lực quản lý Nhà nước của chính quyền các cấp trong thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh',N'Phát huy sức mạnh chiến lược với kết hợp xây dựng các vùng kinh tế',N'Tăng cường sự lãnh đạo của Đảng và hiệu lực quản lý Nhà nước của chính quyền các cấp trong thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh',N'Tăng cường củng cố quốc phòng, an ninh trong các cơ quan quyền lực chủ yếu của nhà nước',N'Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quán triệt việc kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng,  an ninh ở nước ta hiện nay tập trung vào mấy nội dung chính?','',N'Tập trung vào 4 nội dung',N'Tập trung vào 3 nội dung',N'Tập trung vào 4 nội dung',N'Tập trung vào 5 nội dung',N'Tập trung vào 6 nội dung',3,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số giải pháp chủ yếu thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay là:
            1/  Xây dựng chiến lược tổng thể kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh trong thời kỳ mới
            2/  Bồi dưỡng nâng cao kiến thức, kinh nghiệm kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh cho các đối tượng
            3/  Củng cố kiện toàn các vùng kinh tế với xây dựng thế trận quốc phòng, an ninh
            4/  Tăng cường sự lãnh đạo của Đảng và hiệu lực quản lý Nhà nước của chính quyền các cấp trong thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng , an ninh ','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung  2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Để thực hiện kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng - an ninh ở nước ta hiện nay có bao nhiêu giải pháp chủ yếu?','',N'Có 5 giải pháp',N'Có 3 giải pháp',N'Có 4 giải pháp',N'Có 5 giải pháp',N'Có 6 giải pháp',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc kết hợp phát triển kinh tế xã hội với tăng cường củng cố quốc phòng,  an ninh ở nước ta hiện nay nhằm mục đích gì?','',N'Thực hiện tốt hai nhiệm vụ chiến lược xây dựng CNXH và bảo vệ vững chắc Tổ quốc Việt Nam XHCN',N'Thực hiện mục tiêu dân giàu nước mạnh',N'Làm cho kinh tế phát triển, quốc phòng vững mạnh',N'Thực hiện tốt hai nhiệm vụ chiến lược xây dựng CNXH và bảo vệ vững chắc Tổ quốc Việt Nam XHCN',N'Tăng cường nền quốc phòng toàn dân , bảo vệ Tổ quốc trong giai đoạn mới',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hiện nay nước ta chia thành mấy vùng kinh tế trọng điểm?','',N'Có 3 vùng kinh tế trọng điểm',N'Có 2 vùng kinh tế trọng điểm',N'Có 3 vùng kinh tế trọng điểm',N'Có 4 vùng kinh tế trọng điểm',N'Có 5 vùng kinh tế trọng điểm',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Kết hợp gắn việc động viên đưa dân ra lập nghiệp ở các đảo để xây dựng các làng xã, huyện đảo vững mạnh với chú trọng đầu tư xây dựng phát triển các hợp tác xã, đội tàu thuyền đánh cá xa bờ, xây dựng lực lượng tự vệ, dân quân biển đảo…” là nội dung kết hợp kinh tế -xã hội với tăng cường củng cố quốc phòng , an ninh trong các ngành, lĩnh vực kinh tế nào ?','',N'Trong nông , lâm , ngư nghiệp',N'Trong xây dựng cơ bản',N'Trong công nghiệp',N'Trong nông , lâm , ngư nghiệp',N'Trong giao thông, vận tải',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Khi xây dựng bất cứ công trình nào, ở đâu,quy mô nào cũng phải tính đến yếu tố tự bảo vệ và có thể chuyển hóa phục vụ được cả cho quốc phòng, an ninh, cho phòng thủ tác chiến và phòng thủ dân sự .”là nội dung kết hợp kinh tế -xã hội với tăng cường củng cố quốc phòng , an ninh trong các ngành, lĩnh vực kinh tế nào ?','',N'Trong xây dựng cơ bản',N'Trong  phát triên công nghiệp',N'Trong giao thông, vận tải',N'Trong xây dựng cơ bản',N'Trong khoa học công nghệ',3,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cuộc kháng chiến chống thực dân Pháp xâm lược(1945-1954), thực hiện việc kết hợp phát triển kinh tế với tăng cường củng cố quốc phòng , an ninh, Đảng ta đã đề ra chủ trương nào sau đây:','',N'Tất cả phương án đều đúng',N'Vừa kháng chiến , vừa kiến quốc; vừa chiến đấu , vừa tăng gia sản xuất , thực hành tiết kiệm',N' Vừa thực hiện phát triển kinh tế ở địa phương, vừa tiến hành chiến tranh rộng khắp',N'Xây dựng làng kháng chiến',N'Tất cả phương án đều đúng',3,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cuộc kháng chiến chống Mỹ, cứu nước(1954-1975), kết hợp phát triển kinh tế với tăng cường củng cố quốc phòng an ninh đã được Đảng ta chỉ đạo như thế nào?','',N'Thực hiện ở hai miền Nam , Bắc , ở mỗi miền với nội dung và hình thức thích hợp để tạo sức mạnh tổng hợp',N'Kết hợp tăng gia sản xuất, thực hành tiết kiệm để củng cố cho quốc phòng',N'Xây dựng, phát triển xã hội mới , nền kinh tế mới, văn hóa mới, đồng thời chăm lo củng cố quốc phòng',N'Thực hiện ở hai miền Nam , Bắc , ở mỗi miền với nội dung và hình thức thích hợp để tạo sức mạnh tổng hợp',N'Triển khai trên qui mô rộng lớn',3,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc kháng chiến chống quân Tống lần thứ nhất do ai lãnh đạo và vào năm nào?','',N'Lê Hoàn, năm 981',N'Đinh Tiên Hoàng, năm 981',N'Ngô Quyền, năm 981',N'Lê Hoàn, năm 981',N'Lý Thường Kiệt, năm 938',4,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc kháng chiến chống quân Tống lần thứ 2 do ai lãnh đạo và vào giai đoạn nào?','',N'Lý Thường Kiệt, giai đoạn 1075 - 1077',N'Đinh Tiên Hoàng, giai đoạn 981 – 1012',N'Ngô Quyền, giai đoạn 938 - 981',N'Lê Hoàn, giai đoạn 981 - 1012',N'Lý Thường Kiệt, giai đoạn 1075 - 1077',4,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc kháng chiến chống quân Nguyên lần thứ nhất vào năm nào và Nhà Trần đã đánh bại bao nhiêu vạn quân Nguyên?','',N'Năm 1258; 3 vạn',N'Năm 1258; 3 vạn',N'Năm 1225; 30 vạn',N'Năm 1285;50 vạn',N'Năm 1252; 60 vạn',4,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc kháng chiến chống quân Nguyên lần thứ 2 vào năm nào và Nhà Trần đã đánh bại bao nhiêu vạn quân Nguyên?','',N'Năm 1285 ;60 vạn',N'Năm 1225; 3 vạn',N'Năm 1285 ;30 vạn',N'Năm 1285 ;60 vạn',N'Năm 1258  ;40 vạn',4,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc kháng chiến chống quân Nguyên lần thứ 3 vào giai đoạn nào và Nhà Trần đã đánh bại bao nhiêu vạn quân Nguyên?','',N'Giai đoạn 1287 – 1288; 50 vạn',N'Giai đoạn 1287 – 1288; 50 vạn',N'Giai đoạn 1287 – 1288; 60 vạn',N'Giai đoạn 1287 – 1289; 40 vạn',N'Giai đoạn 1286 – 1287; 30 vạn',4,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong kháng chiến chống Mỹ, loại hình chiến dịch phòng ngự ( Quảng Bình) diễn ra vào thời gian nào?','',N'Năm 1972',N'Năm 1974-1975',N'Năm 1972',N'Năm  1972-1973',N'Năm 1973',4,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chiến dịch Hồ Chí Minh thuộc loại hình nghệ thuật quân sự nào?','',N'Chiến dịch tiến công',N'Chiến dịch phản công',N'Chiến dịch phòng ngự',N'Chiến dịch tiến công',N'Chiến dịch phòng ngự , phản công',4,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chủ nghĩa Mác –Lê Nin có những ảnh hưởng nào tới nghệ thuật quân sự Việt Nam từ khi có Đảng lãnh đạo ?','',N'Là nền tảng tư tưởng,là cơ sở cho Đảng ta định ra đường lối quân sự trong khởi nghĩa và chiến tranh ở Việt Nam',N'Là nền tảng tư tưởng,là cơ sở cho Đảng ta định ra đường lối quân sự trong khởi nghĩa và chiến tranh ở Việt Nam',N'Là học thuyết quân sự đúng đắn, khoa học nhất để Việt Nam sử dụng trong chiến tranh bảo vệ Tổ quốc',N'Là chủ trương , đường lối quân sự phù hợp nhất, sát thực nhất đối với Cách mạng Việt Nam',N'Là lý luận kinh điển về nghệ thuật quân sự, tư liệu tham khảo cho tư tưởng quân sự Việt Nam',4,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư tưởng chỉ đạo tác chiến trong nghệ thuật đánh giặc của Tổ tiên ta là gì?','',N'Dụ địch vào sâu trong nội địa, đánh vào sự chủ quan , hiếu thắng của chúng',N'Chủ động đánh địch ,khi chúng có mưu đồ xâm lược, chặn địch ngay từ biên giới',N'Dụ địch vào sâu trong nội địa, đánh vào sự chủ quan , hiếu thắng của chúng',N'Tích cực chủ động tiến công, liên tục tiến công từ nhỏ đến lớn, từ cục bộ đến toàn bộ',N'Chủ động phòng ngự, tạo thời cơ bao vây chia cắt chúng để tiêu diệt , giành thắng lợi',4,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cuộc kháng chiến chống Nguyên Mông thời Trần, đã thực hiện kế sách đánh giặc như thế nào?','',N'Tránh chỗ mạnh , đánh chỗ yếu, nơi hiểm yếu của kẻ thù',N'Khôn khéo, mềm dẻo, linh hoạt',N'Tránh chỗ mạnh , đánh chỗ yếu, nơi hiểm yếu của kẻ thù',N'Tiến công liên tục vào hậu phương địch',N'Phân tán lực lượng, tránh thế mạnh, đánh vào sau lưng địch',4,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung chủ yếu về nghệ thuật đánh giặc của cha ông ta là:
            1/  Tư tưởng chỉ đạo tác chiến
            2/  Nghệ thuật lấy đoản binh thắng trường trận
            3/  Nghệ thuật lấy nhỏ đánh lớn, lấy ít địch nhiều, lấy yếu chống mạnh
            4/  Tư tưởng chỉ đạo kháng chiến trường kỳ','',N'Nội dung 1 và 3 đều đúng',N'Nội dung 1 và 4 đều đúng',N'Nội dung 2 và 4 đều đúng',N'Nội dung 1 và 3 đều đúng',N'Nội dung 3 và 4 đều đúng',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ sở hình thành nghệ thuật quân sự Việt Nam bao gồm những yếu tố nào?
            1/  Tư tưởng quân sự Hồ Chí Minh
            2/  Truyền thống đánh giặc của tổ tiên
            3/  Truyền thống lấy ít địch nhiều, lấy yếu chống mạnh
            4/  Chủ nghĩa Mác Lê Nin về chiến tranh, quân đội và bảo vệ Tổ quốc','',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những cơ sở hình thành nghệ thuật quân sự Việt Nam từ khi có Đảng lãnh đạo là:','',N'Tư tưởng quân sự Hồ Chí Minh',N'Tư tưởng Hồ Chí Minh về đại đoàn kết toàn dân',N'Tư tưởng chỉ đạo tác chiến của Hồ Chí Minh',N'Tư tưởng quân sự Hồ Chí Minh',N'Tư tưởng chỉ đạo tác chiến của quân đội nhân dân Việt Nam',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung chủ yếu về nghệ thuật đánh giặc của Tổ tiên ta là :','',N'Nghệ thuật chiến tranh nhân dân, thực hiện toàn dân đánh giặc',N'Nghệ thuật toàn dân đánh giặc, đánh giặc toàn diện',N'Nghệ thuật tác chiến của chiến tranh nhân dân',N'Nghệ thuật chiến tranh nhân dân, thực hiện toàn dân đánh giặc',N'Nghệ thuật kết hợp đấu tranh quân sự với ngoại gia',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Xác định đúng kẻ thù, đúng đối tượng tác chiến”, Đảng ta đã xác định Đế quốc Mỹ trở thành kẻ thù trực tiếp, nguy hiểm của dân tộc Việt Nam , Lào , Campuchia vào thời điểm nào?','',N'Tháng 9 năm 1954',N'Tháng 9 năm 1945',N'Tháng 9 năm 1946',N'Tháng 9 năm 1954',N'Tháng 9 năm 1955',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sau cách mạng tháng tám chúng ta xác định kẻ thù “nguy hiểm, trựctiếp”  của cách mạng là những đối tượng nào?','',N'Thực dân Pháp là kẻ thù trực tiếp, nguy hiểm của Cách mạng Việt Nam',N'Thực dân Pháp là kẻ thù trực tiếp, nguy hiểm của Cách mạng Việt Nam',N'Thực dân Pháp , phát xít Nhật là kẻ thù trực tiếp, nguy hiểm của Cách mạng Việt Nam',N'Thực dân Pháp , phát xít Nhật, quân Tưởng là kẻ thù trực tiếp, nguy hiểm của Cách mạng Việt Nam',N'Thực dân Pháp , quân Tàu Tưởng là kẻ thù trực tiếp, nguy hiểm của Cách mạng Việt Nam',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung bài học kinh nghiệm về nghệ thuật quân sự được vận dụng vào sự nghiệp bảo vệ Tổ quốc trong thời kỳ mới là:','',N'Nghệ thuật tạo sức mạnh tổng hợp bằng lực, thế, thời và mưu kế',N'Vận dụng các hình thức chiến thuật vào các trận chiến đấu',N'Quán triệt các loại hình tác chiến trong một chiến dịch',N'Vận dụng các hình thức và quy mô lực lượng tham gia trong các trận chiến đấu',N'Nghệ thuật tạo sức mạnh tổng hợp bằng lực, thế, thời và mưu kế',4,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nghệ thuật quân sự Việt Nam từ khi có Đảng lãnh đạo , gồm những bộ phận hợp thành nào?','',N'Chiến lược quân sự, nghệ thuật chiến dịch và chiến thuật',N'Chiến lược , chiến dịch tác chiến trên bộ và trên biển',N'Chiến lược quân sự, nghệ thuật chiến dịch và chiến thuật',N'Chiến lược , chiến dịch tiến công và tác chiến phòng ngự',N'Chiến lược, nghệ thuật chiến dịch tiến công và phòng ngự, kỹ thuật bộ binh',5,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung  nghệ thuật đánh giặc của Tổ tiên ta thể hiện tính mềm dẻo , khôn khéo là :','',N'Nghệ thuật kết hợp đấu tranh giữa các mặt trận quân sự, chính trị , ngoại giao, binh vận',N' Nghệ thuật phát huy sức mạnh của lĩnh vực hoạt động quân sự , chính trị',N'Nghệ thuật đấu tranh quân sự đóng vai trò quyết định',N'Nghệ thuật kết hợp đấu tranh giữa các mặt trận quân sự, chính trị , ngoại giao, binh vận',N'Nghệ thuật phát huy sức mạnh  hoạt động quân sự , chính trị',5,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những cơ sở lý luận hình thành nghệ thuật quân sự Việt Nam từ khi có Đảng lãnh đạo là:','',N'Học thuyết chủ nghĩa Mác-Lê nin về chiến tranh, quân đội và bảo vệ Tổ quốc',N'Học thuyết chủ nghĩa Mác-Lê nin về Chiến tranh',N'Học thuyết chủ nghĩa Mác-Lê nin về bảo vệ Tổ quốc',N'Học thuyết chủ nghĩa Mác-Lê nin về chiến tranh, quân đội và bảo vệ Tổ quốc',N'Học thuyết chủ nghĩa Mác-Lê nin về quân đội',5,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung của chiến lược quân sự từ khi có Đảng lãnh đạo là :','',N'Xác định đúng kẻ thù, đúng đối tượng tác chiến',N'Xác định đúng kẻ thù, đúng đối tượng tác chiến',N'Xây dựng tinh thần yêu nước , ý chí quật cường cho toàn dân tộc',N'Phát huy sức mạnh dân tộc và thời đại trong chiến tranh bảo vệ Tổ quốc',N'Thực hiện tốt chiến tranh nhân dân trong chiến tranh bảo vệ Tổ quốc',5,N'Đã duyệt','MC001','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nghệ thuật kết hợp đấu tranh giữa các mặt trận quân sự, chính trị, ngoại giao, binh vận trong lịch sử chiến tranh chống ngoại xâm của ông cha ta là nhằm mục đích gì?','',N'Để tạo ra sức mạnh tổng hợp, giành thắng lợi trong chiến tranh',N'Để tạo ra sức mạnh tổng hợp, giành thắng lợi trong chiến tranh',N'Để nhân dân Việt nam và các nước trong khu vực ủng hộ cuộc chiến tranh chính nghĩa của dân tộc ta',N'Để chống kẻ thù mạnh, ta phải kiên quyết , khôn khéo , triệt để lợi dụng các  cơ hội ngoại giao… giảm tối đa tổn thất trong chiến tranh',N'Để giải quyết nhanh chóng chiến tranh và ngăn chặn nguy cơ chiến tranh xảy ra liên tiếp trên đất nước',5,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung bài học kinh nghiệm về nghệ thuật quân sự được vận dụng vào sự nghiệp bảo vệ Tổ quốc trong thời kỳ mới là:
            1/  Quán triệt tư tưởng lấy ít đánh nhiều, biết tập trung ưu thế lực lượng cần thiết để đánh thắng địch
            2/  Tổ chức lực lượng tập trung trong một chiến dịch
            3/  Nghệ thuật quân sự toàn dân đánh giặc
            4/  Nghệ thuật tạo sức mạnh tổng hợp bằng lực, thế, thời , mưu kế','',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 1, 2 và 3 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Tất cả nội dung1, 2, 3 và 4 đều đúng',5,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trận đánh Điện Biên Phủ đi vào lịch sử quân sự thế giới thuộc loại hình nghệ thuật nào?','',N'Chiến dịch tiến công',N'Chiến đấu tiến công.',N'Chiến dịch tiến công',N'Chiến dịch phòng ngự và tiến công',N'Chiến dịch phản công',5,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Vị trí “cách đánh chiến thuật” trong nghệ thuật quân sự Việt Nam có ý nghĩa như thế nào?','',N'Là nội dung quan trọng nhất của lý luận chiến thuật',N'Là nội dung quan trọng của lý luận quân sự',N'Là nội dung cơ bản trong lý luận chiến thuật',N'Là nội dung quan trọng của lý luận nghệ thuật quân sự',N'Là nội dung quan trọng nhất của lý luận chiến thuật',5,N'Đã duyệt','MC002','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một trong những nội dung của chiến lược quân sự từ khi có Đảng lãnh đạo là:','',N'Biết mở đầu và kết thúc chiến tranh đúng lúc',N'Xác định được thời thế, đánh giá đúng sức mạnh của cách mạng Việt Nam',N'Xác định được thế mạnh của ta , thế yếu của địch',N'Biết mở đầu và kết thúc chiến tranh đúng lúc',N'Xác định được phương hướng phát triển lực lượng trong chiến tranh',5,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một số nội dung chiến lược quân sự Việt Nam từ khi có Đảng lãnh đạo:
            1/  Phương châm và phương thức tiến hành chiến tranh  
            2/  Xác định đúng kẻ thù, đúng đối tượng tác chiến
            3/  Phương châm và nghệ thuật tiến hành chiến tranh
            4/  Đánh giá đúng kẻ thù','',N'Nội dung 1, 2 và 4 đều đúng',N'Tất cả nội dung1, 2, 3 và 4 đều đúng',N'Nội dung 2, 3 và 4 đều đúng',N'Nội dung 1, 3 và 4 đều đúng',N'Nội dung 1, 2 và 4 đều đúng',5,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Những yếu tố nào tác động đến việc hình thành nghệ thuật đánh giặc của tổ tiên ta:','',N'Địa lý, kinh tế, chính trị ,văn hóa -xã hội',N'Kinh tế, chính trị , văn hóa - xã hội',N'Địa lý, kinh tế, chính trị ,văn hóa -xã hội',N'Địa lý, kinh tế, sáng tạo, ý chí quật cường',N'Kinh tế, chính trị , văn hóa xã hội, sự sáng tạo và ý chí quật cường',5,N'Đã duyệt','MC003','NHCH002')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cơ sở hình thành nghệ thuật quân sự Việt Nam là:','',N'Tất cả đều đúng',N' Truyền thống đánh giặc của ông cha',N'Tư tưởng quân sự Hồ Chí Minh',N'Chủ nghĩa Mác –Lê Nin về chiến tranh, quân đội và bảo vệ Tổ quốc',N'Tất cả đều đúng',5,N'Đã duyệt','MC003','NHCH002')

INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Gía trị hàng hóa được cấu thành bởi các yếu tố:','',N'Chi phí tư bản bất biến, chi phí tư bản khả biến và giá trị thặng dư',N'Chi phí tư bản bất biến, chi phí tư bản khả biến và giá trị thặng dư',N'Chi phí sản xuất tư bản chủ nghĩa và lợi nhuận bình quân',N'Chi phí sản xuất tư bản chủ nghĩa và giá trị mới do lao động làm thuê tạo ra',N'Chi phí sản xuất tư bản chủ nghĩa và lợi nhuận độc quyền',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điều kiện ra đời của sản xuất hàng hóa là','',N'Có sự phân công lao động xã hội và chế độ tư hữu về tư liệu sản xuất',N'Có sự phân công lao động xã hội',N'Có chế độ tư hữu về tư liệu sản xuất',N'Có sự phân công lao động xã hội và chế độ tư hữu về tư liệu sản xuất',N'Có sự phân công lao động xã hội và sự trao đổi, mua hàng hóa trên thị trường',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hàng hóa là','',N'Sản phẩm của lao động để thỏa mãn nhu cầu của con người thông qua mua bán',N'Sản phẩm của lao động để thỏa mãn nhu cầu của con người',N'Sản phẩm của lao động để thỏa mãn nhu cầu của con người thông qua mua bán',N'Sản phẩm ở trên thị trường',N'Sản phẩm được sản xuất ra để đem bán',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lao động cụ thể là','',N'Lao động có ích dưới 1 hình thức cụ thể của 1 nghề nhất định',N'Lao động có ích dưới 1 hình thức cụ thể của 1 nghề nhất định',N'Lao động giống nhau giữa các loại lao động',N'Lao động giản đơn',N'Lao động chân tay',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lao động trừu tượng là nguồn gốc của','',N'Gía trị hàng hóa',N'Tính hữu ích của hàng hóa',N'Gía trị hàng hóa',N'Gía trị trao đổi',N'Gía trị sử dụng',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Gía trị cá biệt của hàng hóa do','',N'Hao phí lao động cá biệt của người sản xuất hàng hóa quyết định',N'Hao phí lao động giản đơn trung bình quyết định',N'Hao phí lao động của ngành quyết định',N'Hao phí lao động cá biệt của người sản xuất hàng hóa quyết định',N'Hao phí lao động cá biệt của người sản xuất nhiều hàng hóa quyết định',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lượng giá trị của một đơn vị hàng hóa thay đổi','',N'Tỷ lệ nghịch với năng suất lao động và không phụ thuộc vào cường độ lao động',N'Tỷ lệ thuận với năng suất lao động',N'Tỷ lệ nghịch với cường độ lao động',N'Tỷ lệ nghịch với năng suất lao động và tỷ lệ nghịch với cường độ lao động',N'Tỷ lệ nghịch với năng suất lao động và không phụ thuộc vào cường độ lao động',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền tệ có mấy chức năng khi chưa có quan hệ kinh tế quốc tế?','',N'Bốn chức năng',N'Hai chức năng',N'Ba chức năng',N'Bốn chức năng',N'Năm chức năng',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Yếu tố quyết định đến giả cả hàng hóa là','',N'Giá trị của hàng hóa',N'Giá trị của hàng hóa',N'Giá trị sử dụng của hàng hóa',N'Quan hệ cung cầu về hàng hóa',N'Sở thích của người tiêu dùng',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lượng giá trị của một đơn vị hàng hóa phụ thuộc vào các yếu tố','',N'Cường độ lao động, năng suất lao động và mức độ phức tạp của lao động',N'Năng suất lao động, sự phát triển của khoa học kỹ thuật',N'Cường độ lao động, năng suất lao động và mức độ phức tạp của lao động',N'Cường độ lao động, trình độ tổ chức quản lý và trình độ của người công nhân',N'Cường độ lao động, năng suất lao động và sự áp dụng khoa học kỹ thuật mới',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi nền kinh tế có hiện tượng mua bán chịu thì lúc đó tiền tệ thực hiện chức năng gì?','',N'Phương tiện thành toàn',N'Thước đo giá trị',N'Phương tiện lưu thông',N'Phương tiện thành toàn',N'Tiền tệ thế giới',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung (yêu cầu) của quy luật giả trị thể hiện:','',N'Sản xuất, trao đổi tiến hành trên cơ sở hao phí lao động xã hội cần thiết',N'Sản xuất, trao đổi tiến hành trên cơ sở hao phí lao động xã hội cần thiết',N'Giá cả bằng giá trị của hàng hóa',N'Giá cả lên xuống xoay quanh giá trị',N'Giả cả hình thành tự phát trên thị trường',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan hệ giữa giá trị và giá cả hàng hóa là','',N'Giá trị là cơ sở của giá cả, là yếu tố quyết định giả cả',N'Giá trị là cơ sở của giá cả, là yếu tố quyết định giả cả',N'Giá cả là cơ sở của giá trị, là yếu tố quyết định giá trị',N'Giá cả luôn tách rời giá trị hàng hóa',N'Giá trị luôn xoay quanh giá cả hàng hóa',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cặp phạm trù nào là phát hiện riêng của C.Mác?','',N'Lao động cụ thể và lao động trừu tượng',N'Lao động gian đơn và lao động phức tạp',N'Lao động cụ thể và lao động trừu tượng',N'Lao động tư nhân và lao động xã hội',N'Lao động quá khứ và lao động sống',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên nhân ra đời của tiền tệ là gi?','',N'Xuất phát từ quan hệ cung cầu trên thị trường',N'Là kết quả của quá trình phát triển lâu dài của sản xuất và trao đổi hàng hóa',N'Xuất phát từ quan hệ cung cầu trên thị trường',N'Do nhu cầu cất trữ lại để khi cần đem trao đổi, mau bản',N'Do nhu cầu trao đổi, mua bán giữa các nước',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhân tố nào là cơ ban, lâu dài để tăng sản phẩm cho xã hội','',N'Tăng năng suất lao động',N'Tăng năng suất lao động',N'Tăng cường độ lao động',N'Tăng số người lao động',N'Kéo dài thời gian lao động',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá cả hàng hóa là','',N'Biểu hiện bằng tiền của giá trị hàng hóa',N'Giá trị của hàng hóa',N'Quan hệ về lượng giữa hàng và tiền',N'Tổng của chi phí sản xuất và lợi nhuận',N'Biểu hiện bằng tiền của giá trị hàng hóa',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị của hàng hóa là gì ?','',N'Là lao động xã hội của người sản xuất hàng hóa kết tinh trong hàng hóa',N'Là lao động cụ thể của người sản xuất hàng hóa',N'Là công dụng của hàng hóa trong việc thỏa mãn nhu cầu của người sử dụng',N'Là lao động xã hội của người sản xuất hàng hóa kết tinh trong hàng hóa',N'Là lao động cả biệt của người sản xuất hàng hóa kết tỉnh trong hàng hóa',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị sử dụng của hàng hóa là gì?','',N'Là công dụng của hàng hóa trong việc thỏa mãn nhu cầu của người sử dụng',N'Là lao động cụ thể của người sản xuất hàng hóa',N'Là công dụng của hàng hóa trong việc thỏa mãn nhu cầu của người sử dụng',N'Là lao động xã hội của người sản xuất hàng hóa kết tinh trong hàng hóa',N'Là lao động cả biệt của người sản xuất hàng hóa kết tỉnh trong hàng hóa',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lương giá trị của một đơn vị hàng hóa được quyết định bởi?','',N'Thời gian lao dộng xã hội cần thiết của những người sản xuất hàng hóa',N'Thời gian lao động cả biệt của những người sản xuất hàng hóa',N'Thời gian lao động xã hội của người sản xuất hàng hóa',N'Thời gian lao dộng xã hội cần thiết của những người sản xuất hàng hóa',N'Thời gian lao động thặng dư của người sản xuất hàng hóa',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong trao đổi hàng hóa, khi người 1 mang vật này trao đổi trực tiếp với một vật khác thủ đô biểu hiện của hình thái cụ thể nào ?','',N'Hình thái giá trị giản đơn hay ngẫu nhiên',N'Hình thái giá trị giản đơn hay ngẫu nhiên',N'Hình thái giá trị toàn bộ hay mở rộng',N'Hình thái chung của giá trị',N'Hình thái tiền tệ',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tinh chất hai mặt của lao động sản xuất hàng hóa là','',N'Lao động cụ thể và lao động trừu tượng',N'Lao động tư nhân và lao động xã hội',N'Lao động cụ thể và lao động trừu tượng',N'Lao động giản đơm và lao động phức tạp',N'Lao động cả biệt và lao động xã hội',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền tệ có mấy chức năng ?','',N'5',N'2',N'3',N'4',N'5',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền tệ là gì?','',N'Là hàng hóa đặc biệt đóng vai trò là vật ngang giá chung',N'Là thước đo giá trị của hàng hóa',N'Là phương tiện để lưu thông hàng hóa và để thanh toàn',N'Là hàng hóa đặc biệt đóng vai trò là vật ngang giá chung',N'Là vàng, bạc',4,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lao động cụ thể là nguồn gốc của','',N'Giá trị sử dụng',N'Tính hữu ích của hàng hóa',N'Giá trị hàng hóa',N'Giá trị trao đổi',N'Giá trị sử dụng',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sản xuất hàng hóa tồn tại','',N'Trong các xã hội có sự phân công lao động xã hội và sự tách biệt tương đối về kinh tế giữa những người sản xuất hàng hóa',N'Trong mọi xã hội',N'Trong chế độ nô lệ, phong kiến',N'Chỉ có trong chủ nghĩa tư bản',N'Trong các xã hội có sự phân công lao động xã hội và sự tách biệt tương đối về kinh tế giữa những người sản xuất hàng hóa',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc sản xuất và trao đổi hàng hóa dựa trên cơ sở nào ?','',N'Hao nhỏ thôi gian lao động xã hội cần thiết',N'Hao phi thời gian lao động cá biệt',N'Hao phi thời gian lao động của người sản xuất hàng hóa kém nhất',N'Hao nhỏ thôi gian lao động xã hội cần thiết',N'Hao phi lao động quả khử và lao động sống của người sản xuất hàng hóa',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sản xuất và trao đổi hàng hóa chịu sự chỉ phổi của những quy luật kinh tế nào ?','',N'Quy luật giá trị, quy luật cạnh tranh và cung cầu và quy luật lưu thông tiền tệ',N'Quy luật giá trị',N'Quy luật cạnh tranh và cung cầu',N'Quy luật lưu thông tiền tệ',N'Quy luật giá trị, quy luật cạnh tranh và cung cầu và quy luật lưu thông tiền tệ',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi nghiên cứu phương thức sản xuất tư bản chủ nghĩa, C Mac bắt đầu từ đầu ?','',N'Sản xuất hàng hóa gian đơn và hàng hóa',N'Nền sản xuất của cải vật chất',N'Công thức chung của tư bản',N'Sản xuất hàng hóa gian đơn và hàng hóa',N'Quá trình sản xuất giá trị thặng dư',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền tệ có một trong những chức năng nào sau dãy ?','',N'Thước đo giá trị',N'Thước đo giá cả',N'Thước đo giá trị',N'Trao đổi mua bán',N'Biểu hiện giá cả',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thế nào là lao động giản đơn ?','',N'Là lao động không cần trải qua đào tạo cũng có thể làm được',N'Là lao động làm công việc đem giản',N'Là lao động làm ra hàng hóa chất lượng không cao',N'Là lao động chỉ làm một công đoạn của quá trình tạo ra hàng hóa',N'Là lao động không cần trải qua đào tạo cũng có thể làm được',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thể nào là lao động phức tạp?','',N'Là lao động phải trải qua đào tạo, huấn luyện mới làm được',N'Là lao động tạo ra giá trị của hàng hóa',N'Là lao động phải trải qua đào tạo, huấn luyện mới làm được',N'Là lao động tạo ra tính hữu ích của sản phẩm',N'Là lao động có trình độ và công nghệ cao',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các nhân tố nào làm tăng sản phẩm cho xã hội ?','',N'Tăng năng suất lao động, tăng cường độ lao động và tăng số người',N'Tăng năng suất lao động',N'Tăng cường độ lao động',N'Tăng năng suất lao động, tăng cường độ lao động',N'Tăng năng suất lao động, tăng cường độ lao động và tăng số người',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan hệ cung cầu có ảnh hưởng đến?','',N'Giá cả hàng hóa',N'Giá trị hàng hóa',N'Giá cả hàng hóa',N'Giá trị thặng dư',N'Giá trị trao dồi',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quy luật giá trị là','',N'Quy luật cơ bản của sản xuất và trao đổi hàng hóa',N'Quy luật riêng của chủ nghĩa tư bản',N'Quy luật cơ bản của sản xuất và trao đổi hàng hóa',N'Quy luật kinh tế chung của mọi xã hội',N'Quy luật kinh tế của thời kỳ quá độ lên chủ nghĩa xã hội',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mâu thuẫn cơ bản của sản xuất hàng hóa là','',N'Giữa lao động tư nhân với lao động xã hội',N'Giữa giá trị với giá trị sử dụng',N'Giữa lao động giản đơn với lao động phức tạp',N'Giữa lao động cụ thể với lao động trừu tượng',N'Giữa lao động tư nhân với lao động xã hội',4,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan hệ giữa tăng cường độ lao động và giá trị hàng hóa là ?','',N'Tăng cường độ lao động thị giả trị một đơn vị hàng hóa không thay đổi',N'Tăng cường độ lao động thì giá trị một đơn vị hàng hóa bằng không (=0)',N'Tăng cường độ lao động thị giả trị một đơn vị hàng hóa không thay đổi',N'Tăng cường độ lao động thì giả trị một đơn vị hàng hóa giảm xuống',N'Tăng cường độ lao động thì giả trị của một đơn vị hàng hóa tăng lên',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cùng một thời gian lao động, khi số lượng sản phẩm tăng lên còn giá trị một đơn vị hàng hóa giảm xuống và các điều kiện khác không thay đổi thì đó là kết quả của','',N'Tăng năng suất lao động',N'Tăng năng suất lao động',N'Tăng cường độ lao động',N'Của cả tăng năng suất lao động và tăng cường độ lao động',N'Của cả giảm năng suất lao động và giảm cường độ lao động',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong cùng một thời gian lao động, khi số lượng sản phẩm tăng lên còn giả trị một đơn vị hàng hóa và các điều kiện khác không thay đổi thi đô là kết quả của','',N'Tăng cường độ lao động',N'Tăng năng suất lao động',N'Tăng cường độ lao động',N'Của cả tăng năng suất lao động và tăng cường độ lao động',N'Của cả giảm năng suất lao động và giảm cường độ lao động',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các chức năng của tiền tệ thì chức năng nào không đòi hỏi cẩn thiết phải là tiền mặt mà chỉ cần so sánh với một lượng vàng nào đó một cách tưởng tượng?','',N'Thước đo giá trị',N'Thước đo giá trị',N'Phương tiện lưu thông',N'Phương tiện thanh toán',N'Tiền tệ thế giới',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hai hàng hóa trao dõi được với nhau về','',N'Chúng cũng là sản phẩm của lao động và có lượng thời gian hao phí lao động thiết để sản xuất ra chúng bằng nhau',N'Chúng cùng là sản phẩm của lao động',N'Có lượng hao phí vật tư kỹ thuật bằng nhau',N'Chúng cũng là sản phẩm của lao động và có lượng thời gian hao phí lao động thiết để sản xuất ra chúng bằng nhau',N'Chủng cũng là sản phẩm của lao động và có lượng hao phi vật tư kỹ thuật bằng nhau',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tăng năng suất lao động và tăng cường độ lao động giống nhau ở chỗ nào','',N'Đều làm tăng số sản phẩm sản xuất ra trong một đơn vị thời gian',N'Đều làm giá trị một đơn vị hàng hóa giam xuống',N'Đều làm tăng số sản phẩm sản xuất ra trong một đơn vị thời gian',N'Đều làm tăng lượng lao động hao phi trong một đơn vị thời gian',N'Đều làm giảm lượng lao động hao phi trong một đơn vị thời gian',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan hệ giữa tăng năng suất lao động và tổng giá trị hàng hóa là?','',N'Tăng năng suất lao động thì tổng giá trị hàng hóa không thay đổi',N'Tăng năng suất lao động thì tổng giá trị hàng hóa không thay đổi',N'Tăng năng suất lao động thi tổng giá trị hàng hóa tăng lên',N'Tăng năng suất lao động thì giá trị một đơn vị hàng hóa tăng lên',N'Tăng năng suất lao động thì giá trị một đơn vị hàng hóa không đổi',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quan hệ giữa tăng cường độ lao động và giá trị hàng hóa là?','',N'Tăng cường độ lao động thị tổng giá trị hàng hóa tăng lên',N'Tăng cường độ lao động thì tổng giá trị hàng hóa không thay đổi',N'Tăng cường độ lao động thị tổng giá trị hàng hóa tăng lên',N'Tăng cường độ lao động thị tổng giá trị hàng hóa giảm xuống',N'Tăng cường độ lao động thì giá trị của một đơn vị hàng hóa tăng lên',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lưu thông hàng hóa dựa trên nguyên tắc ngang giã. Điều này được hiểu như thế nào là dùng?','',N'Giá cả có thể tách rời giá trị và xoay quanh giá trị của nó nhưng tổng giả cả bằng tổng giá tr',N'Giá cả của từng hàng hóa luôn luôn bằng giá trị của nó',N'Giá cả có thể tách rời giá trị và xoay quanh giá trị của nó',N'Tổng giá cả = tổng giá trị',N'Giá cả có thể tách rời giá trị và xoay quanh giá trị của nó nhưng tổng giả cả bằng tổng giá trị',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Suy cho cùng, nguyên nhân của dẫn dẫn sự xuất hiện của nền sản xuất hàng hóa là','',N'Sự phát triển của lực lượng sản xuất',N'Sự xuất hiện của chế độ tư hữu về tư liệu sản xuất',N'Sự xuất hiện lượng sản phẩm dư thừa',N'Sự phát triển của lực lượng sản xuất',N'Sư độc lập của các chủ thể sản xuất',4,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mục đích của lưu thông tư bản là:','',N'Giá trị sử dụng',N'Giá trị thặng dự',N'Giá trị sử dụng',N'Giá trị trao đổi',N'Tính hữu ích của hàng hóa',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cạnh tranh trong nội bộ ngành là nguyên nhân hình thành','',N'Giá cả thị trường',N'Chỉ phi sản xuất tư bản chủ nghĩa',N'Lợi nhuận siêu ngạch',N'Tỷ suất lợi nhuận bình quân',N'Giá cả thị trường',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quy luật giá trị thặng dư là :','',N'Quy luật kinh tế cơ bản của chủ nghĩa tư bản',N'Quy luật kinh tế cơ bản của chủ nghĩa tư bản',N'Quy luật của toàn bộ sự vận động của chủ nghĩa tư bản',N'Quy luật làm tăng mâu thuẫn cơ bản của các nhà tư bản và tăng giá trị cá biệt của hàng hóa',N'Quy luật cơ bản của mọi chế độ xã hội có giai cấp',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn phát biễu đúng về tuần hoàn tư bản','',N'Tuần hoàn tư bản là sự vận động của tư bản mang tính chu kỳ, bảo tồn và làm tăng giá trị',N'Tuần hoàn tư bản là sự vận động của tư bản mang tính chu kỳ, bảo tồn và làm tăng giá trị',N'Thời gian tuần hoàn tư bản gồm thời gian sản xuất và thời gian lưu thông',N'Tuần hoàn tư bản là một giai đoạn trong quá trình tái sản xuất tư bản xã hội',N'Mọi quá trình tuần hoàn của tư bản đều bắt đầu bằng hình thái liền tệ',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cạnh tranh giữa các ngành là nguyên nhân hình thành','',N'Tỷ suất lợi nhuận bình quân',N'Giá cả thị trường của hàng hóa',N'Tỷ suất lợi nhuận bình quân',N'Chi phí sản xuất tư bản chủ nghĩa',N'Năng suất lao động cá biệt',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá cả sản xuất bao gồm:','',N'Chi phí sản xuất tư bản chủ nghĩa + lợi nhuận binh quân',N'Giá trị thăng dư - lợi nhuận',N'Chi phí sản xuất tư bản chủ nghĩa + lợi nhuận binh quân',N'Chi phí sản xuất tư bản chủ nghĩa + giá trị thặng dư',N'Chi phi tư liệu sản xuất + tiền công của công nhân',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tỷ suất lợi nhuận phản ảnh','',N'Khả năng sinh lời của việc đầu tư tư bản',N'Trình độ bóc lột lao động làm thuê',N'Trinh độ phát triển của khoa học kỹ thuật',N'Khả năng sinh lời của việc đầu tư tư bản',N'Mức độ thay đổi trong cấu tạo hữu cơ của tư bản',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn gốc của lợi nhuận thương nghiệp','',N'Giá trị thăng di do lao động làm thuế tạo ra trong lĩnh vực sản xuất mà tư bản công nghiệp nhưng lại cho tư bán thương nghiệp',N'Giá trị thăng di do lao động làm thuế tạo ra trong lĩnh vực sản xuất mà tư bản công nghiệp nhưng lại cho tư bán thương nghiệp',N'Tư bản ứng trước',N'Sự chênh lệch giữa giã mua rẻ với giá bán đất',N'Tất cả đều sai',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn phát biểu dùng về tư bản giá','',N'Bản thân tư bản không có giá trị thực khỏi',N'Tư bản giả có giá trị vì nó là một loại hàng hóa',N'Tư bản gia là một phần của lợi nhuận bình quân',N'Giá trị của tư bản giả được thu hồi sau mỗi chu kỳ sản xuất kinh doanh',N'Bản thân tư bản không có giá trị thực khỏi',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn phát biểu dùng về tập trung tư bản','',N'Sư hạn nhất một số tư bản nhỏ thành tư bản cả biệt khác có quy mô lớn hơn',N'Làm tăng quy mô tư bản cá biệt và tư bản xã hội',N'Làm tăng quy mô tư bản cả biệt, làm giảm tư ban xã hội',N'Sư hạn nhất một số tư bản nhỏ thành tư bản cả biệt khác có quy mô lớn hơn',N'Làm tăng quy mô tư bản xã hội, tư bán cá biệt không đối',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thức nào sau dãy không phải biểu hiện của giá trị thặng dư','',N'Tiền lương',N'Tiền lương',N'Địa tô',N'Lợi tức',N'Lợi nhuận',5,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chi phi về thực tế về lao động để tạo ra giá trị hàng hóa bao gồm:','',N'c+v+m',N'c-m',N'c+v+m',N'c+v',N'v + m',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc phân chia tư bản ứng trước thành tư bản tư bản bắt biển và tư ban khả biển có ý nghĩa','',N'Xác định nguồn gốc của giá trị thông dư',N'Xác định nguồn gốc của giá trị thông dư',N'Phần ảnh trình độ bóc lột lao động làm thuê',N'Chỉ ra cách thức chuyển giá trị vào sản phẩm mới',N'Phản ánh khả năng sinh lời của việc đầu tư tư bản',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Việc phân chia tư bản ứng trước thành tư ban tư bản cố định và tư bản lưu động có ý nghĩa','',N'Chỉ ra cách thức chuyển giả tri vào sản phẩm mới',N'Xác định nguồn gốc của giá trị thặng dư',N'Phản ánh trình độ bóc lột lao động làm thuê',N'Chỉ ra cách thức chuyển giả tri vào sản phẩm mới',N'Phản ánh khả năng sinh lời của việc đầu tư tư ban',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn nội dung sai','',N'Giá trị của sản phẩm mới: v+m',N'Giá trị mới của sản phẩm :v+m',N'Giá trị của sản phẩm mới: v+m',N'Giá trị của sức lao động : v',N'Giá trị của tư liệu sản xuất: c',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thức phổ biến của khủng hoảng kinh tế trong chủ nghĩa tư bản là:','',N'Sản xuất thi hàng hóa',N'Khủng hoảng thiếu hàng hóa',N'Lạm phát cao',N'Sản xuất thi hàng hóa',N'Thất nghiệp kéo dài',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tính chất cơ bản của khủng hoảng kinh tế của chủ nghĩa tư bản là','',N'Tính chu kỳ',N'Tính phổ biến',N'Tính chu kỳ',N'Tính kế thừa',N'Tính khách quan',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc khủng hoàng kinh tế đầu tiên nổ ra vào năm nào ?','',N'1825',N'1829',N'1833',N'1825',N'1847',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Cuộc khủng hoảng kinh tế đầu tiên mang tính chất thế giới tư bản chủ nghĩa nổ ra vào năm nào?','',N'1847',N'1829',N'1833',N'1825',N'1847',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn gốc của tích lũy tư ban là :','',N'Giá trị thăng dr do người lao động làm thuê tra',N'Giá trị thăng dr do người lao động làm thuê tra',N'Lợi nhuận bình quân của các nhà tư bản',N'Lợi nhuận độc quyền của các nhà tư bản',N'Lợi nhuận độc quyền cao của nhà tư bản',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhân tố nào sau dây ảnh hưởng đến tỷ suất lợi nhuận','',N'Tỷ suất giá trị thăng dư',N'Tỷ suất giá trị thăng dư',N'Chi phí sản xuất tư bản chủ nghĩa',N'Giá trị hàng hóa',N'Khối lượng giá trị thặng dư',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản thương nghiệp có vai trò :','',N'Mở rộng thị trường, tạo điều kiện cho công nghiệp phát triển',N'Tăng quy mô tích lũy tư bản',N'Mở rộng thị trường, tạo điều kiện cho công nghiệp phát triển',N'Tăng trình độ bóc lột lao động làm thuê',N'Góp phần hình thanh tỷ suất lợi nhuận binh quân',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn gốc của lợi tức','',N'Một phần của giá trị thăng dư do công nhân tạo ra trong lĩnh vực sản xuất',N'Tiền của nhà tư bản cho vay tăng giá trị sau một thời gian cho nhà tư bản công nghiệp vay',N'Một phần của lợi nhuận độc quyền mà nhà tư bản đi vay trả cho nhà tư bản cho vay',N'Một phần của giá trị thăng dư do công nhân tạo ra trong lĩnh vực sản xuất',N'Một phần của lợi nhuận ngân hàng có được do làm trung gian tài chính',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tuần hoàn của tư bản công nghiệp là sự thống nhất của các hình thái tuần hoàn','',N'Tư bản tiền tệ, tư bản sản xuất và tư bản hàng hóa',N'Tư bản tiền tệ và tư bản sản xuất',N'Tư bản sản xuất và tư bản hàng hóa',N'Tư bản tiền tệ, tư bản sản xuất và tư bản hàng hóa',N'Tất cả đều đúng',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Biện pháp gian hao môn tư bản cố định :','',N'Tăng tốc độ chu chuyển từ bản',N'Kéo dài thời gian sử dụng máy móc thiết bị',N'Tăng tốc độ chu chuyển từ bản',N'Giảm tốc độc chu chuyển tư bản',N'Rút ngắn thời gian lưu thông tư bản',5,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản cố định bao gồm :','',N'Giá trị máy móc, thiết bị, nhà xưởng, kho bãi',N'Giá trị tư liệu sản xuất và sức lao động',N'Giá trị máy móc, thiết bị, nhà xưởng, kho bãi',N'Giá trị máy móc, thiết bị, nhà xương, kho bãi và giá trị sức lao động',N'Giá trị sức lao động và nguyên nhiên vật liệu',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tốc độ chu chuyển tư bản (N) được tinh bởi công thức','',N'N=Thời gian tư bàn vận động trong một năm / Thời gian một vòng chu chuyển tu ban',N'N = Thời gian một vòng chu chuyển từ bản / Sổ vòng chu chuyển tư bản trong một năm',N'N=Thời gian tư bàn vận động trong một năm / Thời gian một vòng chu chuyển tu ban',N'N = Thời gian một vòng chu chuyển tư bản / Thời gian tư bản vận động trong một năm',N'N = Thời gian tư bản vận động trong một năm / Sổ vòng chu chuyển tu ban trong một năm',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sự vận động của tư bản xét về mặt bản chất thì đó là quá trình :','',N'Tuần hoàn tư bản',N'Tích lũy từ bản',N'Lưu thông tư bản',N'Tuần hoàn tư bản',N'Chu chuyển tư bản',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sự vận động của tư bản xét về mặt thời gian và tốc độ vận động thì đó là quá trình','',N'Chu chuyển từ bản',N'Tích lũy tư bản',N'Lưu thông tư bản',N'Tuần hoàn tư bản',N'Chu chuyển từ bản',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn câu phát biểu đúng','',N'Khi các yếu tố khác không đổi, cấu tạo hữu cơ của tư hãn càng tăng thì tỷ suất lợi nhuận càng giảm',N'Khi các yếu tố khác không đổi, cấu tạo hữu cơ của tư hãn càng tăng thì tỷ suất lợi nhuận càng giảm',N'Khi các yếu tố khác không đổi, cấu tạo hữu cơ của tư bản càng cao thì tỷ suất lợi nhuận càng lớn',N'Cấu tạo hữu cơ của tư bản và tỷ suất lợi nhuận không có mối quan hệ gì với nhau',N'Khi tỷ suất giả trị thặng dư và cấu tạo hữu cơ của tư bản củng tăng thì ty suất lợi nhuận càng giảm',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các giai đoạn trong một chu kỳ khủng hoang kinh tế của chủ nghĩa tư ban là','',N'Khủng hoảng – Tiêu điều – Phục hồi – Hưng thỉnh',N'Tiêu điều – Khủng hoàng – Hưng thịnh – Phục hồi',N'Khủng hoảng – Tiêu điều – Phục hồi – Hưng thỉnh',N'Khủng hoảng – Phục hồi – Tiêu điều —Hưng thịnh',N'Tiêu điều – Hưng thịnh – Khủng hoảng -Phục hồi',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các công thức tính khối lượng giá trị thặng dư dưới đây, công thức nào đúng?','',N'M=m.m.V',N'M=m.m.V',N'M=m. V',N'M = m/V',N'M=m/V',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản là','',N'Giá trị mang lại giá trị thặng dư bằng cách bóc lột lao động làm thuê',N'Tiền và máy móc thiết bị',N'Tiền có khả năng đề ra tiền',N'Giá trị mang lại giá trị thặng dư bằng cách bóc lột lao động làm thuê',N'Công cụ san xuất và nguyên vật liệu',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm nào dưới đây thuộc về phương pháp sản xuất giá trị thặng dư tuyệt đối','',N'Kéo dài ngày lao động còn thời gian lao động cần thiết không đổi',N'Kéo dài ngày lao động còn thời gian lao động cần thiết không đổi',N'Sử dụng kỹ thuật tiên tiến',N'Tăng năng suất lao động',N'Cải tiến tổ chức quản lý',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tỷ suất giả trị thặng dư (m) phản ảnh điều gi?','',N'Trình đô bóc lột của tư bản đối với công nhân làm thuê',N'Trình đô bóc lột của tư bản đối với công nhân làm thuê',N'Hiệu quả của tư bản',N'Sự chênh lệch giữa tư bản sử dụng và tư bản tiêu dùng',N'Chỉ cho nhà tư bản biết nơi đầu tư có lợi',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khối lượng giá trị thặng dư (M) phản ánh điều gi','',N'Quy mô bóc lột của tư bản đối với cộng nhân làm thuê',N'Quy mô bóc lột của tư bản đối với cộng nhân làm thuê',N'Hiệu quả của tư bản',N'Sự chênh lệch giữa tư bún sử dụng và từ bàn tiêu dùng',N'Chỉ cho nhà tư bản biết nơi đầu tư có lợi',5,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi nhà tự bản trả công cho công nhân theo đúng giá trị sức lao động thì có còn bóc lột giá trị thặng dư không ?','',N'Có',N'Không',N'Có',N'Bị lỗ vốn',N'Hòa vốn',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích tụ tư ban có nguồn gốc trực tiếp từ đầu','',N'Giá trị thăng dư',N'Giá trị thăng dư',N'Tư bản có sẵn trong xã hội',N'Tiền tiết kiệm trong dân cư',N'Quỹ phúc lợi xã hội',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền công thực tế là gì ?','',N'Là số lượng hàng hóa và dịch vụ mua được từ tiền công danh nghĩa',N'Là tổng số tiền nhận được trong một tháng',N'Là số lượng hàng hóa và dịch vụ mua được từ tiền công danh nghĩa',N'Là giá cả của lao động',N'Là giá trị của lao động',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tiền công danh nghĩa là gì ?','',N'Là số tiền mà người công nhân nhận được do bản sức lao động của mình cho nhà tư bản',N'Là giá cả của lao động từ tiền công danh nghĩa',N'Là giá trị của lao động',N'Là số tiền mà người công nhân nhận được do bản sức lao động của mình cho nhà tư bản',N'Là số lượng hàng hóa và dịch vụ mà người công nhân mua được trong 1 tháng',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điều kiện tất yếu để sức lao động trở thành hàng hóa là','',N'Người lao động được tự do về thân thể và không có tư liệu sản xuất chủ yếu',N'Người lao động tự nguyện đi làm thuê',N'Người lao động được tự do về thân thế',N'Người lao động hoàn toàn không có tư liệu sản xuất chu yếu',N'Người lao động được tự do về thân thể và không có tư liệu sản xuất chủ yếu',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điểm giống nhau giữa tích tụ và tập trung tư bản là:','',N'Tăng quy mô tư bản cá biệt',N'Tăng quy mô tư ban xã hội',N'Tăng quy mô tư bản cá biệt',N'Phản ảnh mối quan hệ trực tiếp giữa giai cấp tư sản với giai cấp công nhân',N'Phân anh mối quan hệ trực tiếp giữa giai cấp tư sản với nhau',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản bất biển là gì ?','',N'Là tư bản mà giá trị của nó được bảo toàn và không thay đổi về lượng',N'Là tư bản lưu động',N'Là tư bản mà giá trị của nó được bảo toàn và không thay đổi về lượng',N'Là tư bản mà giá trị của nó lớn lên trong quá trình sản xuất',N'Là tư bản mà giá trị của nó tăng lên về lượng trong quá trình sản xuất',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lương giá trị mới do lao động tạo ra bao gồm:','',N'v+m',N'cv',N'c+v+m',N'c+m',N'v+m',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tái sản xuất là gi?','',N'Là quá trình sản xuất lập đi lặp lại thường xuyên và phục hồi không ngừng',N'Là quá trình sản xuất lập đi lặp lại thường xuyên và phục hồi không ngừng',N'Là quá trình sản xuất được lặp lại như cũ',N'Là quá trình sản xuất lập lại với quy mô lớn hơn trước',N'Là quá trình sản xuất với quy mô giá trị thặng dư không đổi về lượng',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp sản xuất giá trị thặng dư tuyệt đối là phương pháp','',N'Kéo dài thời gian lao động vượt qua',N'Tăng năng suất lao động',N'Làm cho giá trị sức lao động tăng lên',N'Kéo dài thời gian lao động vượt qua',N'Sử dụng máy móc thiết bị hiện đại, cải tiến tổ chức quản lý',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích tụ tư bản là gì ?','',N'Là tặng quy mô tự bán cá biệt bằng cách tư bản hóa giá trị thăng dư',N'Là tặng quy mô tự bán cá biệt bằng cách tư bản hóa giá trị thăng dư',N'Là tăng quy mô tư bản cá biệt bằng cách hợp nhất những tư bản cá biệt có sẵn trong xã hội',N'Là tăng quy mô tư bản cá biệt mà không làm tăng quy mô tư bản xã hội',N'Là tăng quy mô tư bản xã hội mà không làm tăng quy mô tư bản cả biệt',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tập trung tư bản là gì ?','',N'Là tăng quy mô tư bản cả biệt bằng cách tư ban hóa giá trị thặng dư',N'Là tăng quy mô tư bản cả biệt bằng cách tư ban hóa giá trị thặng dư',N'Là tăng quy mô tư bản cá biệt bằng cách hợp nhất những tư bản cả biệt có sẵn trong xã hội',N'Là tăng quy mô tư ban cá biệt mà không làm tăng quy mô tư bản xã hội',N'Là tăng quy mô tư bản xã hội mà không làm tăng quy mô tư bản cả biệt',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Quy luật kinh tế tuyệt đối của chủ nghĩa tư bản là gì?','',N'Quy luật sản xuất giả trị thăng dư',N'Quy luật sản xuất giả trị thăng dư',N'Quy luật cạnh tranh và cung cầu',N'Quy luật giá trị',N'Quy luật lưu thông tiền tệ',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chu kỳ khủng hoảng kinh tế có mấy giai đoạn?','',N'4 giai đoạn',N'2 giai đoạn',N'3 giai đoạn',N'4 giai đoạn',N'5 giai đoạn',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Học thuyết kinh tế nào của C Mạc được coi là hòn đá tảng?','',N'Học thuyết giá trị thăng dư',N'Học thuyết giá trị lao động',N'Học thuyết giá trị thăng dư',N'Học thuyết tích lũy tư bản',N'Học thuyết tái sản xuất tư bản xã hội',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản khá biển là','',N'Là tư bản mà giá trị của nó lớn lên trong quá trình sản xuất',N'Tư bản mà giá trị của nó chuyển dẫn vào sản phẩm qua khẩu hao',N'Là tư bản cố định',N'Là tư bản mà giá trị của nó lớn lên trong quá trình sản xuất',N'Là tư bản mà giá trị của nó không thay đổi về lượng và được chuyển nguyên vẹn vào sản phẩm',6,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điền vào chỗ trống : Tich tu tu ban-> Thúc đẩy tích tụ tư bản-> Tăng khả năng cạnh tranh -> Thúc đẩy tập trung in ban ->','',N'Tăng quy mô tư bản cả biệt: Cạnh tranh gay gắt',N'Tăng quy mô tư bản cả biệt: Cạnh tranh gay gắt',N'Cạnh tranh gay gắt, Tăng quy mô tư bản xã hội',N'Tăng quy mô tư bản xã hội; Tăng quy mô tư bán cả biệt',N'Cạnh tranh gay gắt, tăng quy mô tư bản cá biệt và tư bản xã hội',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn câu phát biểu đúng','',N'Khi các yếu tố khác không đổi, tỷ suất giá trị thặng dư tăng thì tỷ suất lợi nhuận tăng',N'Khi các yếu tố khác không đổi, tỷ suất giá trị thặng dư tăng thì tỷ suất lợi nhuận giám',N'Khi các yếu tố khác không đổi, tỷ suất giá trị thặng dư tăng thì tỷ suất lợi nhuận tăng',N'Khi nhà tư bản đầu tư thêm máy móc thiết bị, các yếu tố khác không đôi, thì tỷ suất lợi nhuận sẽ tăng lên ngay',N'Tỷ suất giá trị thặng dư và tỷ suất lợi nhuận không có mối quan hệ nào',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn câu phát biểu đúng','',N'Tư bản cố định nhỏ hơn từ biản bắt biểu khai',N'Tư bản cố định lớn hơn tư bản bất biến',N'Tư bản cố định chính là từ bán bất biển',N'Tư bản lưu động nhỏ hơn từ bản khả biển',N'Tư bản cố định nhỏ hơn từ biản bắt biểu khai',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Điển vào chỗ trống: Khi tỷ lệ phân chia khối lượng giá trị thặng dư thành quỹ tích lũy và quỹ tiêu dùng của nhà tư bản không đổi, phụ thuộc vào khối lượng giá trị thặng dư -','',N'Quy mô tích lũy từ bản',N'Quy mô tích lũy từ bản',N'Tỷ suất giá trị thặng dư',N'Tỷ suất lợi nhuận',N'Cấu tạo hữu cơ của tư bản',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thái tư bản nào sau đây không tham gia vào quá trình hình thành tỷ suất lợi nhuận bình quân?','',N'Tư bản cho vay',N'Tư bản công nghiệp',N'Tư bản cho vay',N'Tư bản thương nghiệp',N'Tư ban kinh doanh nông nghiệp',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một xí nghiệp tư bản có 200 công nhân. Ngày lao động của mỗi công nhân là 8g với thời gian lao động tất yếu là 5g. Giá trị thặng dư bình quân do mỗi công nhân tạo ra là 30S. Quý tiến công của xí nghiệp tư bản trong 1 ngày là','',N'10,000',N'24.000',N'60.000',N'10,000',N'12.000',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi tỷ lệ phân chia khối lượng giá trị thặng dư thành quỹ tích lũy và quỹ tiêu dùng của nhà tư bản không dỗi, quy mô tích lũy tư bản phụ thuộc chủ yếu vào một trong các yếu tố sau đây :','',N'Năng suất lao động xã hội',N'Năng suất lao động xã hội',N'Giá cả thị trưởng của các tư liệu sinh hoạt',N'Giá cả thị trường của các tư liệu sản xuất',N'Tỷ suất lợi nhuận binh quân',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một xí nghiệp tư bản có 800 công nhân. Trong một ngày lao động là 8g, mỗi công nhân chi cần ông là đã tạo ra lượng giá trị tương đương với giá trị sức lao động. Thời gian còn lại, một lượng giá trị thăng dư được tạo ra là 20 5. Với cấu tạo hữu cơ của tư bản là C = 3V thì giá trị hàng hóa của xi nghiệp là','',N'208.000',N'48.000',N'96.000',N'208.000',N'62.000',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Biện pháp thực hiện cạnh tranh giữa các ngành','',N'Tư do di chuyển tư bản từ ngành có p thấp sang ngành có nỉ cho',N'Tư do di chuyển tư bản từ ngành có p thấp sang ngành có nỉ cho',N'Cải tiến kỹ thuật sản xuất, nâng cao năng suất lao động',N'Tăng tốc độ chu chuyển tư bản',N'Giảm hao mòn tư bản cố định',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Biện pháp thực hiện cạnh tranh trong nội bộ ngành','',N'Cải tiến kỹ thuật sản xuất, nâng cao năng suất lao động',N'Tự do di chuyển tư ban tử ngành có p thấp sang ngành có p cao',N'Cải tiến kỹ thuật sản xuất, nâng cao năng suất lao động',N'Tăng tốc độ chu chuyển bán',N'Giảm hao mòn tư bản cố định',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các yếu kỳ dưới dây, yếu tố nào thuộc về tư bản khả biến','',N'Máy móc, thiết bị, nhà xương',N'Máy móc, thiết bị, nhà xương',N'Kết cấu hạ tầng sản xuất',N'Tiền lương, tiền thưởng',N'Điện, nước, nguyên liệu',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi các nhà tư bản bán hàng hóa với giả cả cao hơn giá trị thì :','',N'Tổng lợi nhuận bằng tổng giá trị thặng dư',N'Tổng lợi nhuận bằng tổng chỉ phi sản xuất bản chủ nghĩa',N'Tổng lợi nhuận bằng tổng giá trị thặng dư',N'Tổng lợi nhuận lớn hơn tổng giá trị thặng dư',N'Tổng lợi nhuận nhỏ hơn tổng giá trị thặng dư',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ý nghĩa kinh tế của bất đẳng thức: 0<z"<p"','',N'Nhà tư bản cho vay và nhà tư bản di vay đều có lại',N'Nhà tư bản công nghiệp và nhà tư bản thương nghiệp đều có lợi',N'Nhà tư bản kinh doanh nông nghiệp và địa chủ đều có lợi',N'Các cổ dâng (người nắm giữ chứng khoản có giá) đều có lợi',N'Nhà tư bản cho vay và nhà tư bản di vay đều có lại',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nội dung nào sau đây không đúng về giá cả sản xuất (GCSX)?','',N'Sự thay đổi của GCSX phụ thuộc vào sự thay đổi của giá cả thị trường của hàng hóa',N'GCSX K+P',N'GCSX là cơ sở để hình thành giá cả thị trường của hàng hóa',N'GCSX chính giá trị của hàng hóa trải qua quá trình cạnh tranh trong nội bộ ngành',N'Sự thay đổi của GCSX phụ thuộc vào sự thay đổi của giá cả thị trường của hàng hóa',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị thặng dư tương đối và giá trị thặng dư siêu ngạch đều dựa trên cơ sở nào?','',N'Tăng năng suất lao động',N'Tăng năng suất lao động',N'Tăng cường độ lao động',N'Tăng thời gian lao động tất yếu',N'Giảm thời gian lao động thặng dư',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giá trị hàng hóa sức lao động được đo bằng cách nào ?','',N'Giá trị những tư liệu sinh hoạt cần thiết để tái sản xuất ra sức lao động',N'Giá trị những tư liệu sinh hoạt cần thiết để tái sản xuất ra sức lao động',N'Giá trị những tư liệu sản xuất cần thiết để tái sản xuất ra sức lao động',N'Giá trị những tư liệu sinh hoạt và tư liệu sản xuất để tái sản xuất 1 sức lao động',N'Giá trị những tư liệu sinh hoạt và tư liệu sản xuất cần thiết dễ tái sản xuất ra sức lao động',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản cố định và tư bản lưu động thuộc phạm trù tu bản nào?','',N'Tư bản sản xuất',N'Tư bản tiền tệ',N'Tư bản sản xuất',N'Tư bản hàng hóa',N'Tư bản ứng trước',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mục đích trực tiếp của nền sản xuất tư bản chủ nghĩa là:','',N'Tạo ra ngày càng nhiều giá trị thăng dư',N'Sản xuất ra ngày càng nhiều của cải vật chất',N'Mở rộng phạm vi thống trị của quan hệ sản xuất tư bản chủ nghĩa',N'Tạo ra ngày càng nhiều giá trị thăng dư',N'Làm cho lao động ngày càng lệ thuộc vào tư bản',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp sản xuất giá trị thặng dư tuyệt đối có hạn chế gì ?','',N'Năng suất lao động không thay đổi',N'Hạ thấp giá trị sức lao động',N'Thời gian lao động thặng dư không đổi',N'Năng suất lao động không thay đổi',N'Thời gian lao động cần thiết giảm xuống',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong phương pháp sản xuất giá trị thặng dư tuyệt đối, người lao động muốn giam thời gian lao động trong ngày, còn nhà tư bản lại muốn kéo dài thời gian lao động trong ngày. Giới hạn tối thiểu của ngày lao động là bao nhiêu?','',N'Lớn hơn thời gian lao động tất yếu',N'Đủ bủ đắp giá trị sức lao động của công nhân',N'Bằng thời gian lao động cần thiết',N'Do nhà tư ban quy định',N'Lớn hơn thời gian lao động tất yếu',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhân tố nào quyết định trực tiếp tiền công tinh theo sản phẩm ?','',N'Số lượng sản phẩm',N'Định mức sản phẩm',N'Đơn giá sản phẩm',N'Số lượng sản phẩm',N'Công dụng của sản phẩm',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn gốc trực tiếp của tập trung tư bản là:','',N'Tư bản có sẵn trong xã hội',N' Giá trị thặng dư',N'Tư bản có sẵn trong xã hội',N'Tiền tiết kiệm trong dân cư',N'Hiệu quả quản lý của nhà tư bản',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản bất biển (C) và tư bản khu biển (V) có vai trò thể nào trong quá trình sản xuất giá trị thặng dư?','',N'Tư bản bất biến là điều kiện để sản xuất giá trị thặng dư và tư bản khả biến là nguồn uốc của của trị thăng dư',N'Tư bản bắt biến là điều kiện để sản xuất giá trị thặng dư',N'Tư bản khả biến là nguồn gốc của giá trị thặng dư',N'Cả C và V đều có vai trò ngang nhau trong việc tạo ra giá trị thặng dư',N'Tư bản bất biến là điều kiện để sản xuất giá trị thặng dư và tư bản khả biến là nguồn uốc của của trị thăng dư',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản bất biển (C) và tư bản kha biển (V) có vai trò thặng dư Chọn ý không đúng trong các ý kiến dưới đây thể nào trong quá trình sản xuất giá trị?','',N'Cả C và V đều có vai trò ngang nhau trong việc tạo ra giá trị thặng dư',N'Tư bản bất biển là điều kiện để sản xuất giá trị thặng dư',N'Tư bàn khả biển là nguồn gốc của giá trị thặng dư',N'Cả C và V đều có vai trò ngang nhau trong việc tạo ra giá trị thặng dư',N'Tư bản bất biến la diễu kiện dễ sản xuất giá trị thặng dư và tư ban kha biển là nguồn gốc của giá trị thặng dư',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi so sánh sức lao động và lao động, ý kiến nào sau đây không đúng ?','',N'Cả sức lao động và lao động đều là hàng hóa',N'Sức lao động là khả năng lao động, còn lao động là sức lao động đã được tiêu dùng',N'Sức lao động là hàng hòa còn lao động không là hàng hóa',N'Cả sức lao động và lao động đều là hàng hóa',N'Tiền công là giá cả của sức lao động nhưng lại biểu hiện ra bên ngoài thành giả cả của lao động',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhận định nào dưới đây không đúng?','',N'Khi có khối lượng tiền lớn nó sẽ thành tư bản',N'iền tệ là sản vật cuối cùng của lưu thông hàng hóa đồng thời cũng hình thức biểu hiện đầu tiên của tư bản',N'Tư bản được biểu hiện ở tiển, còn bản thân tiền không phải là tư bản',N'Khi có khối lượng tiền lớn nó sẽ thành tư bản',N'Tiền biến thành tư bản khi nó được sử dụng để bóc lột lao động của người khác',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm nào dưới đây không thuộc về phương pháp sản xuất giá trị thặng dư tương đối','',N'Giá trị sing lao động không đổi',N'Ngày lao động không đổi',N'Giá trị sing lao động không đổi',N'Hạ thấp giá trị sức lao động',N'Tỷ suất giá trị thặng dư thay đổi',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nhận xét nào dưới đây không đúng về ty suất giá trị thặng dư " Tỷ suất giá trị thặng dư phản ánh :','',N'Mức doanh lợi của việc đầu tư tư bản',N'Trình độ bóc lột của tư bản đối với lao động làm thuê',N'Mức doanh lợi của việc đầu tư tư bản',N'Ngảy lao động chia thành 2 phần: lao động cần thiết và lao động thăng dư theo tỷ lệ nào',N'Tổng số giá trị mới do sức lao động tạo ra thì công nhận được nhận bao nhiêu, nhà tư bản chiếm đoạt bao nhiêu',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tích tụ tư bản','',N'Làm tăng quy mô tư bún cá biệt và tư bản xã hội',N'Là sự hợp nhất một số tư bản nhỏ thành một tư bản cả biệt lớn',N'Làm tăng quy mô tư bún cá biệt và tư bản xã hội',N'Làm tăng quy mô tư bản cả biệt, giảm quy mô tư bản xã hội',N'Làm lãng quy mô tư bản cả biệt, quy mô tư bản xã hội không đối',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Một xí nghiệp tư bản có 300 công nhân. Ngày lao động của mỗi công nhãn trong xỉ nghiệp là 8 giờ, trong đó, thời gian lao động bù đắp sức lao động đã hao phi là 5 giờ. Trong thời gian còn lại của ngày lao động, mỗi công nhân tạo ra một lượng giả trị thặng dư là 600$. Giá trị mới mà xi nghiệp tạo ra trong một ngày là','',N'480.000',N'560.000',N'480.000',N'800.000',N'720.000',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Vai trò của máy móc thiết bị trong quá trình sản xuất giá trị thặng dư','',N'Là tiền đề vật chất cho việc tạo ra thăng dư',N'Là nguồn gốc trực tiếp tạo ra thặng dư',N'Là tiền đề vật chất cho việc tạo ra thặng dư',N'Cùng với sức lao động tạo ra thặng dư',N'Là yếu tố có thể thay thế hoàn toàn sức lao động trong việc tạo ra giá trị thặng dư',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn câu phát biểu đúng','',N'Giá trị thăng dir siêu ngạch dura trên cơ sở tăng năng suất lao động cá biệt, giá trị thăng du tương đối dựa trên cơ sở tăng năng suất lao động xã hội',N'Giá trị thặng dư siêu ngạch dựa trên cơ sở lăng năng suất lao động xã hội, giá trị tương đối dựa trên cơ sở tăng năng suất lao động cá biệt',N'Giá trị thăng dir siêu ngạch dura trên cơ sở tăng năng suất lao động cá biệt, giá trị thăng du tương đối dựa trên cơ sở tăng năng suất lao động xã hội',N'Giá trị thặng dư siêu ngạch dựa trên cơ sở kéo dài ngày lao động, giá trị thặng dư tương đối dựa trên cơ sở tăng năng suất lao động xã hội',N'Giá trị thặng dư siêu ngạch dựa trên cơ sở kéo dài ngày lao động, giá trị thặng dư tương đối dựa trên cơ sở tăng cường độ lao động xã hội',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hàng hóa sức lao động và hàng hóa thông thưởng khác nhau cơ bản nhất ở:','',N'Giá trị sử dụng của chúng',N'Giá trị của chúng',N'Giá trị sử dụng của chúng',N'Việc mua bán chúng',N'Việc trao dồi chúng',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp sản xuất giá trị thặng dư tuyệt đối và phương pháp sản xuất giá trị thặng dư tương đối có điểm nào giống nhau ?','',N'Đều làm tăng tỷ suất giả trị thông dư',N'Đều làm cho công nhân tốn sức lao động nhiều hơn',N'Đều làm tăng tỷ suất giả trị thông dư',N'Đều làm giảm giá trị sức lao động của công nhân',N'Đều phải sử dụng kỹ thuật tiên tiến, cải tiến tổ chức quản lý',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sự phân chia lợi nhuận của các nhà tư ban căn cứ vào đầu:','',N'Tỷ suất lợi nhuận bình quân',N'Giá cả thị trưởng của hàng hóa',N'Tỷ suất lợi nhuận bình quân',N'Chi phí sản xuất tư bản chủ nghĩa',N'Năng suất lao động cả biệt',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Phương pháp sản xuất giả trị thặng dư bằng cách tăng cường độ lao động là phương pháp sản xuất giá trị đúng','',N'Tuyệt đối',N'Tuyệt đối',N'Tương đối',N'Siêu ngạch',N'Vừa tương đối, vừa siêu ngạch',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Căn cứ vào đầu để chia ra thành tái sản xuất giản đơn và tái sản xuất mở rộng','',N'Căn cứ vào quy mô',N'Căn cứ vào phạm vi',N'Căn cứ vào quy mô',N'Căn cứ vào tính chất',N'Căn cứ vào nội dung',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi nào tiền tệ biến thành tư bản','',N'khi có lương tiền dù lớn và dùng tiền đầu tư vào sản xuất kinh doanh',N'Khi có lượng tiền đủ lớn',N'Khi sức lao động trở thành hàng hóa',N'khi có lương tiền dù lớn và dùng tiền đầu tư vào sản xuất kinh doanh',N'Khi dùng tiền để mua rẻ, bản đắt và sức lao động trở thành hàng hóa',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn ý đúng trong các ý sau đây','',N'Lao động của mọi người sản xuất hàng hóa đều có lao động cụ thể và lao động trừu tượng',N'Lao động của người kỹ sư có trình độ cao thuần túy là lao động trừu tượng',N'Lao động của người không qua đào tạo chỉ là lao động cụ thể',N'Lao động của mọi người sản xuất hàng hóa đều có lao động cụ thể và lao động trừu tượng',N'Lao động trải qua đào tạo, huấn luyện là lao động trừu tượng',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các cách diễn đạt dưới đây, ý nào diễn đạt sai ?','',N'Cả tích tu và tập trung tư bản đều phản ánh mối quan hệ trực tiếp giữa các nhà tư bản với nhau',N'Tích tụ tư bản làm cho cạnh tranh gay gắt hơn dẫn đến tập trung tư bản nhanh hơn',N'Tập trung tư bản tạo điều kiện tăng cường bóc lột giá trị thặng dư nên đẩy nhanh tích tụ tư bản',N'Cả tích tụ và tập trung tư bản đều thúc đẩy quá trình tích lũy tư bản',N'Cả tích tu và tập trung tư bản đều phản ánh mối quan hệ trực tiếp giữa các nhà tư bản với nhau',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Thời gian chu chuyển của tư bản gồm thời gian sản xuất và thời gian lưu thông Thời gian sản xuất không bao gồm ?','',N'Thời gian tiêu thu hàng hóa',N'Thời gian lao động',N'Thời gian tiêu thu hàng hóa',N'Thời gian dự trữ sản xuất',N'Thời gian gián đoạn lao động',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Ý kiến nào dưới đây là sai','',N'Tích lũy cơ bản đó là sự tiết kiệm của nhà tư bản',N'Tích lũy tư bản là biển một phần giá trị thặng dư thanh tư bản',N'Nguồn gốc của tích lũy tư ban là gái trị thặng dư',N'Động cơ của tích lũy tư bản là giá trị thặng dư',N'Tích lũy cơ bản đó là sự tiết kiệm của nhà tư bản',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Loại tái sản xuất nào làm tăng sản phẩm chủ yếu do tăng năng suất lao động và hiệu quả sử dụng các nguồn lực ?','',N'Tái sản xuất mở rộng',N'Tái sản xuất giản đơn',N'Tái sản xuất mở rộng',N'Tái sản xuất phức tạp',N'Tái sản xuất sức lao động',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Sự phân phối giá trị thặng dư giữa tư bản công nghiệp và tư ban thương nghiệp tuần theo quy luật','',N'Tỷ suất lợi nhuận bình quân',N'Tỷ suất lợi nhuận',N'Tỷ suất giá trị thặng dư',N'Tỷ suất lợi nhuận bình quân',N'Giá cả thị trưởng của hàng hóa',6,N'Đã duyệt','MC003','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lợi tức là giả cả của','',N'Quyền sử dụng tư bản',N'Quyền sở hữu các chứng khoán có giá',N'Quyền sở hữu tư liệu sản xuất chủ yếu',N'Quyền kinh doanh tư bản',N'Quyền sử dụng tư bản',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lợi nhuận thương nghiệp, lợi nhuận ngân hàng, lợi tức, địa tô là','',N'Các hình thức biểu hiện của gia tri thăng dư',N'Các hình thức cụ thể của lợi nhuận binh quân',N'Các hình thức biểu hiện của gia tri thăng dư',N'Các bộ phận cấu thành của tổng tư bản xã hội',N'Các bộ phận cấu thành của thu nhập quốc dân',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Khi có những rủi ro xảy ra, nhà tư bản phải bán hàng hóa với giá cả thấp hơn chi phí sản xuất tư bản chủ nghĩa, trong trường hợp này','',N'Sự sản xuất giá trị thăng du vẫn tồn tại vì giá trị thặng dự đã được tạo ra trong sản xuất',N'Không tồn tại sự sản xuất giá trị thặng dư vị nhà tư bản đã bị lỗ vốn',N'Nhà tư bản sản xuất giá trị thặng dư nhiều hơn để bù vào khoản thua lỗ trước kia',N'Sự sản xuất giá trị thăng du vẫn tồn tại vì giá trị thặng dự đã được tạo ra trong sản xuất',N'Chưa đủ cơ sở để kết luận',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thái tư bản nào sau dãy chứa dụng hoạt động san xuất giá trị thặng dư:','',N'Tư bản sản xuất',N'Tư bán hàng hóa',N'Tư bản tiền tệ',N'Tư bản sản xuất',N'Cả ba hình thái tư bạn trên đều không tạo ra giá trị thặng dư',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Đặc điểm của tư bản cố định:','',N'Chuyển giả trị ting phần một vào sản phẩm mới trong nhiều chu kỳ sản xuất dưới dạng khẩu bao',N'Chuyển toàn bộ giả trị một lần duy nhất trong một chu kỳ sản xuất kinh doanh vào sản phẩm mới',N'Chuyển giả trị ting phần một vào sản phẩm mới trong nhiều chu kỳ sản xuất dưới dạng khẩu bao',N'Không có sự thay đổi về lượng trong quá trình sản xuất',N'Là nguồn gốc của giá trị thặng dư',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên nhân chủ yếu trực tiếp của nạn nhân khẩu thừa tương đối','',N'Cấu tạo hữu cơ của tư bản tăng lên trong quá trình tích lũy',N'Cấu tạo hữu cơ của tư bản tăng lên trong quá trình tích lũy',N'Sự tập trung tư bùn tăng lên trong quá trình tích lũy tư bản',N'Tỷ suất lợi nhuận tăng lên trong quá trình tích lũy tư ban',N'Tỷ suất giá trị tăng lên',6,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Biểu hiện chủ yếu của chủ nghĩa tư bản độc quyền nhà nước là','',N'Sự kết hợp về nhân sự giữa nhà nước tư sản với các tổ chức độc quyền tư nhân',N'Sự kết hợp về nhân sự giữa nhà nước tư sản với các tổ chức độc quyền tư nhân',N'Xuất khẩu tư bản chuyển tử nước tư bản phát triển sang các nước chậm phát triển',N'Sự xuất hiện của tư bản tài chính',N'Sự phát triển mạnh của các tổ chức độc quyền trong ngân hàng',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tư bản tài chính là sự hợp nhất của','',N'Tư bản độc quyền công nghiệp với tư bản độc quyển ngân hàng',N'Tư bản độc quyền công nghiệp với tư bản cho vay',N'Tư bản độc quyền công nghiệp với tư bản độc quyển ngân hàng',N'Tư ban kinh doanh nông nghiệp với tư ban độc quyền ngân hàng',N'Tư bản độc quyền công nghiệp với tư bản',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguồn gốc của lợi nhuận độc quyền thương nghiệp','',N'Sự tổng hơn của các nguồn',N'Giá trị thặng dư do công nhân trong các xi nghiệp độc quyền và xi nghiệp không độc quyền tạo ra',N'Phần bóc lột được của những người sản xuất nhỏ',N'Phần bóc lột nhân dân lao động ở các nước chậm phát triển',N'Sự tổng hơn của các nguồn',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thức liên kết nào sau đây của các tổ chức độc quyền có trình độ cao và quy mô lớn nhất','',N'Công xodc xi-om',N'Công xodc xi-om',N'To-rot',N'Các-ten',N'Xanh-di-ca',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Nguyên nhân cơ bản của sự hình thành chủ nghĩa tư bản độc quyền','',N'Sự tích tu và tập trung to bản',N'Sự tích tu và tập trung to bản',N'Sự xuất hiện của những ngành sản xuất mới',N'Sự cạnh tranh khốc liệt của các công ty tư bản',N'Do khủng hoang kinh tế',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hạn chế cơ bản nhất của chủ nghĩa tư bản :','',N'Mâu thuẫn giữa trịnh độ xã hội hóa cao của lực lượng sản xuất với quan hệ sở hữu tư nhân tư bản chủ nghĩa về tư liệu sản xuất',N'Mâu thuẫn gay gắt giữa giai cấp tư sản với giai cấp vô sản không thể điều hòa được',N'Mâu thuẫn giữa trịnh độ xã hội hóa cao của lực lượng sản xuất với quan hệ sở hữu tư nhân tư bản chủ nghĩa về tư liệu sản xuất',N'Gây ra những cuộc chiến tranh đẫm máu trên thế giới',N'Sự phân hóa giàu nghèo ngày càng sâu sắc',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hình thức xuất khẩu chủ yếu của chủ nghĩa tư ban hiện nay là :','',N'Xuất khẩu tư bản kết hợp với xuất khẩu hàng hóa',N'Đầu tư trực tiếp kết hợp với đầu tư gián tiếp',N'Xuất khẩu tư bản kết hợp với xuất khẩu hàng hóa',N'Đầu tư trực tiếp',N'Đầu tư giản tiếp',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Xuất khẩu tư bản là đặc điểm cơ bản của :','',N'Chủ nghĩa tư bản độc quyền',N'Mọi nền kinh tế thị trường',N'Chủ nghĩa tư bản tự do cạnh tranh',N'Chủ nghĩa tư bản độc quyền',N'Chủ nghĩa tư bản độc quyền nhà nước',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn phát biểu đúng về cạnh tranh trong chủ nghĩa tư bản độc quyển :','',N'Cạnh tranh trong chủ nghĩa tư bản độc quyền quy gắt hơn trong nghiền từ bản do cạnh tranh',N'Độc quyền thụ tiểu cạnh tranh',N'Cạnh tranh trong chủ nghĩa tư bản độc quyền quy gắt hơn trong nghiền từ bản do cạnh tranh',N'Mức độ cạnh tranh trong chủ nghĩa tư bản độc quyển giảm',N'Cạnh tranh trong chủ nghĩa tư bản độc quyền không có sự thay đổi so với trọng chủ nghĩa tư bản tự do cạnh tranh',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hoạt động của quy luật giả trị thặng dư trong chủ nghĩa tư bản độc quyển biểu hiện thành quy luật:','',N'Lợi nhuận độc quyền cao',N'Tỷ suất lợi nhuận binh quân',N'Lợi nhuận độc quyền cao',N'Giả cả độc quyền',N'Giá cả sản xuất',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hoạt động của quy luật giá trị trong chủ nghĩa tư bản độc quyền biểu hiện thành quy luật','',N'Giá cả độc quyền',N'Tỷ suất lợi nhuận bình quân',N'Lợi nhuận độc quyền cao',N'Giá cả độc quyền',N'Giá cả sản xuất',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hoạt động của quy luật giá trị thặng dư trong chủ nghĩa tư ban tự do cạnh tranh biểu hiện thành quy luật :','',N'Tỷ suất lợi nhuận bình quân',N'Tỷ suất lợi nhuận bình quân',N'Lợi nhuận độc quyền cao',N'Giá cả độc quyền',N'Giá cả sản xuất',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Hoạt động của quy luật giá trị trong chủ nghĩa tư bản tự do cạnh tranh biểu hiện thành quy luật','',N'Giá cả sản xuất',N'Tỷ suất lợi nhuận binh quân',N'Lợi nhuận độc quyền cao',N'Giá cả độc quyền',N'Giá cả sản xuất',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Lĩnh vực diều chỉnh căn bản của chủ nghĩa tư bản trong thời đại ngày nay là','',N'Sở hữu tư liệu sản xuất',N'Sở hữu tư liệu sản xuất',N'Quản lý hoạt động sản xuất kinh doanh',N'Phân phối lợi nhuận giữa các hình thái tư bản',N'Lĩnh vực xuất khẩu tư bản',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Mục đích của xuất khẩu tư bản là','',N'Chiếm đoạt giá trị thăng du và các nguồn lợi khác ở nước nhập khẩu tư bản',N'Chiếm đoạt giá trị thăng du và các nguồn lợi khác ở nước nhập khẩu tư bản',N'Để giải quyết nguồn tư ban “thừa” trong nước',N'Giúp dỡ các nước nhập khẩu tư bản phát triển',N'Chiếm các nguồn lợi khác của nước nhập khẩu tư bản',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Những thành tựu chủ nghĩa tư bản trong sự vận động đầy mâu thuẫn thành hai xu hướng vận động trái ngược nhau, đó là :','',N'Xu hướng phát triển nhanh và xu hướng trì trệ',N'Xu hướng tập trung hóa và phi tập trung hóa',N'Xu hưởng liên kết và không liên kết',N'Xu hướng hợp tác và đấu tranh',N'Xu hướng phát triển nhanh và xu hướng trì trệ',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Các hình thức chiến tranh thương mại, chiến tranh sắc tộc, tôn giáo là hình thức mới của:','',N'Sự phân chia thế giới giữa các cường quốc đế quốc',N'Sự phân chia thế giới giữa các cường quốc đế quốc',N'Sự phân chia thế giới về mặt kinh tế giữa các liên minh của chủ nghĩa tư bản',N'Xuất khẩu tư bản',N'Tập trung sản xuất và các hình thức độc quyền',7,N'Đã duyệt','MC001','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Suy cho cùng, nguyên nhân của sự chuyển biển tử chủ nghĩa tư ban tự do cạnh tranh sang chủ nghĩa tư bản độc quyền là','',N'Trình độ phát triển của lực lượng sản xuất',N'Mâu thuẫn giai cấp đối kháng gay gắt đến mức không thể điều hòa được',N'Sự phân hóa giàu nghèo trong xã hội tư bản',N'Trình độ phát triển của lực lượng sản xuất',N'Sự lạc hậu của quan hệ sản xuất tư bản chủ nghĩa',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Tương quan so sánh giữa tổng lợi nhuận và tổng giá trị thặng dư trong chủ nghĩa tư bản độc quyền là','',N'Tổng lợi nhuận bằng tổng giá trị thặng dư',N'Tổng lợi nhuận bằng tổng giá trị thặng dư',N'Tổng lợi nhuận lớn hơn tổng giả trị thặng dư',N'Tổng lợi nhuận nhỏ hơn tổng giá trị thặng dư',N'Chưa thể kết luận',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chọn câu phát biểu đúng về chủ nghĩa tư bản độc quyển nhà nước :','',N'Một trong những nguyên nhân làm xuất hiện chủ nghĩa tư bản độc quyền nhà nước là mâu thuẫn gay gắt giữa giai cấp tư sản với giai cấp vô sản',N'Chủ nghĩa tư bản độc quyền nhà nước là một phương thức sản xuất của xã hội loài người',N'Một trong những nguyên nhân làm xuất hiện chủ nghĩa tư bản độc quyền nhà nước là mâu thuẫn gay gắt giữa giai cấp tư sản với giai cấp vô sản',N'Một trong những nguyên nhân làm xuất hiện chủ nghĩa tư bản độc quyền nhà nước là sự cạnh tranh gay gắt giữa các xí nghiệp tư bản có quy mô lớn',N'Tất cả đều sai',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Những thành tựu to lớn nhất của chủ nghĩa tư bản xét về mặt lực lượng sản xuất là','',N'Làm cho lực lượng sản xuất phát triển mạnh mẽ với trình đô kỹ thuật và công nghệ ngày càng cao',N'Thiết lập nền dân chủ tư sản',N'Giải phỏng xã hội loài người khỏi “đêm trưởng trung cổ" của xã hội phong kiến',N'Tạo tiền để cho sự ra đời của hình thái kinh tế xã hội cao hơn – xã hội cộng sản chủ nghĩa',N'Làm cho lực lượng sản xuất phát triển mạnh mẽ với trình đô kỹ thuật và công nghệ ngày càng cao',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong chủ nghĩa tư ban ngày nay, xuất khẩu từ bản có xu hướng :','',N'Di chuyển giữa các nước tư bản phát triển với nhau',N'Chuyển từ đầu tư trực tiếp sang đầu tư giản tiếp',N'Di chuyển giữa các nước tư bản phát triển với nhau',N'Chuyển từ các nước tư bản phát triển sang các nước dạng và chậm phát triển',N'Đầu tư vào những ngành nghề thâm dụng lao động và tài nguyên',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Vì sao trong chủ nghĩa tư bản độc quyển, cạnh tranh không bị thủ tiêu?','',N'Vị cạnh tranh là quy luật khách quan của kinh tế hàng hóa',N'Vì tổ chức độc quyền cạnh tranh với các công ty ngoài dộc quyền',N'Vì các tổ chức độc quyền cạnh tranh với nhau',N'Vị cạnh tranh là quy luật khách quan của kinh tế hàng hóa',N'Vì xi nghiệp trong nội bộ tổ chức độc quyền cạnh tranh với nhau',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Chủ nghĩa tư ban độc quyển là ','',N'Giai đoạn phát triển cao của chủ nghĩa tư bản',N'Giai đoạn phát triển cao của chủ nghĩa tư bản',N'Một phương thức sản xuất mới',N'Một hình thái kinh tế xã hội mới',N'Một chế độ xã hội',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'“Chế đô tham dự", “chế dộ ủy nhiệm" là hình thức tổ chức của -','',N'Tư bản tài chính',N'Các tổ chức độc quyền công nghiệp',N'Tư bản tài chính',N'Các tổ chức độc quyền ngân hàng',N'Nhà nước tư sản trong giai đoạn chủ nghĩa tư ban độc quyển',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Trong các hình thức liên kết sau đây của chủ nghĩa tư bản độc quyền, hình thức nào dễ bị tan rã nhất','',N'Các-tel',N'Các-tel',N'To-rot',N'Công-xoóc-xi-om',N'Xanh-di-ca',7,N'Đã duyệt','MC002','NHCH001')
INSERT INTO CAUHOI (NOIDUNGCH,HINH,DAPAN,A,B,C,D,CHUONG,TTrang,ID_MUCDO,ID_NHCH)
VALUES (N'Giới hạn của chủ nghĩa tư ban là do','',N'Mâu thuẫn giữa trình đô xã hội hóa cao của lực lượng sản xuất với quan hệ sở hữu tư nhân tư bản chủ nghĩa về tư liệu sản xuất',N'Mâu thuẫn gay gắt giữa giai cấp tư sản với giai cấp vô sản không thể điều hòa được',N'Mâu thuẫn giữa trình đô xã hội hóa cao của lực lượng sản xuất với quan hệ sở hữu tư nhân tư bản chủ nghĩa về tư liệu sản xuất',N'Gây ra những cuộc chiến tranh đẫm máu trên thế giới',N'Sự phân hóa giàu nghèo ngày càng sâu sắc',7,N'Đã duyệt','MC002','NHCH001')



INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN001', N'Quản lý Sinh Vien')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN002', N'Soạn NHCH')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN003', N'Ngân Hàng Câu Hỏi')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN004', N'Tạo Đợt Thi')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN005', N'Chức Vụ')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN006', N'Phân Quyền')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN007', N'Thống Kê')
INSERT [dbo].[MANHINH] ([ID_MANHINH], [TENMANHINH]) VALUES (N'MHN008', N'Tham Gia Thi')

INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU001', N'MHN003', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU001', N'MHN007', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU003', N'MHN002', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU004', N'MHN003', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU004', N'MHN004', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU004', N'MHN007', 1)
INSERT [dbo].[PHANQUYEN] ([ID_CVU], [ID_MANHINH], [COQUYEN]) VALUES (N'CVU004', N'MHN008', 1)

INSERT [dbo].[GIANGVIEN] ([ID_GVIEN], [PASSGV], [TENGV], [HINHGV], [NAMSINH], [GIOITINH], [CHUYENMON], [TDHOCVAN], [ID_KHOA]) VALUES (N'2021120089', N'123', N'Nguyễn Văn Hiếu', NULL, NULL, N'Nam', NULL, NULL, N'KH001')
INSERT [dbo].[GVIENCHUCVU] ([ID_CVU], [ID_GVIEN]) VALUES (N'CVU004', N'2021120089')

CREATE TABLE CTBAITHI
(
	ID_CTBAITHI int NOT NULL,
	ID_BAITHI char(6) NOT NULL,
	ID_CTDETHI int NOT NULL,
	DapAn nvarchar (MAX),
    PRIMARY KEY(ID_CTBAITHI,ID_BAITHI),
	CONSTRAINT FK_CTBAITHI_BAITHI FOREIGN KEY (ID_BAITHI) REFERENCES BAITHI(ID_BAITHI)
)
GO
CREATE TABLE TIETHOC
(
	TIETHOC int NOT NULL PRIMARY KEY,
	TGIANHOC nchar(10) NULL,
)
GO
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (1, N'7:00')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (2, N'7:45')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (3, N'8:35')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (4, N'9:30')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (5, N'10:15')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (6, N'11:00')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (7, N'12:30')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (8, N'13:15')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (9, N'14:05')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (10, N'15:00')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (11, N'15:45')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (12, N'16:30')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (13, N'18:00')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (14, N'18:45')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (15, N'19:45')
INSERT [dbo].[TIETHOC] ([TIETHOC], [TGIANHOC]) VALUES (16, N'20:30')
GO

CREATE TABLE GVCOITHI
(
	ID_GVIEN char(10) not null,
	ID_PHONGTHI char(4) not null,
	ID_LICHTHI char(11) not null,
	QUYEN INT,
	CONSTRAINT PK_GVCOITHI PRIMARY KEY(ID_GVIEN,ID_PHONGTHI,ID_LICHTHI),
	CONSTRAINT FK_GVCOITHI_GVIEN FOREIGN KEY (ID_GVIEN) REFERENCES GIANGVIEN(ID_GVIEN),
	CONSTRAINT FK_GVCOITHI_PHONGTHI FOREIGN KEY (ID_PHONGTHI) REFERENCES PHONGTHI(ID_PHONGTHI),
	CONSTRAINT FK_GVCOITHI_LICHTHI FOREIGN KEY (ID_LICHTHI) REFERENCES LICHTHI(ID_LICHTHI)
)
GO