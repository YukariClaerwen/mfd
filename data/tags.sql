-- create database reviewthucpham;
use reviewthucpham;

Alter table tbl_baiviet add soluotthich int;
alter table tbl_baiviet add hinhmacdinh varchar(255);

create table tbl_hashTag (
	Idtag int not null auto_increment primary key,
	Tentag text not null
);

create table tbl_tagBaiviet (
	Idtag int not null,
    Idbaiviet int not null,
    foreign key (Idtag) references tbl_hashTag(Idtag),
    foreign key (Idbaiviet) references tbl_baiviet(Idbaiviet),
    primary key (Idtag, Idbaiviet)
);