DROP DATABASE IF EXISTS school;

create database school;
use school;

-- Table structure for student

CREATE TABLE student
(
    sid   int NOT NULL AUTO_INCREMENT,
    fName varchar(255) DEFAULT NULL,
    lName varchar(255) DEFAULT NULL,
    PRIMARY KEY (sid)
);

-- Table structure for teacher

CREATE TABLE teacher
(
    tid    int NOT NULL AUTO_INCREMENT,
    tFName varchar(255) DEFAULT NULL,
    tLName varchar(255) DEFAULT NULL,
    dept   varchar(255) DEFAULT NULL,
    PRIMARY KEY (tid)
);


-- Table structure for course

CREATE TABLE course
(
    cid        int NOT NULL AUTO_INCREMENT,
    courseName varchar(255) DEFAULT NULL,
    courseDesc varchar(255) DEFAULT NULL,
    teacherId  int          DEFAULT NULL,
    PRIMARY KEY (cid),
    KEY teacherId (teacherId),
    CONSTRAINT course_ibfk_1
        FOREIGN KEY (teacherId) REFERENCES teacher (tid)
);

-- Table structure for course_student

CREATE TABLE course_student
(
    student_id int,
    course_id  int,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT course_student_ibfk_1
        FOREIGN KEY (student_id) REFERENCES student (sid),
    CONSTRAINT course_student_ibfk_2
        FOREIGN KEY (course_id) REFERENCES course (cid)
);