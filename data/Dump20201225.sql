/* Tìm bài viết theo từ khóa*/
drop procedure Sp_TimbaivietTheoTuKhoa ;
  delimiter $$
create procedure Sp_TimbaivietTheoTuKhoa (in tukhoa varchar(255))
begin
	drop temporary table if exists temp_bvTheoTuKhoa;
	create temporary table if not exists temp_bvTheoTuKhoa as (
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

	from tbl_baiviet bv, tbl_diadiem dd, tbl_tinhthanh tt
    where bv.IdDiadiem= dd.IdDiadiem and dd.IdTinhthanh= tt.IdTinhthanh and
    (dd.Tenquan like (select concat("%",tukhoa,"%")) or bv.Tieudebaiviet like (select concat("%",tukhoa,"%")) 
    or dd.Diachiquan like (select concat("%",tukhoa,"%"))) group by bv.Idbaiviet
    );
select * from temp_bvTheoTuKhoa;
end $$
delimiter ;

/* Tìm bài viết theo địa điểm*/
drop procedure Sp_TimbaivietTheoDiaDiem ;
  delimiter $$
create procedure Sp_TimbaivietTheoDiaDiem (in diadiem varchar(255))
begin
	drop temporary table if exists temp_bvTheoDiaDiem;
	create temporary table if not exists temp_bvTheoDiaDiem as (
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
	from tbl_baiviet bv, tbl_diadiem dd, tbl_tinhthanh tt
    where bv.IdDiadiem= dd.IdDiadiem and dd.IdTinhthanh= tt.IdTinhthanh and
	tt.Tentinhthanh = diadiem	group by bv.Idbaiviet
    );
select * from temp_bvTheo;
end $$
delimiter ;