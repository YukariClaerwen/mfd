drop procedure if exists Sp_Dangnhap;
delimiter //
create procedure Sp_Dangnhap(in email varchar(255))
begin
	select 
		Email as email,
        Tentaikhoan as username,
        Tenhienthi as name,
        Hinhdaidien as avatar,
        Idquyen as role
    from tbl_Taikhoan where Email = email;
end //
delimiter ;