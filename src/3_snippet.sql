.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab.so
create virtual table posts using fts5(title, content, tokenize='mecab');
insert into posts values('タイトルです', '本文です。');
insert into posts values('タイトなタイトルです', '本文章は本文です。');
insert into posts values('表題です', 'タイトな本文です。');

SELECT snippet(posts, 0, '<mark>', '</mark>', '', 1) FROM posts WHERE posts MATCH 'タイト*';
SELECT snippet(posts, 0, '<mark>', '</mark>', '', 2) FROM posts WHERE posts MATCH 'タイト*';

