use reviewamthuc;

create table tbl_Quyen(
	Idquyen int unique primary key,
    Tenquyen varchar(255)
);

INSERT INTO `review`.`tbl_quyen` (`Idquyen`, `Tenquyen`) VALUES ('0', 'Admin');
INSERT INTO `review`.`tbl_quyen` (`Idquyen`, `Tenquyen`) VALUES ('1', 'Thành viên');

alter table tbl_taikhoan add column Idquyen int;
alter table tbl_taikhoan add foreign key (Idquyen) references tbl_Quyen(Idquyen);

drop procedure if exists Sp_Dangky;
DELIMITER $$
CREATE PROCEDURE Sp_Dangky (in tentk varchar(255), in mail varchar(255),in mk1 varchar(255),in mk2 varchar(255),out mess int)
begin
	if(exists(select Tentaikhoan from tbl_taikhoan where Tentaikhoan=tentk))then
		select 1 into mess;
	elseif(exists(select Email from tbl_taikhoan where Email=mail))then
		select 2 into mess;
	elseif (mk1 <> mk2 )then
		select 3 into mess;
	else
		insert into tbl_taikhoan(Email,Tentaikhoan,Matkhau,Tenhienthi,Ngaytaotaikhoan,Idtrangthai,Idquyen)
        values (mail,tentk,mk1,tentk,current_timestamp(),2,1);
        select 4 into mess;
	end if;
    select mess;
end $$
DELIMITER ;