DROP
DATABASE  IF EXISTS `studentFestDB`;

CREATE
DATABASE  IF NOT EXISTS `studentFestDB`;
USE
`studentFestDB`;

--
-- Table `student`
--

DROP TABLE IF EXISTS `student`;

create table student
(
    student_id int primary key auto_increment,
    name       varchar(50),
    department varchar(50),
    country    varchar(50)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `username`   varchar(50) NOT NULL,
    `password`   char(80)    NOT NULL,
    `first_name` varchar(50) NOT NULL,
    `last_name`  varchar(50) NOT NULL,
    `email`      varchar(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- Default passwords here are: student123

INSERT INTO `user` (username, password, first_name, last_name, email)
VALUES ('Akhil', '$2a$10$38OKrrgpg.qy0WYgQ4.92e.QyfuTcdFc25U51EaeQYJZP0cPhmSq6', 'Akhil', 'Singla', 'akhil@gmail.com'),
       ('Amit', '$2a$10$38OKrrgpg.qy0WYgQ4.92e.QyfuTcdFc25U51EaeQYJZP0cPhmSq6', 'Amit', 'Garg', 'amit@gmail.com'),
       ('Neha', '$2a$10$38OKrrgpg.qy0WYgQ4.92e.QyfuTcdFc25U51EaeQYJZP0cPhmSq6', 'Neha', 'Mittal', 'neha@gmail.com');


--
-- Table `role`
--

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO `role` (name)
VALUES ('ROLE_USER'),
       ('ROLE_ADMIN');

--
-- Table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles`
(
    `user_id` int(11) NOT NULL,
    `role_id` int(11) NOT NULL,

    PRIMARY KEY (`user_id`, `role_id`),

    KEY       `FK_ROLE_idx` (`role_id`),

    CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`)
        REFERENCES `user` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,

    CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`)
        REFERENCES `role` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET
FOREIGN_KEY_CHECKS = 1;

INSERT INTO `users_roles` (user_id, role_id)
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (3, 1),
       (3, 2)