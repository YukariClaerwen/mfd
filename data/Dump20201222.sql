drop procedure if exists Sp_dstkyeuthich;
delimiter //
CREATE PROCEDURE Sp_dstkyeuthich (in i int)
begin
	select yt.Tentaikhoan as username
	from tbl_baivietyeuthich yt
	where yt.Idbaiviet = i;
end //
delimiter ;

drop procedure if exists Sp_themluotthich;
delimiter //
CREATE PROCEDURE Sp_themluotthich(in i int, in tk varchar(255))
begin
	insert into tbl_baivietyeuthich (Idbaiviet, Tentaikhoan) value (i,tk);
end //
delimiter ;

drop procedure if exists Sp_Xoathich;
delimiter //
create procedure Sp_Xoathich(in i int, in tk varchar(255))
begin
	delete from tbl_baivietyeuthich where Idbaiviet = i and Tentaikhoan = tk;
end //
delimiter ;