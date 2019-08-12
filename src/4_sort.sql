.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab.so
create virtual table posts using fts5(title, content, tokenize='mecab');
insert into posts values('タイトルです', '本文です。');
insert into posts values('タイトなタイトルです', '本文章は本文です。');
insert into posts values('表題です', 'タイトな本文です。');

select * from posts('タイト*') order by rank;

-- 以下3つは同じ
SELECT * FROM posts WHERE posts MATCH 'タイト*' AND rank = 'bm25(1.0, 5.0)' ORDER BY rank;
SELECT * FROM posts WHERE posts = 'タイト*' AND rank = 'bm25(1.0, 5.0)' ORDER BY rank;
SELECT * FROM posts('タイト*', 'bm25(1.0, 5.0)') ORDER BY rank;

-- 列指定
SELECT * FROM posts WHERE posts MATCH 'content:タイト*' AND rank = 'bm25(1.0, 5.0)' ORDER BY rank;
SELECT * FROM posts WHERE posts = 'content:タイト*' AND rank = 'bm25(1.0, 5.0)' ORDER BY rank;
SELECT * FROM posts('content:タイト*', 'bm25(1.0, 5.0)') ORDER BY rank;

