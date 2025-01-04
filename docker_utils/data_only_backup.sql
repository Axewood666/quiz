--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Ubuntu 17.2-1.pgdg24.04+1)
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
fdda3c97181a
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
33	Sosal?
34	Как зовут главного героя аниме "Покемон"?
35	В каком аниме фигурируют титаны?
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
77	33	Da	t
78	33	Sosal	f
79	33	Konesh	f
80	34	Брок	f
81	34	Эш	t
82	34	Джеймс	f
83	35	Атака титанов	t
84	35	Мастера меча онлайн	f
85	35	Синий экзорцист	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, phone_number, first_name, last_name, password, is_user, is_admin, login, email) FROM stdin;
34	89179349242	Axewood	Axewood	$2b$12$dtgEKPEPuRdc2HhmVndZ6eSJ4XWbNpu5QnxkxuKzBt5netGn5Y16C	f	t	axewood	axewood@mail.ru
35	89179349243	Axewood	Axewood	$2b$12$LbHBcESeLh6QIQdj.0naiuB4oBEjGzAyTTXqCx0fqvNZfmFdLO36m	t	f	axewood1	axewood1@mail.ru
\.


--
-- Data for Name: useranswers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.useranswers (id, user_id, question_id) FROM stdin;
46	34	35
47	34	15
48	34	6
49	34	34
50	34	3
51	34	2
52	34	33
53	34	1
54	34	11
55	34	14
56	34	17
57	34	12
58	34	9
59	34	13
60	34	5
61	34	4
62	34	8
63	34	7
64	35	12
65	35	2
66	35	11
67	35	35
68	35	14
69	35	3
70	35	17
71	35	4
72	35	10
73	35	15
74	35	7
75	35	5
\.


--
-- Data for Name: userquizsessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userquizsessions (id, user_id, question_id, session_id, question_num) FROM stdin;
3071	35	33	eefd2be4-b706-4ffe-8e49-f302579d4e25	1
3072	35	6	eefd2be4-b706-4ffe-8e49-f302579d4e25	2
3073	35	8	eefd2be4-b706-4ffe-8e49-f302579d4e25	3
3074	35	1	eefd2be4-b706-4ffe-8e49-f302579d4e25	4
3075	35	13	eefd2be4-b706-4ffe-8e49-f302579d4e25	5
3076	35	9	eefd2be4-b706-4ffe-8e49-f302579d4e25	6
3077	35	34	eefd2be4-b706-4ffe-8e49-f302579d4e25	7
3084	34	10	0f676e65-0f52-4c41-85d2-54c1a2031a13	1
\.


--
-- Name: choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.choices_id_seq', 86, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 36, true);


--
-- Name: useranswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.useranswers_id_seq', 75, true);


--
-- Name: userquizsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userquizsessions_id_seq', 3084, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- PostgreSQL database dump complete
--

