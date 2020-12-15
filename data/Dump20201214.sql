use reviewthucpham;

alter table tbl_taikhoan add Idtrangthai int;

alter table tbl_taikhoan modify Email varchar(255) NOT NULL unique;
alter table tbl_taikhoan add column Tentaikhoan varchar(255) not null after Email;
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'Doraemon' WHERE (`Email` = 'doremon@gmail.com');
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'hien' WHERE (`Email` = 'hien@gmail.com');
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'nobita' WHERE (`Email` = 'nobita@gmail.com');
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'thuha' WHERE (`Email` = 'thuha2@gmail.com');
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'tuan' WHERE (`Email` = 'tuan@gmail.com');
UPDATE `reviewthucpham`.`tbl_taikhoan` SET `Tentaikhoan` = 'xuka' WHERE (`Email` = 'xuka@gmail.com');
alter table tbl_taikhoan drop primary key;
alter table tbl_taikhoan modify Tentaikhoan varchar(255) not null primary key unique;

DROP function IF EXISTS Fn_kiemtraEmail;
DELIMITER $$
create function Fn_kiemtraEmail(mail varchar(255))
	RETURNS bool
    NOT DETERMINISTIC
    READS SQL DATA
BEGIN
   return EXISTS (select * from tbl_Taikhoan where Email = mail) ;
end $$

DROP function IF EXISTS Fn_kiemtraDangnhap;
DELIMITER $$
create function Fn_kiemtraDangnhap(mail varchar(255), pass varchar(255))
	RETURNS int
    NOT DETERMINISTIC
    READS SQL DATA
BEGIN
	declare flag int(11) default -1;
    select Idtrangthai into flag from tbl_Taikhoan where Email = mail and Matkhau = MD5(pass);
	return flag;
end $$

DELIMITER ;

UPDATE tbl_taikhoan SET Matkhau = md5(123456) WHERE (Email = 'nobita@gmail.com');
SELECT Fn_kiemtraDangnhap("nobita@gmail.com","f");

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
                Idtrangthai as userstatus
            from tbl_Taikhoan 
            where tk = Tentaikhoan);
	end if;
    select * from temp_tim_taikhoan;
end //
delimiter ;