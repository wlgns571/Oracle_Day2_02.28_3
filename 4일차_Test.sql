-- 표현식 CASE문
SELECT employee_id
     , salary
     , CASE WHEN salary > 15000 THEN 'A등급'
            WHEN salary > 5000 AND salary <=15000 THEN 'B등급'
            WHEN salary <= 5000 THEN 'C등급'
        ELSE '나머지'
        END as salary_grade -- as는 테이블의 이름을 설정해서 안으로 데이터를 넣어준다.
FROM employees;

-- 문자 연산자 ||
-- 문자와 데이터를 붙여주는 역할 ( 많이 쓰임 )
SELECT employee_id
     , emp_name
     , '사번:' || employee_id || ' 이름:' || emp_name as doc
FROM employees;

-- 수식 연산자
SELECT emp_name
     , salary      as 월급
     , round(salary / 30,2) as 일당
     , salary * 12 as 연봉
FROM employees;

-- 논리 연산자
SELECT * FROM employees WHERE salary > 15000;  -- 초과
SELECT * FROM employees WHERE salary < 3000;   -- 미만
SELECT * FROM employees WHERE salary >= 15000; -- 이상
SELECT * FROM employees WHERE salary <= 3000;  -- 이하
SELECT * FROM employees WHERE department_id != 50; -- 아닌(not)
SELECT * FROM employees WHERE department_id <> 50; -- 아닌
SELECT * FROM employees WHERE department_id ^= 50; -- 아닌

--NULL (null 여부는 연산자를 사용하면 비교하지 못함)
SELECT *
FROM departments
WHERE parent_id is not null; -- null이 아닌 (null 검색시엔 is 사용)

-- ROWNUM : 의사컬럼_테이블에는 없지만 있는것 처럼 사용
-- 페이징 처리시 많이 사용
-- BETWEEN a AND b : a ~ b 사이 값인 로우 검색
SELECT *
FROM (
        SELECT rownum as rnum
             , emp_name
             , employee_id
        FROM employees
      )
WHERE rnum BETWEEN 1 AND 10;

SELECT rownum as rnum
     , emp_name
     , employee_id
FROM employees
ORDER BY emp_name desc;

-- IN 조건식
SELECT employee_id
     , salary
FROM employees
--WHERE salary IN (2000, 3000, 4000);  -- OR과 같음
WHERE salary NOT IN (2000, 3000, 4000);  -- OR과 같음

-- 30, 40번 부서 직원만 조회하시오.                                                                                                                                                                                                                                                                                                                                                              
SELECT emp_name
     , department_id
FROM employees
WHERE department_id IN (30, 40);
-- WHERE department_id = 30
-- OR department_id = 40;

-- 직원 이름에 David 또는 King이 들어가는 직원을 조회하시오.
SELECT employee_id
     , emp_name
     , email
     , phone_number
     , hire_date
FROM employees
WHERE emp_name LIKE '%David%'
OR emp_name LIKE '%King%';

-- customers 테이블에서 CUST_EMAIL 컬럼의
-- 이메일 주소의 @ 기준으로 앞은 아이디
--             @ 기준으로 뒤는 도메인 으로 출력하시오.

SELECT substr(cust_email, 1, INSTR(cust_email,'@')-1) as 아이디
     , substr(cust_email, INSTR(cust_email,'@')+1) as 도메인
     , cust_email
FROM customers;