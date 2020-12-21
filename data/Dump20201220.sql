/* Đăng ký tài khoản */ 
 delimiter $$
create procedure Sp_Dangky (in tentk varchar(255), in mail varchar(255),in mk1 varchar(255),in mk2 varchar(255),out mess int)
begin
	if(exists(select Tentaikhoan from tbl_taikhoan where Tentaikhoan=tentk))then
		select 1 into mess;
	elseif(exists(select Email from tbl_taikhoan where Email=mail))then
		select 2 into mess;
	elseif (mk1 <> mk2 )then
		select 3 into mess;
	else
		insert into tbl_taikhoan(Email,Tentaikhoan,Matkhau,Tenhienthi,Ngaytaotaikhoan,Idtrangthai)
        values (mail,tentk,mk1,tentk,current_timestamp(),2);
        select 4 into mess;
	end if;
    select mess;
end $$
delimiter ;
alter table tbl_hashtag add column tenhashtag varchar(255);
/* Tìm bài viết theo hashtag */
drop procedure Sp_TimbaivietTheoHashtag;
 delimiter $$
create procedure Sp_TimbaivietTheoHashtag (in tag varchar(255))
begin
drop temporary table if exists temp_bvTheoHashtag;
	create temporary table if not exists temp_bvTheoHashtag as(
	select bv.Idbaiviet,Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,Tentaikhoan,hinhmacdinh,soluotthich
    from tbl_baiviet bv, tbl_tagbaiviet tbv where bv.Idbaiviet= tbv.Idbaiviet and tbv.Idtag = (select Idtag from tbl_hashtag where Tentag=tag)
    );
select * from temp_bvTheoHashtag;
end $$
delimiter ;
drop procedure Sp_TimbaivietTheoTuKhoa;
/* Tìm bài viết theo từ khóa */
 delimiter $$
create procedure Sp_TimbaivietTheoTuKhoa (in tukhoa varchar(255))
begin
	drop temporary table if exists temp_bvTheoTuKhoa;
	create temporary table if not exists temp_bvTheoTuKhoa as ( 
	select * from tbl_baiviet where Tenquan like (select concat("%",tukhoa,"%")) or Tieudebaiviet like (select concat("%",tukhoa,"%")) 
    or Diachiquan like (select concat("%",tukhoa,"%")) or Tenquan like (select concat("%",tukhoa,"%")) 
    );
select * from temp_bvTheoTuKhoa;
end $$
delimiter ;

/* Thêm bình luận */
 delimiter $$
create procedure Sp_Thembinhluan (in noidung text, in idbv int, in tentk varchar(255))
begin
	insert into tbl_binhluan(Noidung,Ngaybinhluan,Idbaiviet,Tentaikhoan) values (noidung,current_timestamp(),idbv,tentk);
end $$
delimiter ;

/* Xóa bình luận */
  delimiter $$
create procedure Sp_Xoabinhluan (in idbl int)
begin
	delete from tbl_binhluan where Idbinhluan=idbl;
end $$
delimiter ;
drop trigger tg_after_insert_baiviet;
/* Đăng bài viết */
  delimiter $$
create procedure Sp_Thembaiviet (in content text,in storename varchar(255) ,in score int, in address varchar(255), in location varchar(255)
,in timeopen varchar(255),in price varchar(255), in statuss varchar(255), in title text, in image varchar(255), in username varchar(255))
begin
	insert into tbl_baiviet(Noidung,Soluotxem,Tenquan,Diemdanhgia,Diachiquan,Diadiem,Thoigianmocua,Giaban,Trangthaibaiviet,Dachinhsua,Ngaydangbaiviet,Tieudebaiviet,soluotthich,hinhmacdinh,Tentaikhoan)
    values(content,0,storename,score,address,location,timeopen,price,statuss,'Chưa',current_timestamp(),title,0,image,username);
end $$
delimiter ;

/* Thêm hình bài viết */
  delimiter $$
create procedure Sp_Themhinhbaiviet (in url varchar(255),in id int)
begin
	insert into tbl_hinhanh (Duongdan,Idbaiviet) values (url,id);
end $$
delimiter ;

/* Thêm hashtag của bài viết*/
drop procedure Sp_Themhashtag;
  delimiter $$
create procedure Sp_Themhashtag (in idbv int, in tenhtg varchar(255),in tag varchar(255))
begin
	declare idt int;
	if exists(select Tentag from tbl_hashtag where Tentag=tag) then
		select Idtag from tbl_hashtag where Tentag=tag into idt;
		insert into tbl_tagbaiviet (Idtag,Idbaiviet) values (idt,idbv);
	else
		insert into tbl_hashtag(Tentag,tenhashtag) values (tag,tenhtg);
        select max(Idtag) from tbl_hashtag into idt ;
        insert into tbl_tagbaiviet (Idtag,Idbaiviet) values (idt,idbv);
	end if;
end $$
delimiter ;

/* Sửa đăng ký */
drop procedure if exists Sp_Dangky;
delimiter $$
create procedure Sp_Dangky (in tentk varchar(255), in mail varchar(255),in mk1 varchar(255),in mk2 varchar(255),out mess int)
begin
	if(exists(select Tentaikhoan from tbl_taikhoan where Tentaikhoan=tentk))then
		select 1 into mess;
	elseif(exists(select Email from tbl_taikhoan where Email=mail))then
		select 2 into mess;
	elseif (mk1 <> mk2 )then
		select 3 into mess;
	else
		insert into tbl_taikhoan(Email,Tentaikhoan,Matkhau,Tenhienthi,Ngaytaotaikhoan,Idtrangthai,Idquyen)
        values (mail,tentk,mk1,tentk,current_timestamp(),2,0);
        select 4 into mess;
	end if;
    select mess;
end $$
delimiter ;

/*Chỉnh sửa thông tin */
/* 1 Eamil đã tồn tại, 2 update thành công*/
drop procedure if exists Sp_Chinhsuathongtin;
delimiter $$
create procedure Sp_Chinhsuathongtin (in mail varchar(255), in tentk varchar(255),in nghenghiep varchar(255),in gt varchar(255),in ns date,out mess int)
beginn
	if(exists(select Email from tbl_taikhoan where Email=mail))then
		select 1 into mess;
	else
		update tbl_taikhoan set Email=mail,Congviec=nghenghiep,Gioitinh=gt, ngaysinh=ns where Tentaikhoan= tentk ;
        select 2 into mess;
	end if;
    select mess;
end $$
delimiter ;

call Sp_Chinhsuathongtin('hien@gmail.com','hien','Nong dan','Nam','2000-02-19',@mess);
call Sp_Chinhsuathongtin('hien567@gmail.com','hien','Nong dan','Nam','2000-02-19',@mess)
