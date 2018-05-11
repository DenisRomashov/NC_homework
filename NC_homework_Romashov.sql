--------------------------------------------------------------------------------
--CREATE,ALTER
--------------------------------------------------------------------------------
CREATE TABLE ATTRIBUTES (
  attr_id NUMBER PRIMARY KEY,
  attr_type_id NUMBER NOT NULL,
  attr_group_id NUMBER NOT NULL,
  name VARCHAR2(255),
  description VARCHAR2(255),
  ismultiple NUMBER(1),
  properties VARCHAR2(45)
);

CREATE TABLE ATTR_GROUPS (
  attr_group_id NUMBER PRIMARY KEY,
  name VARCHAR2(45) UNIQUE,
  properties VARCHAR2(45)
);

CREATE TABLE ATTR_TYPES (
  attr_type_id NUMBER PRIMARY KEY,
  name VARCHAR2(45) UNIQUE,
  properties VARCHAR2(45)
);

CREATE TABLE ATTR_BINDS (
  object_type_id NUMBER NOT NULL,
  attr_id NUMBER NOT NULL,
  options VARCHAR2(45),
  isrequired NUMBER(1),
  default_value VARCHAR2(45)
);

CREATE TABLE OBJECT_TYPES (
  object_type_id NUMBER PRIMARY KEY,
  parent_id NUMBER,
  name VARCHAR2(45) UNIQUE,
  description VARCHAR2(45),
  properties VARCHAR2(45)
);


CREATE TABLE OBJECTS (
  object_id NUMBER PRIMARY KEY,
  parent_id NUMBER,
  object_type_id NUMBER NOT NULL,
  name VARCHAR2(45),
  description VARCHAR2(45),
  order_number NUMBER
);

CREATE TABLE PARAMS (
  attr_id NUMBER NOT NULL,
  object_id NUMBER NOT NULL,
  value VARCHAR2(45) UNIQUE,
  date_value DATE,
  show_order NUMBER
);

CREATE TABLE REFERENCES (
  attr_id NUMBER NOT NULL,
  object_id NUMBER NOT NULL,
  reference NUMBER NOT NULL,
  show_order NUMBER
);


ALTER TABLE ATTRIBUTES ADD FOREIGN KEY
(attr_type_id) REFERENCES ATTR_TYPES(attr_type_id);
ALTER TABLE ATTRIBUTES ADD FOREIGN KEY
(attr_group_id) REFERENCES ATTR_GROUPS(attr_group_id);

ALTER TABLE ATTR_BINDS ADD FOREIGN KEY
(object_type_id) REFERENCES OBJECT_TYPES(object_type_id);
ALTER TABLE ATTR_BINDS ADD FOREIGN KEY
(attr_id) REFERENCES ATTRIBUTES(attr_id);

ALTER TABLE OBJECT_TYPES ADD FOREIGN KEY
(parent_id) REFERENCES OBJECT_TYPES (object_type_id);

ALTER TABLE OBJECTS ADD FOREIGN KEY
(parent_id) REFERENCES OBJECTS (object_id);
ALTER TABLE OBJECTS ADD FOREIGN KEY
(object_type_id) REFERENCES OBJECT_TYPES (object_type_id);

ALTER TABLE PARAMS ADD FOREIGN KEY
(attr_id) REFERENCES ATTRIBUTES(attr_id);
ALTER TABLE PARAMS ADD FOREIGN KEY
(object_id) REFERENCES OBJECTS(object_id);

ALTER TABLE REFERENCES ADD FOREIGN KEY
(attr_id) REFERENCES ATTRIBUTES(attr_id);
ALTER TABLE REFERENCES ADD FOREIGN KEY
(object_id) REFERENCES OBJECTS(object_id);
ALTER TABLE REFERENCES ADD FOREIGN KEY
(reference) REFERENCES OBJECTS(object_id);


--------------------------------------------------------------------------------
--INSERT
--------------------------------------------------------------------------------

INSERT INTO OBJECT_TYPES
VALUES ( 1, NULL, 'TV', 'Телевизор', '...' );

INSERT INTO OBJECT_TYPES
VALUES ( 2, NULL, 'Сamera', 'Фотокамера', '...' );

INSERT INTO OBJECT_TYPES
VALUES ( 3, 1, 'OLED-TV', 'OLED — телевизор', '...' );

INSERT INTO OBJECT_TYPES
VALUES ( 4, 1, 'LCD TV', 'ЖК телевизоры', '...' );

INSERT INTO OBJECT_TYPES
VALUES ( 5, 2, 'SLR camera', 'Зеркальный фотоаппарат', '...' );
--------------------------------------------------------------------------------

INSERT INTO OBJECTS
VALUES ( 1, NULL, 4, 'Samsung UE43M5513AU', 'TV Samsung', 1 );

INSERT INTO OBJECTS
VALUES ( 2, NULL, 3, 'LG OLED77G7V ', 'TV LG', 2 );

INSERT INTO OBJECTS
VALUES ( 3, NULL, 5, 'Canon EOS 5D Mark IV Body', 'Canon camera', 3 );

INSERT INTO OBJECTS
VALUES ( 4, 3, 5, 'Canon EF-S 55-250mm f/4-5.6 IS STM', 'lens canon', 3 );

INSERT INTO OBJECTS
VALUES ( 5, 1, 4, 'TV screen Samsung', 'TV screen Samsung', 1 );
--------------------------------------------------------------------------------
INSERT INTO ATTR_TYPES
VALUES ( 1, 'Resolution', '...' );

INSERT INTO ATTR_TYPES
VALUES ( 2, 'Diagonal', '...' );

INSERT INTO ATTR_TYPES
VALUES ( 3, 'Focal length', '...' );

INSERT INTO ATTR_TYPES
VALUES ( 4, 'Refresh rate index', '...' );

INSERT INTO ATTR_TYPES
VALUES ( 5, 'Number of pixels', '...' );

INSERT INTO ATTR_TYPES
VALUES ( 6, 'Object reference', '...' );
--------------------------------------------------------------------------------
INSERT INTO ATTR_GROUPS
VALUES ( 1, 'TV attributes', '...' );

INSERT INTO ATTR_GROUPS
VALUES ( 2, 'Сamera attributes', '...' );

INSERT INTO ATTR_GROUPS
VALUES ( 3, 'Lens attributes', '...' );

--------------------------------------------------------------------------------
INSERT INTO ATTRIBUTES
VALUES ( 1, 1, 1, 'Max resolution', 'Максимальное разрешение', 0, '...' );

INSERT INTO ATTRIBUTES
VALUES ( 2, 2, 1, 'Screen diagonal', 'Диагональ экрана', 0, '...' );

INSERT INTO ATTRIBUTES
VALUES ( 3, 4, 1, 'Refresh rate index', 'Индекс частоты обновления', 0, '...' );

INSERT INTO ATTRIBUTES
VALUES ( 4, 3, 3, 'Max focal length', 'Максимальное фокусное расстояние', 0, '...' );

INSERT INTO ATTRIBUTES
VALUES ( 5, 5, 2, 'The total number of pixels', 'Максимальное число пикселей', 0, '...' );

INSERT INTO ATTRIBUTES
VALUES ( 6, 6, 1, 'Screen-TV', '', 1, '...' );
--------------------------------------------------------------------------------

INSERT INTO ATTR_BINDS
VALUES ( 1, 1, 'max resolution', 1, NULL );

INSERT INTO ATTR_BINDS
VALUES ( 1, 2, 'diagonal', 1, NULL );

INSERT INTO ATTR_BINDS
VALUES ( 5, 4, 'SLR focal length', 1, NULL );

INSERT INTO ATTR_BINDS
VALUES ( 1, 3, 'Refresh rate index', 1, NULL );

INSERT INTO ATTR_BINDS
VALUES ( 4, 6, 'Connected screen', 1, NULL );
--------------------------------------------------------------------------------

INSERT INTO REFERENCES
VALUES ( 6, 5, 1, 1 );

INSERT INTO REFERENCES
VALUES ( 6, 4, 3, 1 );
--------------------------------------------------------------------------------

INSERT INTO PARAMS
VALUES ( 1, 1, '720', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 1, 2, '4000', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 2, 1, '77', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 2, 2, '41', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 4, 1, '120', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 4, 2, '50', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 5, 1, '1000', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 5, 2, '9000', NULL, 1 );

INSERT INTO PARAMS
VALUES ( 4, 4, '105', NULL, 1 );


--1. получение информации обо всех атрибутах(учитывая только атрибутную группу и атрибутные типы)
--(attr_id, attr_name, attr_group_id, attr_group_name, attr_type_id, attr_type_name)
select attributes.attr_id, attributes.name as attr_name, attributes.attr_group_id, attr_groups.name as attr_group_name, attributes.attr_type_id, attr_types.name as attr_type_name
from attributes 
join attr_groups on  attributes.attr_group_id = attr_groups.attr_group_id
join attr_types on attributes.attr_type_id = attr_types.attr_type_id;

--2. получение всех атрибутов для заданного  объектного типа, без учета наследования
--(attr_id, attr_name )
select attributes.attr_id, attributes.name as attr_name 
from attributes 
join attr_binds on attributes.attr_id = attr_binds.attr_id 
where object_type_id = 1;

--3. получение иерархии от(объектных типов)  для заданного объектного типа(нужно получить иерархию наследования) 
--(ot_id, ot_name, level)
select object_type_id as ot_id, name as ot_name, level
from object_types
start with object_type_id = 3
connect by prior parent_id = object_type_id;

--4. получение вложенности объектов для заданного объекта(нужно получить иерархию вложенности)
--(obj_id, obj_name, level)
select object_id as obj_id, name as obj_name, level
from objects
start with object_id = 3
connect by prior parent_id = object_id;

--5. получение объектов заданного объектного типа(учитывая только наследование от)
--(ot_id, ot_name, obj_id, obj_name)
select object_type_id as ot_id, object_types.name as ot_name, object_id as obj_id, objects.name as obj_name 
from  objects 
join object_types using (object_type_id)
where object_type_id in (
        select object_type_id from object_types
        start with object_type_id = 3
        connect by object_type_id = prior parent_id);

--6. получение значений всех атрибутов(всех возможных типов) для заданного объекта(без учета наследования от)
--(attr_id, attr_name, value)
select attr_id, attributes.name as attr_name, value from (
    select * from (
        --id атрибутов, которые могут быть у объектного типа заданного объекта
        select attr_id
        from objects
        right join attr_binds 
        using (object_type_id)
        where object_type_id = (
            select object_type_id 
            from objects
            where object_id = 3
        ) 
    )
    left join ( 
        --id атрибутов и их значения из таблиц params и references для заданного объекта
        select attr_id, 
            case
                when value is null then to_char(date_value)
                else value
            end as value
        from params
        where params.object_id = 3
        union
        select attr_id, to_char(reference) as value
        from references
        where references.object_id = 3
    )
    using (attr_id)
)
join attributes 
using (attr_id);
 
--7. получение ссылок на заданный объект(все объекты, которые ссылаются на текущий)
--(ref_id, ref_name) нам нужны ссылки на объект(references.reference), а не объекты по ссылкам(references.object_id)
select references.reference as ref_id, objects.name as ref_name 
from references 
join objects using (object_id )
where object_id = 4;

--8. получение значений всех атрибутов(всех возможных типов, без повторяющихся атрибутов) для заданного объекта
--( с учетом наследования от) вывести в виде см. п.6 (attr_id, attr_name, value)
select distinct attr_id, attributes.name as attr_name, value from (
    select * from (
        --id атрибутов, которые могут быть у иерархии объектных типов заданного объекта
        select attr_id
        from objects
        right join attr_binds 
        using (object_type_id)
        where object_type_id in (
        --получение иерархии наследования объектных типов заданного объекта
            select object_type_id
            from object_types
            start with object_type_id = (select object_type_id from objects where object_id = 5)
            connect by prior parent_id = object_type_id
        )  
    )
    left join ( -- исключение повторяющихся
        --id атрибутов и их значения из таблиц params и references для заданного объекта
        select attr_id, 
            case
                when value is null then to_char(date_value)
                else value
            end as value
        from params
        where params.object_id = 5
        union
        select attr_id, to_char(reference) as value
        from references
        where references.object_id = 5
    )
    using (attr_id)
)
join attributes 
using (attr_id);
