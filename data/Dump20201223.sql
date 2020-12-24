UPDATE tbl_baiviet SET Soluotxem = 102 WHERE (Idbaiviet = 11);


drop procedure if exists Sp_capnhatluotxem;
delimiter //
create procedure Sp_capnhatluotxem(in id int)
begin
	update tbl_baiviet set Soluotxem = (Soluotxem + 1) where Idbaiviet = id;
end //
delimiter ;

call Sp_capnhatluotxem(11);

ALTER TABLE tbl_baiviet 
DROP FOREIGN KEY fk_Tentaikhoan_Baiviet;
ALTER TABLE tbl_baiviet
CHANGE COLUMN Soluotxem Soluotxem INT NULL DEFAULT 0 ,
CHANGE COLUMN Tieudebaiviet Tieudebaiviet TEXT NOT NULL ,
CHANGE COLUMN Tentaikhoan Tentaikhoan VARCHAR(255) NOT NULL ;
ALTER TABLE tbl_baiviet
ADD CONSTRAINT fk_Tentaikhoan_Baiviet
FOREIGN KEY (Tentaikhoan)
REFERENCES tbl_taikhoan (Tentaikhoan);

drop procedure if exists Sp_Themhashtag;
delimiter //
CREATE PROCEDURE Sp_Themhashtag(in newidbv int, in tenhtg varchar(255),in tag varchar(255))
begin
	declare idt int;
    declare idbv int;
    if newidbv = 0 then 
		select max(Idbaiviet) from tbl_baiviet into idbv;
    else 
		set idbv = newidbv;
	end if;
	if exists(select Tentag from tbl_hashtag where Tentag=tag) then
		select Idtag from tbl_hashtag where Tentag=tag into idt;
		insert into tbl_tagbaiviet (Idtag,Idbaiviet) values (idt,idbv);
	else
		insert into tbl_hashtag(Tentag,tenhashtag) values (tag,tenhtg);
        select max(Idtag) from tbl_hashtag into idt ;
        insert into tbl_tagbaiviet (Idtag,Idbaiviet) values (idt,idbv);
	end if;
end //
delimiter ;