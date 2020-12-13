use reviewthucpham;

drop procedure if exists tim_baiviet;
delimiter //
create procedure tim_baiviet (in param int)
begin
	drop temporary table if exists temp_tim_baiviet;
    if (param < 0) then
		create temporary table if not exists temp_tim_baiviet as (select * from tbl_baiviet);
	else
		create temporary table if not exists temp_tim_baiviet as (select * from tbl_baiviet where Idbaiviet = param);
	end if;
    select * from temp_tim_baiviet;
end//
delimiter ;

drop procedure if exists tim_baiviet_ten;
delimiter //

delimiter ;