use  Reviewthucpham;
/* Đổi khóa ngoại bảng kehoachkhampha*/
alter table tbl_kehoachkhampha drop foreign key fk_Email_Kehoachkhampha;
alter table tbl_kehoachkhampha drop column Email;
alter table tbl_kehoachkhampha add column Tentaikhoan varchar(255);
alter table tbl_kehoachkhampha add constraint fk_Tentaikhoan_Kehoachkhampha foreign key (Tentaikhoan) references tbl_Taikhoan(Tentaikhoan);

/* Đổi khóa ngoại bảng binhluan */
alter table tbl_binhluan drop foreign key fk_Email_Binhluan;
alter table tbl_binhluan drop column Email;
alter table tbl_binhluan add column Tentaikhoan varchar(255);
alter table tbl_binhluan add constraint fk_Tentaikhoan_Binhluan foreign key (Tentaikhoan) references tbl_Taikhoan(Tentaikhoan);

/* Đổi khóa ngoại bảng binhluan */
alter table tbl_baiviet drop foreign key fk_Email_Baiviet;
alter table tbl_baiviet drop column Email;
alter table tbl_baiviet add column Tentaikhoan varchar(255);
alter table tbl_baiviet add constraint fk_Tentaikhoan_Baiviet foreign key (Tentaikhoan) references tbl_Taikhoan(Tentaikhoan);


/* SP lấy kế hoạch khám phá*/ 
 delimiter $$
create procedure Sp_Laykehoach (in param varchar(255))
begin
	drop temporary table if exists temp_laykehoach;
	create temporary table if not exists temp_laykehoach as(
	select khkp.Idkehoachkhampha,Tenkehoach,Diadiem,Idchitietkehoach,Hoatdong,Trangthai,Ngaydutinhthuchien,Diachi from tbl_kehoachkhampha khkp, tbl_chitietkehoach ctkh 
	where khkp.IdKehoachkhampha = ctkh.IdKehoachkhampha and Tentaikhoan= param    
);
select * from temp_laykehoach;
end $$
delimiter ;

alter table tbl_baivietyeuthich drop foreign key fk_Email_Baivietyeuthich;
alter table tbl_baivietyeuthich drop column Email;
alter table tbl_baivietyeuthich add column Tentaikhoan varchar(255);
alter table tbl_baivietyeuthich add constraint fk_Tentaikhoan_Baivietyeuthich foreign key (Tentaikhoan) references tbl_Taikhoan(Tentaikhoan);

/* Lấy danh sách bài viết yêu thích */
drop procedure Sp_Laybaivietyeuthich;
 delimiter $$
create procedure Sp_Laybaivietyeuthich (in param varchar(255))
begin
	drop temporary table if exists temp_laybaivietyeuthich;
	create temporary table if not exists temp_laybaivietyeuthich as(
	select bv.Idbaiviet,bv.Tentaikhoan,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,soluotthich 
    from tbl_baivietyeuthich bvyt, tbl_baiviet bv where bvyt.Tentaikhoan=param and bv.Idbaiviet = bvyt.Idbaiviet
);
select * from temp_laybaivietyeuthich;
end $$
delimiter ;

/* Lấy bình luận bài viết */
 delimiter $$
create procedure Sp_Laybinhluan (in idbv int)
begin
	drop temporary table if exists temp_laybinhluan;
	create temporary table if not exists temp_laybinhluan as(
	select *
    from tbl_binhluan where Idbaiviet = idbv
    );
select * from temp_laybinhluan;
end $$
delimiter ;

/*Lấy hình ảnh bài viết */
 delimiter $$
create procedure Sp_Layhinhanh (in idbv int)
begin
	drop temporary table if exists temp_layhinhanh;
	create temporary table if not exists temp_layhinhanh as(
	select *
    from tbl_hinhanh where Idbaiviet = idbv
    );
select * from temp_layhinhanh;
end $$
delimiter ;


/* Tìm bài viết theo địa điểm*/
 delimiter $$
create procedure Sp_TimbaivietTheoDiaDiem (in diadiemm varchar(255))
begin
	drop temporary table if exists temp_bvTheoDiaDiem;
	create temporary table if not exists temp_bvTheoDiaDiem as(
	select *
    from tbl_baiviet where Diadiem = diadiemm
    );
select * from temp_bvTheoDiaDiem;
end $$
delimiter ;

/* Tìm kiếm bài viết theo hashtag */ 
drop procedure Sp_TimbaivietTheoHashtag
 delimiter $$
create procedure Sp_TimbaivietTheoHashtag (in tag varchar(255))
begin
	drop temporary table if exists temp_bvTheoHashtag;
	create temporary table if not exists temp_bvTheoHashtag as(
	select bv.Idbaiviet,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,Email,hinhmacdinh,soluotthich
    from tbl_baiviet bv, tbl_tagbaiviet tbv where bv.Idbaiviet= tbv.Idbaiviet and tbv.Idtag = (select Idtag from tbl_hashtag where Tentag=tag)
    );
select * from temp_bvTheoHashtag;
end $$
delimiter ;



