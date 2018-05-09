--third task
--counting the number of lucky tickets
--function that count and return the number of tickets
create or replace function tickets
return number
as
v_ticket varchar(6);
counter number(10) := 0;
begin
for ticket_number in 0..999999 loop
v_ticket := substr('000000',1, 6-length(ticket_number)) || ticket_number;
if 
(to_number(substr(v_ticket,1, 1)) +
to_number(substr(v_ticket,2, 1)) +
to_number(substr(v_ticket,3, 1)))
=
(to_number(substr(v_ticket,4, 1)) +
to_number(substr(v_ticket,5, 1)) +
to_number(substr(v_ticket,6, 1))) 
then 
counter := counter + 1;
end if;
end loop;
return counter;
end;
/
--function call
declare
v_tickets number(10);
begin
v_tickets := tickets;
dbms_output.put_line(v_tickets);
end;