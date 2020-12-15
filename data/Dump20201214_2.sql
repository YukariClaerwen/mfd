use reviewthucpham;

alter table tbl_Taikhoan add column Hinhtrangchu varchar(255) after Hinhdaidien;

drop procedure if exists Sp_Timtaikhoan;

delimiter //
create procedure Sp_Timtaikhoan(
	in tk varchar(255)
)
begin
	drop temporary table if exists temp_tim_taikhoan;
    if tk = '' then
		create temporary table if not exists temp_tim_taikhoan as (
			select 
				Email as email, 
				Tentaikhoan as username,
				Tenhienthi as viewname,
				Ngaysinh as birthday,
				Gioitinh as gender,
				Congviec as job,
				Ngaytaotaikhoan as createdate,
				Hinhdaidien as avatar,
				Hinhtrangchu as cover,
				Idtrangthai as userstatus
			from tbl_Taikhoan);
	else
		create temporary table if not exists temp_tim_taikhoan as (
			select 
					Email as email, 
					Tentaikhoan as username,
					Tenhienthi as viewname,
					Ngaysinh as birthday,
					Gioitinh as gender,
					Congviec as job,
					Ngaytaotaikhoan as createdate,
					Hinhdaidien as avatar,
					Hinhtrangchu as cover,
					Idtrangthai as userstatus
				from tbl_Taikhoan 
				where tk = Tentaikhoan);
	end if;
    select * from temp_tim_taikhoan;
end //
delimiter ;

create table tbl_theodoi(
	Idtheodoi int not null auto_increment primary key,
    Taikhoan varchar(255) not null,
    Taikhoantheodoi varchar(255) not null,
    constraint fk_tk_theodoi_1 foreign key (Taikhoan) references tbl_taikhoan(Tentaikhoan),
    constraint fk_tk_theodoi_2 foreign key (Taikhoantheodoi) references tbl_taikhoan(Tentaikhoan)
);
    
drop procedure if exists Sp_DemTheoDoi;

delimiter //
create procedure Sp_DemTheoDoi(
	in tk varchar(255)
)
begin
	drop temporary table if exists temp_dem_theodoi;
	create temporary table if not exists temp_dem_theodoi as (
			select 
				(SELECT count(*) FROM tbl_theodoi WHERE Taikhoan = tk) AS following,
				(SELECT count(*) FROM tbl_theodoi WHERE Taikhoantheodoi = tk) AS followers);
	select * from temp_dem_theodoi;
end//
delimiter ;

alter table tbl_taikhoan modify column Ngaytaotaikhoan timestamp default current_timestamp;
