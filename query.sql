CREATE DATABASE Teachers
USE Teachers

CREATE TABLE Posts(
    Id int PRIMARY KEY IDENTITY(1,1),
    PostName NVARCHAR(20)
)


CREATE TABLE Teachers(
    Id int PRIMARY KEY IDENTITY(1,1),
    TeacherName NVARCHAR(15),
    Code CHAR(10),
    PostId Int FOREIGN KEY REFERENCES Posts(Id),
    Telefon CHAR(7),
    Salary int,
    Rise NUMERIC(6,2),
    Hiredate DATETIME
)


-----------------------------------------------------------------------


-- 2. Delete the "POSTS" table.

DROP TABLE Posts;

-- 3. In the "TEACHERS" table, delete the "IdPost" column.

ALTER TABLE Teachers
DROP COLUMN IdPost;

-- 4. For the "HireDate" column, create a limit: the date of hiring must be at least 01/01/1990.

ALTER TABLE Teachers
ADD CONSTRAINT CHK_HireDate
CHECK (HireDate >= '1990-01-01');

-- 5. Create a unique constraint for the "Code" column.

ALTER TABLE Teachers
ADD CONSTRAINT UQ_TeacherCode
UNIQUE (Code);

-- 6. Change the data type In the Salary field from INTEGER to NUMERIC (6,2).

ALTER TABLE Teachers
ALTER COLUMN Salary NUMERIC(6,2);

-- 7. Add to the table "TEACHERS" the following restriction: the salary should not be less than 1000, but also should not Exceed 5000.

ALTER TABLE Teachers
ADD CONSTRAINT CHK_SalaryRange
CHECK (Salary >= 1000 AND Salary <= 5000);

-- 8. Rename Tel column to Phone.

EXEC sp_rename 'Teachers.Telefon', 'Phone', 'COLUMN';

-- 9. Change the data type in the Phone field from CHAR (7) to CHAR (11).

ALTER TABLE Teachers
ALTER COLUMN Phone CHAR(11);


-- 10. Create again the "POSTS" table.

CREATE TABLE Posts (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PostName NVARCHAR(20) UNIQUE  
);


-- 11. For the Name field of the "POSTS" table, you must set a limit on the position (professor, assistant professor, teacher or assistant).

ALTER TABLE Posts
ADD CONSTRAINT CHK_PostName_ValidValues
CHECK (PostName IN ('professor', 'assistant professor', 'teacher', 'assistant'));

-- 12. For the Name field of the "TEACHERS" table, specify a restriction in which to prohibit the presence of figures in the teacher's surname.

ALTER TABLE Teachers
ADD CONSTRAINT CHK_TeacherName_NoDigits
CHECK (TeacherName NOT LIKE '%[0-9]%');

-- 13. Add the IdPost (int) column to the "TEACHERS" table.

ALTER TABLE Teachers
ADD IdPost INT;

-- 14. Associate the field IdPost table "TEACHERS" with the field Id of the table "POSTS".

ALTER TABLE Teachers
ADD CONSTRAINT FK_Teachers_Posts
FOREIGN KEY (IdPost) REFERENCES Posts(Id);


------------------------------------------------------------------------------------------------------


-- 15. Fill both tables with data.


INSERT INTO Posts (Id, PostName) VALUES (1, N'Professor '); 
INSERT INTO Posts (Id, PostName) VALUES (2, N'Docent '); 
INSERT INTO Posts (Id, PostName) VALUES (3, N'Teacher'); 
INSERT INTO Posts (Id, PostName) VALUES (4, N'Assistant ');

INSERT INTO Teachers (Id, TeacherName, Code, PostId, Telefon, Salary, Rise, HireDate) VALUES (1, N'Sidorov ',' 0123456789 ', 1, NULL, 1070, 470, '01 .09.1992');
INSERT INTO Teachers (Id, TeacherName, Code, PostId, Telefon, Salary, Rise, HireDate) VALUES (2, N'Ramishevsky ',' 4567890123 ', 2,' 4567890 ', 1110, 370, '09 .09.1998'); INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate) VALUES (3, N'Horenko ',' 1234567890 ', 3, NULL, 2000, 230, '10 .10.2001');
INSERT INTO Teachers (Id, TeacherName, Code, PostId, Telefon, Salary, Rise, HireDate) VALUES (4, N'Vibrovsky ',' 2345678901 ', 4, NULL, 4000, 170, '01 .09.2003'); INSERT INTO TEACHER (Id, Name, Code, IdPost, phone, Salary, Rise, HireDate) VALUES (5, N'Voropaev ', NULL, 4, NULL, 1500, 150, '02 .09.2002');
INSERT INTO Teachers (Id, TeacherName, Code, PostId, Telefon, Salary, Rise, HireDate) VALUES (6, N'Kuzintsev ',' 5678901234 ', 3,' 4567890 ', 3000, 270, '01 .01.1991');

-- 16. Create a view:

-- 16.1. All job titles.







-- 16.2. All the names of teachers.




-- 16.3. The identifier, the name of the teacher, his position, the general s / n (sort by s \ n).




-- 16.4. Identification number, surname, telephone number (only those who have a phone number).




-- 16.5. Surname, position, date of admission in the format [dd/mm/yy].





-- 16.6. Surname, position, date of receipt in the format [dd month_text yyyy].



