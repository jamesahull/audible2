create table registeredemails (
id serial,
email varchar(255),
create_date datetime);
CREATE TABLE contactrequests (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  email varchar(128) NOT NULL,
  message varchar(255) DEFAULT NULL,
  datesubmitted date DEFAULT NULL,
  UNIQUE KEY id (id)
);
CREATE TABLE poststatus (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  status char(1) DEFAULT NULL,
  name varchar(64) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id)
);
INSERT INTO northern_aliweb.poststatus
(status,name) VALUES ('E', 'Saved');
INSERT INTO northern_aliweb.poststatus
(status,name) VALUES ('R', 'Submitted');
INSERT INTO northern_aliweb.poststatus
(status,name) VALUES ('Y', 'Approved');
INSERT INTO northern_aliweb.poststatus
(status,name) VALUES ('N', 'To be removed');


CREATE TABLE `feedbackreqds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `userid` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `showpost` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` mediumtext,
  `answer` mediumtext,
  `answered` char(1) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` char(1) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `mhp` char(1) DEFAULT NULL,
  `mentalhealth` varchar(255) DEFAULT NULL,
  `ethnic` tinyint(4) DEFAULT NULL,
  `ethnicgroup` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `usedirect` char(1) DEFAULT NULL,
  `sector` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `adminusers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loginid` varchar(64) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` char(1) DEFAULT NULL,
  `roles` varchar(32) DEFAULT NULL,
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`));