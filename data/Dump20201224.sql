
drop procedure if exists Sp_Laydiemdanhgia;
delimiter //
CREATE PROCEDURE `Sp_Laydiemdanhgia`(in i int)
begin
	select
		d.IdDiadiem as Id,
		count(bv.IdDiadiem) as review_count,
		sum(bv.Diemdanhgia) as review_sum
	from tbl_diadiem d
	left join tbl_baiviet bv on bv.IdDiadiem = d.IdDiadiem
    where d.IdDiadiem = i
	group by d.IdDiadiem;
end //
delimiter ;

alter table tbl_hinhanh add column IdDiadiem int;
alter table tbl_hinhanh add foreign key (IdDiadiem) references tbl_diadiem(IdDiadiem);

alter table tbl_diadiem add column Idhinhanh int;
alter table tbl_diadiem add foreign key (Idhinhanh) references tbl_hinhanh(Idhinhanh);

drop procedure if exists Sp_Timbaiviet;
delimiter //
CREATE PROCEDURE Sp_Timbaiviet(in id varchar(255), in tag varchar(255))
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
			dd.Giaban as place_price,
            ha.Duongdan as place_img
		from tbl_baiviet bv
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        left join tbl_hinhanh ha on dd.Idhinhanh = ha.Idhinhanh
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
			dd.Giaban as place_price,
            ha.Duongdan as place_img
		from tbl_baiviet bv
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        left join tbl_tagbaiviet tbv on bv.Idbaiviet = tbv.Idbaiviet
        left join tbl_hinhanh ha on dd.Idhinhanh = ha.Idhinhanh
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
			dd.Giaban as place_price,
            ha.Duongdan as place_img
		from tbl_baiviet bv
		left join tbl_diadiem dd on bv.IdDiadiem = dd.IdDiadiem
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        left join tbl_hinhanh ha on dd.Idhinhanh = ha.Idhinhanh
        where bv.Idbaiviet = id
		group by bv.Idbaiviet);
	end if;
    select * from temp_timbaiviet;
end //
delimiter ;

drop procedure if exists Sp_Laydiadiem;
delimiter //
create procedure Sp_Laydiadiem()
begin
	drop temporary table if exists temp_placelist;
	create temporary table if not exists temp_placelist as (
		select 
			dd.IdDiadiem as id,
			dd.Tenquan as name,
			dd.Diachiquan as address,
			tt.Tentinhthanh as city,
			dd.Thoigianmocua as open_time,
			dd.Thoigiandongcua as close_time,
			dd.Giaban as price,
            ha.Duongdan as img
		from tbl_diadiem dd
		left join tbl_tinhthanh tt on dd.IdTinhthanh = tt.Idtinhthanh
        left join tbl_hinhanh ha on dd.Idhinhanh = ha.Idhinhanh
		group by dd.IdDiadiem);
    select * from temp_placelist;
end //
delimiter ;

