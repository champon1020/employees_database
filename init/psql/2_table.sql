-- Create Tables.

\c employees;

CREATE TYPE gender_type AS ENUM('M', 'F');

CREATE TABLE employees (
    emp_no     INT            NOT NULL,
    birth_date DATE           NOT NULL,
    first_name VARCHAR(14)    NOT NULL,
    last_name  VARCHAR(16)    NOT NULL,
    gender     gender_type    NOT NULL,
    hire_date  DATE           NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no   CHAR(4)     NOT NULL,
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE      (dept_name)
);

CREATE TABLE dept_manager (
   dept_no   CHAR(4) NOT NULL,
   emp_no    INT     NOT NULL,
   from_date DATE    NOT NULL,
   to_date   DATE    NOT NULL,
   PRIMARY KEY (emp_no,dept_no),   
   CONSTRAINT dept_manager_emp_no
              FOREIGN KEY (emp_no)
              REFERENCES employees (emp_no)
              ON DELETE CASCADE,
   CONSTRAINT dept_manager_dept_no
              FOREIGN KEY (dept_no)
              REFERENCES departments (dept_no)
              ON DELETE CASCADE
);

CREATE INDEX IDX_dept_manager_dept_no ON dept_manager(dept_no);

CREATE TABLE dept_emp (
    emp_no    INT     NOT NULL,
    dept_no   CHAR(4) NOT NULL,
    from_date DATE    NOT NULL,
    to_date   DATE    NOT NULL,
    PRIMARY KEY (emp_no,dept_no),    
    CONSTRAINT FK_dept_emp_emp_no
               FOREIGN KEY (emp_no)
               REFERENCES employees (emp_no)
               ON DELETE CASCADE,
    CONSTRAINT FK_dept_emp_dept_no
               FOREIGN KEY (dept_no)
               REFERENCES departments (dept_no)
               ON DELETE CASCADE
);

CREATE INDEX IDX_dept_emp_dept_no ON dept_emp(dept_no);

CREATE TABLE titles (
    emp_no    INT         NOT NULL,
    title     VARCHAR(50) NOT NULL,
    from_date DATE        NOT NULL,
    to_date   DATE,
    PRIMARY KEY (emp_no,title, from_date),    
    CONSTRAINT titles_emp_no
               FOREIGN KEY (emp_no)
               REFERENCES employees (emp_no)
               ON DELETE CASCADE
);

CREATE TABLE salaries (
    emp_no    INT  NOT NULL,
    salary    INT  NOT NULL,
    from_date DATE NOT NULL,
    to_date   DATE NOT NULL,
    PRIMARY KEY (emp_no, from_date),    
    CONSTRAINT FK_salaries_emp_no
               FOREIGN KEY (emp_no)
               REFERENCES employees (emp_no)
               ON DELETE CASCADE
);
