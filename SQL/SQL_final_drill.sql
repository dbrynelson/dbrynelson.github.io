CREATE DATABASE db_library

USE db_library;
GO

/*TABLES FOR db_library */

CREATE TABLE tbl_branches (
	branch_id INT PRIMARY KEY not null IDENTITY (1,1),
	branch_name VARCHAR(50) not null,
	branch_address VARCHAR(50) not null
);

CREATE TABLE tbl_publisher (
	pub_name VARCHAR(50) PRIMARY KEY not null,
	pub_address VARCHAR(50) not null,
	pub_phone VARCHAR(50) not null
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY not null IDENTITY (1,1),
	book_title VARCHAR(50) not null,
	pub_name VARCHAR(50) not null CONSTRAINT fk_pub_name FOREIGN KEY REFERENCES tbl_publisher(pub_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_authors (
	book_id INT not null CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	auth_name VARCHAR(50) not null
);

CREATE TABLE tbl_copies (
	book_id INT not null CONSTRAINT fk_book2_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT not null CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branches(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	num_copies INT not null
);

CREATE TABLE tbl_borrower (
	card_num INT PRIMARY KEY not null IDENTITY (1,1),
	borrower_name VARCHAR(50) not null,
	borrower_address VARCHAR(50) not null,
	borrower_phone VARCHAR(50) not null
);

CREATE TABLE tbl_loans (
	book_id INT not null CONSTRAINT fk_book3_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT not null CONSTRAINT fk_branch2_id FOREIGN KEY REFERENCES tbl_branches(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_num INT not null CONSTRAINT fk_card_num FOREIGN KEY REFERENCES tbl_borrower(card_num) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out VARCHAR(50) null,
	date_due VARCHAR(50) null
);

/* Data INSERTED into TABLES of db_library */

INSERT INTO tbl_branches
	(branch_name, branch_address)
	VALUES
	('Sharpstown', '1234 Reading Road'),
	('Central', '5678 Center Avenue'),
	('Uptown', '9876 North Court'),
	('Downtown', '5432 Broadway Street')
;

INSERT INTO tbl_publisher
	(pub_name, pub_address, pub_phone)
	VALUES
	('Doubleday', '2244 2nd Street', '503-223-1293'),
	('Viking', '1133 Ship Road', '971-245-4432'),
	('Island', '8808 Liholiho Street', '808-878-9321'),
	('VIP Publishing', '454 Secret Avenue', '360-456-1233'),
	('American Publishing', '1977 Independence Road', '503-255-6969')
;

INSERT INTO tbl_books
	(book_title, pub_name)
	VALUES
	('The Lost Tribe', 'Island'),
	('The Shining', 'Doubleday'),
	('IT', 'Viking'),
	('Book 4', 'VIP Publishing'),
	('Book 5', 'American Publishing'),
	('Book 6', 'VIP Publishing'),
	('Book 7', 'Doubleday'),
	('Book 8', 'Doubleday'),
	('Book 9', 'Viking'),
	('Book 10', 'Island'),
	('Book 11', 'American Publishing'),
	('Book 12', 'VIP Publishing'),
	('Book 13', 'Viking'),
	('Book 14', 'Viking'),
	('Book 15', 'Island'),
	('Book 16', 'Doubleday'),
	('Book 17', 'Doubleday'),
	('Book 18', 'Viking'),
	('Book 19', 'Island'),
	('Book 20', 'Island')
;

INSERT INTO tbl_authors
	(book_id, auth_name)
	VALUES
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'George Karl'),
	(5, 'Jim Jones'),
	(6, 'Dane Brynelson'),
	(7, 'Paul Brown'),
	(8, 'Anthony Green'),
	(9, 'Elijah Smith'),
	(10, 'Mary Poppins'),
	(11, 'Susan Bowers'),
	(12, 'Susan Bowers'),
	(13, 'Paul Brown'),
	(14, 'George Karl'),
	(15, 'Jim Jones'),
	(16, 'Dane Brynelson'),
	(17, 'Mark Lee'),
	(18, 'Mary Poppins'),
	(19, 'Anthony Green'),
	(20, 'Jim Jones')
;

INSERT INTO tbl_copies
	(book_id, branch_id, num_copies)
	VALUES
	(1, 1, 2),
	(2, 1, 3),
	(3, 1, 3),
	(4, 1, 3),
	(5, 1, 2),
	(6, 1, 2),
	(7, 1, 2),
	(8, 1, 3),
	(9, 1, 4),
	(10, 1, 2),
	(11, 3, 2),
	(12, 3, 4),
	(13, 3, 5),
	(14, 3, 2),
	(15, 3, 2),
	(16, 3, 3),
	(17, 3, 3),
	(18, 3, 3),
	(19, 3, 2),
	(20, 3, 5),
	(1, 2, 2),
	(2, 2, 2),
	(3, 2, 2),
	(4, 2, 3),
	(5, 2, 3),
	(6, 2, 5),
	(7, 2, 5),
	(8, 2, 4),
	(9, 2, 3),
	(10, 2, 3),
	(11, 4, 2),
	(12, 4, 2),
	(13, 4, 2),
	(14, 4, 2),
	(15, 4, 2),
	(16, 4, 2),
	(17, 4, 2),
	(18, 4, 2),
	(19, 4, 2),
	(20, 4, 2)
;


INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Bob', '1234 102nd Ave', '503-255-1010'),
	('Joe', '4532 A Street', '503-212-4321'),
	('Alex', '5633 Main Street', '971-245-9887'),
	('Diane', '6807 SE Clinton Street', '503-253-1919'),
	('Riley', '455 La Grande Road', '503-542-1234'),
	('Sara', '8776 Powell Blvd', '541-443-1234'),
	('Mona', '503 Beach Street', '808-214-5959'),
	('Troy', '6775 SE Division Street', '503-781-5543')
;

INSERT INTO tbl_loans
	(book_id, branch_id, card_num, date_out, date_due)
	VALUES
	(1, 1, 1, '2018-10-06', '2018-10-13'),
	(2, 1, 1, '2018-10-05', '2018-10-12'),
	(3, 1, 1, '2018-10-05', '2018-10-12'),
	(4, 1, 1, '2018-10-04', '2018-10-11'),
	(5, 1, 1, '2018-10-04', '2018-10-11'),
	(6, 1, 2, '2018-10-06', '2018-10-13'),
	(7, 1, 2, '2018-10-06', '2018-10-13'),
	(8, 1, 2, '2018-10-05', '2018-10-12'),
	(9, 1, 2, '2018-10-05', '2018-10-12'),
	(10, 1, 2, '2018-10-04', '2018-10-11'),
	(11, 2, 3, '2018-10-06', '2018-10-13'),
	(12, 2, 3, '2018-10-05', '2018-10-12'),
	(13, 2, 3, '2018-10-05', '2018-10-12'),
	(14, 2, 3, '2018-10-04', '2018-10-11'),
	(15, 2, 3, '2018-10-04', '2018-10-11'),
	(16, 2, 4, '2018-10-06', '2018-10-13'),
	(17, 2, 4, '2018-10-06', '2018-10-13'),
	(18, 2, 4, '2018-10-04', '2018-10-11'),
	(19, 2, 4, '2018-10-04', '2018-10-11'),
	(20, 2, 4, '2018-10-03', '2018-10-10'),
	(1, 3, 5, '2018-10-03', '2018-10-10'),
	(2, 3, 5, '2018-10-03', '2018-10-10'),
	(3, 3, 5, '2018-10-02', '2018-10-09'),
	(4, 3, 5, '2018-10-02', '2018-10-09'),
	(5, 3, 5, '2018-10-01', '2018-10-08'),
	(6, 3, 6, '2018-10-04', '2018-10-11'),
	(7, 3, 6, '2018-10-04', '2018-10-11'),
	(8, 3, 6, '2018-10-03', '2018-10-10'),
	(9, 3, 6, '2018-10-03', '2018-10-10'),
	(10, 3, 6, '2018-10-06', '2018-10-13'),
	(11, 4, 7, '2018-10-06', '2018-10-13'),
	(12, 4, 7, '2018-10-06', '2018-10-13'),
	(13, 4, 7, '2018-10-05', '2018-10-12'),
	(14, 4, 7, '2018-10-05', '2018-10-12'),
	(15, 4, 7, '2018-10-04', '2018-10-11'),
	(16, 4, 5, '2018-10-06', '2018-10-13'),
	(17, 4, 3, '2018-10-06', '2018-10-13'),
	(18, 4, 2, '2018-10-03', '2018-10-10'),
	(19, 4, 1, '2018-10-03', '2018-10-10'),
	(20, 4, 6, '2018-10-01', '2018-10-08'),
	(1, 1, 2, '2018-10-05', '2018-10-12'),
	(2, 3, 2, '2018-10-05', '2018-10-12'),
	(3, 1, 4, '2018-10-03', '2018-10-10'),
	(4, 3, 4, '2018-10-03', '2018-10-10'),
	(5, 3, 4, '2018-10-01', '2018-10-08'),
	(6, 1, 1, '2018-10-01', '2018-10-08'),
	(7, 1, 1, '2018-10-01', '2018-10-08'),
	(8, 3, 1, '2018-09-29', '2018-10-06'),
	(9, 3, 3, '2018-09-29', '2018-10-06'),
	(10, 3, 1, '2018-09-29', '2018-10-06')
;

/* FINAL DRILL Q1 */

select 
	a2.book_title, a3.branch_name, a1.num_copies
	from tbl_copies a1
	inner join tbl_books a2 on a2.book_id = a1.book_id
	inner join tbl_branches a3 on a3.branch_id = a1.branch_id
	where branch_name = 'Sharpstown'
	AND
	book_title = 'The Lost Tribe'
;

/* FINAL DRILL Q2 */

select 
	a2.book_title, a3.branch_name, a1.num_copies
	from tbl_copies a1
	inner join tbl_books a2 on a2.book_id = a1.book_id
	inner join tbl_branches a3 on a3.branch_id = a1.branch_id
	where book_title = 'The Lost Tribe'
;

/* FINAL DRILL Q3 */

select 
	a2.borrower_name, a1.card_num, a1.date_due
	from tbl_loans a1
	right join tbl_borrower a2 on a2.card_num = a1.card_num
	where date_due IS NULL
;

/* FINAL DRILL Q4 */

SELECT
	a3.book_title, a2.borrower_name, a2.borrower_address
	from tbl_loans a1
	INNER JOIN tbl_borrower a2 on a2.card_num = a1.card_num
	INNER JOIN tbl_books a3 on a3.book_id = a1.book_id
	INNER JOIN tbl_branches a4 on a4.branch_id = a1.branch_id
	where branch_name = 'Sharpstown' and date_due = '2018-10-10'
;

/* FINAL DRILL Q5 */

SELECT 
	a1.branch_name, COUNT(a2.card_num) AS NumberOfLoans
	from tbl_branches a1
	INNER JOIN tbl_loans a2 on a2.branch_id = a1.branch_id
	GROUP BY branch_name
;

/* FINAL DRILL Q6 */

SELECT
	a1.borrower_name, a1.borrower_address, COUNT(a2.card_num) AS NumberOfLoans
	FROM tbl_borrower a1
	INNER JOIN tbl_loans a2 on a2.card_num = a1.card_num
	GROUP BY borrower_name, borrower_address
	HAVING COUNT(a2.card_num) > 5 
;

/* FINAL DRILL Q7 */

SELECT
	a3.book_title, a2.num_copies
	FROM tbl_branches a1
	INNER JOIN tbl_copies a2 on a2.branch_id = a1.branch_id
	INNER JOIN tbl_books a3 on a3.book_id = a2.book_id
	INNER JOIN tbl_authors a4 on a4.book_id = a3.book_id
	WHERE a4.auth_name = 'Stephen King' and a1.branch_name = 'Central'
;