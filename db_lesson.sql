Q1.

CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2.

ALTER TABLE people ADD department_id INT UNSIGNED AFTER email; 

Q3.

INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, department_id)
VALUES
('佐藤', 1),
('田中', 1),
('山口', 1),
('宮原', 2),
('上村', 2),
('須藤', 2),
('斎藤', 2),
('神田', 3),
('敷島', 4),
('常田', 5);

INSERT INTO reports (person_id, content)
VALUES
(7, '人生で一番だらだらできる時間にだらだらできる帰宅部が一番だ！'),
(8, '猫がソファの上で気持ちよさそうに寝ています。'),
(9, '新しいスマートフォンを買いに行きました。'),
(10, 'これからバーベキューを始めようかと思っています。'),
(11, '公園には子どもたちの笑い声が響いていました。'),
(12, '朝ごはんにパンと卵を食べました。'),
(13, 'その映画は感動的で涙が止まりませんでした。'),
(14, '道に迷ってしまって少し遅れてしまいました。'),

Q4.

SELECT * FROM people WHERE department_id IS NULL;

UPDATE people SET  department_id = 3 WHERE person_id = 1;
UPDATE people SET  department_id = 3 WHERE person_id = 2;
UPDATE people SET  department_id = 4 WHERE person_id = 3;
UPDATE people SET  department_id = 4 WHERE person_id = 4;
UPDATE people SET  department_id = 5 WHERE person_id = 5;
UPDATE people SET  department_id = 5 WHERE person_id = 6;

Q5.

SELECT name, age FROM people WHERE gender = 1 ORDER BY age ASC;

Q6.

`people`テーブルからレコードが作成された順番に男性だけのデータのカラム`name`,`email`,`age`を表示させる。

Q7.

SELECT name, age FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

Q8.

SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9.

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2;

Q10.

SELECT p.department_id, p.name, r.content FROM people p JOIN reports r USING (person_id);

Q11.

SELECT p.person_id, p.name FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE content IS NULL;
