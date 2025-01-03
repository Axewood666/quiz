--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Debian 14.15-1.pgdg120+1)
-- Dumped by pg_dump version 14.15 (Debian 14.15-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
97edcb57f00b
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, question) FROM stdin;
1	Какое настоящее имя известного персонажа Учиха Итати?
2	Как зовут капитана пиратов Соломенной Шляпы?
3	Какое прозвище у Эрена Йегера?
4	Что говорит Гоку перед трансформацией в суперсаяна?
5	Какое настоящее имя героя Альмайт?
6	Кто является капитаном пиратов Соломенной Шляпы в аниме One Piece?
7	Как называется техника, использующая чакру в виде сферы, в аниме Наруто?
8	Кого называют Алхимиком стали в аниме Fullmetal Alchemist?
9	Какой предмет ищет Гоку в Dragon Ball?
10	Кто является главным героем в аниме Death Note?
11	Какое имя истинного наследника трона Британии в аниме Code Geass?
12	Какое прозвище носит герой Йонко в аниме One Piece, использующий плод Gura Gura no Mi?
13	Что является источником силы Гонга Фрикса в аниме Hunter x Hunter?
14	Как зовут главного героя в аниме My Hero Academia, который наследует силу Все-Могущего?
15	Как называют скрытое сообщество в аниме Bleach, контролирующее порядок душ?
17	string
\.


--
-- Data for Name: choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.choices (id, question_id, choice, true_answer) FROM stdin;
3	1	Учиха Мадара	f
4	1	Учиха Саске	f
5	1	Учиха Обито	f
6	1	Учиха Итати	t
7	2	Ророноа Зоро	f
8	2	Винсмок Санджи	f
9	2	Монки Д. Луффи	t
10	2	Усопп	f
11	3	Бронированный Титан	f
12	3	Учитель	f
13	3	Титан-убийца	t
14	3	Звероподобный Титан	f
15	4	Каме-хамеха	f
16	4	Сила Саяна	f
17	4	Возвращение гнева	f
18	4	Кричит от ярости	t
19	5	Кацуки Бакуго	f
20	5	Идзуку Мидория	f
21	5	Тошинори Яги	t
22	5	Шото Тодороки	f
23	6	Монки Д. Луффи	t
24	6	Ророноа Зоро	f
25	6	Винсмок Санджи	f
26	6	Трафальгар Ло	f
27	7	Рассенган	t
28	7	Таскенжуцу	f
29	7	Чидори	f
30	7	Кагебуншин	f
31	8	Эдвард Элрик	t
32	8	Альфонс Элрик	f
33	8	Рой Мустанг	f
34	8	Маэс Хьюз	f
35	9	Драконьи жемчужины	t
36	9	Меч силы	f
37	9	Свиток мудрости	f
38	9	Кольцо времени	f
39	10	Лайт Ягами	t
40	10	Эл	f
41	10	Миса Амане	f
42	10	Рюк	f
43	11	Лелуш Ламперуж	t
44	11	Сузаку Куруруги	f
45	11	Шнайзель ел Британия	f
46	11	Юфемия ли Британия	f
47	12	Эдвард Ньюгейт (Белая Борода)	t
48	12	Шарлотта Линлин (Биг Мом)	f
49	12	Кайдо	f
50	12	Портгас Д. Эйс	f
51	13	Нен	t
52	13	Чакра	f
53	13	Ки	f
54	13	Банкай	f
55	14	Изуку Мидория	t
56	14	Кацуки Бакуго	f
57	14	Шото Тодороки	f
58	14	Теня Ида	f
59	15	Готей 13	t
60	15	Химерасантос	f
61	15	Шинигами	f
62	15	Северное Братство	f
64	17	string	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, phone_number, email, first_name, last_name, password, is_user, is_admin) FROM stdin;
1	axewood	89179341111	user@example.com	Igor	Zhug	$2b$12$sLXaGd0jqfuhWCx3ZVkfBelTvVdFFpizmHtGwbvt8yLqCFB3LGPwu	t	f
10	axewood1	string1	user1@example.com	string1	string1	$2b$12$KZ5r.6aJRqmpeIjPy//JGuo3eadr/R6xxea9wklQKkPqeUyEjpOku	f	t
11	qwe	89179342222	qwe@mail.ru	Игорь	Жугар	$2b$12$yjlGmgbqjCPHrBvp4/aSqujZOEwvtBitsTIEHxPiRmFRVabKq8EbK	t	f
12	qwe12	89179342221	qwe12@mail.ru	Игорь	Жугар	$2b$12$mJ5z6p3TaqxPY/bTHVzbq.FE9jF8knTxozxsa0XOyuYi3YHPCfpJq	t	f
13	qwe122	891793422211	qwe122@mail.ru	Игорь	Жугар	$2b$12$6lnc8IQhmfK9JquyN2.DPutkXtq1ZMQu6q4RRyEVAeXa.JrS8iGw2	t	f
14	qwe1223	8917934222112	qwe1232@mail.ru	Игорь	Жугар	$2b$12$E1S3DlpOt2omWdt8KNj7XO7TfLBYtqvl81L6tFZoACZp0NwKq8izC	t	f
15	test_user	89179349211	testuser@mail.ru	Lala	Blabla	$2b$12$HNvPf2xWG0Gf9bXy/Go9JeLi7eokhYzlGIfVo/UHUCCYrME5CnOJS	t	f
\.


--
-- Data for Name: userquizsessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userquizsessions (id, user_id, question_id, session_id, question_num) FROM stdin;
1156	11	12	56464ee2-582c-44c9-bbfe-f59a6bfddd28	1
1157	11	4	56464ee2-582c-44c9-bbfe-f59a6bfddd28	2
1158	11	6	56464ee2-582c-44c9-bbfe-f59a6bfddd28	3
1159	11	1	56464ee2-582c-44c9-bbfe-f59a6bfddd28	4
1160	11	15	56464ee2-582c-44c9-bbfe-f59a6bfddd28	5
1161	11	14	56464ee2-582c-44c9-bbfe-f59a6bfddd28	6
1162	11	13	56464ee2-582c-44c9-bbfe-f59a6bfddd28	7
1163	11	11	56464ee2-582c-44c9-bbfe-f59a6bfddd28	8
1164	11	3	56464ee2-582c-44c9-bbfe-f59a6bfddd28	9
1165	11	7	56464ee2-582c-44c9-bbfe-f59a6bfddd28	10
\.


--
-- Name: choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.choices_id_seq', 64, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 17, true);


--
-- Name: userquizsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userquizsessions_id_seq', 1165, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- PostgreSQL database dump complete
--

