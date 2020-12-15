drop procedure if exists Sp_Dangtheodoi;
delimiter //
create procedure Sp_Dangtheodoi(in u varchar(255))
begin
	select t.Taikhoantheodoi as following, tk.Tenhienthi as viewname, tk.Hinhdaidien as avatar
	from tbl_theodoi t, tbl_Taikhoan tk
	where t.Taikhoan = u && tk.Tentaikhoan = t.Taikhoantheodoi;

end //
delimiter ;

drop procedure if exists Sp_Nguoitheodoi;
delimiter //
create procedure Sp_Nguoitheodoi(in u varchar(255))
begin
	select t.Taikhoan as followers, tk.Tenhienthi as viewname, tk.Hinhdaidien as avatar
	from tbl_theodoi t, tbl_Taikhoan tk
	where t.Taikhoantheodoi = u && tk.Tentaikhoan = t.Taikhoan;
end //
delimiter ;
