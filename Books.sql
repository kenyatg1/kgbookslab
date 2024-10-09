------------------------Step 1. Create the Tables:


CREATE TABLE member (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    card_number VARCHAR(20)
);

CREATE TABLE book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    checked_out_by VARCHAR(100) NULL
);


------------------------Step 2. Add Rows to the member Table:


INSERT INTO member (name, card_number) VALUES
('Annabelle Aster', '772-93-110'),
('Boris Berceli', '000-00-000'),
('Carter Corbin', '282-09-382');


------------------------Step 3. Add Rows to the book Table:


INSERT INTO book (title, author, checked_out_by) VALUES
('In Search of Lost Time', 'Marcel Proust', 'Annabelle Aster'),
('Ulysses', 'James Joyce', 'Annabelle Aster'),
('Don Quixote', 'Miguel de Cervantes', 'Carter Corbin'),
('Moby Dick', 'Herman Melville', NULL);


------------------------Step 4. Update the Member with ID 2:

UPDATE member
SET card_number = '357-15-964'
WHERE id = 2;

------------------------Step 5. Remove the Member with ID 2:

DELETE FROM member
WHERE id = 2;

------------------------Step 6. Select All Members with Card Number 772-93-110:

SELECT * FROM member
WHERE card_number = '772-93-110';

------------------------Step 7. Select All Books Sorted by Title:

SELECT * FROM book
ORDER BY title;


------------------------Step 8. Annabelle Checked Out Moby Dick:


UPDATE book
SET checked_out_by = 'Annabelle Aster'
WHERE title = 'Moby Dick';


------------------------Step 9. Annabelle Turned in Ulysses:


UPDATE book
SET checked_out_by = NULL
WHERE title = 'Ulysses';


------------------------Step 10. JOIN to List All Books and Who They're Checked Out To:


SELECT b.title, b.author, b.checked_out_by
FROM book b;


------------------------Step 11. JOIN to List Titles of Books Checked Out by Annabelle Aster:


SELECT b.title
FROM book b
JOIN member m ON b.checked_out_by = m.name
WHERE m.name = 'Annabelle Aster';


------------------------Step 12. JOIN to List Name and Card Number of Members Who Checked Out Books by Herman Melville:


SELECT DISTINCT m.name, m.card_number
FROM member m
JOIN book b ON m.name = b.checked_out_by
WHERE b.author = 'Herman Melville';


INSERT INTO member (name, card_number) VALUES
('Dewi Djoyosuroto', '291-32-093'),
('Erika Espinoza', '332-94-212');

INSERT INTO book (title, author, checked_out_by_id) VALUES
('Anna Karenina', 'Leo Tolstoy', 4),
('Crime and Punishment', 'Fyodor Dostoevsky', NULL),
('Pride and Prejudice', 'Jane Austen', NULL),
('War and Peace', 'Leo Tolstoy', NULL),
('The Brothers Karamazov', 'Fyodor Dostoevsky', 1),
('Alice''s Adventures in Wonderland', 'Lewis Carroll', 3);

-------------------------Step 13. List Each Author with the Number of Books


SELECT author, COUNT(*) AS book_count
FROM book
GROUP BY author;


------------------------Step 14. Modify the Query to Include Only Authors with at Least Two Books


SELECT author, COUNT(*) AS book_count
FROM book
GROUP BY author
HAVING COUNT(*) >= 2;


------------------------Step 15. List Members with the Count of Books Checked Out (Including Those with No Books)


SELECT m.name, COUNT(b.title) AS books_checked_out
FROM member m
LEFT JOIN book b ON m.name = b.checked_out_by
GROUP BY m.name;


