select lecture_name, name, lecture_num, num, lecture_room, start_day, end_day from lectures natural join member where lecture_num=2





insert into member values (member_seq.nextval||member_seq.currval,'teacher4@email.com','설민석','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher5@email.com','황현필','강사',3,'password',01012341235,null);
insert into member values (member_seq.nextval||member_seq.currval,'teacher6@email.com','정민재','강사',3,'password',01012341235,null);
select * from member;
select * from lectures;
commit;