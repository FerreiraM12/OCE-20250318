-- create tables

create table jobs (
    id      number generated by default on null as identity
            constraint jobs_id_pk primary key,
    name    varchar2(255 char)
            constraint jobs_name_unq unique constraint jobs_name_ck
            check (name in ('DEVELOPER','ANALYST','MANAGER','ASSISTANT'))
);



create table departments (
    id             number generated by default on null as identity
                   constraint departments_id_pk primary key,
    name           varchar2(100 char)
                   constraint departments_name_unq unique not null constraint departments_name_ck
                   check (name in ('HR','DEVELOPMENT','LEGAL','SALES','OPERATIONS')),
    cost_center    number
);


create table employees (
    id               number generated by default on null as identity
                     constraint employees_id_pk primary key,
    department_id    number                     constraint employees_department_id_fk
                     references departments,
    job_id           number                     constraint employees_job_id_fk
                     references jobs,
    first_name       varchar2(100 char),
    last_name        varchar2(100 char),
    email            varchar2(100 char),
    hire_date        date,
    city             varchar2(100 char),
    country          varchar2(100 char)
);

-- table index
create index employees_i1 on employees (department_id);

create index employees_i2 on employees (job_id);



-- triggers
create or replace trigger jobs_biu
    before insert or update
    on jobs
    for each row
begin
    :new.name := upper(:new.name);
end jobs_biu;
/


create or replace trigger departments_biu
    before insert or update
    on departments
    for each row
begin
    :new.name := upper(:new.name);
end departments_biu;
/


create or replace trigger employees_biu
    before insert or update
    on employees
    for each row
begin
    :new.email := lower(:new.email);
end employees_biu;
/


-- load data

insert into jobs (
    id,
    name
) values (
    1,
    'manager'
);
insert into jobs (
    id,
    name
) values (
    2,
    'analyst'
);
insert into jobs (
    id,
    name
) values (
    3,
    'developer'
);
insert into jobs (
    id,
    name
) values (
    4,
    'assistant'
);

commit;

alter table jobs
modify id generated always  as identity restart start with 5;


insert into departments (
    id,
    name,
    cost_center
) values (
    1,
    'legal',
    97
);
insert into departments (
    id,
    name,
    cost_center
) values (
    2,
    'development',
    97
);
insert into departments (
    id,
    name,
    cost_center
) values (
    3,
    'sales',
    84
);
insert into departments (
    id,
    name,
    cost_center
) values (
    4,
    'operations',
    58
);
insert into departments (
    id,
    name,
    cost_center
) values (
    5,
    'hr',
    78
);

commit;

alter table departments
modify id generated always  as identity restart start with 6;

insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    1,
    1,
    2,
    'Christine',
    'Doherty',
    'hutufunon@apekap.fi',
    TO_DATE('100123', 'DDMMYY'),
    'Osoladgu',
    'LU'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    2,
    1,
    4,
    'Bruce',
    'Biancalani',
    'ra@cawe.bv',
    TO_DATE('100123', 'DDMMYY'),
    'Gigucako',
    'ET'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    3,
    1,
    1,
    'Travis',
    'Herrera',
    'zi@feh.np',
    TO_DATE('100123', 'DDMMYY'),
    'Iwuototo',
    'MN'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    4,
    3,
    3,
    'Lucas',
    'Bartolozzi',
    'pok@zavig.cy',
    TO_DATE('100123', 'DDMMYY'),
    'Vufzenno',
    'LU'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    5,
    4,
    1,
    'Mina',
    'Fujiwara',
    'sihgafa@tif.ly',
    TO_DATE('100123', 'DDMMYY'),
    'Wiziduc',
    'FJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    6,
    3,
    4,
    'Lucy',
    'Holt',
    'refeze@giozu.ye',
    TO_DATE('100123', 'DDMMYY'),
    'Aheusne',
    'CH'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    7,
    4,
    3,
    'Joseph',
    'Ciolli',
    'uh@upefeocu.at',
    TO_DATE('100123', 'DDMMYY'),
    'Cekkuswuj',
    'SE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    8,
    2,
    1,
    'Walter',
    'Wallace',
    'zi@ti.gov',
    TO_DATE('100123', 'DDMMYY'),
    'Nehegar',
    'JO'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    9,
    1,
    1,
    'Jessie',
    'Gautier',
    'nizitu@dotedkon.mw',
    TO_DATE('100123', 'DDMMYY'),
    'Ivowotu',
    'GW'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    10,
    4,
    4,
    'Angel',
    'Massai',
    'catjal@fitu.sb',
    TO_DATE('100123', 'DDMMYY'),
    'Vavasa',
    'DK'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    11,
    4,
    4,
    'Alex',
    'Powers',
    'ta@ha.gd',
    TO_DATE('100123', 'DDMMYY'),
    'Mabtefjo',
    'PM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    12,
    1,
    1,
    'Della',
    'Fitzgerald',
    'toosku@bakibhi.cf',
    TO_DATE('100123', 'DDMMYY'),
    'Ezwujwu',
    'BA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    13,
    4,
    2,
    'Cody',
    'D''Angelo',
    'ho@iskibzef.rw',
    TO_DATE('100123', 'DDMMYY'),
    'Dehobe',
    'LS'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    14,
    2,
    2,
    'Jeanette',
    'Schwarz',
    'baftuto@ezuc.lb',
    TO_DATE('100123', 'DDMMYY'),
    'Vivbesom',
    'SR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    15,
    2,
    1,
    'Ronnie',
    'Silva',
    'uzi@um.pm',
    TO_DATE('100123', 'DDMMYY'),
    'Detmangu',
    'EH'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    16,
    3,
    3,
    'Edgar',
    'Greco',
    'nulcun@gelet.cr',
    TO_DATE('100123', 'DDMMYY'),
    'Adoucewew',
    'TC'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    17,
    2,
    4,
    'Olga',
    'Hofmann',
    'gavpizbew@ohiodpu.tk',
    TO_DATE('100123', 'DDMMYY'),
    'Rielwo',
    'AQ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    18,
    1,
    3,
    'Mitchell',
    'Leonardi',
    'sinnel@ehjum.ss',
    TO_DATE('100123', 'DDMMYY'),
    'Ebjefji',
    'CK'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    19,
    2,
    2,
    'Nelle',
    'Zagli',
    'ezokuc@feowocit.cg',
    TO_DATE('100123', 'DDMMYY'),
    'Masadtah',
    'DJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    20,
    4,
    1,
    'Leila',
    'Thomas',
    'iciifed@kij.kn',
    TO_DATE('100123', 'DDMMYY'),
    'Zeerfu',
    'TD'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    21,
    3,
    1,
    'Elsie',
    'Martin',
    'rofom@gaen.kg',
    TO_DATE('100123', 'DDMMYY'),
    'Moecehot',
    'CO'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    22,
    3,
    1,
    'Glenn',
    'Donnini',
    'abe@launuela.au',
    TO_DATE('100123', 'DDMMYY'),
    'Bojbatko',
    'TM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    23,
    2,
    4,
    'Matilda',
    'Sanna',
    'niadi@katacaha.ph',
    TO_DATE('100123', 'DDMMYY'),
    'Vomfoivo',
    'MK'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    24,
    1,
    1,
    'Brian',
    'Cherici',
    'te@zoluzu.al',
    TO_DATE('100123', 'DDMMYY'),
    'Sovusec',
    'DJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    25,
    4,
    4,
    'Cecelia',
    'van Oosten',
    'pihvo@roj.gn',
    TO_DATE('100123', 'DDMMYY'),
    'Uffashop',
    'CO'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    26,
    3,
    4,
    'Christine',
    'James',
    'pumiso@dov.cv',
    TO_DATE('100123', 'DDMMYY'),
    'Lehecreb',
    'LR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    27,
    4,
    4,
    'Andre',
    'Barbetti',
    'kih@ohwi.ne',
    TO_DATE('100123', 'DDMMYY'),
    'Otealba',
    'TL'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    28,
    2,
    1,
    'Cynthia',
    'Hewitt',
    'sirmelma@donit.ve',
    TO_DATE('100123', 'DDMMYY'),
    'Haigoro',
    'CI'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    29,
    4,
    4,
    'Francis',
    'Berger',
    'urijihed@ocekode.ls',
    TO_DATE('100123', 'DDMMYY'),
    'Kibfopid',
    'RW'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    30,
    1,
    4,
    'Bertie',
    'Volpe',
    'jikeda@go.cn',
    TO_DATE('100123', 'DDMMYY'),
    'Rizufvi',
    'LU'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    31,
    2,
    2,
    'Kyle',
    'Nannini',
    'gucu@piccuvle.nu',
    TO_DATE('100123', 'DDMMYY'),
    'Deakegu',
    'KH'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    32,
    4,
    3,
    'Ronnie',
    'Lee',
    'oli@dutuza.tc',
    TO_DATE('100123', 'DDMMYY'),
    'Usragked',
    'CV'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    33,
    5,
    1,
    'Tillie',
    'de Waal',
    'pirgis@kez.vu',
    TO_DATE('100123', 'DDMMYY'),
    'Apluera',
    'BW'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    34,
    3,
    2,
    'Corey',
    'Lanini',
    'tezcis@hawnuf.pm',
    TO_DATE('100123', 'DDMMYY'),
    'Dadikemi',
    'SJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    35,
    1,
    4,
    'Terry',
    'Bagni',
    'we@sasga.mg',
    TO_DATE('100123', 'DDMMYY'),
    'Seomabe',
    'GT'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    36,
    4,
    1,
    'Rose',
    'Morin',
    'sakutu@foninjiw.nc',
    TO_DATE('100123', 'DDMMYY'),
    'Fiwcotac',
    'SR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    37,
    5,
    1,
    'Alvin',
    'Bush',
    'gug@humanzog.mp',
    TO_DATE('100123', 'DDMMYY'),
    'Arjuhi',
    'CA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    38,
    1,
    4,
    'Barry',
    'Rodriquez',
    'zun@reja.nl',
    TO_DATE('100123', 'DDMMYY'),
    'Ucaedaut',
    'LI'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    39,
    3,
    4,
    'Cora',
    'Tesi',
    'bivo@bajnovo.ke',
    TO_DATE('100123', 'DDMMYY'),
    'Igulahep',
    'SY'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    40,
    2,
    2,
    'Gene',
    'Goodman',
    'kem@ziovedu.zw',
    TO_DATE('100123', 'DDMMYY'),
    'Zudsova',
    'NF'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    41,
    5,
    4,
    'Jordan',
    'Miccinesi',
    'duod@osgoh.dj',
    TO_DATE('100123', 'DDMMYY'),
    'Gipwufpus',
    'LK'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    42,
    2,
    3,
    'Garrett',
    'Stokes',
    'fef@ve.vg',
    TO_DATE('100123', 'DDMMYY'),
    'Pahlosgi',
    'UA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    43,
    5,
    2,
    'Jack',
    'Romoli',
    'zamum@fe.et',
    TO_DATE('100123', 'DDMMYY'),
    'Gawnebuh',
    'SA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    44,
    2,
    3,
    'Olive',
    'Molina',
    'razuppa@jih.gw',
    TO_DATE('100123', 'DDMMYY'),
    'Zewekse',
    'WS'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    45,
    3,
    4,
    'Larry',
    'Ciappi',
    'ba@cipzin.gq',
    TO_DATE('100123', 'DDMMYY'),
    'Vojogkiw',
    'LR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    46,
    4,
    2,
    'Frances',
    'Koopmans',
    'foga@unuluoju.gu',
    TO_DATE('100123', 'DDMMYY'),
    'Fuswuzzub',
    'TZ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    47,
    3,
    1,
    'Edna',
    'Henry',
    'gugusu@ozonawoj.mh',
    TO_DATE('100123', 'DDMMYY'),
    'Jojdekak',
    'GB'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    48,
    2,
    1,
    'Isabel',
    'Serafini',
    'turuhu@tog.mo',
    TO_DATE('100123', 'DDMMYY'),
    'Lumjoda',
    'KP'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    49,
    5,
    1,
    'Ollie',
    'Turnbull',
    'sicewap@si.kr',
    TO_DATE('100123', 'DDMMYY'),
    'Gasamzit',
    'BJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    50,
    2,
    1,
    'Anne',
    'Weiß',
    'kuvesa@geuhwe.uk',
    TO_DATE('100123', 'DDMMYY'),
    'Febpahu',
    'UG'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    51,
    5,
    2,
    'Maud',
    'Dunn',
    'nabeaga@vicki.edu',
    TO_DATE('100123', 'DDMMYY'),
    'Gejuwij',
    'GL'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    52,
    2,
    4,
    'Gregory',
    'Cozzi',
    'eh@bahiwnos.zw',
    TO_DATE('100123', 'DDMMYY'),
    'Zacleunu',
    'TO'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    53,
    3,
    2,
    'Mattie',
    'Graham',
    'ispaviw@fagu.az',
    TO_DATE('100123', 'DDMMYY'),
    'Kejuhib',
    'AC'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    54,
    3,
    4,
    'Gary',
    'Osborne',
    'do@vo.ms',
    TO_DATE('100123', 'DDMMYY'),
    'Borivon',
    'BZ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    55,
    5,
    2,
    'Henrietta',
    'Hilton',
    'joopoju@feocanuf.ro',
    TO_DATE('100123', 'DDMMYY'),
    'Ofkotiwu',
    'GL'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    56,
    3,
    4,
    'Lula',
    'Testi',
    'benom@uniicucuc.gw',
    TO_DATE('100123', 'DDMMYY'),
    'Ihelokbe',
    'GB'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    57,
    2,
    2,
    'Eva',
    'Tesi',
    'dupid@fo.ga',
    TO_DATE('100123', 'DDMMYY'),
    'Narmouc',
    'TJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    58,
    1,
    4,
    'Joe',
    'Riley',
    'pe@gijcinsu.sl',
    TO_DATE('100123', 'DDMMYY'),
    'Zimopjof',
    'BN'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    59,
    2,
    4,
    'Lee',
    'Miceli',
    'rucwi@azicolo.pw',
    TO_DATE('100123', 'DDMMYY'),
    'Sogzeknew',
    'LT'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    60,
    4,
    1,
    'Fanny',
    'Parkinson',
    'tupwovali@imo.uz',
    TO_DATE('100123', 'DDMMYY'),
    'Egikeki',
    'ML'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    61,
    1,
    3,
    'Jeremy',
    'Marilli',
    'vesa@emoigaih.ly',
    TO_DATE('100123', 'DDMMYY'),
    'Motpikdoh',
    'VU'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    62,
    1,
    3,
    'Virginia',
    'Woods',
    'soofpe@zeduc.vu',
    TO_DATE('100123', 'DDMMYY'),
    'Vorwowvec',
    'SY'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    63,
    1,
    1,
    'Rosie',
    'Murphy',
    'uneehi@polez.ky',
    TO_DATE('100123', 'DDMMYY'),
    'Pedhinaba',
    'AE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    64,
    1,
    1,
    'Kenneth',
    'Bianchini',
    'jo@ukjihdak.sl',
    TO_DATE('100123', 'DDMMYY'),
    'Varcouve',
    'SR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    65,
    1,
    1,
    'Eva',
    'Pierre',
    'reduzris@to.th',
    TO_DATE('100123', 'DDMMYY'),
    'Ulcunit',
    'IE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    66,
    3,
    4,
    'Corey',
    'McDaniel',
    'aba@ducmafeg.lc',
    TO_DATE('100123', 'DDMMYY'),
    'Ijeopumo',
    'SD'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    67,
    4,
    1,
    'Lillie',
    'Winter',
    'vioburez@zarpeuhu.cy',
    TO_DATE('100123', 'DDMMYY'),
    'Fucare',
    'HR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    68,
    3,
    2,
    'Clyde',
    'Crawford',
    'luw@ve.mp',
    TO_DATE('100123', 'DDMMYY'),
    'Cigafhec',
    'CM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    69,
    3,
    3,
    'John',
    'Sutton',
    'ag@sa.lr',
    TO_DATE('100123', 'DDMMYY'),
    'Odvatije',
    'GM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    70,
    4,
    4,
    'Earl',
    'Giovannoni',
    'lojet@vih.hn',
    TO_DATE('100123', 'DDMMYY'),
    'Fukveura',
    'MT'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    71,
    2,
    3,
    'Dollie',
    'Ingram',
    'apuwibem@omnupme.pg',
    TO_DATE('100123', 'DDMMYY'),
    'Nibico',
    'KG'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    72,
    4,
    1,
    'Flora',
    'Alvarez',
    'kaarobu@zeku.cd',
    TO_DATE('100123', 'DDMMYY'),
    'Ditala',
    'VG'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    73,
    3,
    1,
    'Duane',
    'Terry',
    'wer@ko.st',
    TO_DATE('100123', 'DDMMYY'),
    'Bufneon',
    'NZ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    74,
    2,
    1,
    'Darrell',
    'Ferri',
    'kod@nempu.io',
    TO_DATE('100123', 'DDMMYY'),
    'Pusiwle',
    'KH'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    75,
    2,
    1,
    'Emilie',
    'Simon',
    'racosetu@docorake.kp',
    TO_DATE('100123', 'DDMMYY'),
    'Atdozep',
    'BD'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    76,
    4,
    2,
    'Noah',
    'Snyder',
    'ja@ohhuwfa.pl',
    TO_DATE('100123', 'DDMMYY'),
    'Rakahig',
    'FI'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    77,
    5,
    2,
    'Violet',
    'van Egmond',
    'sadbus@farfebdo.ee',
    TO_DATE('100123', 'DDMMYY'),
    'Hakpicka',
    'PG'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    78,
    5,
    4,
    'Angel',
    'Collini',
    'deg@uc.nl',
    TO_DATE('100123', 'DDMMYY'),
    'Tamzaotu',
    'TA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    79,
    5,
    3,
    'Alexander',
    'Grimaldi',
    'ikpar@lovris.gg',
    TO_DATE('100123', 'DDMMYY'),
    'Aliziemu',
    'PE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    80,
    3,
    2,
    'Stanley',
    'Bencini',
    'je@taore.mk',
    TO_DATE('100123', 'DDMMYY'),
    'Radgalo',
    'NE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    81,
    1,
    1,
    'Glenn',
    'Castagnoli',
    'vom@facgamwe.be',
    TO_DATE('100123', 'DDMMYY'),
    'Sorjimu',
    'LT'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    82,
    5,
    1,
    'Edgar',
    'Webb',
    'sif@vamej.tf',
    TO_DATE('100123', 'DDMMYY'),
    'Dusrofrak',
    'UM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    83,
    3,
    2,
    'Hester',
    'Berry',
    'dugisoeb@sopemcer.kg',
    TO_DATE('100123', 'DDMMYY'),
    'Cehefor',
    'BJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    84,
    2,
    1,
    'Brian',
    'Magni',
    'wupos@hacgukar.in',
    TO_DATE('100123', 'DDMMYY'),
    'Hozsirheb',
    'FM'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    85,
    3,
    1,
    'Nellie',
    'Targioni',
    'vuva@fif.br',
    TO_DATE('100123', 'DDMMYY'),
    'Wahukwow',
    'BB'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    86,
    3,
    3,
    'Bradley',
    'Floyd',
    've@gepveha.sh',
    TO_DATE('100123', 'DDMMYY'),
    'Lapetci',
    'DJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    87,
    3,
    3,
    'Sallie',
    'Edwards',
    'kolo@do.vc',
    TO_DATE('100123', 'DDMMYY'),
    'Muogena',
    'CZ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    88,
    3,
    1,
    'Herman',
    'Ciapetti',
    'sid@ombe.ve',
    TO_DATE('100123', 'DDMMYY'),
    'Pounudug',
    'IL'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    89,
    1,
    1,
    'Joseph',
    'Rigacci',
    'kaap@soaf.no',
    TO_DATE('100123', 'DDMMYY'),
    'Pupugos',
    'CX'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    90,
    2,
    4,
    'Chad',
    'Cohen',
    'hal@venul.bj',
    TO_DATE('100123', 'DDMMYY'),
    'Kadahto',
    'JE'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    91,
    3,
    3,
    'Mittie',
    'Veldkamp',
    'kupfat@tagnogrih.lv',
    TO_DATE('100123', 'DDMMYY'),
    'Maffufin',
    'SR'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    92,
    4,
    3,
    'Clyde',
    'Webster',
    'huk@av.gn',
    TO_DATE('100123', 'DDMMYY'),
    'Noizoheb',
    'BI'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    93,
    3,
    4,
    'Sarah',
    'Baxter',
    'rohoit@mikfen.hk',
    TO_DATE('100123', 'DDMMYY'),
    'Zezibki',
    'EG'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    94,
    3,
    1,
    'Mason',
    'Cammelli',
    'lon@rezo.mr',
    TO_DATE('100123', 'DDMMYY'),
    'Wojjekuvu',
    'BL'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    95,
    5,
    4,
    'Virginia',
    'van Vliet',
    'kufiw@tojusni.tk',
    TO_DATE('100123', 'DDMMYY'),
    'Asogli',
    'FJ'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    96,
    4,
    3,
    'Susie',
    'Lowe',
    'suafide@avnubik.jm',
    TO_DATE('100123', 'DDMMYY'),
    'Akrozuv',
    'FK'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    97,
    2,
    2,
    'Jeffrey',
    'Franceschini',
    'seeme@niwolzom.gs',
    TO_DATE('100123', 'DDMMYY'),
    'Vumbonem',
    'NI'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    98,
    3,
    2,
    'Oscar',
    'Meli',
    'erumo@muowo.tj',
    TO_DATE('100123', 'DDMMYY'),
    'Nupikpi',
    'CA'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    99,
    5,
    2,
    'Adrian',
    'Fanfani',
    'mak@mot.net',
    TO_DATE('100123', 'DDMMYY'),
    'Togzide',
    'SB'
);
insert into employees (
    id,
    department_id,
    job_id,
    first_name,
    last_name,
    email,
    hire_date,
    city,
    country
) values (
    100,
    1,
    1,
    'Myra',
    'Meyer',
    'vaztezez@vet.so',
    TO_DATE('100123', 'DDMMYY'),
    'Biwalgep',
    'JE'
);

commit;

alter table employees
modify id generated always  as identity restart start with 101;


-- Generated by Quick SQL 1.2.9 5/13/2024, 3:43:28 PM

/*
jobs /insert 4
  name /upper /unique /check developer, analyst, manager, assistant
departments /insert 5
  name vc100 /nn /upper /unique /check hr, development, legal, sales, operations
  cost center num
  employees /insert 100
    first_name vc100
    last_name vc100
    email /lower vc100
    hire_date vc6 /values TO_DATE('100123', 'DDMMYY')
    city vc100
    country vc100
    job id /references jobs

 Non-default options:
# settings = {"apex":"Y","db":"19c","pk":"IDENTITY"}

*/