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
