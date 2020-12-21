alter table tbl_baiviet modify column Ngaydangbaiviet timestamp default current_timestamp;
alter table tbl_binhluan modify column Ngaybinhluan timestamp default current_timestamp;
alter table tbl_baiviet drop column soluotthich;

drop procedure if exists Sp_demluotthich;
delimiter //
CREATE  PROCEDURE Sp_demluotthich (in i int)
begin
	select 
		bv.Idbaiviet as post_id,
		count(yt.Idbaiviet) as count
	from tbl_baivietyeuthich yt
	left join tbl_baiviet bv on yt.Idbaiviet = bv.Idbaiviet
    where yt.Idbaiviet = i
	group by yt.Idbaiviet;
end //
delimiter ;

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

drop procedure if exists Sp_demluotbinhluan;
delimiter //
CREATE  PROCEDURE Sp_demluotbinhluan (in i int)
begin
	select 
		bv.Idbaiviet as post_id,
		count(bl.Idbaiviet) as count
	from tbl_binhluan bl
	left join tbl_baiviet bv on bl.Idbaiviet = bv.Idbaiviet
    where bl.Idbaiviet = i
	group by bl.Idbaiviet;
end //
delimiter ;

drop procedure if exists Sp_Laybinhluan;
delimiter //
CREATE PROCEDURE Sp_Laybinhluan (in idbv int)
begin
	select bl.*, tk.Hinhdaidien as avatar, tk.Tenhienthi as viewname
    from tbl_binhluan bl
    left join tbl_taikhoan tk on  bl.Tentaikhoan = tk.Tentaikhoan
    where bl.Idbaiviet = idbv
    group by bl.Idbinhluan;
end //
delimiter ;
call Sp_Laybinhluan(11);