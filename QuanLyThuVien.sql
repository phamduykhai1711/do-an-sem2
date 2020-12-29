CREATE DATABASE QuanLyThuVien
go
USE QuanLyThuVien
go
CREATE TABLE SinhVien(
	maThe int identity primary key,
	hoTen nvarchar(100),
	ngaySinh date,
	gioiTinh bit,
	lop nvarchar(10),
	khoa nvarchar(50),
	diaChi nvarchar(200),
	sdt varchar(20),
	ngayCap date,
	ngayHetHan date
)
go

CREATE TABLE NhanVien(
	maNV int identity primary key,
	tenNV nvarchar(100),
	ngaySinh date,
	gioiTinh bit,
	sdt varchar(20),
	diaChi nvarchar(200),
	soCMT varchar(30),
	chucVu nvarchar(50),
	tenDangNhap varchar(100),
	matKhau varchar(50)
)
go

CREATE TABLE ViPham(
	maSach int primary key,
	ndViPham nvarchar(200),
	htXuPhat nvarchar(200),
	mucPhat float,
	maThe int foreign key references SinhVien(maThe)
)
go

CREATE TABLE LoaiSach(
	maLoaiSach int identity primary key,
	tenLoaiSach nvarchar(100)
)
go

CREATE TABLE ViTri(
	maViTri int identity primary key,
	tenViTri nvarchar(100)
)
go

CREATE TABLE Sach(
	maSach int identity primary key,
	maLoaiSach int foreign key references LoaiSach(maLoaiSach),
	maViTri int foreign key references ViTri(maViTri),
	tenSach nvarchar(100),
	tacGia nvarchar(100),
	nxb nvarchar(100),
	tinhTrang nvarchar(50),
	namXB int,
	giaSach float
)
go

CREATE TABLE MuonTra(
	maThe int foreign key references SinhVien(maThe),
	maSach int foreign key references Sach(maSach),
	maNV int foreign key references NhanVien(maNV),
	tenSach nvarchar(100),
	tenDG nvarchar(100),
	ngayMuon date,
	ngayHenTra date,
	ngayTra date
)
go

CREATE TABLE NXB(
	maNXB int identity primary key,
	tenNXB nvarchar(100)
)
go

CREATE TABLE Sach_NXB(
	maSach int foreign key references Sach(maSach),
	maNXB int foreign key references NXB(maNXB)
)
go

CREATE TABLE TacGia(
	maTG int identity primary key,
	tenTG nvarchar(100),
	sdt varchar(20)
)
go

CREATE TABLE Sach_TG(
	maSach int foreign key references Sach(maSach),
	maTG int foreign key references TacGia(maTG)
)
go

CREATE TABLE ThanhLySach(
	maSach int foreign key references Sach(maSach),
	maThanhLy int identity primary key,
	tenSach nvarchar(100),
	ngayThanhLy date,
	lyDo nvarchar(200)
)
