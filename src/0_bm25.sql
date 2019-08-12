.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab.so
create virtual table posts using fts5(title, content, tokenize='mecab');
insert into posts values('タイトルです', '本文です。');
insert into posts values('タイトなタイトルです', '本文章は本文です。');

select * from posts where posts match 'タイト*' order by bm25(posts);
select * from posts where posts match 'タイト*';

insert into posts values('表題です', 'タイトな本文です。');
select * from posts where posts match 'タイト*' order by bm25(posts, 2.0, 9.0);
select * from posts where posts match 'タイト*' order by bm25(posts);
select * from posts where posts match 'タイト*';

