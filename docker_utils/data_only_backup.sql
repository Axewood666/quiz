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
dbd9176e0e38
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
33	Sosal?
34	Как зовут главного героя аниме "Покемон"?
35	В каком аниме фигурируют титаны?
47	Какое аниме рассказывает о волейбольной команде старшей школы Карасуно?
48	Как называется аниме, где главный герой хочет стать Хокаге?
49	В каком аниме главный герой использует тетрадь смерти?
50	Какое аниме рассказывает о приключениях пиратов в поисках легендарного сокровища?
51	В каком аниме главный герой может превращаться в гигантского человекоподобного монстра?
55	Какое аниме рассказывает о девушке, которая может видеть связующие людей нити судьбы?
56	В каком аниме главный герой является полудемоном и владеет мечом, разрушающим демонов?
57	Какое аниме рассказывает о школьнике, который может управлять гравитацией?
58	В каком аниме главная героиня является полуяпонкой и полуангличанкой и работает горничной в богатом поместье?
59	Какое аниме рассказывает о группе друзей, которые создают собственную компанию по разработке видеоигр?
60	Какое аниме рассказывает о девушке, которая может видеть линии жизни людей?
67	Какое аниме рассказывает о девушке, которая может путешествовать между реальным миром и миром духов?
68	В каком аниме главный герой является членом элитного отряда по борьбе с вампирами?
69	Какое аниме рассказывает о людях, выживающих в постапокалиптическом мире, населённом гигантскими насекомыми?
70	В каком аниме главная героиня работает в индустрии аниме и сталкивается с трудностями создания аниме-сериалов?
71	Какое аниме рассказывает о мальчике, который может превращаться в девочку-волшебницу?
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
77	33	Da	t
78	33	Sosal	f
79	33	Konesh	f
80	34	Брок	f
81	34	Эш	t
82	34	Джеймс	f
83	35	Атака титанов	t
84	35	Мастера меча онлайн	f
85	35	Синий экзорцист	f
105	47	Haikyuu!!	t
106	47	Kuroko no Basuke	f
107	47	Free!	f
108	47	Yuri!!! on Ice	f
109	48	One Piece	f
110	48	Naruto	t
111	48	Bleach	f
112	48	Dragon Ball	f
113	49	Death Note	t
114	49	Code Geass	f
115	49	Mirai Nikki	f
116	49	Death Parade	f
117	50	Naruto	f
118	50	Fairy Tail	f
119	50	One Piece	t
120	50	Black Clover	f
121	51	Tokyo Ghoul	f
122	51	Attack on Titan	t
123	51	Parasyte	f
124	51	Boku no Hero Academia	f
125	55	Kimi no Na wa	f
126	55	Ao Haru Ride	f
127	55	Kimi no Suizou wo Tabetai	f
128	55	Koi wa Ameagari no You ni	t
129	56	Demon Slayer: Kimetsu no Yaiba	t
130	56	Noragami	f
131	56	Blue Exorcist	f
132	56	Inuyasha	f
133	57	Charlotte	f
134	57	Mob Psycho 100	f
135	57	The Disastrous Life of Saiki K.	f
136	57	Kiseijuu: Sei no Kakuritsu	t
137	58	Kaichou wa Maid-sama!	f
138	58	Violet Evergarden	f
139	58	Emma: A Victorian Romance	t
140	58	Akagami no Shirayuki-hime	f
141	59	New Game!	t
142	59	Shirobako	f
143	59	Bakuman	f
144	59	Saenai Heroine no Sodatekata	f
145	60	Иная	f
146	60	Токийский гуль	f
147	60	Проект воспитания девочек-волшебниц	t
148	60	Когда плачут цикады	f
149	67	Унесённые призраками	t
150	67	Мастер муси	f
151	67	Тетрадь дружбы Нацумэ	f
152	67	Невиданный цветок	f
153	68	Тёмный дворецкий	f
154	68	Ванпанчмен	f
155	68	Рыцарь-вампир	f
156	68	Проект воспитания девочек-волшебниц	t
157	69	Атака титанов	f
158	69	Кабанэри железной крепости	f
159	69	Семь смертных грехов	f
160	69	Рыцари Сидонии	t
161	70	Дотянуться до тебя	f
162	70	Белый альбом	f
163	70	Гармония	f
164	70	Ширабако	t
165	71	Фейри Тейл	f
166	71	Мадока	f
167	71	Забавы богов	t
168	71	Индекс волшебства	f
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
3086	34	10	0d8177fa-5109-46b1-aa5d-0d9960b85c57	2
\.


--
-- Name: choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.choices_id_seq', 168, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 71, true);


--
-- Name: useranswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.useranswers_id_seq', 75, true);


--
-- Name: userquizsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userquizsessions_id_seq', 3086, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- PostgreSQL database dump complete
--

