--second task
--creating package
CREATE or REPLACE PACKAGE PKG_OPERATIONS AUTHID CURRENT_USER  IS
    procedure make(
    table_name in varchar2,
    cols varchar2
    );
    
    procedure add_row(
    table_name in varchar2,
    val varchar2,
    cols varchar2
    );
    
    procedure upd_row(
    table_name in varchar2,
    val varchar2,
    cond varchar2
    );
    
    procedure delete_row(
    table_name in varchar2,
    cond varchar2
    );
    
    function remove(
    table_name varchar2
    )return number; 

end PKG_OPERATIONS;
/
--creating package body
CREATE or REPLACE PACKAGE BODY PKG_OPERATIONS IS

procedure make(
    table_name in varchar2,
    cols varchar2
    )
is
begin
 EXECUTE IMMEDIATE 'create table '|| table_name || '(' || cols || ')';
exception
when others then
if sqlcode = -00955 then
    dbms_output.put_line('table with the same name already exist');
else if sqlcode = -00957 then
    dbms_output.put_line('duplicate column name');
else if sqlcode = -00911 then
    dbms_output.put_line('invalid character');
else if sqlcode = -00907 then
    dbms_output.put_line('missing right parenthesis');
else if sqlcode = -00922 then
    dbms_output.put_line('missing or invalid option');
else if sqlcode = -00972 then
    dbms_output.put_line('identifier is too long');
else if sqlcode = -00903 then
    dbms_output.put_line('invalid table name');
else if sqlcode = -00904 then
    dbms_output.put_line('invalid identifier');
else if sqlcode = -02263 then
    dbms_output.put_line('need to specify the datatype for this column');
else if sqlcode = -00910 then
    dbms_output.put_line('specified length too long for its datatype');
else if sqlcode = -01723 then
    dbms_output.put_line('zero-length columns are not allowed');
else if sqlcode = -02250 then
    dbms_output.put_line('missing or invalid constraint name');
else if sqlcode = -00905 then
    dbms_output.put_line('missing keyword');
else if sqlcode = -02264 then
    dbms_output.put_line('name already used by an existing constraint');
else if sqlcode = -00902 then
    dbms_output.put_line('invalid datatype');
else if sqlcode = -00936 then
    dbms_output.put_line('missing expression');
else if sqlcode = -02261 then
    dbms_output.put_line('such unique or primary key already exists in the table');
else if sqlcode = -02260 then
    dbms_output.put_line('table can have only one primary key');
else if sqlcode = -02253 then
    dbms_output.put_line('constraint specification not allowed here');
else if sqlcode = -02270 then
    dbms_output.put_line('no matching unique or primary key for this column-list');
else if sqlcode = -01727 then
    dbms_output.put_line('numeric precision specifier is out of range (1 to 38)');
else if sqlcode = -02267 then
    dbms_output.put_line('column type incompatible with referenced column type');
else if sqlcode = -02438 then
    dbms_output.put_line('Column check constraint cannot reference other columns');
else if sqlcode = -00920 then
    dbms_output.put_line('invalid relational operator');
else if sqlcode = -00942 then
    dbms_output.put_line('table or view does not exist');
else if sqlcode = -01426 then
    dbms_output.put_line('numeric overflow');
else if sqlcode = -01756 then
    dbms_output.put_line('quoted string not properly terminated');
    else if sqlcode = -00933 then
    dbms_output.put_line('SQL command not properly ended');
else 
    raise;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;  
end if;
end if;
end if;  
end if;
end if;
end if;    
end if;
end if;
end;

procedure add_row(
    table_name in varchar2,
    val varchar2,
    cols varchar2
    )
is
begin
 EXECUTE IMMEDIATE 'insert into ' || table_name || ' (' ||
cols || ') values (' || val || ')';
exception
when others then
if sqlcode = -00957 then
    dbms_output.put_line('duplicate column name');
else if sqlcode = -00911 then
    dbms_output.put_line('invalid character');
else if sqlcode = -00907 then
    dbms_output.put_line('missing right parenthesis');
else if sqlcode = -00922 then
    dbms_output.put_line('missing or invalid option');
else if sqlcode = -00972 then
    dbms_output.put_line('identifier is too long');
else if sqlcode = -00903 then
    dbms_output.put_line('invalid table name');
else if sqlcode = -00904 then
    dbms_output.put_line('invalid identifier');
else if sqlcode = -00905 then
    dbms_output.put_line('missing keyword');
else if sqlcode = -00902 then
    dbms_output.put_line('invalid datatype');
else if sqlcode = -00936 then
    dbms_output.put_line('missing expression');
else if sqlcode = -00942 then
    dbms_output.put_line('table or view does not exist');
else if sqlcode = -00928 then
    dbms_output.put_line('missing SELECT keyword');
else if sqlcode = -12899 then
    dbms_output.put_line('value too large for column');
else if sqlcode = -01722 then
    dbms_output.put_line('invalid number');
else if sqlcode = -00947 then
    dbms_output.put_line('not enough values');
else if sqlcode = -00984 then
    dbms_output.put_line('column not allowed here');
else if sqlcode = -00913 then
    dbms_output.put_line('too many values');
else if sqlcode = -02291 then
    dbms_output.put_line('integrity constraint violated - parent key not found');
else if sqlcode = -01438 then
    dbms_output.put_line('value larger than specified precision allowed for this column');
else if sqlcode = -00001 then
    dbms_output.put_line('unique constraint violated');
else if sqlcode = -01400 then
    dbms_output.put_line('cannot insert NULL ');
else if sqlcode = -02290 then
    dbms_output.put_line('check constraint violated');
else if sqlcode = -01426 then
    dbms_output.put_line('numeric overflow');
else if sqlcode = -01756 then
    dbms_output.put_line('quoted string not properly terminated');
    else if sqlcode = -00933 then
    dbms_output.put_line('SQL command not properly ended');
else 
    raise;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;  
end if;
end if;
end if;  
end if;
end if;
end if;    
end if;
end if;
end;     

procedure upd_row(
    table_name in varchar2,
    val varchar2,
    cond varchar2
    )
is
begin
 EXECUTE IMMEDIATE 'update ' || table_name || ' set ' ||
val || ' where ' || cond;
exception
when others then
if sqlcode = -00957 then
    dbms_output.put_line('duplicate column name');
else if sqlcode = -00911 then
    dbms_output.put_line('invalid character');
else if sqlcode = -00907 then
    dbms_output.put_line('missing right parenthesis');
else if sqlcode = -00922 then
    dbms_output.put_line('missing or invalid option');
else if sqlcode = -00972 then
    dbms_output.put_line('identifier is too long');
else if sqlcode = -00903 then
    dbms_output.put_line('invalid table name');
else if sqlcode = -00904 then
    dbms_output.put_line('invalid identifier');
else if sqlcode = -00905 then
    dbms_output.put_line('missing keyword');
else if sqlcode = -00902 then
    dbms_output.put_line('invalid datatype');
else if sqlcode = -00936 then
    dbms_output.put_line('missing expression');
else if sqlcode = -00942 then
    dbms_output.put_line('table or view does not exist');
else if sqlcode = -00928 then
    dbms_output.put_line('missing SELECT keyword');
else if sqlcode = -12899 then
    dbms_output.put_line('value too large for column');
else if sqlcode = -01722 then
    dbms_output.put_line('invalid number');
else if sqlcode = -02291 then
    dbms_output.put_line('integrity constraint violated - parent key not found');
else if sqlcode = -01438 then
    dbms_output.put_line('value larger than specified precision allowed for this column');
else if sqlcode = -00001 then
    dbms_output.put_line('unique constraint violated');
else if sqlcode = -01400 then
    dbms_output.put_line('cannot insert NULL ');
else if sqlcode = -02290 then
    dbms_output.put_line('check constraint violated');
else if sqlcode = -01426 then
    dbms_output.put_line('numeric overflow');
else if sqlcode = -01756 then
    dbms_output.put_line('quoted string not properly terminated');
else if sqlcode = -00933 then
    dbms_output.put_line('SQL command not properly ended');
    else if sqlcode = -02292 then
    dbms_output.put_line('integrity constraint violated - child record found');
else 
    raise;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;  
end if;
end if;
end if;  
end if;
end if;
end if;    
end if;
end if;
end;

procedure delete_row(
    table_name in varchar2,
    cond varchar2
    )
as
begin
 EXECUTE IMMEDIATE 'delete from ' || table_name || ' where ' || cond;
 exception
when others then
if sqlcode = -00957 then
    dbms_output.put_line('duplicate column name');
else if sqlcode = -00911 then
    dbms_output.put_line('invalid character');
else if sqlcode = -00907 then
    dbms_output.put_line('missing right parenthesis');
else if sqlcode = -00922 then
    dbms_output.put_line('missing or invalid option');
else if sqlcode = -00972 then
    dbms_output.put_line('identifier is too long');
else if sqlcode = -00903 then
    dbms_output.put_line('invalid table name');
else if sqlcode = -00904 then
    dbms_output.put_line('invalid identifier');
else if sqlcode = -00905 then
    dbms_output.put_line('missing keyword');
else if sqlcode = -00902 then
    dbms_output.put_line('invalid datatype');
else if sqlcode = -00936 then
    dbms_output.put_line('missing expression');
else if sqlcode = -00942 then
    dbms_output.put_line('table or view does not exist');
else if sqlcode = -00928 then
    dbms_output.put_line('missing SELECT keyword');
else if sqlcode = -12899 then
    dbms_output.put_line('value too large for column');
else if sqlcode = -01722 then
    dbms_output.put_line('invalid number');
else if sqlcode = -00947 then
    dbms_output.put_line('not enough values');
else if sqlcode = -00984 then
    dbms_output.put_line('column not allowed here');
else if sqlcode = -00913 then
    dbms_output.put_line('too many values');
else if sqlcode = -02291 then
    dbms_output.put_line('integrity constraint violated - parent key not found');
else if sqlcode = -01438 then
    dbms_output.put_line('value larger than specified precision allowed for this column');
else if sqlcode = -00001 then
    dbms_output.put_line('unique constraint violated');
else if sqlcode = -01400 then
    dbms_output.put_line('cannot insert NULL ');
else if sqlcode = -02290 then
    dbms_output.put_line('check constraint violated');
else if sqlcode = -01426 then
    dbms_output.put_line('numeric overflow');
else if sqlcode = -01756 then
    dbms_output.put_line('quoted string not properly terminated');
else if sqlcode = -00933 then
    dbms_output.put_line('SQL command not properly ended');
else if sqlcode = -02292 then
    dbms_output.put_line('integrity constraint violated - child record found');
else 
    raise;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;  
end if;
end if;
end if;  
end if;
end if;
end if;    
end if;
end if;
end;

function remove(
    table_name varchar2
    )return number
as
v_rows number(30);
begin
   EXECUTE IMMEDIATE 'select count(*) from ' || table_name
   into v_rows;
   EXECUTE IMMEDIATE 'drop table ' || table_name || ' purge';
   return v_rows;
exception
when others then
if sqlcode = -00911 then
    dbms_output.put_line('invalid character');
else if sqlcode = -00907 then
    dbms_output.put_line('missing right parenthesis');
else if sqlcode = -00922 then
    dbms_output.put_line('missing or invalid option');
else if sqlcode = -00972 then
    dbms_output.put_line('identifier is too long');
else if sqlcode = -00903 then
    dbms_output.put_line('invalid table name');
else if sqlcode = -00904 then
    dbms_output.put_line('invalid identifier');
else if sqlcode = -00905 then
    dbms_output.put_line('missing keyword');
else if sqlcode = -00902 then
    dbms_output.put_line('invalid datatype');
else if sqlcode = -00936 then
    dbms_output.put_line('missing expression');
else if sqlcode = -00942 then
    dbms_output.put_line('table or view does not exist');
else if sqlcode = -00928 then
    dbms_output.put_line('missing SELECT keyword');
else if sqlcode = -01722 then
    dbms_output.put_line('invalid number');
else if sqlcode = -02291 then
    dbms_output.put_line('integrity constraint violated - parent key not found');
else if sqlcode = -01438 then
    dbms_output.put_line('value larger than specified precision allowed for this column');
else if sqlcode = -00001 then
    dbms_output.put_line('unique constraint violated');
else if sqlcode = -02290 then
    dbms_output.put_line('check constraint violated');
else if sqlcode = -01426 then
    dbms_output.put_line('numeric overflow');
else if sqlcode = -01756 then
    dbms_output.put_line('quoted string not properly terminated');
else if sqlcode = -00933 then
    dbms_output.put_line('SQL command not properly ended');
else if sqlcode = -02449 then
    dbms_output.put_line('unique/primary keys in table referenced by foreign keys');
else 
    raise;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;  
end if;
end if;
end if;  
end if;
end if;
end if;    
end if;
end if;
end if;
return -1;
end;

end PKG_OPERATIONS;
/
--testing pkg methods
declare
v_rows number(10);
begin
PKG_OPERATIONS.make('my_contacts', 'id number(4), name varchar2(40)');
PKG_OPERATIONS.add_row('my_contacts','1,''Andrey Gavrilov''', 'id, name');
PKG_OPERATIONS.upd_row('my_contacts','name=''Andrey A. Gavrilov''', 'id=1');
PKG_OPERATIONS.delete_row('my_contacts', 'id=1');
v_rows := PKG_OPERATIONS.remove('my_contacts');
DBMS_OUTPUT.PUT_LINE('Number of rows deleted: ' || v_rows);
end;
/