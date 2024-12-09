drop table member cascade constraints;

create table member
(
    id       varchar2(12),
    password varchar2(10),
    name     varchar2(15), -- 한글 5글자까지 가능
    age      number(2),
    gender   varchar2(3),
    email    varchar2(30),
    primary key (id)
)

    insert into member (id, password, name, age, gender, email)
VALUES ('test3', '1234', 'test3', 24, 1, 'test3@gmail.com');
commit;

select *
from member;