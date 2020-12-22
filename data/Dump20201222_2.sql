drop procedure if exists Sp_Dangnhap;
delimiter //
create procedure Sp_Dangnhap(in mail varchar(255))
begin
	select 
		Email as email,
        Tentaikhoan as username,
        Tenhienthi as name,
        Hinhdaidien as avatar,
        Idquyen as role
    from tbl_Taikhoan where Email = mail;
end //
delimiter ;

drop procedure if exists Sp_theodoi;
delimiter //
CREATE PROCEDURE Sp_theodoi (in tk varchar(255), in follow varchar(255))
begin
	insert into tbl_theodoi (Taikhoan, Taikhoantheodoi) value (tk,follow);
end //
delimiter ;

drop procedure if exists Sp_botheodoi;
delimiter //
CREATE PROCEDURE Sp_botheodoi (in tk varchar(255), in notfollow varchar(255))
begin
	delete from tbl_theodoi where Taikhoan = tk and Taikhoantheodoi = notfollow;
end //
delimiter ;

