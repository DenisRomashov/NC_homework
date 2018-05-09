--fourth task
--creating table
create table cat (
    id number(38) not null,
    name varchar2(16),
    constraint pk_cat primary key (id)
);
/
--creating SEQUENCE
CREATE SEQUENCE cats_id
 START WITH     100
 INCREMENT BY   2
 NOCYCLE;
/
--creating trigger
create or replace trigger trig_cat
before insert on cat
for each row
declare
begin
   if :new.id is null then
   :new.id := cats_id.nextval;
   end if;
end;
/
--examples
insert into cat (name) values ('Tom');
insert into cat (name) values ('Vasya');
insert into cat values(null, 'Sasha');
/
--check
select * from cat;