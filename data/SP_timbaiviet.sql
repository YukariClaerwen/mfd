CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Timbaiviet`(in param int)
begin
	drop temporary table if exists temp_timbaiviet;
    if (param < 0) then
		create temporary table if not exists temp_timbaiviet as (select * from tbl_baiviet);
	else
		create temporary table if not exists temp_timbaiviet as (select * from tbl_baiviet where Idbaiviet = param);
	end if;
    select * from temp_timbaiviet;
end