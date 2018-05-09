--first task
--new data type
create or replace type arrayofnames is table of varchar2(25);
/ 
--creating function
create or replace function emp(dep_id in number)
return arrayofnames
as
    v_response arrayofnames;
    counter number := 1;
    CURSOR c1 IS
    SELECT last_name FROM employees
    WHERE department_id = dep_id; 
begin
    --common select in pl/sql code
    select LAST_NAME 
    bulk collect into v_response 
    from EMPLOYEES
    where department_id = dep_id;
    
    --using explicit cursor
    OPEN c1;
    LOOP 
    FETCH c1 INTO v_response(counter);
    counter := counter + 1;
    EXIT WHEN c1%NOTFOUND;
    END LOOP;
    CLOSE c1;
    
    return v_response;
end;
/ 
--function calling
declare
    v_names arrayofnames;
begin
    v_names := emp(100);
    for i in v_names.first..v_names.last loop
        dbms_output.put_line(v_names(i));
    end loop;
    EXCEPTION
    when VALUE_ERROR
    then dbms_output.put_line('No such department');
end;
/
--function calling in select statement
select * from table(emp(100))
where column_value='Chen';







