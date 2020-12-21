drop procedure if exists Sp_Layhashtag;

delimiter //
create procedure Sp_Layhashtag()
begin
	select h.Idtag as IDtag, h.Tentag as tag, h.tenhashtag as tagname, count(t.Idtag) as count
	from tbl_hashtag h
	left join tbl_tagbaiviet t on h.Idtag = t.Idtag 
    left join tbl_baiviet b on b.Idbaiviet = t.Idbaiviet
	group by h.Tentag;
end //
delimiter ;

drop procedure if exists Sp_Dangtheodoi;
delimiter //
CREATE  PROCEDURE Sp_Dangtheodoi (in u varchar(255))
begin
	select t.Taikhoantheodoi as following, tk.Tenhienthi as viewname, tk.Hinhdaidien as avatar
	from tbl_theodoi t, tbl_Taikhoan tk
	where t.Taikhoan = u && tk.Tentaikhoan = t.Taikhoantheodoi;
end //
delimiter ;

drop procedure if exists Sp_Nguoitheodoi;
delimiter //
CREATE  PROCEDURE Sp_Nguoitheodoi (in u varchar(255))
begin
	select t.Taikhoan as followers, tk.Tenhienthi as viewname, tk.Hinhdaidien as avatar
	from tbl_theodoi t, tbl_Taikhoan tk
	where t.Taikhoantheodoi = u && tk.Tentaikhoan = t.Taikhoan;
end //
delimiter ;


drop procedure if exists Sp_Laytagsbaiviet;
delimiter //
CREATE  PROCEDURE Sp_Laytagsbaiviet (in p int)
begin
	select h.Idtag as IDtag, h.Tentag as tag, h.tenhashtag as tagname, b.Idbaiviet as Idpost
	from tbl_hashtag h
	left join tbl_tagbaiviet t on h.Idtag = t.Idtag 
    left join tbl_baiviet b on b.Idbaiviet = t.Idbaiviet
    where b.Idbaiviet = p
	group by h.Idtag;
end //
delimiter ;

    

	

