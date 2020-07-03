# 1.Query the existence of 1 course
select `id`,`name`,`teacherid` from course where `id` = 1;
# 2.Query the presence of both 1 and 2 courses
select `id`,`name`,`teacherid` from course where `id` = 1 or `id`=2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select stu.id, stu.name,avg(sc.score) as average_score from student stu,student_course sc 
where stu.id = sc.studentId
group by stu.id, stu.name
having avg(sc.score) >= 60; 
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select distinct studentId from student_course)
# 5.Query all SQL with grades
select stu.id,stu.name,stu.age,stu.sex,cou.name,sc.score 
from student stu, student_course sc,course cou 
where stu.id = sc.studentId and cou.id = sc.courseId;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select stu.id,stu.name,stu.age,stu.sex 
from student stu, student_course sc
where stu.id = sc.studentId and sc.courseId = 1 and EXISTS
(select * from student_course sc2 where stu.id = sc2.studentId and sc2.courseId = 2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select stu.id,stu.name,stu.age,stu.sex 
from student stu, student_course sc
where stu.id = sc.studentId and sc.courseId = 1 and sc.score < 60
order by sc.score desc;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select cou.id, cou.name, avg(sc.score) as average_score
from course cou, student_course sc
where cou.id = sc.courseId 
group by cou.id,cou.name
order by average_score desc ,cou.id;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select stu.id,sc.score
from student stu, student_course sc, course cou 
where stu.id = sc.studentId and cou.id = sc.courseId and cou.name = "Math" and sc.score < 60