Q1.

CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


SELECT * FROM departments;

Q2.⭐️

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


⭐️
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

Q4.⭐️

SELECT * FROM people WHERE department_id IS NULL;

UPDATE people SET  department_id = 3 WHERE person_id = 1;
UPDATE people SET  department_id = 3 WHERE person_id = 2;
UPDATE people SET  department_id = 4 WHERE person_id = 3;
UPDATE people SET  department_id = 4 WHERE person_id = 4;
UPDATE people SET  department_id = 5 WHERE person_id = 5;
UPDATE people SET  department_id = 5 WHERE person_id = 6;

Q5.

SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6.

`people`テーブルからレコードが作成された順番に男性だけのデータのカラム`name`,`email`,`age`を表示させる。

Q7.

SELECT name, age FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;

Q8.

SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9.⭐️

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2;

Q10.⭐️

SELECT d.name, p.name, r.content FROM people AS p RIGHT OUTER JOIN reports AS r ON p.person_id = r.person_id RIGHT OUTER JOIN departments AS d ON p.department_id = d.department_id;

Q11.⭐️

SELECT p.person_id, p.name FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE content IS NULL;


-宿題の回答-

Q1.なぜPRIMARY KEYを使用するのか
→レコードを特定するための値であり、データの重複を許さないためデータの整合性が保たれるから。

Q4.person_idが4,5,6のdepartment_idを1に一つのクエリでまとめる
→UPDATE people SET department_id = 1 WHERE person_id IN (4,5,6);

Q10.クエリの改善・外部結合から内部結合を使用してデータを取得する
→SELECT d.name, p.name, r.content FROM people AS p INNER JOIN reports AS r ON p.person_id = r.person_id INNER JOIN departments AS d ON p.department_id = d.department_id;

Q11.ONとUSINGの違いを調べる
→USINGは同じカラム名を持つテーブルを完結で可読性が高く結合でき、ONは任意の条件で異なるカラムや複数条件で結合が可能。