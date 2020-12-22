


create table tbl_tinhthanh(
	IdTinhthanh int auto_increment primary key,
    Tentinhthanh varchar(255) not null unique
);
alter table tbl_tinhthanh modify Tentinhthanh varchar(255) not null unique;
insert into tbl_tinhthanh (Tentinhthanh) values ('An Giang'),('Bà Rịa - Vũng Tàu'),('Bắc Giang'),('Bắc Kạn'),('Bạc Liêu'),('Bắc Ninh'),('Bến Tre'),('Bình Định'),('Bình Dương'),('Bình Phước'),('Bình Thuận'),('Cà Mau'),('Cao Bằng'),('Cần Thơ'),('Đà Nẵng'),('Đắk Lắk'),('Đắk Nông'),('Điện Biên'),('Đồng Nai'),('Đồng Tháp'),('Gia Lai'),('Hà Giang'),('Hà Nam'),('Hà Nội'),('Hà Tĩnh'),('Hải Dương'),('Hải Phòng'),('Hậu Giang'),('Hòa Bình'),('TP.Hồ Chí Minh'),('Hưng Yên'),('Khánh Hòa'),('Kiên Giang'),('Kon Tum'),('Lai Châu'),('Lâm Đồng'),('Lạng Sơn'),('Lào Cai'),('Long An'),('Nam Định'),('Nghệ An'),('Ninh Bình'),('Ninh Thuận'),('Phú Thọ'),('Phú Yên'),('Quảng Bình'),('Quảng Nam'),('Quảng Ngãi'),('Quảng Ninh'),('Quảng Trị'),('Sóc Trăng'),('Sơn La'),('Tây Ninh'),('Thái Bình'),('Thái Nguyên'),('Thanh Hóa'),('Thừa Thiên Huế'),('Tiền Giang'),('Trà Vinh'),('Tuyên Quang'),('Vĩnh Long'),('Vĩnh Phúc'),('Yên Bái');
create table tbl_diadiem (
	IdDiadiem int auto_increment primary key,
    Tenquan varchar(255) not null, 
	Diachiquan varchar(255) not null,
	IdTinhthanh int not null,
	Thoigianmocua time default null,
    Thoigiandongcua time default null,
	Giaban varchar(255),
    foreign key (IdTinhthanh) references tbl_tinhthanh(IdTinhthanh)
);
create table tbl_baivietdiem(
	IdBaiviet int not null,
	IdDiadiem int not null,
    foreign key (IdBaiviet) references tbl_baiviet(IdBaiviet),
    foreign key (IdDiadiem) references tbl_Diadiem(IdDiadiem),
    primary key (IdBaiviet, IdDiadiem)
);
alter table tbl_baiviet drop column Tenquan;
alter table tbl_baiviet drop column Diemdanhgia;
alter table tbl_baiviet drop column Diachiquan;
alter table tbl_baiviet drop column DiaDiem;
alter table tbl_baiviet drop column Thoigianmocua;
alter table tbl_baiviet drop column Giaban;
alter table tbl_baiviet add column IdDiadiem int;
alter table tbl_baiviet add column Diemdanhgia int;
alter table tbl_baiviet add foreign key (IdDiadiem) references tbl_Diadiem(IdDiadiem);

insert into tbl_diadiem (Tenquan,Diachiquan,IdTinhthanh,Thoigianmocua,Thoigiandongcua,Giaban) values
('Mapiness Coffee','345/3 Nguyễn Đình Chiểu, P. 5, Quận 3, TP. HCM',30,'8:30','22:00','30k đến 50k'),
('Hẻm đồ ăn vặt','76 Hai Bà Trưng ,Q1, TPHCM',30,'14','23',''),
('Hải sản Hàng Dương','Chợ Hàng Dương',30,'','',''),
('Here Coffee','78 Bùi Viện',30,'','',''),
('Chu’s Coffee',' 561 Điện Biên Phủ, Phường 25, Quận Bình Thạnh',30,'7:00','21:00',''),
('Là Việt Coffee Saigon','57A Tú Xương, Phường 7, Quận 3',30,'7:00','22:00',''),
('Cơm Tấm đêm CuBo','122 Nguyễn Cư Trinh, Phường Nguyễn Cư Trinh, Quận 1',30,'18:00','23:59','45k'),
('Há cảo Ngọc Lan','500 Vĩnh Viễn quận 10',30,'','','30k'),
('Mr.Pad Thái','87/27 Hồ Thị Kỷ, Phường 1, Quận 10 ',30,'','',''),
('sitooterie - coffee & stories','35, 2 Đường Khởi Nghĩa Bắc Sơn, Phường 10',36,'','',''),
('Quán hoa sữa','64 Tăng Bạt Hổ',36,'16:00','22:00','5,000đ - 20,000đ'),
('Nộm Nguyệt','19 Hàm Long',24,'10:00','19:30','40k-70k/người'),
('Aeon Mall Hà Đông','Khu dân cư Hoàng Văn Thụ, Quận Hà Đông',24,'','',''),
('ROSETTA KAFE & CHILL','158 Xuân Diệu, Phường Quảng An, Quận Hồ Tây',24,'','','38k - 80k');

insert into tbl_baivietdiem (IdBaiviet,IdDiadiem) values
(11,1),(12,2),(13,3),
(14,4),(15,5),(16,6),
(21,7),(22,8),(23,9),
(24,10),(25,11),(26,12),
(27,13),(28,14);

drop procedure if exists Sp_Timbaiviet;
delimiter //
CREATE PROCEDURE Sp_Timbaiviet (in id varchar(255), in tag varchar(255))
begin
    if (id = '' and tag = '') then
		drop temporary table if exists temp_timbaiviet;
		create temporary table if not exists temp_timbaiviet as (
        select 
			bv.Idbaiviet as Id,
			bv.Noidung as content,
			bv.Soluotxem as views,
			bv.Trangthaibaiviet as post_status,
			bv.Dachinhsua as edited,
			bv.Ngaydangbaiviet as post_time,
			bv.Tieudebaiviet as title,
			bv.soluotthich as like_count,
			bv.hinhmacdinh as featured_img,
			bv.Tentaikhoan as username,
			bv.IdDiadiem as place_id,
			bv.Diemdanhgia as review_point,
			dd.Tenquan as place_name,
			dd.Diachiquan as place_address,
			tt.Tentinhthanh as place_city,
			dd.Thoigianmocua as place_open_time,
			dd.Thoigiandongcua as place_close_time,
			dd.Giaban as place_price
		from tbl_baiviet bv
		left join tbl_baivietdiem bvd on bv.Idbaiviet = bvd.Idbaiviet
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
		group by bv.Idbaiviet);
	elseif (id = '') then
		drop temporary table if exists temp_timbaiviet;
		create temporary table if not exists temp_timbaiviet as (
        select 
			bv.Idbaiviet as Id,
			bv.Noidung as content,
			bv.Soluotxem as views,
			bv.Trangthaibaiviet as post_status,
			bv.Dachinhsua as edited,
			bv.Ngaydangbaiviet as post_time,
			bv.Tieudebaiviet as title,
			bv.soluotthich as like_count,
			bv.hinhmacdinh as featured_img,
			bv.Tentaikhoan as username,
			bv.IdDiadiem as place_id,
			bv.Diemdanhgia as review_point,
			dd.Tenquan as place_name,
			dd.Diachiquan as place_address,
			tt.Tentinhthanh as place_city,
			dd.Thoigianmocua as place_open_time,
			dd.Thoigiandongcua as place_close_time,
			dd.Giaban as place_price
		from tbl_baiviet bv
		left join tbl_baivietdiem bvd on bv.Idbaiviet = bvd.Idbaiviet
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        left join tbl_tagbaiviet tbv on bv.Idbaiviet = tbv.Idbaiviet
        where tbv.Idtag = (select Idtag from tbl_hashtag where Tentag=tag)
        group by bv.Idbaiviet);
	elseif  (tag = '') then
		drop temporary table if exists temp_timbaiviet;
		create temporary table if not exists temp_timbaiviet as (
        select 
			bv.Idbaiviet as Id,
			bv.Noidung as content,
			bv.Soluotxem as views,
			bv.Trangthaibaiviet as post_status,
			bv.Dachinhsua as edited,
			bv.Ngaydangbaiviet as post_time,
			bv.Tieudebaiviet as title,
			bv.soluotthich as like_count,
			bv.hinhmacdinh as featured_img,
			bv.Tentaikhoan as username,
			bv.IdDiadiem as place_id,
			bv.Diemdanhgia as review_point,
			dd.Tenquan as place_name,
			dd.Diachiquan as place_address,
			tt.Tentinhthanh as place_city,
			dd.Thoigianmocua as place_open_time,
			dd.Thoigiandongcua as place_close_time,
			dd.Giaban as place_price
		from tbl_baiviet bv
		left join tbl_baivietdiem bvd on bv.Idbaiviet = bvd.Idbaiviet
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        where bv.Idbaiviet = id
		group by bv.Idbaiviet);
	end if;
    select * from temp_timbaiviet;
end //
delimiter ;

drop procedure if exists Sp_Laydiemdanhgia;
delimiter //
CREATE  PROCEDURE Sp_Laydiemdanhgia (in i int)
begin
	select
		d.IdDiadiem as Id,
		count(bvd.IdDiadiem) as review_count,
		sum(bv.Diemdanhgia) as review_sum
	from tbl_diadiem d
	left join tbl_baivietdiem bvd on bvd.IdDiadiem = d.IdDiadiem
	left join tbl_baiviet bv on bvd.Idbaiviet = bv.Idbaiviet
    where d.IdDiadiem = i
	group by d.IdDiadiem;
end //
delimiter ;

drop temporary table if exists temp_bvTheoTuKhoa;
create temporary table if not exists temp_bvTheoTuKhoa as (
	select * from tbl_baiviet 
    where Noidung like (select concat("%",'thương hiệu',"%")) or Tieudebaiviet like (select concat("%",'cà',"%")));
select * from temp_bvTheoTuKhoa;



