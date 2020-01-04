DROP DATABASE IF EXISTS employee_tracker_db;
CREATE DATABASE employee_tracker_db;
USE employee_tracker_db;

CREATE TABLE department (
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
department VARCHAR(30)
);

CREATE TABLE employeeRole (
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id),
title VARCHAR(30),
salary DECIMAL,
department_id INTEGER NOT NULL,
CONSTRAINT fk_department_id
FOREIGN KEY (department_id)
    REFERENCES department(id)
    ON UPDATE CASCADE
);

CREATE TABLE manager (
id INTEGER NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
manager VARCHAR(30)
);

CREATE TABLE employee (
id INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id),
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
employeeRole_id INTEGER NOT NULL,
CONSTRAINT fk_employeeRole_id
FOREIGN KEY (employeeRole_id)
    REFERENCES employeeRole(id)
    ON UPDATE CASCADE,
manager_id INTEGER,
CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id)
    REFERENCES manager(id)
    ON UPDATE CASCADE
);

INSERT into department (department)
VALUES
('Sales'),
('HR');

INSERT INTO employeeRole (title, salary, department_id)
VALUES
('Sales lead', 70000, 1),
('HR lead', 40000, 2),
('Sales assistant', 35000, 1),
('HR assistant', 45000, 2);

INSERT INTO manager (manager)
VALUES
('Yulia'),
('Jill'),
('Jennifer');

INSERT INTO employee (first_name, last_name, employeeRole_id, manager_id)
VALUES
("Yulia", "Che", 1, 1),
("Jill","Black", 2, 1),
("Jennifer","Hooper", 4, 3),
("Emily","Ross", 4, 3),
("Tanya","Who", 4, 3),
("Lisa","Croft", 3, 2),
("Kat","Smith", 3, 2);

SELECT * FROM employee_tracker_db.employee;

SELECT * FROM employee_tracker_db.employeeRole;

SELECT * FROM employee_tracker_db.department;

SELECT * FROM employee_tracker_db.manager;


SELECT
first_name, last_name, title, department, salary, manager
FROM
employee
INNER JOIN
manager using (id)
INNER JOIN
employeeRole USING (id)
INNER JOIN
department USING (id)
ORDER BY
id;

SELECT * FROM employee