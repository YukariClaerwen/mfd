drop procedure if exists Sp_LayhinhanhUser;
delimiter //
create procedure Sp_LayhinhanhUser(in u varchar(255))
begin
	drop temporary table if exists temp_hinhanhuser;
	create temporary table if not exists temp_hinhanhuser as(
	select 
		ha.Idhinhanh as id,
		ha.Duongdan as src,
		bv.Idbaiviet as postid
	from tbl_hinhanh ha
	left join tbl_baiviet bv on ha.Idbaiviet = bv.Idbaiviet
	where bv.Tentaikhoan = u
	group by ha.Idhinhanh);
    select * from temp_hinhanhuser;
end //
delimiter ;