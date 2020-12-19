use reviewamthuc;

create table tbl_Quyen(
	Idquyen int unique primary key,
    Tenquyen varchar(255)
);

INSERT INTO `review`.`tbl_quyen` (`Idquyen`, `Tenquyen`) VALUES ('0', 'Admin');
INSERT INTO `review`.`tbl_quyen` (`Idquyen`, `Tenquyen`) VALUES ('1', 'Thành viên');

alter table tbl_taikhoan add column Idquyen int;
alter table tbl_taikhoan add foreign key (Idquyen) references tbl_Quyen(Idquyen);
