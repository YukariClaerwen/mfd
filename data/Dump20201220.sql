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
begin
	if(exists(select Email from tbl_taikhoan where Email=mail))then
		select 1 into mess;
	else
		update tbl_taikhoan set Email=mail,Congviec=nghenghiep,Gioitinh=gt, ngaysinh=ns where Tentaikhoan= tentk ;
        select 2 into mess;
	end if;
    select mess;
end $$
delimiter ;

/*Them kế hoạch*/
drop procedure if exists Sp_Taokehoachamthuc;
delimiter $$
create procedure Sp_Taokehoachamthuc (in tenkh text, in tentk varchar(255),in dd varchar(255))
begin
	insert into tbl_Kehoachkhampha(Tenkehoach,Diadiem,Tentaikhoan) values(tenkh,dd,tentk);
    select *from tbl_kehoachkhampha where Tentaikhoan = tentk;
end $$
delimiter ; 

/* Thêm hoạt động */
drop procedure if exists Sp_Themhoatdong;
delimiter $$
create procedure Sp_Themhoatdong (in hd varchar(255),in Ngay date, in dc varchar(255), in idkh int)
begin
	insert into tbl_Chitietkehoach(Hoatdong,Trangthai,Ngaydutinhthuchien,Diachi,Idkehoachkhampha) values(hd,'Chưa xong',Ngay,dc,idkh);
    select * from tbl_Chitietkehoach where Idchitietkehoach =  (select max(Idchitietkehoach) from tbl_Chitietkehoach where Idkehoachkhampha = idkh) ;
end $$
delimiter ; 

/* Đổi mật khẩu */
drop procedure if exists Sp_Doimatkhau;
delimiter $$
create procedure Sp_doimatkhau (in tentk varchar(255),in mkht varchar(255),in mkm1 varchar(255), in mkm2 varchar(255), out mess int)
begin
	if  not exists (select Matkhau from tbl_taikhoan where Matkhau = MD5(mkht) and Tentaikhoan = tentk) then
		select 1 into mess;
	elseif(mkm1 <> mkm2) then
		select 2 into mess;
    else 
		update tbl_taikhoan set Matkhau = MD5(mkm1) where Tentaikhoan = tentk;
        select 3 into mess;
	end if;
    select mess;
end $$
delimiter ; 

/*Lấy bài viết của người đăng*/ 
drop procedure if exists Sp_Laybaivietdang;
delimiter $$
create procedure Sp_Laybaivietdang (in tentk varchar(255))
begin
	select 
		bv.Idbaiviet as Id,
		bv.Noidung as content,
		bv.Soluotxem as views,
		bv.Trangthaibaiviet as post_status,
		bv.Dachinhsua as edited,
		bv.Ngaydangbaiviet as post_time,
		bv.Tieudebaiviet as title,
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
    where Tentaikhoan = tentk group by bv.Idbaiviet;
end $$
delimiter ; 