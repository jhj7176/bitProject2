select lecture_name, name, lecture_num, num, lecture_room, start_day, end_day from lectures natural join member where lecture_num=2



delete from lectures where lecture_name='테스트3' and lecture_num=8;

insert into member values (member_seq.nextval||member_seq.currval,'teacher4@email.com','설민석','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher5@email.com','황현필','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher6@email.com','정민재','강사',3,'password',01012341235,null);
select * from member;
select * from lectures;
select * from BITJEJUDEPT;
commit;
name, num, lecture, lecture_name, lecture_room, lecture_num, start_day, end_day

select * from member full outer join lectures on member.num=lectures.num;
select * from member full outer join lectures on member.num=lectures.num where lecture_name = (select lecture from member where num = 수강생번호);


select * from member where id_email='staff@email.com';

update member set lecture = '거북선 제조과정A' where num = 66;

select * from member full outer join grade on member.num = GRADE.num where num = 4848;

select * from lectures where lecture_name=(select lecture from member where num=1010);

select * from lectures natural join member;

select * from member natural join grade where num =1010;
select * from attendance where num = 1010;

select lecture_name, lecture_num, lecture_room, name, start_day, end_day from lectures natural join member where lecture_name=(select lecture from member where num=1313);

select * from member full outer join grade on member.num=grade.num where member.num=3838;

insert into member values (member_seq.nextval||member_seq.currval,'tttt','tttt',0,'asdf1234',01011111111,null);
















