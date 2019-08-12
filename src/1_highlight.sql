.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab.so
create virtual table posts using fts5(title, content, tokenize='mecab');
insert into posts values('タイトルです', '本文です。');
insert into posts values('タイトなタイトルです', '本文章は本文です。');
insert into posts values('表題です', 'タイトな本文です。');

select highlight(posts, 0, '<mark>', '</mark>') from posts where posts match 'タイト*';
select 
    highlight(posts, 0, '<mark>', '</mark>'), 
    highlight(posts, 1, '<mark>', '</mark>') 
from posts where posts match 'タイト*';

CREATE VIRTUAL TABLE ft USING fts5(a);
INSERT INTO ft VALUES('a b c x c d e');
INSERT INTO ft VALUES('a b c c d e');
INSERT INTO ft VALUES('a b c d e');
SELECT highlight(ft, 0, '[', ']') FROM ft WHERE ft MATCH 'a+b+c AND c+d+e';

