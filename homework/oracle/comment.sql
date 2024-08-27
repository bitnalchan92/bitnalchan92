/* TODO
    08/12
        - date는 세기, 년, 월, 일, 시간, 분, 초의 날짜 및 시간데이터를 저장하기 위한 데이터 형입니다.
        - 별다른 설정이 없을시, 년, 월, 일만 출력
        - 기본 날짜형식은 "YY/MM/DD"형식으로 "년/월/일"로 출력
        > ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
 */

select ename, comm, sal * 12 + comm, nvl(comm, 0), sal * 12 + nvl(comm, 0)
from emp
where ROWNUM <= 1;

select ename, sal * 12 + nvl(comm, 0) as Annsal, comm
from emp;

select ename, comm, sal * 12 + comm, nvl(comm, 0), sal * 12 + nvl(comm, 0) as 연봉, sal * 12
from emp
where ename = 'ALLEN';

SELECT ename,
       comm,
       sal * 12 + NVL(comm, 0),
       NVL(comm, 0),
       sal * 12 + NVL(comm, 0) AS 연봉
FROM emp
WHERE ename = 'ALLEN';

select deptno 부서번호, dname 부서명
from dept;

select *
from emp
where sal >= 3000
order by ename;

select *
from emp
;

select *
from emp
where hiredate <= '1982/01/01';

select empno, sal
from emp
where empno = 7521
   or empno = 7654
   or empno = 7844;

select ROWNUM, emp.*
from emp
;

select to_char(sysdate, 'YYYY년 MM DD DAY')
from dual;
select to_char(sysdate, 'YYYY') || '년 ' || to_char(sysdate, 'MM') || '월 ' || to_char(sysdate, 'DD') || '일 ' ||
       to_char(sysdate, 'DAY') 오늘날짜
from dual;

select to_char(sysdate, 'YYYY') || '년 '
           || to_char(sysdate, 'MM') || '월 '
           || to_char(sysdate, 'DD') || '일 '
           || to_char(sysdate, 'DAY') as 오늘날짜
from dual;
select to_char(sysdate, 'YYYY"년 "MM"월 "DD"일 "Day')
from dual;

select to_char(sysdate, 'YYYY년')
from dual;

select to_char(sysdate, 'YYYY/MM/DD,HH24:MI:SS')
from dual;

select ename, sal, to_char(SAL, 'L999,999')
from emp;

select trunc(sysdate - to_date('2024/07/22')) 기간
from dual;

select trunc(SYSDATE - TO_DATE('2024/07/22', 'YYYY/MM/DD'))
from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

select EMPNO, ENAME, NVL(to_char(mgr), 'C E O') as MANAGER
from emp
where mgr is null;

select deptno, decode(deptno, 10, 'A', 20, 'B', 'DEFAULT')
from emp
order by deptno;

select ename,
       deptno,
       decode(deptno
           , 10, 'ACCOUNTING'
           , 20, 'RESEARCH'
           , 30, 'SALES'
           , 40, 'OPERATIONS') dname
from emp;



select empno,
       ename,
       job,
       sal,
       decode(job
           , 'ANALYST', sal * 1.05
           , 'SALESMAN', sal * 1.1
           , 'MANAGER', sal * 1.15
           , 'CLERK', sal * 1.2
           , sal) upsal
from emp;

select ename,
       deptno,
       case deptno
           when 10 then 'ACCOUNTING'
           when 20 then 'RESEARCH'
           when 30 then 'SALES'
           when 40 then 'OPERATIONS'
           end as dname
from emp;

select ename,
       deptno,
       sal,
       case
           when sal >= 700 and sal <= 1200 then 'LEVEL1'
           when sal >= 1201 and sal <= 1400 then 'LEVEL2'
           when sal >= 1401 and sal <= 2000 then 'LEVEL3'
           when sal >= 2001 and sal <= 3000 then 'LEVEL4'
           ELSE 'LEVEL5'
           end as grade
from emp;

select ename,
       deptno,
       trunc(sal) sal,
       case
           when sal < 1000 then sal * 1.08
           when sal <= 2000 then sal * 1.05
           when sal <= 3000 then sal * 1.03
           ELSE sal * 1.01
           end as upsal
from emp;

select sum(sal)
from emp;

select sum(comm)
from emp;

select avg(sal)
from emp;

select max(sal), min(sal)
from emp;

select max(HIREDATE) as max_hiredate, min(HIREDATE) as min_hiredate
from emp;

select count(comm)
from emp;

select count(*), count(comm)
from emp;

select count(comm) 사원수
from emp
where DEPTNO = 10;

select count(distinct job) 업무수
from emp;

select deptno, max(sal) max_sal, min(sal) min_sal
from emp
group by deptno;

select deptno, count(*), count(comm)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;

select DEPTNO, max(sal) max_sal, min(sal) min_sal
from EMP
group by DEPTNO
having max(sal) > 2900;

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;

-- 문제1
SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
;

-- 문제2
SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
ORDER BY TO_CHAR(HIREDATE, 'YY') DESC
;

-- 문제3
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제4
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제5
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)", AVG(SAL) as "평균급여"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제6
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
;

-- 문제7
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) < 5
;

-- 문제8
SELECT MGR as "매니저번호", COUNT(*) as "인원수"
FROM EMP
GROUP BY MGR
ORDER BY MGR
;

-- 문제9
SELECT MGR as "매니저번호", COUNT(*) as "인원수"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
ORDER BY MGR
;

-- 문제10
SELECT MGR as "매니저번호", MAX(SAL) as "최고 급여"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
ORDER BY MGR
;

-- 문제11
SELECT MGR as "매니저번호", MAX(SAL) as "최고 급여"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MAX(SAL) BETWEEN 1000 AND 2000
ORDER BY MGR
;



SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1
;

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE, 1, 2) = '87';

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, -1, 1) = 'E';

SELECT *
FROM EMP
WHERE INSTR(ENAME, 'R', 3, 1) = 3;

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R';

SELECT ENAME, TRUNC(SYSDATE - HIREDATE) AS "근무일수"
FROM EMP;

SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR), 'C E O') AS "MANAGER"
FROM EMP
WHERE MGR IS NULL;

SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       DECODE(JOB,
              'ANALYST', SAL * 1.05,
              'SALESMAN', SAL * 1.1,
              'MANAGER', SAL * 1.15,
              'CLERK', SAL * 1.2,
              SAL
           ) AS "UPSAL"
FROM EMP;

SELECT ENAME,
       DEPTNO,
       SAL,
       CASE
           WHEN SAL < 1000 THEN SAL * 1.08
           WHEN SAL <= 2000 THEN SAL * 1.05
           WHEN SAL <= 3000 THEN SAL * 1.03
           ELSE SAL * 1.01
           END AS "UPSAL"
FROM EMP;

SELECT MAX(HIREDATE) AS "입사일", MIN(HIREDATE) AS "입사일"
FROM EMP;

SELECT COUNT(COMM) AS "사원수"
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10;

SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
ORDER BY "입사자(명)" DESC;

SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY "입사자(명)";

SELECT *
FROM EMP;

select DEPTNO, count(*)
from EMP
group by deptno
order by DEPTNO;

-- 6장. 그룹함수2
select deptno, count(deptno)
from emp
group by rollup (deptno)
order by deptno;

select deptno, job, count(*)
from emp
group by rollup (deptno, job)
order by deptno;

select deptno, job, count(*)
from emp
group by rollup (job, deptno)
order by job;

select deptno, job, count(job)
from emp
group by cube (deptno, job)
order by deptno;
select deptno, job, count(job)
from emp
group by cube (job, deptno)
order by job;

-- LISTAGG
select deptno,
       listagg(ename, ', ') within group ( order by job ) as "LISTAGG",
       count(*)                                              count
from emp
GROUP BY deptno;

select emp.ename, dept.deptno, dept.dname
from emp,
     dept
where emp.deptno = dept.deptno
order by deptno;

select d.dname
from emp e,
     dept d
where e.deptno = d.deptno
  and e.ename = 'SCOTT';

select *
from emp e,
     dept d
where e.deptno = d.deptno;

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'NEW YORK';

SELECT *
FROM SALGRADE;

SELECT S.GRADE
     , LISTAGG(E.ENAME, ', ') WITHIN GROUP ( ORDER BY E.ENAME ) LISTAGG
     , COUNT(GRADE) || '명'                                      인원수
FROM EMP E,
     SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

SELECT M.ENAME
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND E.ENAME = 'SMITH';


SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as whoseManager
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT M.ENAME                                                  매니저이름,
       LISTAGG(E.ENAME, ', ') WITHIN GROUP ( ORDER BY E.ENAME ) 사원이름,
       COUNT(*) || '명'                                          인원수
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
GROUP BY M.ENAME;

-- 매니저가 KING인 사원들의 이름과 직급을 출력하시오.
SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';

-- SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오.
SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.DEPTNO = M.DEPTNO
  AND M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO(+);

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO(+);

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
-- 정보가 부족할수도 있는 쪽 테이블이 EMP이기 때문에, 왼쪽에 (+)을 붙인다.

-- cross join
select *
from emp,
     dept;
select *
from emp
         cross join dept;

-- equi join
select ename, dname
from emp,
     dept
where emp.deptno = dept.deptno;
select ename, dname
from emp
         inner join dept
                    on emp.deptno = dept.deptno;
-- ex)
select ename, dname
from emp,
     dept
where emp.deptno = dept.deptno
  and ename = 'SCOTT';
select ename, dname
from emp
         inner join dept on emp.deptno = dept.deptno
where emp.ename = 'SCOTT';

select ename, dname
from emp
         inner join dept using (deptno)
where emp.ename = 'SCOTT';

select d.deptno, e.ename, d.dname
from emp e
         inner join dept d using (deptno)
where e.ename = 'SCOTT';

select *
from emp e
         inner join dept d using (deptno)
where e.job = 'MANAGER';

select emp.ename, dept.dname
from emp
         natural join dept; -- EMP와 DEPT라는 같은 이름의 컬럼이 있기 때문에 다음과 같이 간단하게 조인문을 기술할 수 있다.

select *
from emp
         natural join dept;

select e.ename, d.dname
from emp e
         natural join dept d
where e.ename = 'SCOTT';

drop table dept01;

create table dept01
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14)
);

insert into dept01
values (10, 'ACCOUNTING');
insert into dept01
values (20, 'RESEARCH');

drop table dept02;

create table dept02
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14)
);
insert into dept02
values (10, 'ACCOUNTING');
insert into dept02
values (30, 'SALES');

select *
from dept01;
select *
from dept02;

select *
from dept01
         left outer join dept02
                         on dept01.deptno = dept02.deptno;
select *
from dept01
         left outer join dept02
                         using (deptno);


-- 어디껄 더 보여주세요~ 라는 의미라고 이해하면 쉬움
select *
from dept01
         right outer join dept02
                          on dept01.deptno = dept02.deptno;

select *
from dept01
         right outer join dept02
                          using (deptno);


select *
from dept01
         full outer join dept02
                         using (deptno)
order by deptno;


-- right outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         RIGHT OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME IS NOT NULL;

-- left outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         LEFT OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME IS NOT NULL;


-- full outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         FULL OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME IS NOT NULL
  AND M.ENAME IS NOT NULL;


-- 사원테이블에 대한 급여 등급을 조회하는 문을 ANSI JOIN문으로 바꾸어 보세요.
select e.ename 사원명, e.sal 급여, sg.GRADE 급여등급
from emp e
         inner join salgrade sg
                    on e.sal between sg.losal and sg.hisal
;
SELECT E.ENAME 사원명, E.SAL 급여, SG.GRADE 급여등급
FROM EMP E
         INNER JOIN SALGRADE SG ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL;

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'NEW YORK';

SELECT E.ENAME, E.SAL
FROM EMP E
         INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'NEW YORK';

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.DNAME = 'ACCOUNTING';

SELECT E.ENAME, E.SAL
FROM EMP E
         INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME = 'ACCOUNTING';

SELECT E.ENAME, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.JOB = 'MANAGER';

SELECT E.ENAME, D.DNAME
FROM EMP E
         INNER JOIN DEPT D on E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER';

SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';

SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';
SELECT E.ENAME, E.JOB
FROM EMP E
         INNER JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'KING';


SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.DEPTNO = M.DEPTNO
  AND M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, M.ENAME
FROM EMP E
         INNER JOIN EMP M ON E.DEPTNO = M.DEPTNO
WHERE M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         LEFT OUTER JOIN EMP E2
                         ON E1.MGR = E2.EMPNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         RIGHT OUTER JOIN EMP E2
                          ON E1.MGR = E2.EMPNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         FULL OUTER JOIN EMP E2
                         ON E1.MGR = E2.EMPNO
ORDER BY E1.ENAME;

select *
from emp e
         inner join salgrade s on sal between losal and hisal;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E
         RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');

SELECT *
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SCOTT');



SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SCOTT');

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');

SELECT AVG(SAL)
FROM EMP;
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);


-- 다중 행 서브쿼리
select ename, sal, deptno
from emp
where deptno in (10, 20);

select distinct deptno
from emp
where sal >= 3000;

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000)
ORDER BY DEPTNO;

SELECT DEPTNO
FROM EMP
WHERE JOB = 'MANAGER';

SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');


-- 추가 과제
select ENAME, REPLACE(ENAME, SUBSTR(ENAME, 2), '****') AS REPLACE-- , replace(ename, substr(ename, 2), '*')
from emp;

select replace(ename, substr(ename, 2, length(ename) - 1), '*')
from emp;

select RPAD('*', LENGTH(ENAME) - 1, '*')
from emp;

SELECT ENAME,
       -- 이름 중에 두번째 알파벳부터 끝까지에 해당하는 문자열을 바꿀껀데 뭘로?
       -- *로, 길이 계산은 기존 이름의 길이 -1만큼을 잡아놓고, 첫번째 문자를 '*'로 잡아 나머지 또한 '*'로 채운다.
       REPLACE(ENAME, SUBSTR(ENAME, 2), RPAD('*', LENGTH(ENAME) - 1, '*')) AS REPLACE
FROM EMP;

select substr(ename, 2)
from emp;

SELECT ENAME,
       -- 이름 중에 두번째 알파벳부터 끝까지에 해당하는 문자열을 바꿀껀데 뭘로?
       -- *로, 길이 계산은 기존 이름의 길이 -1만큼을 잡아놓고, 첫번째 문자를 '*'로 잡아 나머지 또한 '*'로 채운다.
       REPLACE(ENAME, SUBSTR(ENAME, 2), RPAD('*', LENGTH(ENAME) - 1, '*')) AS REPLACE
FROM EMP;

SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');

select rpad('*', 5, '*')
from dual;

select ename, sal, deptno
from emp
where deptno in (10, 20);

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);

SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30;


-- SELECT *
-- FROM EMP
-- WHERE SAL > (SELECT SAL FROM EMP WHERE DEPTNO = 30); -- single-row subquery returns more than one row.

SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');


SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);


SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND JOB <> 'SALESMAN';
-- SELECT ENAME, SAL, JOB
--   FROM EMP
--  WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
--    AND JOB ^= 'SALESMAN';
-- SELECT ENAME, SAL, JOB
--   FROM EMP
--  WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
--    AND JOB != 'SALESMAN';

SELECT ENAME, JOB
FROM EMP
WHERE JOB = (select job
             from emp
             where ename = 'SMITH');

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND DEPTNO <> 20;

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND DEPTNO <> 20;

SELECT *
FROM EMP
WHERE EXISTS(SELECT SAL
             FROM EMP
             WHERE DEPTNO = 30);

SELECT *
FROM EMP
WHERE EXISTS(SELECT SAL
             FROM EMP
             WHERE DEPTNO = 40);

select deptno, min(sal)
from emp
group by deptno;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO)
ORDER BY SAL DESC;

SELECT 2, 4, 6
FROM DUAL
UNION
SELECT 1, 3, 5
FROM DUAL;

SELECT ENAME
FROM EMP
UNION
SELECT ENAME
FROM EMP;

-- select ename
-- from emp
-- union
-- select deptno
-- from emp; -- expression must have same datatype as corresponding expression

SELECT ENAME
FROM EMP
UNION ALL
SELECT ENAME
FROM EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

-- create table <-> drop table
CREATE TABLE
    EMP01
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL   NUMBER(7, 2)
);


select *
from emp;
desc EMP01;

CREATE TABLE
    DEPT01
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
);

select *
from emp01;
select *
from dept01;

create table emp02
as
select *
from emp;
select *
from emp02;

create table emp03
as
select empno, ename
from emp;
select *
from EMP03;

CREATE TABLE EMP04
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;
select *
from emp04;

create table emp05
as
select *
from emp
where deptno = 10;
select *
from emp05;

create table emp06
as
select *
from emp
where 1 = 0;
select *
from emp06;


CREATE TABLE DEPT02
AS
SELECT *
FROM DEPT
WHERE 1 = 0;

select *
from emp01;
alter table EMP01
    add (JOB varchar2(9));
select *
from emp01;

-- set sqlprompt '_USER>'
-- login.sql

ALTER TABLE DEPT02
    ADD (DMGR VARCHAR2(10));

select *
from dept02;

alter table emp01
    modify (job varchar2(30));

ALTER TABLE DEPT02
    MODIFY (DMGR NUMBER(4));

alter table emp01
    drop column job;

ALTER TABLE DEPT02
    DROP COLUMN DMGR;

drop table emp01;
select *
from emp01;

select *
from emp02;

truncate table emp02;
select *
from emp02;

RENAME TEST to EMP02;
select *
from EMP02;

alter table emp02
    rename column emno2 to empno2;

select *
from emp02;

select *
from dept02;
ALTER TABLE DEPT02
    RENAME COLUMN LOC TO LOC2;

insert into dept01 (deptno, dname, loc)
values (10, 'ACCOUNTING', 'NEW YORK');

select *
from dept01;
insert into dept01 (deptno, dname, loc)
values (10, 'ACCOUNTING', 'NEW YORK');
select *
from dept01;

INSERT INTO DEPT01
    (DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING'); -- NOT ENOUGH VALUES

INSERT INTO DEPT01
    (DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING', 'NEW YORK', 20);
-- TOO MANY VALUES

-- insert into dept01
-- (num, dname, loc)
-- values ( 10, 'ACCOUNTING', 'NEW YORK');

-- insert into dept01
-- (deptno, dname, loc)
-- values (10, ACCOUNTING, 'NEW YORK');

insert into dept01
values (20, 'RESEARCH', 'DALLAS');
select *
from dept01;

select *
from sam100;
CREATE TABLE SAM01
AS
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE 1 = 0;
select *
from emp03
where 1 = 0;

select *
from emp03;

alter table emp03
    add (SAL number(7, 2));


select *
from sam01;
INSERT INTO SAM01
VALUES (1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01
VALUES (1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01
VALUES (1020, 'ORANGE', 'DOCTOR', 25000);

SELECT *
FROM SAM01;

select *
from dept01;

insert into dept01 (deptno, dname)
values (30, 'SALES');
select *
from dept01;

insert into dept01
values (40, 'OPERATIONS', NULL);
select *
from dept01;

insert into dept01
values (50, '', 'CHICAGO');

SELECT *
FROM DEPT01
WHERE LOC IS NULL;

SELECT *
FROM DEPT01
WHERE DNAME IS NULL;

select *
from sam01;
INSERT INTO SAM01
VALUES (1030, 'VERY', NULL, 25000);
INSERT INTO SAM01
VALUES (1040, 'CAT', NULL, 2000);
select *
from sam01;

drop table dept02;
create table dept02
as
select *
from dept
where 1 = 0;

select *
from dept02;

insert into dept02
select *
from dept;

select *
from dept02;


INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 10;

select *
from sam01;

CREATE TABLE EMP_HIR
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;
CREATE TABLE EMP_MGR
AS
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE 1 = 0;

INSERT ALL
    INTO EMP_HIR
VALUES (EMPNO, ENAME, HIREDATE)
INTO EMP_MGR
VALUES (EMPNO, ENAME, MGR)
SELECT EMPNO, ENAME, HIREDATE, MGR
FROM EMP
WHERE DEPTNO = 20;


CREATE TABLE EMP_HIR02
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;
CREATE TABLE EMP_SAL
AS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE 1 = 0;

select *
from emp
where hiredate > '1982-01-01';

INSERT ALL
    WHEN HIREDATE > '1982-01-01' THEN
    INTO EMP_HIR02
VALUES (EMPNO, ENAME, HIREDATE)
    WHEN SAL >= 2000 THEN
INTO EMP_SAL
VALUES (EMPNO, ENAME, SAL)
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP;

select *
from emp_hir02;
select *
from emp_sal;

select *
from emp
where sal >= 2000;


create table emp10
as
select empno, ename
from emp
where 1 = 0;
select *
from emp10;

insert all
    into emp10
values (11, '홍길동')
into emp10
values (22, '전우치')
select *
from emp;
select *
from emp10;

select *
from emp01;
create table emp01
as
select *
from emp;


select *
from emp01;
UPDATE EMP01
SET DEPTNO = 30;
UPDATE EMP01
SET SAL = SAL * 1.1;

select sysdate
from dual;

UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD');

SELECT EMPNO, ENAME, HIREDATE
FROM EMP01;

select *
from emp01;

update emp01
set deptno = 30
where deptno = 10;
update emp01
set sal = sal * 1.1
where sal >= 3000;

select to_char(hiredate, 'YYYY')
from emp01;

UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
WHERE TO_CHAR(HIREDATE, 'YYYY') = '1987';
SELECT EMPNO, ENAME, HIREDATE
FROM EMP01
WHERE EMPNO IN (7788, 7876);


UPDATE SAM01
SET SAL = SAL - 5000
WHERE SAL >= 10000;
select *
from sam01;

drop table emp01;
create table emp01
as
select *
from emp;
commit;

select *
from emp01;

select *
from emp01;

select empno
from emp01;

UPDATE EMP01
SET DEPTNO = 10,
    JOB    = 'MANAGER'
WHERE ENAME = 'SCOTT';
UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
    SAL      = 50,
    COMM     = 4000
WHERE ENAME = 'SCOTT';
SELECT *
FROM EMP01
WHERE ENAME = 'SCOTT';


select loc
from dept
where deptno = 40;

-- insert into dept01
-- select * from dept;
-- select * from dept01;

UPDATE DEPT01
SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

select *
from dept02;

select *
from dept;

CREATE TABLE SAM02
AS
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP;
select *
from sam02;

UPDATE SAM02
SET SAL = SAL + 1000
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT02 WHERE LOC = 'DALLAS');

select *
from sam02;
select *
from dept01;

select dname, loc
from dept
where deptno = 40;

update dept01
set loc = 'DALLAS'
where deptno = 20;


SELECT *
FROM DEPT01;

UPDATE DEPT01
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO = 40

UPDATE SAM02
SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE
                       FROM SAM02
                       WHERE ENAME = 'KING');

DELETE
FROM DEPT01;
SELECT *
FROM DEPT01;


INSERT INTO DEPT01
SELECT *
FROM DEPT;

SELECT *
FROM DEPT01;

DELETE
FROM DEPT01
WHERE DEPTNO = 30;

select *
from sam01;

DELETE
FROM SAM01
WHERE JOB IS NULL;

delete
from emp01;
select *
from emp01;

insert into emp01
select *
from emp;

select *
from emp01;
select deptno
from dept
where dname = 'SALES';

DELETE
FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

SELECT *
FROM SAM02;

SELECT DEPTNO
FROM DEPT
WHERE DNAME = 'RESEARCH';

DELETE
FROM SAM02
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
SELECT *
FROM SAM02;

--7

select *
from jumsu;
CREATE TABLE JUMSU
(
    NAME VARCHAR2(20),
    KOR  NUMBER,
    ENG  NUMBER,
    MAT  NUMBER
);
INSERT INTO JUMSU
VALUES ('박해영', 80, 90, 70);
INSERT INTO JUMSU
VALUES ('김혜수', 75, 96, 80);
INSERT INTO JUMSU
VALUES ('똘똘이', 95, 90, 85);

select *
from jumsu;

SELECT NAME
     , KOR
     , ENG
     , MAT
     , KOR + ENG + MAT              AS               총점
     , ROUND((KOR + ENG + MAT) / 3) AS               평균
     , RANK() OVER (ORDER BY (KOR + ENG + MAT) DESC) 등수
FROM JUMSU;

SELECT NAME, KOR AS "국어 최고 점수"
FROM JUMSU
WHERE KOR = (SELECT MAX(KOR) FROM JUMSU);



SELECT NAME, ENG AS "영어 최고 점수"
FROM JUMSU
WHERE ENG = (SELECT MAX(ENG) FROM JUMSU);
SELECT NAME, MAT AS "수학 최고 점수"
FROM JUMSU
WHERE MAT = (SELECT MAX(MAT) FROM JUMSU);

select *
from jumsu;

SELECT '국어' AS 과목, NAME, KOR AS 점수
FROM JUMSU
WHERE KOR = (SELECT MAX(KOR) FROM JUMSU)
UNION
SELECT '수학' AS 과목, NAME, MAT AS 점수
FROM JUMSU
WHERE MAT = (SELECT MAX(MAT) FROM JUMSU)
UNION
SELECT '영어' AS 과목, NAME, ENG AS 점수
FROM JUMSU
WHERE ENG = (SELECT MAX(ENG) FROM JUMSU);

SELECT ENAME
     , SAL
     , RANK() OVER (ORDER BY SAL DESC)       "급여순"
     , DENSE_RANK() OVER (ORDER BY SAL DESC) "급여순"
FROM EMP;


CREATE TABLE EMP01
AS
SELECT *
FROM EMP;
select *
from emp01;

CREATE TABLE EMP02
AS
SELECT *
FROM EMP
WHERE JOB = 'MANAGER';
SELECT *
FROM EMP02;

update emp02
set job = 'TEST';
select *
from emp02;

INSERT INTO EMP02
VALUES (8000, 'SYJ', 'TOP', 7566, '2009-01-12', 1200, 10, 20);

SELECT *
FROM EMP02;


MERGE INTO EMP01
USING EMP02
ON (EMP01.EMPNO = EMP02.EMPNO)
WHEN MATCHED THEN
    UPDATE
    SET EMP01.ENAME    = EMP02.ENAME,
        EMP01.JOB      = EMP02.JOB,
        EMP01.MGR      = EMP02.MGR,
        EMP01.HIREDATE = EMP02.HIREDATE,
        EMP01.SAL      = EMP02.SAL,
        EMP01.COMM     = EMP02.COMM,
        EMP01.DEPTNO   = EMP02.DEPTNO
WHEN NOT MATCHED THEN
    INSERT
    VALUES (EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, EMP02.HIREDATE, EMP02.SAL, EMP02.COMM, EMP02.DEPTNO);

select *
from dept01;
drop table dept01;

CREATE TABLE DEPT01
AS
SELECT *
FROM DEPT;
SELECT *
FROM DEPT01;

DELETE
FROM DEPT01;
SELECT *
FROM DEPT01;

ROLLBACK;
SELECT *
FROM DEPT01;

DELETE
FROM DEPT01
WHERE DEPTNO = 20;
SELECT *
FROM DEPT01;

commit;

select *
from dept01;
rollback;

select *
from dept01;

select *
from dept02;

drop table dept02;
create table dept02
as
select *
from dept;

delete
from dept02
where deptno = 40;


select *
from dept02;

create table dept03
as
select *
from dept;

rollback;
select *
from dept02;

drop table dept01;

create table dept01
as
select *
from dept;

select *
from dept01; ---------------------------------------------------

delete
from dept01
where deptno = 40;
commit;

delete
from dept01
where deptno = 30;
savepoint C1;

delete
from dept01
where deptno = 20;
savepoint C2;

delete
from dept01
where deptno = 10;

select *
from dept01;

rollback to C2;
select *
from dept01;

rollback to C1;
select *
from dept01;

rollback;
select *
from dept01;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

SELECT *
FROM USER_CONS_COLUMNS;

select *
from emp01;
drop table emp01;

select *
from dept;
drop table emp01;


select *
from dept;
drop table emp01;

CREATE TABLE EMP01
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10),
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

INSERT INTO EMP01
VALUES (NULL, NULL, 'SALESMAN', 30);

SELECT *
FROM EMP01;

CREATE TABLE EMP02
(
    EMPNO  NUMBER(4)    NOT NULL,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);
-- [23000][1400] ORA-01400: cannot insert NULL into ("SCOTT"."EMP02"."EMPNO")
INSERT INTO EMP02
VALUES (NULL, NULL, 'SALESMAN', 30);


SELECT * -- CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP02');

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP02');

SELECT UC.OWNER
     , UC.CONSTRAINT_NAME
     , UC.CONSTRAINT_TYPE
     , UC.TABLE_NAME
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC,
     USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME IN ('EMP02');

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP03');

SELECT *
FROM EMP03;
CREATE TABLE EMP03
(
    EMPNO  NUMBER(4) UNIQUE,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);
COMMIT;

INSERT INTO EMP03
VALUES (7499, 'JONES', 'MANAGER', 20);

insert into emp03
values (null, 'JONES', 'MANAGER', 20);
insert into emp03
values (null, 'JONES', 'SALESMAN', 10);

select *
from emp03;


select *
from emp04;
drop table emp04;

CREATE TABLE EMP04
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP04_EMPNO_UK UNIQUE,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP04_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP05');


CREATE TABLE EMP05
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP05_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP05');

INSERT INTO EMP05
VALUES (7499, 'ALLEN', 'SALESMAN', 30);
INSERT INTO EMP05
VALUES (7499, 'JONES', 'MANAGER', 20); -- [23000][1] ORA-00001: unique constraint (SCOTT.EMP05_EMPNO_PK) violated

INSERT INTO EMP05
VALUES (NULL, 'JONES', 'MANAGER', 20); -- [23000][1400] ORA-01400: cannot insert NULL into ("SCOTT"."EMP05"."EMPNO")

select *
from emp06;
drop table emp06;

CREATE TABLE EMP06
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
        CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT (DEPTNO)
);
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP06');

-- [23000][2291] ORA-02291: integrity constraint (SCOTT.EMP06_DEPTNO_FK) violated - parent key not found
-- 참조하는 테이블에 존재하지 않는 값을 입력해서 오류, 50
insert into emp06
values (7566, 'JONES', 'MANAGER', 50);

CREATE TABLE EMP07
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP07_ENAME_NN NOT NULL,
    SAL    NUMBER(7, 2)
        CONSTRAINT EMP07_SAL_CK CHECK ( SAL BETWEEN 500 AND 5000 ),
    GENDER VARCHAR2(1)
        CONSTRAINT EMP07_GENDER_CK CHECK ( GENDER IN ('M', 'F') )
);
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP07');

INSERT INTO EMP07
VALUES (7499, 'ALLEN', 200, 'M'); -- 급여 제약조건 위배 [23000][2290] ORA-02290: CHECK CONSTRAINT (SCOTT.EMP07_SAL_CK) VIOLATED

INSERT INTO EMP07
VALUES (7499, 'ALLEN', 5000,
        'A'); -- GENDER 제약조건 위배 [23000][2290] ORA-02290: CHECK CONSTRAINT (SCOTT.EMP07_GENDER_CK) VIOLATED

drop table dept01;
CREATE TABLE DEPT01
(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(31) DEFAULT 'SEOUL'
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP01');


INSERT INTO DEPT01 (DEPTNO, DNAME)
VALUES (10, 'ACCOUNTING');

SELECT *
FROM DEPT01;

select *
from emp01;
drop table emp01;

-- 컬럼 레벨 방식의 제약조건 설정
CREATE TABLE EMP01
(
    EMPNO  NUMBER(4) PRIMARY KEY,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(4)
        CONSTRAINT EMP01_DEPTNO_FK REFERENCES DEPT (DEPTNO)
);

-- 테이블 레벨 방식의 제약조건 설정
CREATE TABLE EMP02
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(4),
    PRIMARY KEY (EMPNO),
    UNIQUE (JOB),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);
CREATE TABLE EMP03
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP03_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(4),
    CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY (EMPNO),
    CONSTRAINT EMP03_JOB_UK UNIQUE (JOB),
    CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP01', 'EMP02', 'EMP03');

CREATE TABLE MEMBER01
(
    NAME    VARCHAR2(10),
    ADDRESS VARCHAR2(30),
    HPHONE  VARCHAR2(11),
    CONSTRAINT MEMBER01_COMBO_PK PRIMARY KEY (NAME, HPHONE)
);

INSERT INTO MEMBER01
VALUES ('A', 'B', 'C');
INSERT INTO MEMBER01
VALUES ('A', 'B', 'D');
-- [23000][1] ORA-00001: unique constraint (SCOTT.MEMBER01_COMBO_PK) violated 복합키때문에 insert할때 에러 발생함
INSERT INTO MEMBER01
VALUES ('A', 'F', 'C');

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION, POSITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('MEMBER01');

-- COLUMN OWNER FORMAT A8
-- COLUMN COLUMN_NAME FORMAT A15
-- COLUMN CONSTRAINT_NAME FORMAT A20

CREATE TABLE PARENT
(
    P_ID NUMBER(2) PRIMARY KEY
);

CREATE TABLE CHILD
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD_ID_FK REFERENCES PARENT (P_ID)
);


SELECT OWNER
     , CONSTRAINT_NAME
     , R_CONSTRAINT_NAME
     , CONSTRAINT_TYPE
     , TABLE_NAME
     , COLUMN_NAME
     , SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('PARENT', 'CHILD');

INSERT INTO PARENT
VALUES (10);
INSERT INTO PARENT
VALUES (20);
INSERT INTO PARENT
VALUES (30);

INSERT INTO CHILD
VALUES (10);

-- [23000][2292] ORA-02292: integrity constraint (SCOTT.CHILD_ID_FK) violated - child record found
DELETE
FROM PARENT
WHERE P_ID = 10;

DELETE
FROM CHILD
WHERE C_ID = 10;

-- 🚨 on delete cascade
CREATE TABLE PARENT2
(
    P_ID NUMBER(2) PRIMARY KEY
);

-- 부모 테이블의 부모키를 삭제하면 자식 테이블의 참조 컬럼도 삭제됩니다.
CREATE TABLE CHILD2
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD2_ID_FK REFERENCES PARENT2 (P_ID) ON DELETE CASCADE
);

INSERT INTO PARENT2
VALUES (10);
INSERT INTO PARENT2
VALUES (20);
INSERT INTO PARENT2
VALUES (30);

INSERT INTO CHILD2
VALUES (10);


delete parent2
where P_ID = 10;
select *
from child2;

-- 🚨 on delete cascade
CREATE TABLE PARENT3
(
    P_ID NUMBER(2) PRIMARY KEY
);

-- 부모 테이블의 부모키를 삭제하면 자식 테이블의 참조 컬럼도 삭제됩니다.
CREATE TABLE CHILD3
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD3_ID_FK REFERENCES PARENT3 (P_ID) ON DELETE SET NULL
);

INSERT INTO PARENT3
VALUES (10);
INSERT INTO PARENT3
VALUES (20);
INSERT INTO PARENT3
VALUES (30);

INSERT INTO CHILD3
VALUES (10);

select *
from child3;

DELETE PARENT3
WHERE P_ID = 10;

-- 🚨 VIEW
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPT;
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO = 20;

SELECT *
FROM EMP_VIEW30;


SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 20;

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO = 20;
SELECT *
FROM EMP_VIEW20;

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

select *
from emp_view30;
insert into emp_view30
values (1111, 'AAAA', 30);

select *
from EMP_COPY;

CREATE VIEW EMP_VIEW_DEPT
AS
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

select *
from EMP_VIEW_DEPT;


CREATE VIEW SAL_VIEW
AS
SELECT DNAME, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL
FROM EMP E
         NATURAL JOIN DEPT D
GROUP BY DNAME;
SELECT *
FROM SAL_VIEW;

select dname, max(sal), min(sal)
from emp
         inner join dept
                    on emp.deptno = dept.deptno
group by dname;


select *
from parent;

-- ## 🚨 1번.
CREATE TABLE PARENT
(
    ID       VARCHAR2(20) PRIMARY KEY,
    PASSWORD VARCHAR2(12) NOT NULL,
    NAME     VARCHAR2(10) NOT NULL,
    BIRTHDAY DATE         NOT NULL
);

-- ## 🚨 2번.
CREATE TABLE CHILD
(
    ID      VARCHAR2(20) REFERENCES PARENT (ID),
    ADDRESS VARCHAR2(20) default '서울시',
    GENDER  VARCHAR2(2) CHECK ( GENDER IN ('남', '여') )
)

-- ## 🚨 3번.
-- 한글은 한글자당 3byte이기 때문에, 길이를 변경해주어야 한다. ( 1번문제에서 초기 테이블 생성시 10byte로 만들었음 )
-- ERROR at line 1: ORA-12899: value too large for column "SCOTT"."PARENT"."NAME" (actual: 12, maximum: 10)
ALTER TABLE PARENT
    MODIFY (NAME VARCHAR2(12));

INSERT INTO PARENT
VALUES ('abcd', '1234', '홍길동', '88/7/23');
INSERT INTO PARENT
VALUES ('bbbb', '5678', '신사임당', '85/11/01');
INSERT INTO PARENT
VALUES ('cccc', '90as', '성춘향', '93/12/15');
INSERT INTO PARENT
VALUES ('dddd', 'efgy', '리카엘', '92/05/01');
INSERT INTO PARENT
VALUES ('ffff', 'wjdgml', '김풍', '95/04/08');

-- CHILD.GENDER에는 '남' 또는 '여'가 들어가야 하는데 들어갈 컬럼의 길이가 짧기 때문에 먼저 길이를 3byte로 수정한다.
-- 그리고 insert를 문제에 나와있는 대로 수행해도 오류가 발생하는데, 이는 CHECK제약조건을 무시했기 때문이라, '남' 또는 '여'로 수정해야 한다.
ALTER TABLE CHILD
    MODIFY (GENDER VARCHAR2(3));

insert into child
values ('abcd', '경상북도', '남');
insert into child
values ('cccc', '퐁당시', '여');
insert into child
values ('dddd', '불가리아', '남');
insert into child
values ('ffff', '제주시', '남');
insert into child
values ('bbbb', '기품시', '여');
insert into child
values ('ffff', '제주시', '남');

-- ## 🚨 4번.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('PARENT', 'CHILD');

-- ## 🚨 5번.

/* TODO
    08/12
        - date는 세기, 년, 월, 일, 시간, 분, 초의 날짜 및 시간데이터를 저장하기 위한 데이터 형입니다.
        - 별다른 설정이 없을시, 년, 월, 일만 출력
        - 기본 날짜형식은 "YY/MM/DD"형식으로 "년/월/일"로 출력
        > ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
 */

select ename, comm, sal * 12 + comm, nvl(comm, 0), sal * 12 + nvl(comm, 0)
from emp
where ROWNUM <= 1;

select ename, sal * 12 + nvl(comm, 0) as Annsal, comm
from emp;

select ename, comm, sal * 12 + comm, nvl(comm, 0), sal * 12 + nvl(comm, 0) as 연봉, sal * 12
from emp
where ename = 'ALLEN';

SELECT ename,
       comm,
       sal * 12 + NVL(comm, 0),
       NVL(comm, 0),
       sal * 12 + NVL(comm, 0) AS 연봉
FROM emp
WHERE ename = 'ALLEN';

select deptno 부서번호, dname 부서명
from dept;

select *
from emp
where sal >= 3000
order by ename;

select *
from emp
;

select *
from emp
where hiredate <= '1982/01/01';

select empno, sal
from emp
where empno = 7521
   or empno = 7654
   or empno = 7844;

select ROWNUM, emp.*
from emp
;

select to_char(sysdate, 'YYYY년 MM DD DAY')
from dual;
select to_char(sysdate, 'YYYY') || '년 ' || to_char(sysdate, 'MM') || '월 ' || to_char(sysdate, 'DD') || '일 ' ||
       to_char(sysdate, 'DAY') 오늘날짜
from dual;

select to_char(sysdate, 'YYYY') || '년 '
           || to_char(sysdate, 'MM') || '월 '
           || to_char(sysdate, 'DD') || '일 '
           || to_char(sysdate, 'DAY') as 오늘날짜
from dual;
select to_char(sysdate, 'YYYY"년 "MM"월 "DD"일 "Day')
from dual;

select to_char(sysdate, 'YYYY년')
from dual;

select to_char(sysdate, 'YYYY/MM/DD,HH24:MI:SS')
from dual;

select ename, sal, to_char(SAL, 'L999,999')
from emp;

select trunc(sysdate - to_date('2024/07/22')) 기간
from dual;

select trunc(SYSDATE - TO_DATE('2024/07/22', 'YYYY/MM/DD'))
from dual;

select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

select EMPNO, ENAME, NVL(to_char(mgr), 'C E O') as MANAGER
from emp
where mgr is null;

select deptno, decode(deptno, 10, 'A', 20, 'B', 'DEFAULT')
from emp
order by deptno;

select ename,
       deptno,
       decode(deptno
           , 10, 'ACCOUNTING'
           , 20, 'RESEARCH'
           , 30, 'SALES'
           , 40, 'OPERATIONS') dname
from emp;



select empno,
       ename,
       job,
       sal,
       decode(job
           , 'ANALYST', sal * 1.05
           , 'SALESMAN', sal * 1.1
           , 'MANAGER', sal * 1.15
           , 'CLERK', sal * 1.2
           , sal) upsal
from emp;

select ename,
       deptno,
       case deptno
           when 10 then 'ACCOUNTING'
           when 20 then 'RESEARCH'
           when 30 then 'SALES'
           when 40 then 'OPERATIONS'
           end as dname
from emp;

select ename,
       deptno,
       sal,
       case
           when sal >= 700 and sal <= 1200 then 'LEVEL1'
           when sal >= 1201 and sal <= 1400 then 'LEVEL2'
           when sal >= 1401 and sal <= 2000 then 'LEVEL3'
           when sal >= 2001 and sal <= 3000 then 'LEVEL4'
           ELSE 'LEVEL5'
           end as grade
from emp;

select ename,
       deptno,
       trunc(sal) sal,
       case
           when sal < 1000 then sal * 1.08
           when sal <= 2000 then sal * 1.05
           when sal <= 3000 then sal * 1.03
           ELSE sal * 1.01
           end as upsal
from emp;

select sum(sal)
from emp;

select sum(comm)
from emp;

select avg(sal)
from emp;

select max(sal), min(sal)
from emp;

select max(HIREDATE) as max_hiredate, min(HIREDATE) as min_hiredate
from emp;

select count(comm)
from emp;

select count(*), count(comm)
from emp;

select count(comm) 사원수
from emp
where DEPTNO = 10;

select count(distinct job) 업무수
from emp;

select deptno, max(sal) max_sal, min(sal) min_sal
from emp
group by deptno;

select deptno, count(*), count(comm)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;

select DEPTNO, max(sal) max_sal, min(sal) min_sal
from EMP
group by DEPTNO
having max(sal) > 2900;

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE;

-- 문제1
SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
;

-- 문제2
SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
ORDER BY TO_CHAR(HIREDATE, 'YY') DESC
;

-- 문제3
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제4
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
WHERE COMM IS NOT NULL
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제5
SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)", AVG(SAL) as "평균급여"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY TO_CHAR(HIREDATE, 'YY/MM')
;

-- 문제6
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
;

-- 문제7
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) < 5
;

-- 문제8
SELECT MGR as "매니저번호", COUNT(*) as "인원수"
FROM EMP
GROUP BY MGR
ORDER BY MGR
;

-- 문제9
SELECT MGR as "매니저번호", COUNT(*) as "인원수"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
ORDER BY MGR
;

-- 문제10
SELECT MGR as "매니저번호", MAX(SAL) as "최고 급여"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
ORDER BY MGR
;

-- 문제11
SELECT MGR as "매니저번호", MAX(SAL) as "최고 급여"
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MAX(SAL) BETWEEN 1000 AND 2000
ORDER BY MGR
;



SELECT *
FROM EMP
WHERE MOD(EMPNO, 2) = 1
;

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE, 1, 2) = '87';

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, -1, 1) = 'E';

SELECT *
FROM EMP
WHERE INSTR(ENAME, 'R', 3, 1) = 3;

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R';

SELECT ENAME, TRUNC(SYSDATE - HIREDATE) AS "근무일수"
FROM EMP;

SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR), 'C E O') AS "MANAGER"
FROM EMP
WHERE MGR IS NULL;

SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       DECODE(JOB,
              'ANALYST', SAL * 1.05,
              'SALESMAN', SAL * 1.1,
              'MANAGER', SAL * 1.15,
              'CLERK', SAL * 1.2,
              SAL
           ) AS "UPSAL"
FROM EMP;

SELECT ENAME,
       DEPTNO,
       SAL,
       CASE
           WHEN SAL < 1000 THEN SAL * 1.08
           WHEN SAL <= 2000 THEN SAL * 1.05
           WHEN SAL <= 3000 THEN SAL * 1.03
           ELSE SAL * 1.01
           END AS "UPSAL"
FROM EMP;

SELECT MAX(HIREDATE) AS "입사일", MIN(HIREDATE) AS "입사일"
FROM EMP;

SELECT COUNT(COMM) AS "사원수"
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10;

SELECT TO_CHAR(HIREDATE, 'YY') as "년도", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY')
ORDER BY "입사자(명)" DESC;

SELECT TO_CHAR(HIREDATE, 'YY/MM') as "년/월", COUNT(*) as "입사자(명)"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YY/MM')
ORDER BY "입사자(명)";

SELECT *
FROM EMP;

select DEPTNO, count(*)
from EMP
group by deptno
order by DEPTNO;

-- 6장. 그룹함수2
select deptno, count(deptno)
from emp
group by rollup (deptno)
order by deptno;

select deptno, job, count(*)
from emp
group by rollup (deptno, job)
order by deptno;

select deptno, job, count(*)
from emp
group by rollup (job, deptno)
order by job;

select deptno, job, count(job)
from emp
group by cube (deptno, job)
order by deptno;
select deptno, job, count(job)
from emp
group by cube (job, deptno)
order by job;

-- LISTAGG
select deptno,
       listagg(ename, ', ') within group ( order by job ) as "LISTAGG",
       count(*)                                              count
from emp
GROUP BY deptno;

select emp.ename, dept.deptno, dept.dname
from emp,
     dept
where emp.deptno = dept.deptno
order by deptno;

select d.dname
from emp e,
     dept d
where e.deptno = d.deptno
  and e.ename = 'SCOTT';

select *
from emp e,
     dept d
where e.deptno = d.deptno;

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'NEW YORK';

SELECT *
FROM SALGRADE;

SELECT S.GRADE
     , LISTAGG(E.ENAME, ', ') WITHIN GROUP ( ORDER BY E.ENAME ) LISTAGG
     , COUNT(GRADE) || '명'                                      인원수
FROM EMP E,
     SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

SELECT M.ENAME
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND E.ENAME = 'SMITH';


SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as whoseManager
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT M.ENAME                                                  매니저이름,
       LISTAGG(E.ENAME, ', ') WITHIN GROUP ( ORDER BY E.ENAME ) 사원이름,
       COUNT(*) || '명'                                          인원수
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
GROUP BY M.ENAME;

-- 매니저가 KING인 사원들의 이름과 직급을 출력하시오.
SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';

-- SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오.
SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.DEPTNO = M.DEPTNO
  AND M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO(+);

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO(+);

SELECT RPAD(E.ENAME, 6) || '의 매니저는 ' || M.ENAME || '입니다.' as WHO_IS_MANAGER
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
-- 정보가 부족할수도 있는 쪽 테이블이 EMP이기 때문에, 왼쪽에 (+)을 붙인다.

-- cross join
select *
from emp,
     dept;
select *
from emp
         cross join dept;

-- equi join
select ename, dname
from emp,
     dept
where emp.deptno = dept.deptno;
select ename, dname
from emp
         inner join dept
                    on emp.deptno = dept.deptno;
-- ex)
select ename, dname
from emp,
     dept
where emp.deptno = dept.deptno
  and ename = 'SCOTT';
select ename, dname
from emp
         inner join dept on emp.deptno = dept.deptno
where emp.ename = 'SCOTT';

select ename, dname
from emp
         inner join dept using (deptno)
where emp.ename = 'SCOTT';

select d.deptno, e.ename, d.dname
from emp e
         inner join dept d using (deptno)
where e.ename = 'SCOTT';

select *
from emp e
         inner join dept d using (deptno)
where e.job = 'MANAGER';

select emp.ename, dept.dname
from emp
         natural join dept; -- EMP와 DEPT라는 같은 이름의 컬럼이 있기 때문에 다음과 같이 간단하게 조인문을 기술할 수 있다.

select *
from emp
         natural join dept;

select e.ename, d.dname
from emp e
         natural join dept d
where e.ename = 'SCOTT';

drop table dept01;

create table dept01
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14)
);

insert into dept01
values (10, 'ACCOUNTING');
insert into dept01
values (20, 'RESEARCH');

drop table dept02;

create table dept02
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14)
);
insert into dept02
values (10, 'ACCOUNTING');
insert into dept02
values (30, 'SALES');

select *
from dept01;
select *
from dept02;

select *
from dept01
         left outer join dept02
                         on dept01.deptno = dept02.deptno;
select *
from dept01
         left outer join dept02
                         using (deptno);


-- 어디껄 더 보여주세요~ 라는 의미라고 이해하면 쉬움
select *
from dept01
         right outer join dept02
                          on dept01.deptno = dept02.deptno;

select *
from dept01
         right outer join dept02
                          using (deptno);


select *
from dept01
         full outer join dept02
                         using (deptno)
order by deptno;


-- right outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         RIGHT OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME IS NOT NULL;

-- left outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         LEFT OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME IS NOT NULL;


-- full outer join
SELECT E.ENAME 사원이름, M.ENAME 매니저이름
FROM EMP E
         FULL OUTER JOIN EMP M ON E.MGR = M.EMPNO
WHERE E.ENAME IS NOT NULL
  AND M.ENAME IS NOT NULL;


-- 사원테이블에 대한 급여 등급을 조회하는 문을 ANSI JOIN문으로 바꾸어 보세요.
select e.ename 사원명, e.sal 급여, sg.GRADE 급여등급
from emp e
         inner join salgrade sg
                    on e.sal between sg.losal and sg.hisal
;
SELECT E.ENAME 사원명, E.SAL 급여, SG.GRADE 급여등급
FROM EMP E
         INNER JOIN SALGRADE SG ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL;

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.LOC = 'NEW YORK';

SELECT E.ENAME, E.SAL
FROM EMP E
         INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'NEW YORK';

SELECT E.ENAME, E.SAL
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND D.DNAME = 'ACCOUNTING';

SELECT E.ENAME, E.SAL
FROM EMP E
         INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME = 'ACCOUNTING';

SELECT E.ENAME, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.JOB = 'MANAGER';

SELECT E.ENAME, D.DNAME
FROM EMP E
         INNER JOIN DEPT D on E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER';

SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';

SELECT E.ENAME, E.JOB
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND M.ENAME = 'KING';
SELECT E.ENAME, E.JOB
FROM EMP E
         INNER JOIN EMP M ON E.MGR = M.EMPNO
WHERE M.ENAME = 'KING';


SELECT E.ENAME, M.ENAME
FROM EMP E,
     EMP M
WHERE E.DEPTNO = M.DEPTNO
  AND M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, M.ENAME
FROM EMP E
         INNER JOIN EMP M ON E.DEPTNO = M.DEPTNO
WHERE M.ENAME <> 'SCOTT'
  AND E.ENAME = 'SCOTT';

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         LEFT OUTER JOIN EMP E2
                         ON E1.MGR = E2.EMPNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         RIGHT OUTER JOIN EMP E2
                          ON E1.MGR = E2.EMPNO;

SELECT E1.ENAME AS "사원", E2.ENAME AS "매니저"
FROM EMP E1
         FULL OUTER JOIN EMP E2
                         ON E1.MGR = E2.EMPNO
ORDER BY E1.ENAME;

select *
from emp e
         inner join salgrade s on sal between losal and hisal;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E,
     DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E
         RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');

SELECT *
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SCOTT');



SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SCOTT');

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');

SELECT AVG(SAL)
FROM EMP;
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);


-- 다중 행 서브쿼리
select ename, sal, deptno
from emp
where deptno in (10, 20);

select distinct deptno
from emp
where sal >= 3000;

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000)
ORDER BY DEPTNO;

SELECT DEPTNO
FROM EMP
WHERE JOB = 'MANAGER';

SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');


-- 추가 과제
select ENAME, REPLACE(ENAME, SUBSTR(ENAME, 2), '****') AS REPLACE-- , replace(ename, substr(ename, 2), '*')
from emp;

select replace(ename, substr(ename, 2, length(ename) - 1), '*')
from emp;

select RPAD('*', LENGTH(ENAME) - 1, '*')
from emp;

SELECT ENAME,
       -- 이름 중에 두번째 알파벳부터 끝까지에 해당하는 문자열을 바꿀껀데 뭘로?
       -- *로, 길이 계산은 기존 이름의 길이 -1만큼을 잡아놓고, 첫번째 문자를 '*'로 잡아 나머지 또한 '*'로 채운다.
       REPLACE(ENAME, SUBSTR(ENAME, 2), RPAD('*', LENGTH(ENAME) - 1, '*')) AS REPLACE
FROM EMP;

select substr(ename, 2)
from emp;

SELECT ENAME,
       -- 이름 중에 두번째 알파벳부터 끝까지에 해당하는 문자열을 바꿀껀데 뭘로?
       -- *로, 길이 계산은 기존 이름의 길이 -1만큼을 잡아놓고, 첫번째 문자를 '*'로 잡아 나머지 또한 '*'로 채운다.
       REPLACE(ENAME, SUBSTR(ENAME, 2), RPAD('*', LENGTH(ENAME) - 1, '*')) AS REPLACE
FROM EMP;

SELECT DEPTNO, DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');

select rpad('*', 5, '*')
from dual;

select ename, sal, deptno
from emp
where deptno in (10, 20);

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = 30);

SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 30;


-- SELECT *
-- FROM EMP
-- WHERE SAL > (SELECT SAL FROM EMP WHERE DEPTNO = 30); -- single-row subquery returns more than one row.

SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');


SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);


SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND JOB <> 'SALESMAN';
-- SELECT ENAME, SAL, JOB
--   FROM EMP
--  WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
--    AND JOB ^= 'SALESMAN';
-- SELECT ENAME, SAL, JOB
--   FROM EMP
--  WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
--    AND JOB != 'SALESMAN';

SELECT ENAME, JOB
FROM EMP
WHERE JOB = (select job
             from emp
             where ename = 'SMITH');

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND DEPTNO <> 20;

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
  AND DEPTNO <> 20;

SELECT *
FROM EMP
WHERE EXISTS(SELECT SAL
             FROM EMP
             WHERE DEPTNO = 30);

SELECT *
FROM EMP
WHERE EXISTS(SELECT SAL
             FROM EMP
             WHERE DEPTNO = 40);

select deptno, min(sal)
from emp
group by deptno;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO)
ORDER BY SAL DESC;

SELECT 2, 4, 6
FROM DUAL
UNION
SELECT 1, 3, 5
FROM DUAL;

SELECT ENAME
FROM EMP
UNION
SELECT ENAME
FROM EMP;

-- select ename
-- from emp
-- union
-- select deptno
-- from emp; -- expression must have same datatype as corresponding expression

SELECT ENAME
FROM EMP
UNION ALL
SELECT ENAME
FROM EMP;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 1000
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 2000;

-- create table <-> drop table
CREATE TABLE
    EMP01
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SAL   NUMBER(7, 2)
);


select *
from emp;
desc EMP01;

CREATE TABLE
    DEPT01
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
);

select *
from emp01;
select *
from dept01;

create table emp02
as
select *
from emp;
select *
from emp02;

create table emp03
as
select empno, ename
from emp;
select *
from EMP03;

CREATE TABLE EMP04
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;
select *
from emp04;

create table emp05
as
select *
from emp
where deptno = 10;
select *
from emp05;

create table emp06
as
select *
from emp
where 1 = 0;
select *
from emp06;


CREATE TABLE DEPT02
AS
SELECT *
FROM DEPT
WHERE 1 = 0;

select *
from emp01;
alter table EMP01
    add (JOB varchar2(9));
select *
from emp01;

-- set sqlprompt '_USER>'
-- login.sql

ALTER TABLE DEPT02
    ADD (DMGR VARCHAR2(10));

select *
from dept02;

alter table emp01
    modify (job varchar2(30));

ALTER TABLE DEPT02
    MODIFY (DMGR NUMBER(4));

alter table emp01
    drop column job;

ALTER TABLE DEPT02
    DROP COLUMN DMGR;

drop table emp01;
select *
from emp01;

select *
from emp02;

truncate table emp02;
select *
from emp02;

RENAME TEST to EMP02;
select *
from EMP02;

alter table emp02
    rename column emno2 to empno2;

select *
from emp02;

select *
from dept02;
ALTER TABLE DEPT02
    RENAME COLUMN LOC TO LOC2;

insert into dept01 (deptno, dname, loc)
values (10, 'ACCOUNTING', 'NEW YORK');

select *
from dept01;
insert into dept01 (deptno, dname, loc)
values (10, 'ACCOUNTING', 'NEW YORK');
select *
from dept01;

INSERT INTO DEPT01
    (DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING'); -- NOT ENOUGH VALUES

INSERT INTO DEPT01
    (DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING', 'NEW YORK', 20);
-- TOO MANY VALUES

-- insert into dept01
-- (num, dname, loc)
-- values ( 10, 'ACCOUNTING', 'NEW YORK');

-- insert into dept01
-- (deptno, dname, loc)
-- values (10, ACCOUNTING, 'NEW YORK');

insert into dept01
values (20, 'RESEARCH', 'DALLAS');
select *
from dept01;

select *
from sam100;
CREATE TABLE SAM01
AS
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE 1 = 0;
select *
from emp03
where 1 = 0;

select *
from emp03;

alter table emp03
    add (SAL number(7, 2));


select *
from sam01;
INSERT INTO SAM01
VALUES (1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01
VALUES (1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01
VALUES (1020, 'ORANGE', 'DOCTOR', 25000);

SELECT *
FROM SAM01;

select *
from dept01;

insert into dept01 (deptno, dname)
values (30, 'SALES');
select *
from dept01;

insert into dept01
values (40, 'OPERATIONS', NULL);
select *
from dept01;

insert into dept01
values (50, '', 'CHICAGO');

SELECT *
FROM DEPT01
WHERE LOC IS NULL;

SELECT *
FROM DEPT01
WHERE DNAME IS NULL;

select *
from sam01;
INSERT INTO SAM01
VALUES (1030, 'VERY', NULL, 25000);
INSERT INTO SAM01
VALUES (1040, 'CAT', NULL, 2000);
select *
from sam01;

drop table dept02;
create table dept02
as
select *
from dept
where 1 = 0;

select *
from dept02;

insert into dept02
select *
from dept;

select *
from dept02;


INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 10;

select *
from sam01;

CREATE TABLE EMP_HIR
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;
CREATE TABLE EMP_MGR
AS
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE 1 = 0;

INSERT ALL
    INTO EMP_HIR
VALUES (EMPNO, ENAME, HIREDATE)
INTO EMP_MGR
VALUES (EMPNO, ENAME, MGR)
SELECT EMPNO, ENAME, HIREDATE, MGR
FROM EMP
WHERE DEPTNO = 20;


CREATE TABLE EMP_HIR02
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;
CREATE TABLE EMP_SAL
AS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE 1 = 0;

select *
from emp
where hiredate > '1982-01-01';

INSERT ALL
    WHEN HIREDATE > '1982-01-01' THEN
    INTO EMP_HIR02
VALUES (EMPNO, ENAME, HIREDATE)
    WHEN SAL >= 2000 THEN
INTO EMP_SAL
VALUES (EMPNO, ENAME, SAL)
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP;

select *
from emp_hir02;
select *
from emp_sal;

select *
from emp
where sal >= 2000;


create table emp10
as
select empno, ename
from emp
where 1 = 0;
select *
from emp10;

insert all
    into emp10
values (11, '홍길동')
into emp10
values (22, '전우치')
select *
from emp;
select *
from emp10;

select *
from emp01;
create table emp01
as
select *
from emp;


select *
from emp01;
UPDATE EMP01
SET DEPTNO = 30;
UPDATE EMP01
SET SAL = SAL * 1.1;

select sysdate
from dual;

UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD');

SELECT EMPNO, ENAME, HIREDATE
FROM EMP01;

select *
from emp01;

update emp01
set deptno = 30
where deptno = 10;
update emp01
set sal = sal * 1.1
where sal >= 3000;

select to_char(hiredate, 'YYYY')
from emp01;

UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
WHERE TO_CHAR(HIREDATE, 'YYYY') = '1987';
SELECT EMPNO, ENAME, HIREDATE
FROM EMP01
WHERE EMPNO IN (7788, 7876);


UPDATE SAM01
SET SAL = SAL - 5000
WHERE SAL >= 10000;
select *
from sam01;

drop table emp01;
create table emp01
as
select *
from emp;
commit;

select *
from emp01;

select *
from emp01;

select empno
from emp01;

UPDATE EMP01
SET DEPTNO = 10,
    JOB    = 'MANAGER'
WHERE ENAME = 'SCOTT';
UPDATE EMP01
SET HIREDATE = TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
    SAL      = 50,
    COMM     = 4000
WHERE ENAME = 'SCOTT';
SELECT *
FROM EMP01
WHERE ENAME = 'SCOTT';


select loc
from dept
where deptno = 40;

-- insert into dept01
-- select * from dept;
-- select * from dept01;

UPDATE DEPT01
SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

select *
from dept02;

select *
from dept;

CREATE TABLE SAM02
AS
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP;
select *
from sam02;

UPDATE SAM02
SET SAL = SAL + 1000
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT02 WHERE LOC = 'DALLAS');

select *
from sam02;
select *
from dept01;

select dname, loc
from dept
where deptno = 40;

update dept01
set loc = 'DALLAS'
where deptno = 20;


SELECT *
FROM DEPT01;

UPDATE DEPT01
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO = 40

UPDATE SAM02
SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE
                       FROM SAM02
                       WHERE ENAME = 'KING');

DELETE
FROM DEPT01;
SELECT *
FROM DEPT01;


INSERT INTO DEPT01
SELECT *
FROM DEPT;

SELECT *
FROM DEPT01;

DELETE
FROM DEPT01
WHERE DEPTNO = 30;

select *
from sam01;

DELETE
FROM SAM01
WHERE JOB IS NULL;

delete
from emp01;
select *
from emp01;

insert into emp01
select *
from emp;

select *
from emp01;
select deptno
from dept
where dname = 'SALES';

DELETE
FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

SELECT *
FROM SAM02;

SELECT DEPTNO
FROM DEPT
WHERE DNAME = 'RESEARCH';

DELETE
FROM SAM02
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'RESEARCH');
SELECT *
FROM SAM02;

--7

select *
from jumsu;
CREATE TABLE JUMSU
(
    NAME VARCHAR2(20),
    KOR  NUMBER,
    ENG  NUMBER,
    MAT  NUMBER
);
INSERT INTO JUMSU
VALUES ('박해영', 80, 90, 70);
INSERT INTO JUMSU
VALUES ('김혜수', 75, 96, 80);
INSERT INTO JUMSU
VALUES ('똘똘이', 95, 90, 85);

select *
from jumsu;

SELECT NAME
     , KOR
     , ENG
     , MAT
     , KOR + ENG + MAT              AS               총점
     , ROUND((KOR + ENG + MAT) / 3) AS               평균
     , RANK() OVER (ORDER BY (KOR + ENG + MAT) DESC) 등수
FROM JUMSU;

SELECT NAME, KOR AS "국어 최고 점수"
FROM JUMSU
WHERE KOR = (SELECT MAX(KOR) FROM JUMSU);



SELECT NAME, ENG AS "영어 최고 점수"
FROM JUMSU
WHERE ENG = (SELECT MAX(ENG) FROM JUMSU);
SELECT NAME, MAT AS "수학 최고 점수"
FROM JUMSU
WHERE MAT = (SELECT MAX(MAT) FROM JUMSU);

select *
from jumsu;

SELECT '국어' AS 과목, NAME, KOR AS 점수
FROM JUMSU
WHERE KOR = (SELECT MAX(KOR) FROM JUMSU)
UNION
SELECT '수학' AS 과목, NAME, MAT AS 점수
FROM JUMSU
WHERE MAT = (SELECT MAX(MAT) FROM JUMSU)
UNION
SELECT '영어' AS 과목, NAME, ENG AS 점수
FROM JUMSU
WHERE ENG = (SELECT MAX(ENG) FROM JUMSU);

SELECT ENAME
     , SAL
     , RANK() OVER (ORDER BY SAL DESC)       "급여순"
     , DENSE_RANK() OVER (ORDER BY SAL DESC) "급여순"
FROM EMP;

select *
from jumsu;
CREATE TABLE JUMSU2
AS
SELECT *
FROM JUMSU
WHERE 1 = 0;


select *
from jumsu;
select *
from jumsu2;

MERGE INTO JUMSU
USING JUMSU2
ON (JUMSU.NAME = JUMSU2.NAME)
WHEN MATCHED THEN
    UPDATE
    SET JUMSU.KOR = JUMSU2.KOR,
        JUMSU.ENG = JUMSU2.ENG,
        JUMSU.MAT = JUMSU2.MAT
WHEN NOT MATCHED THEN
    INSERT
    VALUES (JUMSU2.NAME, JUMSU2.KOR, JUMSU2.ENG, JUMSU2.MAT);


MERGE INTO EMP01
USING EMP02
ON (EMP01.EMPNO = EMP02.EMPNO)
WHEN MATCHED THEN
    UPDATE
    SET EMP01.ENAME    = EMP02.ENAME,
        EMP01.JOB      = EMP02.JOB,
        EMP01.MGR      = EMP02.MGR,
        EMP01.HIREDATE = EMP02.HIREDATE,
        EMP01.SAL      = EMP02.SAL,
        EMP01.COMM     = EMP02.COMM,
        EMP01.DEPTNO   = EMP02.DEPTNO
WHEN NOT MATCHED THEN
    INSERT
    VALUES (EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, EMP02.HIREDATE, EMP02.SAL, EMP02.COMM, EMP02.DEPTNO);



CREATE TABLE EMP01
AS
SELECT *
FROM EMP;
select *
from emp01;

CREATE TABLE EMP02
AS
SELECT *
FROM EMP
WHERE JOB = 'MANAGER';
SELECT *
FROM EMP02;

update emp02
set job = 'TEST';
select *
from emp02;

INSERT INTO EMP02
VALUES (8000, 'SYJ', 'TOP', 7566, '2009-01-12', 1200, 10, 20);

SELECT *
FROM EMP02;


MERGE INTO EMP01
USING EMP02
ON (EMP01.EMPNO = EMP02.EMPNO)
WHEN MATCHED THEN
    UPDATE
    SET EMP01.ENAME    = EMP02.ENAME,
        EMP01.JOB      = EMP02.JOB,
        EMP01.MGR      = EMP02.MGR,
        EMP01.HIREDATE = EMP02.HIREDATE,
        EMP01.SAL      = EMP02.SAL,
        EMP01.COMM     = EMP02.COMM,
        EMP01.DEPTNO   = EMP02.DEPTNO
WHEN NOT MATCHED THEN
    INSERT
    VALUES (EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, EMP02.HIREDATE, EMP02.SAL, EMP02.COMM, EMP02.DEPTNO);

select *
from dept01;
drop table dept01;

CREATE TABLE DEPT01
AS
SELECT *
FROM DEPT;
SELECT *
FROM DEPT01;

DELETE
FROM DEPT01;
SELECT *
FROM DEPT01;

ROLLBACK;
SELECT *
FROM DEPT01;

DELETE
FROM DEPT01
WHERE DEPTNO = 20;
SELECT *
FROM DEPT01;

commit;

select *
from dept01;
rollback;

select *
from dept01;

select *
from dept02;

drop table dept02;
create table dept02
as
select *
from dept;

delete
from dept02
where deptno = 40;


select *
from dept02;

create table dept03
as
select *
from dept;

rollback;
select *
from dept02;

drop table dept01;

create table dept01
as
select *
from dept;

select *
from dept01; ---------------------------------------------------

delete
from dept01
where deptno = 40;
commit;

delete
from dept01
where deptno = 30;
savepoint C1;

delete
from dept01
where deptno = 20;
savepoint C2;

delete
from dept01
where deptno = 10;

select *
from dept01;

rollback to C2;
select *
from dept01;

rollback to C1;
select *
from dept01;

rollback;
select *
from dept01;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

SELECT *
FROM USER_CONS_COLUMNS;

select *
from emp01;
drop table emp01;

select *
from dept;
drop table emp01;


select *
from dept;
drop table emp01;

CREATE TABLE EMP01
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10),
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

INSERT INTO EMP01
VALUES (NULL, NULL, 'SALESMAN', 30);

SELECT *
FROM EMP01;

CREATE TABLE EMP02
(
    EMPNO  NUMBER(4)    NOT NULL,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);
-- [23000][1400] ORA-01400: cannot insert NULL into ("SCOTT"."EMP02"."EMPNO")
INSERT INTO EMP02
VALUES (NULL, NULL, 'SALESMAN', 30);


SELECT * -- CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP02');

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP02');

SELECT UC.OWNER
     , UC.CONSTRAINT_NAME
     , UC.CONSTRAINT_TYPE
     , UC.TABLE_NAME
     , UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC,
     USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
  AND UC.TABLE_NAME IN ('EMP02');

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP03');

SELECT *
FROM EMP03;
CREATE TABLE EMP03
(
    EMPNO  NUMBER(4) UNIQUE,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);
COMMIT;

INSERT INTO EMP03
VALUES (7499, 'JONES', 'MANAGER', 20);

insert into emp03
values (null, 'JONES', 'MANAGER', 20);
insert into emp03
values (null, 'JONES', 'SALESMAN', 10);

select *
from emp03;


select *
from emp04;
drop table emp04;

CREATE TABLE EMP04
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP04_EMPNO_UK UNIQUE,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP04_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP05');


CREATE TABLE EMP05
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP05_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP05');

INSERT INTO EMP05
VALUES (7499, 'ALLEN', 'SALESMAN', 30);
INSERT INTO EMP05
VALUES (7499, 'JONES', 'MANAGER', 20); -- [23000][1] ORA-00001: unique constraint (SCOTT.EMP05_EMPNO_PK) violated

INSERT INTO EMP05
VALUES (NULL, 'JONES', 'MANAGER', 20); -- [23000][1400] ORA-01400: cannot insert NULL into ("SCOTT"."EMP05"."EMPNO")

select *
from emp06;
drop table emp06;

CREATE TABLE EMP06
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP06_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(2)
        CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT (DEPTNO)
);
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP06');

-- [23000][2291] ORA-02291: integrity constraint (SCOTT.EMP06_DEPTNO_FK) violated - parent key not found
-- 참조하는 테이블에 존재하지 않는 값을 입력해서 오류, 50
insert into emp06
values (7566, 'JONES', 'MANAGER', 50);

CREATE TABLE EMP07
(
    EMPNO  NUMBER(4)
        CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP07_ENAME_NN NOT NULL,
    SAL    NUMBER(7, 2)
        CONSTRAINT EMP07_SAL_CK CHECK ( SAL BETWEEN 500 AND 5000 ),
    GENDER VARCHAR2(1)
        CONSTRAINT EMP07_GENDER_CK CHECK ( GENDER IN ('M', 'F') )
);
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP07');

INSERT INTO EMP07
VALUES (7499, 'ALLEN', 200, 'M'); -- 급여 제약조건 위배 [23000][2290] ORA-02290: CHECK CONSTRAINT (SCOTT.EMP07_SAL_CK) VIOLATED

INSERT INTO EMP07
VALUES (7499, 'ALLEN', 5000,
        'A'); -- GENDER 제약조건 위배 [23000][2290] ORA-02290: CHECK CONSTRAINT (SCOTT.EMP07_GENDER_CK) VIOLATED

drop table dept01;
CREATE TABLE DEPT01
(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(31) DEFAULT 'SEOUL'
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP01');


INSERT INTO DEPT01 (DEPTNO, DNAME)
VALUES (10, 'ACCOUNTING');

SELECT *
FROM DEPT01;

select *
from emp01;
drop table emp01;

-- 컬럼 레벨 방식의 제약조건 설정
CREATE TABLE EMP01
(
    EMPNO  NUMBER(4) PRIMARY KEY,
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(4)
        CONSTRAINT EMP01_DEPTNO_FK REFERENCES DEPT (DEPTNO)
);

-- 테이블 레벨 방식의 제약조건 설정
CREATE TABLE EMP02
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10) NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(4),
    PRIMARY KEY (EMPNO),
    UNIQUE (JOB),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);
CREATE TABLE EMP03
(
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(10)
        CONSTRAINT EMP03_ENAME_NN NOT NULL,
    JOB    VARCHAR2(9),
    DEPTNO NUMBER(4),
    CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY (EMPNO),
    CONSTRAINT EMP03_JOB_UK UNIQUE (JOB),
    CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP01', 'EMP02', 'EMP03');

CREATE TABLE MEMBER01
(
    NAME    VARCHAR2(10),
    ADDRESS VARCHAR2(30),
    HPHONE  VARCHAR2(11),
    CONSTRAINT MEMBER01_COMBO_PK PRIMARY KEY (NAME, HPHONE)
);

INSERT INTO MEMBER01
VALUES ('A', 'B', 'C');
INSERT INTO MEMBER01
VALUES ('A', 'B', 'D');
-- [23000][1] ORA-00001: unique constraint (SCOTT.MEMBER01_COMBO_PK) violated 복합키때문에 insert할때 에러 발생함
INSERT INTO MEMBER01
VALUES ('A', 'F', 'C');

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, COLUMN_NAME, SEARCH_CONDITION, POSITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('MEMBER01');

-- COLUMN OWNER FORMAT A8
-- COLUMN COLUMN_NAME FORMAT A15
-- COLUMN CONSTRAINT_NAME FORMAT A20

CREATE TABLE PARENT
(
    P_ID NUMBER(2) PRIMARY KEY
);

CREATE TABLE CHILD
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD_ID_FK REFERENCES PARENT (P_ID)
);


SELECT OWNER
     , CONSTRAINT_NAME
     , R_CONSTRAINT_NAME
     , CONSTRAINT_TYPE
     , TABLE_NAME
     , COLUMN_NAME
     , SEARCH_CONDITION
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('PARENT', 'CHILD');

INSERT INTO PARENT
VALUES (10);
INSERT INTO PARENT
VALUES (20);
INSERT INTO PARENT
VALUES (30);

INSERT INTO CHILD
VALUES (10);

-- [23000][2292] ORA-02292: integrity constraint (SCOTT.CHILD_ID_FK) violated - child record found
DELETE
FROM PARENT
WHERE P_ID = 10;

DELETE
FROM CHILD
WHERE C_ID = 10;

-- 🚨 on delete cascade
CREATE TABLE PARENT2
(
    P_ID NUMBER(2) PRIMARY KEY
);

-- 부모 테이블의 부모키를 삭제하면 자식 테이블의 참조 컬럼도 삭제됩니다.
CREATE TABLE CHILD2
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD2_ID_FK REFERENCES PARENT2 (P_ID) ON DELETE CASCADE
);

INSERT INTO PARENT2
VALUES (10);
INSERT INTO PARENT2
VALUES (20);
INSERT INTO PARENT2
VALUES (30);

INSERT INTO CHILD2
VALUES (10);


delete parent2
where P_ID = 10;
select *
from child2;

-- 🚨 on delete cascade
CREATE TABLE PARENT3
(
    P_ID NUMBER(2) PRIMARY KEY
);

-- 부모 테이블의 부모키를 삭제하면 자식 테이블의 참조 컬럼도 삭제됩니다.
CREATE TABLE CHILD3
(
    C_ID NUMBER(2)
        CONSTRAINT CHILD3_ID_FK REFERENCES PARENT3 (P_ID) ON DELETE SET NULL
);

INSERT INTO PARENT3
VALUES (10);
INSERT INTO PARENT3
VALUES (20);
INSERT INTO PARENT3
VALUES (30);

INSERT INTO CHILD3
VALUES (10);

select *
from child3;

DELETE PARENT3
WHERE P_ID = 10;

-- 🚨 VIEW
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPT;
CREATE TABLE EMP_COPY
AS
SELECT *
FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO = 20;

SELECT *
FROM EMP_VIEW30;


SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 20;

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO = 20;
SELECT *
FROM EMP_VIEW20;

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

select *
from emp_view30;
insert into emp_view30
values (1111, 'AAAA', 30);

select *
from EMP_COPY;

CREATE VIEW EMP_VIEW_DEPT
AS
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E,
     DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

select *
from EMP_VIEW_DEPT;


CREATE VIEW SAL_VIEW
AS
SELECT DNAME, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL
FROM EMP E
         NATURAL JOIN DEPT D
GROUP BY DNAME;
SELECT *
FROM SAL_VIEW;

select dname, max(sal), min(sal)
from emp
         inner join dept
                    on emp.deptno = dept.deptno
group by dname;


select *
from parent;

-- ## 🚨 1번.
CREATE TABLE PARENT
(
    ID       VARCHAR2(20) PRIMARY KEY,
    PASSWORD VARCHAR2(12) NOT NULL,
    NAME     VARCHAR2(10) NOT NULL,
    BIRTHDAY DATE         NOT NULL
);

-- ## 🚨 2번.
CREATE TABLE CHILD
(
    ID      VARCHAR2(20) REFERENCES PARENT (ID),
    ADDRESS VARCHAR2(20) default '서울시',
    GENDER  VARCHAR2(2) CHECK ( GENDER IN ('남', '여') )
)

-- ## 🚨 3번.
-- 한글은 한글자당 3byte이기 때문에, 길이를 변경해주어야 한다. ( 1번문제에서 초기 테이블 생성시 10byte로 만들었음 )
-- ERROR at line 1: ORA-12899: value too large for column "SCOTT"."PARENT"."NAME" (actual: 12, maximum: 10)
ALTER TABLE PARENT
    MODIFY (NAME VARCHAR2(12));

INSERT INTO PARENT
VALUES ('abcd', '1234', '홍길동', '88/7/23');
INSERT INTO PARENT
VALUES ('bbbb', '5678', '신사임당', '85/11/01');
INSERT INTO PARENT
VALUES ('cccc', '90as', '성춘향', '93/12/15');
INSERT INTO PARENT
VALUES ('dddd', 'efgy', '리카엘', '92/05/01');
INSERT INTO PARENT
VALUES ('ffff', 'wjdgml', '김풍', '95/04/08');

-- CHILD.GENDER에는 '남' 또는 '여'가 들어가야 하는데 들어갈 컬럼의 길이가 짧기 때문에 먼저 길이를 3byte로 수정한다.
-- 그리고 insert를 문제에 나와있는 대로 수행해도 오류가 발생하는데, 이는 CHECK제약조건을 무시했기 때문이라, '남' 또는 '여'로 수정해야 한다.
ALTER TABLE CHILD
    MODIFY (GENDER VARCHAR2(3));

insert into child
values ('abcd', '경상북도', '남');
insert into child
values ('cccc', '퐁당시', '여');
insert into child
values ('dddd', '불가리아', '남');
insert into child
values ('ffff', '제주시', '남');
insert into child
values ('bbbb', '기품시', '여');
insert into child
values ('ffff', '제주시', '남');

-- ## 🚨 4번.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('PARENT', 'CHILD');

-- ## 🚨 5번.
SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('PARENT', 'CHILD');

-- ## 🚨 6번.
DROP TABLE CHILD;
DROP TABLE PARENT;

-- ## 🚨 7번.
SELECT TABLE_NAME                                                                            AS 자식테이블
     , COLUMN_NAME                                                                           AS 외래키
     , (SELECT TABLE_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = R_CONSTRAINT_NAME)  AS 부모테이블
     , (SELECT COLUMN_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = R_CONSTRAINT_NAME) AS 부모키
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE R_CONSTRAINT_NAME IS NOT NULL
  AND (TABLE_NAME LIKE 'EMP%' OR TABLE_NAME LIKE 'CHILD%');

-- SELECT UC.TABLE_NAME                                                                            AS 자식테이블
--      , UCC.COLUMN_NAME                                                                          AS 외래키
--      , (SELECT TABLE_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = UC.R_CONSTRAINT_NAME)  AS 부모테이블
--      , (SELECT COLUMN_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = UC.R_CONSTRAINT_NAME) AS 부모키
-- FROM USER_CONSTRAINTS UC,
--      USER_CONS_COLUMNS UCC
-- WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
--   AND UC.R_CONSTRAINT_NAME IS NOT NULL
--   AND (UC.TABLE_NAME LIKE 'EMP%' OR UC.TABLE_NAME LIKE 'CHILD%');

SELECT *
FROM EMP_VIEW30;

CREATE OR REPLACE VIEW EMP_VIEW20
AS
SELECT EMPNO AS EMP_NO, ENAME AS EMP_NAME, DEPTNO AS DEPT_NO, MGR AS MANAGER, SAL
FROM EMP_COPY
WHERE DEPTNO = 20;

SELECT *
FROM EMP_VIEW20;

CREATE OR REPLACE VIEW VIEW_READ30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30
WITH READ ONLY;
SELECT *
FROM VIEW_READ30;

UPDATE VIEW_READ30
SET COMM = 2000; -- [99999][42399] ORA-42399: cannot perform a DML operation on a read-only view

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

SELECT ROWNUM, E.*
FROM (SELECT EMPNO, ENAME, HIREDATE
      FROM EMP
      ORDER BY HIREDATE) E;

CREATE OR REPLACE VIEW VIEW_HIRE
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;


SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM <= 5;


CREATE OR REPLACE VIEW VIEW_HIRE
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE
      FROM EMP
      ORDER BY HIREDATE)
WHERE ROWNUM <= 5;

CREATE OR REPLACE VIEW SAL_TOP3_VIEW
AS
SELECT ROWNUM AS RANKING, EMPNO, ENAME, SAL
FROM (SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC)
WHERE ROWNUM <= 3;

-- 🚨 paging 관련 쿼리 🚨
SELECT RANKING, EMPNO, ENAME, SAL
FROM (SELECT ROWNUM AS RANKING, EMPNO, ENAME, SAL
      FROM (SELECT EMPNO, ENAME, SAL
            FROM EMP
            ORDER BY SAL DESC)
      WHERE ROWNUM <= 3)
WHERE RANKING BETWEEN 2 AND 3;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
    START WITH 10
    INCREMENT BY 10;

select *
from USER_SEQUENCES;

COLUMN SEQUENCE_NAME FORMAT A20
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;

-- CURRVAL
-- 1. NEXTVAL로 새로운 값을 생성해야 합니다.
SELECT DEPT_DEPTNO_SEQ.nextval
FROM DUAL;

-- 2. 시퀀스의 현재 값을 알아내기 위해서 CURRVAL를 사용합니다.
SELECT DEPT_DEPTNO_SEQ.currval
FROM DUAL;

CREATE SEQUENCE EMP_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000;
select *
from USER_SEQUENCES;

select *
from emp01;
drop table emp01;
CREATE TABLE EMP01
(
    EMPNO    NUMBER(4) PRIMARY KEY,
    ENAME    VARCHAR2(10),
    HIREDATE DATE
);
select *
from emp01;

-- SELECT * FROM TAB;
-- PURGE RECYCLEBIN;

COLUMN TABLE_NAME FORMAT A15
COLUMN COLUMN_NAME FORMAT A15
COLUMN CONSTRAINT_NAME FORMAT A18

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP01');

SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME IN ('EMP01');

INSERT INTO EMP01
VALUES (EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);
select *
from emp01;

CREATE TABLE DEPT_EXAMPLE
(
    DEPTNO NUMBER(4) PRIMARY KEY,
    DNAME  VARCHAR2(15),
    LOC    VARCHAR2(15)
);

CREATE SEQUENCE DEPT_EXAMPLE_SEQ
    START WITH 10
    INCREMENT BY 10;

INSERT INTO DEPT_EXAMPLE
VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '인사과', '서울');
INSERT INTO DEPT_EXAMPLE
VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '경리과', '서울');
INSERT INTO DEPT_EXAMPLE
VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '총무과', '대전');
INSERT INTO DEPT_EXAMPLE
VALUES (DEPT_EXAMPLE_SEQ.NEXTVAL, '기술팀', '인천');

select *
from DEPT_EXAMPLE;


drop sequence dept_deptno_seq;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 30;

SELECT DEPT_DEPTNO_SEQ.NEXTVAL
FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL
FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL
FROM DUAL;
-- [72000][8004] ORA-08004: sequence DEPT_DEPTNO_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated
SELECT DEPT_DEPTNO_SEQ.NEXTVAL
FROM DUAL;

ALTER SEQUENCE DEPT_DEPTNO_SEQ MAXVALUE 1000;

select *
from USER_SEQUENCES;

CREATE SEQUENCE DEPT_SEQ_TEMP
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 40
    MINVALUE 10
    CYCLE
    NOCACHE;

CREATE TABLE EMP_MAX
(
    EMPNO NUMBER(2) PRIMARY KEY,
    ENAME VARCHAR2(12)
);
select *
from USER_SEQUENCES;
CREATE SEQUENCE EMP_EMPNO_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99;
INSERT INTO EMP_MAX (EMPNO, ENAME)
VALUES (EMP_EMPNO_SEQ.NEXTVAL, 'AAA');
INSERT INTO EMP_MAX (EMPNO, ENAME)
VALUES (EMP_EMPNO_SEQ.NEXTVAL, 'BBB');
select *
from emp_max;

CREATE SEQUENCE DEPT_SEQ_TEMP2
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 40
    MINVALUE 10
    CYCLE
    CACHE 2;

CREATE SEQUENCE EMP_EMPNO_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99;

SELECT *
FROM EMP_MAX;
insert into emp_max (EMPNO, ENAME)
values (nvl(max(empno), 0) + 1, 'AAA');
insert into emp_max
values (NVL(max(empno), 0) + 1, 'BBB');

INSERT INTO EMP_MAX
SELECT NVL(MAX(EMPNO), 0) + 1, 'AAA'
FROM EMP_MAX;
INSERT INTO EMP_MAX
SELECT NVL(MAX(EMPNO), 0) + 1, 'BBB'
FROM EMP_MAX;
INSERT INTO EMP_MAX
SELECT NVL(MAX(EMPNO), 0) + 1, 'CCC'
FROM EMP_MAX;

SELECT *
FROM EMP_MAX;


INSERT INTO EMP_MAX
VALUES ((SELECT NVL(MAX(EMPNO), 0) + 1 FROM EMP_MAX), 'DDD');

drop sequence dept_seq;
CREATE SEQUENCE DEPT_SEQ
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 40
    MINVALUE 10
    CYCLE;

select *
from USER_SEQUENCES
where SEQUENCE_NAME like 'DEPT%';


select DEPT_SEQ_TEMP2.nextval
from dual;

SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN ('EMP', 'DEPT', 'EMP01');

select *
from emp01;
drop table emp01 purge;

CREATE TABLE EMP01
AS
SELECT *
FROM EMP;

INSERT INTO EMP01
SELECT *
FROM EMP01;
INSERT INTO EMP01 (EMPNO, ENAME)
VALUES (1111, 'SYJ');

CREATE INDEX IDX_EMP01_ENAME
    ON EMP01 (ENAME);

CREATE INDEX IDX_EMP01_JOB
    ON EMP01 (JOB);

DROP INDEX IDX_EMP01_JOB;

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME IN ('EMP01');



select *
from gradecard;


SELECT S.*, ROWNUM 등수
FROM (SELECT NO   "번호"
           , NAME "이름"
           , KOR  "국어"
           , ENG  "영어"
           , MAT  "수학"
           , TOT  "총계"
      FROM GRADECARD
      ORDER BY TOT DESC) S;


SELECT *
FROM (SELECT NO                                   번호
           , NAME                                 이름
           , KOR                                  국어
           , ENG                                  영어
           , MAT                                  수학
           , TOT                                  총계
           , RANK() OVER ( ORDER BY TOT DESC ) as 등수
      FROM GRADECARD)
WHERE 등수 BETWEEN 4 AND 7;

SELECT NO,
       NAME,
       KOR,
       ENG,
       MAT,
       TOT,
       ROUND(TOT / 3) 평균,
       G.GRADE        등급
FROM GRADECARD GC
         INNER JOIN GRADE G ON ROUND(GC.TOT / 3) BETWEEN G.LOWSCORE AND G.HISCORE
ORDER BY TOT;

UPDATE GRADECARD GC
SET AVG   = ROUND(TOT / 3),
    GRADE = (SELECT GRADE
             FROM GRADE
             WHERE ROUND(TOT / 3) BETWEEN LOWSCORE AND HISCORE);
select *
from gradecard
order by tot;

SELECT TABLE_NAME                                                                            AS 자식테이블
     , COLUMN_NAME                                                                           AS 외래키
     , (SELECT TABLE_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = R_CONSTRAINT_NAME)  AS 부모테이블
     , (SELECT COLUMN_NAME FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME = R_CONSTRAINT_NAME) AS 부모키
FROM USER_CONSTRAINTS
         NATURAL JOIN USER_CONS_COLUMNS
WHERE R_CONSTRAINT_NAME IS NOT NULL
  AND (TABLE_NAME LIKE 'EMP%' OR TABLE_NAME LIKE 'CHILD%');

-- SELECT CHILD.TABLE_NAME   자식테이블,
--        CHILD.COLUMN_NAME  외래키,
--        PARENT.TABLE_NAME  부모테이블,
--        PARENT.COLUMN_NAME 부모키
-- FROM USER_CONSTRAINTS UC,
--      USER_CONS_COLUMNS PARENT,
--      USER_CONS_COLUMNS CHILD
-- WHERE UC.R_CONSTRAINT_NAME = PARENT.CONSTRAINT_NAME;
SELECT PARENT.TABLE_NAME  부모테이블,
       PARENT.COLUMN_NAME 부모키
-- CHILD.TABLE_NAME   자식테이블,
--        CHILD.COLUMN_NAME  외래키
FROM USER_CONSTRAINTS UC
         INNER JOIN USER_CONS_COLUMNS PARENT ON UC.R_CONSTRAINT_NAME = PARENT.CONSTRAINT_NAME;
--      USER_CONS_COLUMNS CHILD

select *
from USER_CONSTRAINTS
WHERE (TABLE_NAME LIKE 'EMP%' OR TABLE_NAME LIKE 'CHILD%');
select *
from USER_CONS_COLUMNS
WHERE (TABLE_NAME LIKE 'EMP%' OR TABLE_NAME LIKE 'CHILD%');

SELECT *
FROM USER_ROLE_PRIVS;
SELECT *
FROM ROLE_TAB_PRIVS
WHERE TABLE_NAME IN ('EMP');

GRANT SELECT, UPDATE, DELETE ON EMP TO DEF_ROLE;

------------------------------------------------------------------------------------------------------------------------
-- 🚨
-- SET SERVEROUTPUT ON
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('Hello World');
-- end;
-- /
--
-- DECLARE
-- VEMPNO NUMBER(4);
-- VENAME VARCHAR2(10);
-- VPI CONSTANT NUMBER := 3.14; -- 상수는 반드시 초기값 지정
-- VDEPTNO NUMBER(2) NOT NULL := 20; -- NOT NULL인 경우 초기값 반드시 지정해야함


-- EXAM01.sql
SET SERVEROUTPUT ON

DECLARE
    VEMPNO NUMBER(4);
    VENAME VARCHAR2(10);
BEGIN
    VEMPNO := 7788;
    VENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('empno/ename');
    DBMS_OUTPUT.PUT_LINE('-----------');
    DBMS_OUTPUT.PUT_LINE(VEMPNO || '/' || VENAME);
END;
/

-- EXAM02.sql
SET SERVEROUTPUT ON

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('empno/ename');
    DBMS_OUTPUT.PUT_LINE('-----------');

    SELECT EMPNO, ENAME
    INTO VEMPNO, VENAME
    FROM EMP
    WHERE ENAME = 'SCOTT';

    DBMS_OUTPUT.PUT_LINE(VEMPNO || '/' || VENAME);
END;
/

SET SERVEROUTPUT ON

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('empno/ename');
    DBMS_OUTPUT.PUT_LINE('-----------');

    SELECT EMPNO, ENAME
    INTO VEMPNO, VENAME
    FROM EMP
    WHERE ENAME = 'SCOTT';

    DBMS_OUTPUT.PUT_LINE(VEMPNO || '/' || VENAME);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('no data found...');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('data is more than 2');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('other errors...');
END;
/

SET SERVEROUTPUT ON

DECLARE
    VEMPNO NUMBER(4);
    VENAME VARCHAR2(10);
BEGIN
    VEMPNO := 7788;
    VENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('empno/ename');
    DBMS_OUTPUT.PUT_LINE('-----------');
    DBMS_OUTPUT.PUT_LINE(VEMPNO || '/' || VENAME);
END;
/

SET SERVEROUTPUT ON

DECLARE
    EMP_RECORD EMP%ROWTYPE;
BEGIN
    SELECT EMPNO,
           ENAME,
           JOB,
           MGR,
           HIREDATE,
           SAL,
           COMM,
           DEPTNO
    INTO EMP_RECORD
    FROM EMP
    WHERE EMPNO = 7788;

    DBMS_OUTPUT.PUT_LINE(
                RPAD('EMPNO', 6)
                || RPAD('ENAME', 10)
                || RPAD('JOB', 10)
                || RPAD('MGR', 6)
                || RPAD('HIREDATE', 12)
                || RPAD('SAL', 6)
                || RPAD('COMM', 6)
                || RPAD('DEPTNO', 7)
        );

    DBMS_OUTPUT.PUT_LINE(
            RPAD('-', 56, '-')
        );

    DBMS_OUTPUT.PUT_LINE(
                RPAD(TO_CHAR(emp_record.empno), 6)
                || RPAD(emp_record.ename, 10)
                || RPAD(emp_record.JOB, 10)
                || RPAD(NVL(TO_CHAR(emp_record.MGR), ' '), 6)
                || RPAD(TO_CHAR(emp_record.HIREDATE), 12)
                || RPAD(TO_CHAR(emp_record.sal), 6, ' ')
                || RPAD(NVL(TO_CHAR(emp_record.comm), ' '), 6)
                || RPAD(TO_CHAR(emp_record.deptno), 7)
        );
END;
/

SET SERVEROUTPUT ON

DECLARE
    VEMPNO  NUMBER(4);
    VENAME  VARCHAR2(20);
    VDEPTNO EMP.DEPTNO%TYPE;
    VDNAME  VARCHAR2(20) := NULL;

BEGIN
    SELECT EMPNO, ENAME, DEPTNO
    INTO VEMPNO, VENAME, VDEPTNO
    FROM EMP
    WHERE EMPNO = 7788;

    IF (VDEPTNO = 10) THEN
        VDNAME := 'ACCOUNTING';
    END IF;
    IF (VDEPTNO = 20) THEN
        VDNAME := 'RESEARCH';
    END IF;
    IF (VDEPTNO = 30) THEN
        VDNAME := 'SALES';
    END IF;
    IF (VDEPTNO = 10) THEN
        VDNAME := 'OPERATIONS';
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7) || RPAD('ENAME', 11) || RPAD('DNAME', 11));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 28, '-'));
    DBMS_OUTPUT.PUT_LINE(RPAD(VEMPNO, 7) || RPAD(VENAME, 11) || RPAD(VDNAME, 11));
END;
/

-- CH20_QUIZ_01.sql
SET SERVEROUTPUT ON
DECLARE
    VEMP   EMP%ROWTYPE;
    ANNSAL NUMBER(7, 2);
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7) || RPAD('ENAME', 11) || RPAD('ANNSAl', 11));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 28, '-'));

    SELECT *
    INTO VEMP
    FROM EMP
    WHERE ENAME = 'SCOTT';

    IF (VEMP.COMM IS NULL) THEN
        VEMP.COMM := 0;
    end if;

    ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
    DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 7) || RPAD(VEMP.ENAME, 11) || RPAD(ANNSAL, 11));
END;
/

SET SERVEROUTPUT ON
DECLARE
    VEMP   EMP%ROWTYPE;
    ANNSAL NUMBER(7, 2);
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7)
        || RPAD('ENAME', 11)
        -- || RPAD('SAL', 11)
        -- || RPAD('COMM', 11)
        || RPAD('ANNSAL', 11));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 50, '-'));

    SELECT *
    INTO VEMP
    FROM EMP
    WHERE ENAME = 'SCOTT';

    IF (VEMP.COMM IS NULL) THEN
        VEMP.COMM := 0;
    end if;

    ANNSAL := VEMP.SAL * 12 + VEMP.COMM;

    DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 7)
        || RPAD(VEMP.ENAME, 11)
        -- || RPAD(VEMP.SAL, 11)
        -- || RPAD(VEMP.COMM, 11)
        || RPAD(ANNSAL, 11));
END;
/

-- EXAM06.sql
SET SERVEROUTPUT ON

DECLARE
    VEMP   EMP%ROWTYPE;
    ANNSAL NUMBER(7, 2);

BEGIN
    SELECT *
    INTO VEMP
    FROM EMP
    WHERE ENAME = 'SCOTT';

END;
/


SET SERVEROUTPUT ON

DECLARE
    VEMP   EMP%ROWTYPE;
    ANNSAL NUMBER(7, 2);

BEGIN
    SELECT *
    INTO VEMP
    FROM EMP
    WHERE ENAME = 'SCOTT';

    IF (VEMP.COMM IS NULL) THEN
        ANNSAL := VEMP.SAL * 12;
    ELSE
        ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7)
        || RPAD('ENAME', 11)
        || RPAD('ANNSAL', 11));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 50, '-'));

    DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 7)
        || RPAD(VEMP.ENAME, 11)
        || RPAD(ANNSAL, 11));

END;
/

SET SERVEROUTPUT ON

DECLARE
    VEMP   EMP%ROWTYPE;
    VDNAME VARCHAR2(14);

BEGIN
    SELECT *
    INTO VEMP
    FROM EMP
    WHERE ENAME = 'SCOTT';

    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7)
        || RPAD('ENAME', 11)
        || RPAD('DNAME', 12));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 29, '-'));

    IF (VEMP.DEPTNO = 10) THEN
        VDNAME := 'ACCOUNTING';
    ELSIF (VEMP.DEPTNO = 20) THEN
        VDNAME := 'RESEARCH';
    ELSIF (VEMP.DEPTNO = 30) THEN
        VDNAME := 'SALES';
    ELSE
        VDNAME := 'OPERATION';
    end if;

    DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 7)
        || RPAD(VEMP.ENAME, 11)
        || RPAD(VDNAME, 11));

END;
/

SET SERVEROUTPUT ON

DECLARE
    VEMP   EMP%ROWTYPE;
    VDNAME VARCHAR2(14);

BEGIN
    SELECT E.*, D.DNAME
    INTO VEMP, VDNAME
    FROM EMP E
             NATURAL JOIN DEPT D
    WHERE ENAME = 'SCOTT';

    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7)
        || RPAD('ENAME', 11)
        || RPAD('DNAME', 12));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 29, '-'));

    DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 7)
        || RPAD(VEMP.ENAME, 11)
        || RPAD(VDNAME, 11));

END;
/

-- 🚨 EXAM07-JOIN.sql
SET SERVEROUTPUT ON

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
    VDNAME VARCHAR2(14);

BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 7)
        || RPAD('ENAME', 11)
        || RPAD('DNAME', 12));

    SELECT EMPNO, ENAME, DNAME
    INTO VEMPNO, VENAME, VDNAME
    FROM EMP
             NATURAL JOIN DEPT
    WHERE ENAME = 'SCOTT';

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 29, '-'));

    DBMS_OUTPUT.PUT_LINE(RPAD(VEMPNO, 7)
        || RPAD(VENAME, 11)
        || RPAD(VDNAME, 11));
END;
/

-- 🚨 CH20_QUIZ_02.sql
SET SERVEROUTPUT ON

DECLARE
    DAN NUMBER := 5;
    I   NUMBER := 1;

BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || I || ' = ' || (DAN * I));

        I := I + 1;

        IF (I > 9) THEN
            EXIT;
        END IF;
    END LOOP;
END;
/

-- 🚨 EXAM09.sql
SET SERVEROUTPUT ON

DECLARE
BEGIN
    FOR N IN 1..5
        LOOP
            DBMS_OUTPUT.PUT_LINE(N);

        end loop;
END;
/

-- 🚨 EXAM09-REVERSE.sql
SET SERVEROUTPUT ON

DECLARE
BEGIN
    FOR N IN REVERSE 1..5
        LOOP
            DBMS_OUTPUT.PUT_LINE(N);

        end loop;
END;
/

-- 🚨 EXAM09_ALL.sql
SET SERVEROUTPUT ON

DECLARE
BEGIN
    FOR K IN (SELECT EMPNO, ENAME FROM EMP)
        LOOP
            DBMS_OUTPUT.PUT_LINE(K.EMPNO || '/' || K.ENAME);
        END LOOP;
END;
/

-- 🚨 CH20_QUIZ_03.sql
SET SERVEROUTPUT ON

DECLARE
    VDEPT DEPT%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('DEPTNO', 9)
        || RPAD('DNAME', 12)
        || RPAD('LOC', 12));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 30, '-'));

    FOR CNT IN 1..4
        LOOP
            SELECT *
            INTO VDEPT
            FROM DEPT
            WHERE DEPTNO = 10 * CNT;

            DBMS_OUTPUT.PUT_LINE(RPAD(VDEPT.DEPTNO, 9)
                || RPAD(VDEPT.DNAME, 12)
                || RPAD(VDEPT.LOC, 12));
        END LOOP;
END;
/

-- 🚨 EXAM10.sql
SET SERVEROUTPUT ON

DECLARE
    N NUMBER := 1;

BEGIN
    WHILE N <= 5
        LOOP
            DBMS_OUTPUT.PUT_LINE(N);

            N := N + 1;
        end loop;
end;
/

-- 🚨 CH20_QUIZ_04.sql
SET SERVEROUTPUT ON

DECLARE
    V_CNT NUMBER       := 1;
    V_STR VARCHAR2(10) := NULL;

BEGIN
    WHILE V_CNT <= 4
        LOOP
            V_STR := V_STR || '*';
            DBMS_OUTPUT.PUT_LINE(V_STR);

            V_CNT := V_CNT + 1;
        END LOOP;
END;
/


select *
from USER_PROCEDURES;


-- 🚨 PROC01.sql
CREATE OR REPLACE PROCEDURE DEL_ALL
    IS
BEGIN
    DELETE FROM EMP01;
END;
/

-- 🚨 PROC02.sql
CREATE OR REPLACE PROCEDURE DEL_ENAME(VENAME EMP01.ENAME%TYPE)
    IS
BEGIN
    DELETE
    FROM EMP01
    WHERE ENAME = VENAME;
END;
/

-- 🚨 PROC03.sql
CREATE OR REPLACE PROCEDURE SEL_EMPNO(
    VEMPNO IN EMP.EMPNO%TYPE,
    VENAME OUT EMP.ENAME%TYPE,
    VSAL OUT EMP.SAL%TYPE,
    VJOB OUT EMP.JOB%TYPE
)
    IS
BEGIN
    SELECT ENAME, SAL, JOB
    INTO VENAME, VSAL, VJOB
    FROM EMP
    WHERE EMPNO = VEMPNO;
END;
/

VARIABLE VAR_ENAME VARCHAR2(15);
VARIABLE VAR_SAL NUMBER;
VARIABLE VAR_JOB VARCHAR2(9);

-- hint! SET SERVEROUTPUT ON
-- SQL> EXECUTE SEL_EMPNO(7788, :VAR_ENAME, :VAR_SAL, :VAR_JOB);
-- SQL> PRINT VAR_ENAME VAR_SAL VAR_JOB;


-- 🚨 CH21_QUIZ_01
CREATE OR REPLACE PROCEDURE SEL_EMPNAME(
    VENAME IN EMP.ENAME%TYPE,
    VJOB OUT EMP.JOB%TYPE
)
    IS
BEGIN
    SELECT JOB
    INTO VJOB
    FROM EMP
    WHERE ENAME = VENAME;
END;
/
-- SQL> @CH21_QUIZ_01
-- SQL> VARIABLE VAR_JOB VARCHAR2(9);
-- SQL> print VAR_JOB


CREATE OR REPLACE PROCEDURE SEL_EMPNAME2(
    VENAME IN EMP.ENAME%TYPE,
    VJOB OUT EMP.JOB%TYPE,
    VDNAME OUT DEPT.DNAME%TYPE
)
    IS
BEGIN
    SELECT JOB, DNAME
    INTO VJOB, VDNAME
    FROM EMP
             NATURAL JOIN DEPT
    WHERE ENAME = VENAME;
END;
/

-- 🚨 FUNC02.sql
CREATE OR REPLACE FUNCTION CAL_ANNSAL(
    VEMPNO IN EMP.EMPNO%TYPE)
    RETURN NUMBER
    IS
    VANNSAL NUMBER(7, 2);
BEGIN
    SELECT SAL * 12 + NVL(COMM, 0)
    INTO VANNSAL
    FROM EMP
    WHERE EMPNO = VEMPNO;

    RETURN VANNSAL;
END;
/

SELECT ENAME, SAL, COMM, SAL * 12, CAL_ANNSAL(EMPNO)
FROM EMP;

CREATE OR REPLACE FUNCTION SEL_EMPNAME02(
    VENAME IN EMP.ENAME%TYPE)
    RETURN VARCHAR2
    IS
    VJOB EMP.JOB%TYPE;
BEGIN
    SELECT JOB
    INTO VJOB
    FROM EMP
    WHERE ENAME = VENAME;

    RETURN VJOB;
END;
/

-- CREATE OR REPLACE PROCEDURE SEL_EMPNAME2(
--     VENAME IN EMP.ENAME%TYPE,
--     VJOB OUT EMP.JOB%TYPE,
--     VDNAME OUT DEPT.DNAME%TYPE
-- )
--     IS
-- BEGIN
--     SELECT JOB, DNAME
--     INTO VJOB, VDNAME
--     FROM EMP NATURAL JOIN DEPT
--     WHERE ENAME = VENAME;
-- END;
-- /

CREATE OR REPLACE PROCEDURE CURSOR_SAMPLE01
    IS
    VDEPT DEPT%ROWTYPE;
    CURSOR C1
        IS
        SELECT *
        FROM DEPT;
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('DEPTNO', 8)
        || RPAD('DNAME', 10)
        || RPAD('LOC', 10));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 27, '-'));

    OPEN C1;

    LOOP
        FETCH C1 INTO VDEPT.DEPTNO, VDEPT.DNAME, VDEPT.LOC;

        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(RPAD(VDEPT.DEPTNO, 8)
            || RPAD(VDEPT.DNAME, 10)
            || RPAD(VDEPT.LOC, 10));
    END LOOP;

    CLOSE C1;
END;
/

CREATE OR REPLACE PROCEDURE SEL_EMP(
    VDEPTNO IN EMP.DEPTNO%TYPE
)
    IS
    VEMP      EMP%ROWTYPE;
    VEMPCOUNT NUMBER := 0;
    CURSOR C1
        IS
        SELECT EMPNO, ENAME, JOB, SAL
        FROM EMP
        WHERE DEPTNO = VDEPTNO;
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('EMPNO', 8)
        || RPAD('ENAME', 10)
        || RPAD('JOB', 10)
        || RPAD('SAL', 10));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 37, '-'));

    OPEN C1;

    LOOP
        FETCH C1 INTO VEMP.EMPNO, VEMP.ENAME, VEMP.JOB, VEMP.SAL;

        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(RPAD(VEMP.EMPNO, 8)
            || RPAD(VEMP.ENAME, 10)
            || RPAD(VEMP.JOB, 10)
            || RPAD(VEMP.SAL, 10));

        VEMPCOUNT := VEMPCOUNT + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('There are ' || VEMPCOUNT || ' people in ' || 'dept ' || VDEPTNO || '.');
    CLOSE C1;
END;
/

CREATE OR REPLACE PROCEDURE CURSOR_SAMPLE02
    IS
    VDEPT DEPT%ROWTYPE;
    CURSOR C1
        IS
        SELECT *
        FROM DEPT;
BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD('DEPTNO', 10) || RPAD('DNAME', 15) || RPAD('LOC', 10));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 33, '-'));

    FOR VDEPT IN C1
        LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(VDEPT.DEPTNO, 10) || RPAD(VDEPT.DNAME, 15) || RPAD(VDEPT.LOC, 10));
        end loop;
END;
/

/*
부서명 : ACCOUNTING
사원수 : 3
최고급여 : 5000
평균급여 : 2916.67
*/
CREATE OR REPLACE PROCEDURE CURSOR_TEST(
    VDEPTNO IN EMP.DEPTNO%TYPE
) IS
BEGIN
    FOR VEMP IN (SELECT DNAME, MAX(SAL) MAXSAL, ROUND(AVG(SAL), 2) AVGSAL, COUNT(*) EMPCOUNT
                 FROM EMP
                          NATURAL JOIN DEPT
                 WHERE DEPTNO = VDEPTNO
                 GROUP BY DEPTNO, DNAME)
        LOOP
            IF VEMP.EMPCOUNT IS NULL THEN
                DBMS_OUTPUT.PUT_LINE('There is no employees in Dept ' || VDEPTNO || '.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('DNAME : ' || VEMP.DNAME);
                DBMS_OUTPUT.PUT_LINE('EMP_COUNT : ' || VEMP.EMPCOUNT);
                DBMS_OUTPUT.PUT_LINE('MAX_SAL : ' || VEMP.MAXSAL);
                DBMS_OUTPUT.PUT_LINE('AVG_SAL : ' || VEMP.AVGSAL);
            end if;

        END LOOP;
END;
/

-- 🚨 PACK01.SQL
CREATE OR REPLACE PACKAGE EXAM_PACK
IS
    FUNCTION CAL_BONUS(VEMPNO IN EMP.EMPNO%TYPE)
        RETURN NUMBER;
    PROCEDURE CURSOR_SAMPLE02;
END;
/

CREATE OR REPLACE PACKAGE BODY EXAM_PACK
IS
    FUNCTION CAL_BONUS(VEMPNO IN EMP.EMPNO%TYPE)
        RETURN NUMBER
        IS
        VSAL NUMBER(7, 2);
    BEGIN
        SELECT SAL
        INTO VSAL
        FROM EMP
        WHERE EMPNO = VEMPNO;

        RETURN (VSAL * 200);
    END;

    PROCEDURE CURSOR_SAMPLE02
        IS
        CURSOR C1
            IS SELECT *
               FROM DEPT;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('DEPTNO / DNAME / LOC');
        DBMS_OUTPUT.PUT_LINE('-----------------------');

        FOR VDEPT IN C1
            LOOP
                DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' ' || VDEPT.DNAME || ' ' || VDEPT.LOC);
            END LOOP;
    END;
END;
/

drop table emp01;
drop table emp02;

create table EMP01
as
select *
from emp;
create table EMP02
as
select *
from emp;

CREATE OR REPLACE TRIGGER STAT_TRIG
    AFTER UPDATE
    ON EMP01
BEGIN
    DBMS_OUTPUT.PUT_LINE('EMP01 SAL IS UPDATED 10%');
END;
/

CREATE OR REPLACE TRIGGER ROW_TRIG
    AFTER UPDATE
    ON EMP02
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('EMP01 SAL IS UPDATED 10%');
END;
/

SELECT TRIGGER_NAME,
       TABLE_NAME,
       TRIGGERING_EVENT,
       TRIGGER_TYPE
FROM USER_TRIGGERS;

SELECT TRIGGER_NAME,
       DESCRIPTION,
       TRIGGER_BODY
FROM USER_TRIGGERS;

---

CREATE OR REPLACE TRIGGER TRIGGER_TEST
    BEFORE UPDATE
    ON DEPT01
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('before update DNAME : ' || :old.dname);
    DBMS_OUTPUT.PUT_LINE('before update DNAME : ' || :new.dname);

    DBMS_OUTPUT.PUT_LINE('columns not used in SET (:new.LOC) ' || :new.LOC);
    DBMS_OUTPUT.PUT_LINE('columns not used in SET (:old.LOC) ' || :old.LOC);
    DBMS_OUTPUT.PUT_LINE('columns not used in SET (:new.DEPTNO) ' || :new.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('columns not used in SET (:old.DEPTNO) ' || :old.DEPTNO);
END;
/


CREATE TABLE EMP01
(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB   VARCHAR2(20)
);


-- 🚨 TRIG01.sql
CREATE OR REPLACE TRIGGER TRG_01
    AFTER INSERT
    ON EMP01
BEGIN
    DBMS_OUTPUT.PUT_LINE('NEW EMPLOYEES IS HIRED');
END;
/

CREATE TABLE SAL01
(
    SALNO NUMBER(4) PRIMARY KEY,
    SAL   NUMBER(7, 2),
    EMPNO NUMBER(4) REFERENCES EMP01 (EMPNO)
);


CREATE SEQUENCE SAL01_SALNO_SEQ
    START WITH 1
    INCREMENT BY 1;
select *
from USER_SEQUENCES;

-- :new.EMPNO
CREATE OR REPLACE TRIGGER TRG_02
    AFTER INSERT
    ON EMP01
    FOR EACH ROW
BEGIN
    INSERT INTO SAL01
    VALUES (SAL01_SALNO_SEQ.NEXTVAL, 100, :NEW.EMPNO);
END;
/

drop table dept01;

CREATE TABLE DEPT01
AS
SELECT *
FROM DEPT;

create table temp
as
select *
from dept
where 1 = 0;


CREATE OR REPLACE TRIGGER DEPT01_UPDATE
    AFTER UPDATE
    ON DEPT01
    FOR EACH ROW
BEGIN
    INSERT INTO TEMP VALUES (:OLD.DEPTNO, :OLD.DNAME, :OLD.LOC);
END;
/

-- UPDATE DEPT01 SET DNAME = 'SEOUL' WHERE DEPTNO = 10;
-- 제조사: Manufacturer
-- 소비자가격: Retail_Price 또는 Consumer_Price
-- 재고수량: Stock_Quantity 또는 Inventory_Quantity

CREATE TABLE PRODUCT
(
    PNO           CHAR(6) PRIMARY KEY,   -- 상품번호
    PNAME         VARCHAR2(12) NOT NULL, -- 상품명
    MANUFACTURER  VARCHAR2(12),          -- 제조사
    CONSUMERPRICE NUMBER(8),             -- 소비자가격
    QUANTITY      NUMBER DEFAULT 0       -- 재고수량
);

CREATE TABLE RECEIVING
(
    RNO               NUMBER(6) PRIMARY KEY,            -- 입고번호
    PNO               CHAR(6) REFERENCES PRODUCT (PNO), -- 상품코드
    RECEIVINGDATE     DATE DEFAULT SYSDATE,             -- 입고일자
    RECEIVINGQUANTITY NUMBER(6),                        -- 입고수량
    UNITPRICE         NUMBER(8),                        -- 입고단가
    TOTALAMOUNT       NUMBER(8)                         -- 입고금액
);

-- INSERT INTO PRODUCT (PNO, PNAME, MANUFACTURER, CONSUMERPRICE)
-- VALUES ('A00001', 'LAUNDRY', 'LG', 500);
-- INSERT INTO PRODUCT (PNO, PNAME, MANUFACTURER, CONSUMERPRICE)
-- VALUES ('A00002', 'COMPUTER', 'LG', 700);
-- INSERT INTO PRODUCT (PNO, PNAME, MANUFACTURER, CONSUMERPRICE)
-- VALUES ('A00003', 'REFRIGERATOR', 'SAMSUNG', 600);

CREATE OR REPLACE TRIGGER TRG_04
    AFTER INSERT
    ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET QUANTITY = QUANTITY + :NEW.RECEIVINGQUANTITY
    WHERE PNO = :NEW.PNO;
END;
/

INSERT INTO RECEIVING (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
VALUES (1, 'A00001', 5, 320, 1600);
INSERT INTO RECEIVING (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
VALUES (2, 'A00002', 10, 680, 6800);

CREATE TABLE RECEIVING
(
    RNO               NUMBER(6) PRIMARY KEY,            -- 입고번호
    PNO               CHAR(6) REFERENCES PRODUCT (PNO), -- 상품코드
    RECEIVINGDATE     DATE DEFAULT SYSDATE,             -- 입고일자
    RECEIVINGQUANTITY NUMBER(6),                        -- 입고수량
    UNITPRICE         NUMBER(8),                        -- 입고단가
    TOTALAMOUNT       NUMBER(8)                         -- 입고금액
);

INSERT INTO RECEIVING (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
VALUES (3, 'A00003', 3, 220, 660);
INSERT INTO RECEIVING (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
VALUES (4, 'A00003', 5, 220, 1100);
COMMIT;

-- 🚨 TRIG05.sql
CREATE OR REPLACE TRIGGER TRG_05
    AFTER UPDATE
    ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET QUANTITY = QUANTITY - :OLD.RECEIVINGQUANTITY + :NEW.RECEIVINGQUANTITY
    WHERE PNO = :NEW.PNO;
END;
/

-- 🚨 TRIG06.sql
CREATE OR REPLACE TRIGGER TRG_06
    AFTER DELETE
    ON RECEIVING
    FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET QUANTITY = QUANTITY - :OLD.RECEIVINGQUANTITY
    WHERE PNO = :OLD.PNO;
END;
/


CREATE TABLE PRODUCT2
(
    PNO           CHAR(6) PRIMARY KEY,   -- 상품번호
    PNAME         VARCHAR2(12) NOT NULL, -- 상품명
    MANUFACTURER  VARCHAR2(12),          -- 제조사
    CONSUMERPRICE NUMBER(8),             -- 소비자가격
    QUANTITY      NUMBER DEFAULT 0       -- 재고수량
);

CREATE TABLE RECEIVING2
(
    RNO               NUMBER(6) PRIMARY KEY,            -- 입고번호
    PNO               CHAR(6) REFERENCES PRODUCT (PNO), -- 상품코드
    RECEIVINGDATE     DATE DEFAULT SYSDATE,             -- 입고일자
    RECEIVINGQUANTITY NUMBER(6),                        -- 입고수량
    UNITPRICE         NUMBER(8),                        -- 입고단가
    TOTALAMOUNT       NUMBER(8)                         -- 입고금액
);

CREATE OR REPLACE TRIGGER TRIG_ALL
    AFTER INSERT OR UPDATE OR DELETE
    ON RECEIVING2
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE PRODUCT2
        SET QUANTITY = QUANTITY + :NEW.RECEIVINGQUANTITY
        WHERE PNO = :NEW.PNO;
    ELSIF UPDATING THEN
        UPDATE PRODUCT2
        SET QUANTITY = QUANTITY - :OLD.RECEIVINGQUANTITY + :NEW.RECEIVINGQUANTITY
        WHERE PNO = :NEW.PNO;
    ELSIF DELETING THEN
        UPDATE PRODUCT2
        SET QUANTITY = QUANTITY - :OLD.RECEIVINGQUANTITY
        WHERE PNO = :OLD.PNO;
    END IF;
END;

-- INSERT INTO RECEIVING2 (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
-- VALUES (1, 'A00001', 5, 320, 1600);
-- INSERT INTO RECEIVING2 (RNO, PNO, RECEIVINGQUANTITY, UNITPRICE, TOTALAMOUNT)
-- VALUES (2, 'A00002', 10, 680, 6800);
-- commit;


-- select *
-- from gradecard;
-- select *
-- from grade;
CREATE OR REPLACE TRIGGER TRIG_GRADE
    AFTER INSERT
    ON GRADECARD
    FOR EACH ROW
BEGIN
    DECLARE
        V_TOT   NUMBER;
        V_AVG   NUMBER;
        V_GRADE GRADE.GRADE%TYPE;
    BEGIN
        V_TOT := :NEW.KOR + :NEW.ENG + :NEW.MAT;
        V_AVG := ROUND((:NEW.KOR + :NEW.ENG + :NEW.MAT) / 3);
        V_GRADE := CAL_GRADE(V_AVG);

        UPDATE GRADECARD
        SET TOT   = V_TOT,
            AVG   = V_AVG,
            GRADE = V_GRADE
        WHERE NO = :NEW.NO;
    END;
END;
/

select *
from USER_SEQUENCES;

select *
from gradecard;
INSERT INTO GRADECARD(NO, NAME, KOR, ENG, MAT)
VALUES (GRADECARD_SEQ.NEXTVAL, 'TEST1', 90, 90, 90);


commit;



CREATE OR REPLACE TRIGGER TRIG_GRADE
    BEFORE INSERT
    ON GRADECARD
    FOR EACH ROW
BEGIN
    :NEW.TOT := :NEW.KOR + :NEW.ENG + :NEW.MAT;
    :NEW.AVG := ROUND(:NEW.TOT / 3);
    :NEW.GRADE := CAL_GRADE(:NEW.AVG);

    DBMS_OUTPUT.PUT_LINE(:NEW.TOT);
    DBMS_OUTPUT.PUT_LINE(:NEW.AVG);
    DBMS_OUTPUT.PUT_LINE(:NEW.GRADE);

    UPDATE GRADECARD
    SET TOT   = :NEW.TOT,
        AVG   = :NEW.AVG,
        GRADE = :NEW.GRADE
    WHERE NO = :NEW.NO;
END;
/
select *
from grade;
select *
from gradecard;
INSERT INTO GRADECARD(NO, NAME, KOR, ENG, MAT)
VALUES (GRADECARD_SEQ.NEXTVAL, 'TEST1', 90, 90, 90);

CREATE TABLE BOARD
(
    BOARD_NUM       NUMBER(5),      -- 글번호(기본키)
    BOARD_NAME      VARCHAR2(30),   -- 작성자
    BOARD_PASS      VARCHAR2(30),   -- 비밀번호
    BOARD_SUBJECT   VARCHAR2(300),  -- 제목
    BOARD_CONTENT   VARCHAR2(4000), -- 내용
    BOARD_FILE      VARCHAR2(50),   -- 첨부될 파일 명(시스템에 저장되는 파일명)
    BOARD_ORIGINAL  VARCHAR2(50),   -- 첨부될 파일 명(시스템에 저장된 파일의 원래 파일명)
    BOARD_RE_REF    NUMBER(5),      -- 답변 글 작성시 참조되는 글의 번호
    BOARD_RE_LEV    NUMBER(5),      -- 답변 글의 깊이(원문 글:0, 답변:1, 답변의답변:2)
    BOARD_RE_SEQ    NUMBER(5),      -- 답변 글의 순서(원문 글 기준으로 보여주는 순서)
    BOARD_READCOUNT NUMBER(5),      -- 글의 조회수
    BOARD_DATE      DATE,           -- 글의작성날짜
    PRIMARY KEY (BOARD_NUM)
);

CREATE SEQUENCE BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;

SELECT RANKING, EMPNO, ENAME, SAL
FROM (SELECT ROWNUM AS RANKING, EMPNO, ENAME, SAL
      FROM (SELECT EMPNO, ENAME, SAL
            FROM EMP
            ORDER BY SAL DESC)
      WHERE ROWNUM <= 3)
WHERE RANKING BETWEEN 2 AND 3;

select *
from gradecard;


SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP ORDER BY SAL) E
WHERE ROWNUM <= 5;

SELECT *
FROM (SELECT ROWNUM as RNUM, E.*
      FROM (SELECT *
            FROM EMP
            ORDER BY SAL) E
      WHERE ROWNUM <= 14)
WHERE RNUM BETWEEN 10 AND 14;

