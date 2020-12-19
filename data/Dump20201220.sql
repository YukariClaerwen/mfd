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
 