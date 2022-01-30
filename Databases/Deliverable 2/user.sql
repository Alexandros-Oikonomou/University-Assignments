CREATE USER 'admin'@'localhost' IDENTIFIED BY 'iamgod';
CREATE USER 'admin'@'%' IDENTIFIED BY 'iamgod';
GRANT ALL PRIVILEGES ON busdb.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON busdb.* TO 'admin'@'%';

CREATE USER 'secretary'@'localhost' IDENTIFIED BY 'secpass';
GRANT SELECT, INSERT, UPDATE, DELETE ON busdb.reservation TO 'secretary'@'localhost';
GRANT SELECT, INSERT, UPDATE ON busdb.customer TO 'secretary'@'localhost';
GRANT SELECT, INSERT, UPDATE ON busdb.destination TO 'secretary'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON busdb.trip TO 'secretary'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON busdb.driver TO 'secretary'@'localhost';

CREATE USER 'customer'@'%' IDENTIFIED BY 'customerpass';
GRANT SELECT, INSERT, UPDATE ON buds.customer TO 'customer'@'%';
GRANT SELECT, INSERT ON buds.reservation TO 'customer'@'%';