drop table grade;
drop table board2;
drop table lectures;
drop table attendance;
drop table member;--member���̺��� num�� �ٸ����� �����ϹǷ� �׻� drop�� �������� �������
drop sequence member_seq;


create sequence member_seq;
create table member(						--ȸ�����̺�
	num number primary key, 				--ȸ����ȣ
	id_email varchar2(50) unique not null,  --�̸����� ���̵�ξ�
	name varchar2(15),						--ȸ���̸�
	dept varchar2(20) default '�Ϲ�ȸ��',		--ȸ����
	lvl number(1) default 1,				--���
	password varchar2(15) not null, 		--��й�ȣ ����+��������
	phone number,							--��ȭ��ȣ
	lecture varchar2(30)					--���¸� 
);
select * from MEMBER;


insert into member values (member_seq.nextval||member_seq.currval, 'tmsisj@email.com','����','������',5,'tmsisj',01012341234,'JAVA');
insert into member values (member_seq.nextval||member_seq.currval, 'text2@email.com','ö��2','������',2,'password',01012341234,'JAVA');
insert into member values (member_seq.nextval||member_seq.currval, 'text3@email.com','ö��3','������',2,'password',01012341234,'JAVA');




create table attendance( --�⼮���̺�
	nalja date not null,
	num number,
	state varchar2(10), --�⼮ ���� �Ἦ ����
	foreign key(num) references member(num) on delete cascade --foreign key����. member���̺� num����
);

insert into attendance values('2020-08-04',11,'attend');
insert into attendance values('2020-08-04',22,'attend');
insert into attendance values('2020-08-04',33,'absent');


commit;

select * from attendance;



--select * from student;


create table grade(  			--�������̺�
	num number primary key,		--ȸ����ȣ�� ������ �ĺ���. ������̺� num����
	exam1 number,				--���輺��
	exam2 number,
	exam3 number,
	foreign key(num) references member(num) on delete cascade
);  

create table lectures(								--�������̺�
	lecture_name varchar2(50) primary key,			--���¸�
	start_day date,									--�����Ⱓ
	end_day date,
	num number,										--ȸ����ȣ/./��簭���� ȸ����ȣ�� ��
	lecture_room number,							--���ǽǹ�ȣ
	foreign key(num) references member(num) on delete cascade
);

create table board2(									--�⺻���� �Խ��� ���̺�
	num number primary key,
	title varchar2(100) not null,
	writer varchar2(50) not null,
	wtime date,
	content varchar2(3000),
	ref number,
	serial number,
	lev	number,
	filename varchar2(255)
);


