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
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: yourusername
--

COPY public.alembic_version (version_num) FROM stdin;
97edcb57f00b
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: yourusername
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
-- Data for Name: choices; Type: TABLE DATA; Schema: public; Owner: yourusername
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: yourusername
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
-- Data for Name: userquizsessions; Type: TABLE DATA; Schema: public; Owner: yourusername
--

COPY public.userquizsessions (id, user_id, question_id, session_id, question_num) FROM stdin;
586	10	8	6ef19209-f3a4-4403-a431-05960440928f	1
587	10	5	6ef19209-f3a4-4403-a431-05960440928f	2
588	10	7	6ef19209-f3a4-4403-a431-05960440928f	3
589	10	10	6ef19209-f3a4-4403-a431-05960440928f	4
590	10	15	6ef19209-f3a4-4403-a431-05960440928f	5
591	10	2	6ef19209-f3a4-4403-a431-05960440928f	6
592	10	13	6ef19209-f3a4-4403-a431-05960440928f	7
593	10	6	6ef19209-f3a4-4403-a431-05960440928f	8
594	10	9	6ef19209-f3a4-4403-a431-05960440928f	9
595	10	17	6ef19209-f3a4-4403-a431-05960440928f	10
596	10	4	e555c7db-7901-449a-9836-330307494f07	1
597	10	13	e555c7db-7901-449a-9836-330307494f07	2
598	10	10	e555c7db-7901-449a-9836-330307494f07	3
599	10	2	e555c7db-7901-449a-9836-330307494f07	4
600	10	7	e555c7db-7901-449a-9836-330307494f07	5
601	10	6	e555c7db-7901-449a-9836-330307494f07	6
602	10	11	e555c7db-7901-449a-9836-330307494f07	7
603	10	17	e555c7db-7901-449a-9836-330307494f07	8
604	10	9	e555c7db-7901-449a-9836-330307494f07	9
605	10	12	e555c7db-7901-449a-9836-330307494f07	10
606	10	14	c6514d24-a99b-40ff-a75c-0c47628ab4c3	1
607	10	5	c6514d24-a99b-40ff-a75c-0c47628ab4c3	2
608	10	11	c6514d24-a99b-40ff-a75c-0c47628ab4c3	3
609	10	10	c6514d24-a99b-40ff-a75c-0c47628ab4c3	4
610	10	9	c6514d24-a99b-40ff-a75c-0c47628ab4c3	5
611	10	1	c6514d24-a99b-40ff-a75c-0c47628ab4c3	6
612	10	8	c6514d24-a99b-40ff-a75c-0c47628ab4c3	7
613	10	13	c6514d24-a99b-40ff-a75c-0c47628ab4c3	8
614	10	2	c6514d24-a99b-40ff-a75c-0c47628ab4c3	9
615	10	6	c6514d24-a99b-40ff-a75c-0c47628ab4c3	10
616	10	15	898b4cba-e952-4acb-83b2-0d6af0d6cb89	1
617	10	10	898b4cba-e952-4acb-83b2-0d6af0d6cb89	2
618	10	5	898b4cba-e952-4acb-83b2-0d6af0d6cb89	3
619	10	3	898b4cba-e952-4acb-83b2-0d6af0d6cb89	4
620	10	17	898b4cba-e952-4acb-83b2-0d6af0d6cb89	5
621	10	14	898b4cba-e952-4acb-83b2-0d6af0d6cb89	6
622	10	7	898b4cba-e952-4acb-83b2-0d6af0d6cb89	7
623	10	6	898b4cba-e952-4acb-83b2-0d6af0d6cb89	8
624	10	1	898b4cba-e952-4acb-83b2-0d6af0d6cb89	9
625	10	9	898b4cba-e952-4acb-83b2-0d6af0d6cb89	10
626	10	8	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	1
627	10	9	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	2
628	10	12	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	3
629	10	1	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	4
630	10	15	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	5
631	10	3	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	6
632	10	6	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	7
633	10	11	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	8
634	10	10	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	9
635	10	13	220356dd-c1f7-4c6e-a908-5cd3d8a1fc7c	10
636	10	2	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	1
637	10	1	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	2
638	10	12	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	3
639	10	8	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	4
640	10	13	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	5
641	10	14	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	6
642	10	10	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	7
643	10	7	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	8
644	10	3	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	9
645	10	4	eb2081a4-f8bd-4ff6-afcf-d841b300b37d	10
646	10	14	a0448032-3771-43b6-a988-fae6a4e07cfe	1
647	10	3	a0448032-3771-43b6-a988-fae6a4e07cfe	2
648	10	2	a0448032-3771-43b6-a988-fae6a4e07cfe	3
649	10	1	a0448032-3771-43b6-a988-fae6a4e07cfe	4
650	10	11	a0448032-3771-43b6-a988-fae6a4e07cfe	5
651	10	6	a0448032-3771-43b6-a988-fae6a4e07cfe	6
652	10	4	a0448032-3771-43b6-a988-fae6a4e07cfe	7
653	10	15	a0448032-3771-43b6-a988-fae6a4e07cfe	8
654	10	17	a0448032-3771-43b6-a988-fae6a4e07cfe	9
655	10	7	a0448032-3771-43b6-a988-fae6a4e07cfe	10
656	10	15	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	1
657	10	14	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	2
658	10	1	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	3
659	10	8	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	4
660	10	5	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	5
661	10	4	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	6
662	10	11	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	7
663	10	12	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	8
664	10	9	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	9
665	10	10	3fd9cbd2-1794-4ea2-9383-2755fd9472a3	10
666	10	6	508023c3-6538-41ea-b2e0-f4181486b3dd	1
667	10	9	508023c3-6538-41ea-b2e0-f4181486b3dd	2
668	10	10	508023c3-6538-41ea-b2e0-f4181486b3dd	3
669	10	13	508023c3-6538-41ea-b2e0-f4181486b3dd	4
670	10	12	508023c3-6538-41ea-b2e0-f4181486b3dd	5
671	10	14	508023c3-6538-41ea-b2e0-f4181486b3dd	6
672	10	1	508023c3-6538-41ea-b2e0-f4181486b3dd	7
673	10	8	508023c3-6538-41ea-b2e0-f4181486b3dd	8
674	10	2	508023c3-6538-41ea-b2e0-f4181486b3dd	9
675	10	7	508023c3-6538-41ea-b2e0-f4181486b3dd	10
676	10	5	8b2b96ad-da61-4315-b337-3fa58f2fe27e	1
677	10	2	8b2b96ad-da61-4315-b337-3fa58f2fe27e	2
678	10	11	8b2b96ad-da61-4315-b337-3fa58f2fe27e	3
679	10	10	8b2b96ad-da61-4315-b337-3fa58f2fe27e	4
680	10	1	8b2b96ad-da61-4315-b337-3fa58f2fe27e	5
681	10	4	8b2b96ad-da61-4315-b337-3fa58f2fe27e	6
682	10	17	8b2b96ad-da61-4315-b337-3fa58f2fe27e	7
683	10	8	8b2b96ad-da61-4315-b337-3fa58f2fe27e	8
684	10	7	8b2b96ad-da61-4315-b337-3fa58f2fe27e	9
685	10	9	8b2b96ad-da61-4315-b337-3fa58f2fe27e	10
696	10	2	1177f838-be1b-4e7f-9dd4-f112710d82d9	1
697	10	4	1177f838-be1b-4e7f-9dd4-f112710d82d9	2
698	10	17	1177f838-be1b-4e7f-9dd4-f112710d82d9	3
699	10	13	1177f838-be1b-4e7f-9dd4-f112710d82d9	4
700	10	14	1177f838-be1b-4e7f-9dd4-f112710d82d9	5
701	10	6	1177f838-be1b-4e7f-9dd4-f112710d82d9	6
702	10	5	1177f838-be1b-4e7f-9dd4-f112710d82d9	7
703	10	3	1177f838-be1b-4e7f-9dd4-f112710d82d9	8
704	10	15	1177f838-be1b-4e7f-9dd4-f112710d82d9	9
705	10	12	1177f838-be1b-4e7f-9dd4-f112710d82d9	10
716	10	4	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	1
717	10	15	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	2
718	10	6	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	3
719	10	17	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	4
720	10	11	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	5
721	10	1	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	6
722	10	3	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	7
723	10	9	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	8
724	10	2	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	9
725	10	8	4ac36992-3591-4b8c-b9e1-f5557fe4dc12	10
736	10	12	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	1
737	10	7	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	2
738	10	14	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	3
739	10	9	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	4
740	10	3	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	5
741	10	2	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	6
742	10	17	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	7
743	10	4	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	8
744	10	11	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	9
745	10	6	fe168dc4-cb2c-4471-85e8-bedeb1f48fae	10
756	10	10	09278a3b-d2f0-4adf-8a61-177c818b196d	1
757	10	14	09278a3b-d2f0-4adf-8a61-177c818b196d	2
758	10	2	09278a3b-d2f0-4adf-8a61-177c818b196d	3
759	10	5	09278a3b-d2f0-4adf-8a61-177c818b196d	4
760	10	15	09278a3b-d2f0-4adf-8a61-177c818b196d	5
761	10	4	09278a3b-d2f0-4adf-8a61-177c818b196d	6
762	10	6	09278a3b-d2f0-4adf-8a61-177c818b196d	7
763	10	3	09278a3b-d2f0-4adf-8a61-177c818b196d	8
764	10	1	09278a3b-d2f0-4adf-8a61-177c818b196d	9
765	10	11	09278a3b-d2f0-4adf-8a61-177c818b196d	10
686	10	4	692fe3f5-373e-4ba9-a018-fd502c69e4fc	1
687	10	17	692fe3f5-373e-4ba9-a018-fd502c69e4fc	2
688	10	13	692fe3f5-373e-4ba9-a018-fd502c69e4fc	3
689	10	3	692fe3f5-373e-4ba9-a018-fd502c69e4fc	4
690	10	12	692fe3f5-373e-4ba9-a018-fd502c69e4fc	5
691	10	1	692fe3f5-373e-4ba9-a018-fd502c69e4fc	6
692	10	11	692fe3f5-373e-4ba9-a018-fd502c69e4fc	7
693	10	9	692fe3f5-373e-4ba9-a018-fd502c69e4fc	8
694	10	6	692fe3f5-373e-4ba9-a018-fd502c69e4fc	9
695	10	14	692fe3f5-373e-4ba9-a018-fd502c69e4fc	10
706	10	15	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	1
707	10	2	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	2
708	10	9	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	3
709	10	11	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	4
710	10	10	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	5
711	10	7	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	6
712	10	13	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	7
713	10	6	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	8
714	10	8	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	9
715	10	4	05be3bc0-7bb0-4600-bcbc-8d8c1b778132	10
726	10	12	0641ae40-367f-40ad-9e4f-8819723a30d5	1
727	10	11	0641ae40-367f-40ad-9e4f-8819723a30d5	2
728	10	8	0641ae40-367f-40ad-9e4f-8819723a30d5	3
729	10	14	0641ae40-367f-40ad-9e4f-8819723a30d5	4
730	10	13	0641ae40-367f-40ad-9e4f-8819723a30d5	5
731	10	10	0641ae40-367f-40ad-9e4f-8819723a30d5	6
732	10	3	0641ae40-367f-40ad-9e4f-8819723a30d5	7
733	10	4	0641ae40-367f-40ad-9e4f-8819723a30d5	8
734	10	2	0641ae40-367f-40ad-9e4f-8819723a30d5	9
735	10	7	0641ae40-367f-40ad-9e4f-8819723a30d5	10
746	10	15	20acddc1-e6a2-4487-9193-afb312b6a3e0	1
747	10	4	20acddc1-e6a2-4487-9193-afb312b6a3e0	2
748	10	10	20acddc1-e6a2-4487-9193-afb312b6a3e0	3
749	10	7	20acddc1-e6a2-4487-9193-afb312b6a3e0	4
750	10	17	20acddc1-e6a2-4487-9193-afb312b6a3e0	5
751	10	2	20acddc1-e6a2-4487-9193-afb312b6a3e0	6
752	10	6	20acddc1-e6a2-4487-9193-afb312b6a3e0	7
753	10	11	20acddc1-e6a2-4487-9193-afb312b6a3e0	8
754	10	3	20acddc1-e6a2-4487-9193-afb312b6a3e0	9
755	10	5	20acddc1-e6a2-4487-9193-afb312b6a3e0	10
766	10	12	cd9f8c6f-4512-4c06-a0cd-241399012eef	1
767	10	6	cd9f8c6f-4512-4c06-a0cd-241399012eef	2
768	10	2	cd9f8c6f-4512-4c06-a0cd-241399012eef	3
769	10	4	cd9f8c6f-4512-4c06-a0cd-241399012eef	4
770	10	17	cd9f8c6f-4512-4c06-a0cd-241399012eef	5
771	10	11	cd9f8c6f-4512-4c06-a0cd-241399012eef	6
772	10	8	cd9f8c6f-4512-4c06-a0cd-241399012eef	7
773	10	7	cd9f8c6f-4512-4c06-a0cd-241399012eef	8
774	10	9	cd9f8c6f-4512-4c06-a0cd-241399012eef	9
775	10	13	cd9f8c6f-4512-4c06-a0cd-241399012eef	10
776	10	2	b1c10788-641f-4a91-9ce5-e0ae03e678e2	1
777	10	14	b1c10788-641f-4a91-9ce5-e0ae03e678e2	2
778	10	15	b1c10788-641f-4a91-9ce5-e0ae03e678e2	3
779	10	11	b1c10788-641f-4a91-9ce5-e0ae03e678e2	4
780	10	1	b1c10788-641f-4a91-9ce5-e0ae03e678e2	5
781	10	12	b1c10788-641f-4a91-9ce5-e0ae03e678e2	6
782	10	3	b1c10788-641f-4a91-9ce5-e0ae03e678e2	7
783	10	4	b1c10788-641f-4a91-9ce5-e0ae03e678e2	8
784	10	17	b1c10788-641f-4a91-9ce5-e0ae03e678e2	9
785	10	5	b1c10788-641f-4a91-9ce5-e0ae03e678e2	10
786	10	7	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	1
787	10	13	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	2
788	10	14	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	3
789	10	17	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	4
790	10	2	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	5
791	10	9	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	6
792	10	1	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	7
793	10	5	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	8
794	10	12	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	9
795	10	11	9450f3a7-5ee4-4f4c-bf49-ea5124e713a2	10
796	10	15	06ae75a6-7437-4ea2-9488-d4767a656fee	1
797	10	4	06ae75a6-7437-4ea2-9488-d4767a656fee	2
798	10	7	06ae75a6-7437-4ea2-9488-d4767a656fee	3
799	10	3	06ae75a6-7437-4ea2-9488-d4767a656fee	4
800	10	17	06ae75a6-7437-4ea2-9488-d4767a656fee	5
801	10	1	06ae75a6-7437-4ea2-9488-d4767a656fee	6
802	10	14	06ae75a6-7437-4ea2-9488-d4767a656fee	7
803	10	10	06ae75a6-7437-4ea2-9488-d4767a656fee	8
804	10	6	06ae75a6-7437-4ea2-9488-d4767a656fee	9
805	10	2	06ae75a6-7437-4ea2-9488-d4767a656fee	10
806	10	17	9c31c44d-6b1a-42f1-8015-f352b6e8a377	1
807	10	2	9c31c44d-6b1a-42f1-8015-f352b6e8a377	2
808	10	10	9c31c44d-6b1a-42f1-8015-f352b6e8a377	3
809	10	5	9c31c44d-6b1a-42f1-8015-f352b6e8a377	4
810	10	11	9c31c44d-6b1a-42f1-8015-f352b6e8a377	5
811	10	9	9c31c44d-6b1a-42f1-8015-f352b6e8a377	6
812	10	7	9c31c44d-6b1a-42f1-8015-f352b6e8a377	7
813	10	1	9c31c44d-6b1a-42f1-8015-f352b6e8a377	8
814	10	8	9c31c44d-6b1a-42f1-8015-f352b6e8a377	9
815	10	12	9c31c44d-6b1a-42f1-8015-f352b6e8a377	10
816	10	11	d5c5f01c-d2ee-417e-b2a7-1274234475c0	1
817	10	5	d5c5f01c-d2ee-417e-b2a7-1274234475c0	2
818	10	10	d5c5f01c-d2ee-417e-b2a7-1274234475c0	3
819	10	9	d5c5f01c-d2ee-417e-b2a7-1274234475c0	4
820	10	13	d5c5f01c-d2ee-417e-b2a7-1274234475c0	5
821	10	1	d5c5f01c-d2ee-417e-b2a7-1274234475c0	6
822	10	14	d5c5f01c-d2ee-417e-b2a7-1274234475c0	7
823	10	3	d5c5f01c-d2ee-417e-b2a7-1274234475c0	8
824	10	8	d5c5f01c-d2ee-417e-b2a7-1274234475c0	9
825	10	17	d5c5f01c-d2ee-417e-b2a7-1274234475c0	10
826	10	2	3ecd75a1-1dc5-469f-a446-49798e2b51a0	1
827	10	8	3ecd75a1-1dc5-469f-a446-49798e2b51a0	2
828	10	13	3ecd75a1-1dc5-469f-a446-49798e2b51a0	3
829	10	10	3ecd75a1-1dc5-469f-a446-49798e2b51a0	4
830	10	12	3ecd75a1-1dc5-469f-a446-49798e2b51a0	5
831	10	11	3ecd75a1-1dc5-469f-a446-49798e2b51a0	6
832	10	5	3ecd75a1-1dc5-469f-a446-49798e2b51a0	7
833	10	6	3ecd75a1-1dc5-469f-a446-49798e2b51a0	8
834	10	4	3ecd75a1-1dc5-469f-a446-49798e2b51a0	9
835	10	7	3ecd75a1-1dc5-469f-a446-49798e2b51a0	10
836	10	17	d3e27621-5a7f-469f-8044-b8803a3843ec	1
837	10	1	d3e27621-5a7f-469f-8044-b8803a3843ec	2
838	10	3	d3e27621-5a7f-469f-8044-b8803a3843ec	3
839	10	4	d3e27621-5a7f-469f-8044-b8803a3843ec	4
840	10	5	d3e27621-5a7f-469f-8044-b8803a3843ec	5
841	10	9	d3e27621-5a7f-469f-8044-b8803a3843ec	6
842	10	13	d3e27621-5a7f-469f-8044-b8803a3843ec	7
843	10	15	d3e27621-5a7f-469f-8044-b8803a3843ec	8
844	10	11	d3e27621-5a7f-469f-8044-b8803a3843ec	9
845	10	12	d3e27621-5a7f-469f-8044-b8803a3843ec	10
846	10	6	f3108243-7e7f-4e7c-a416-059c7c63a2f7	1
847	10	8	f3108243-7e7f-4e7c-a416-059c7c63a2f7	2
848	10	4	f3108243-7e7f-4e7c-a416-059c7c63a2f7	3
849	10	7	f3108243-7e7f-4e7c-a416-059c7c63a2f7	4
850	10	1	f3108243-7e7f-4e7c-a416-059c7c63a2f7	5
851	10	15	f3108243-7e7f-4e7c-a416-059c7c63a2f7	6
852	10	12	f3108243-7e7f-4e7c-a416-059c7c63a2f7	7
853	10	10	f3108243-7e7f-4e7c-a416-059c7c63a2f7	8
854	10	2	f3108243-7e7f-4e7c-a416-059c7c63a2f7	9
855	10	14	f3108243-7e7f-4e7c-a416-059c7c63a2f7	10
856	10	17	89e80951-74d2-4909-ae9f-b753e52579c3	1
857	10	14	89e80951-74d2-4909-ae9f-b753e52579c3	2
858	10	8	89e80951-74d2-4909-ae9f-b753e52579c3	3
859	10	3	89e80951-74d2-4909-ae9f-b753e52579c3	4
860	10	11	89e80951-74d2-4909-ae9f-b753e52579c3	5
861	10	6	89e80951-74d2-4909-ae9f-b753e52579c3	6
862	10	15	89e80951-74d2-4909-ae9f-b753e52579c3	7
863	10	10	89e80951-74d2-4909-ae9f-b753e52579c3	8
864	10	5	89e80951-74d2-4909-ae9f-b753e52579c3	9
865	10	1	89e80951-74d2-4909-ae9f-b753e52579c3	10
866	10	8	1548a878-3bd4-40e4-88e4-3b4adcb26f18	1
867	10	2	1548a878-3bd4-40e4-88e4-3b4adcb26f18	2
868	10	14	1548a878-3bd4-40e4-88e4-3b4adcb26f18	3
869	10	4	1548a878-3bd4-40e4-88e4-3b4adcb26f18	4
870	10	11	1548a878-3bd4-40e4-88e4-3b4adcb26f18	5
871	10	7	1548a878-3bd4-40e4-88e4-3b4adcb26f18	6
872	10	5	1548a878-3bd4-40e4-88e4-3b4adcb26f18	7
873	10	15	1548a878-3bd4-40e4-88e4-3b4adcb26f18	8
874	10	3	1548a878-3bd4-40e4-88e4-3b4adcb26f18	9
875	10	1	1548a878-3bd4-40e4-88e4-3b4adcb26f18	10
876	10	3	16bfd273-dec2-4759-941a-f10ee7f02127	1
877	10	6	16bfd273-dec2-4759-941a-f10ee7f02127	2
878	10	5	16bfd273-dec2-4759-941a-f10ee7f02127	3
879	10	2	16bfd273-dec2-4759-941a-f10ee7f02127	4
880	10	14	16bfd273-dec2-4759-941a-f10ee7f02127	5
881	10	12	16bfd273-dec2-4759-941a-f10ee7f02127	6
882	10	10	16bfd273-dec2-4759-941a-f10ee7f02127	7
883	10	11	16bfd273-dec2-4759-941a-f10ee7f02127	8
884	10	17	16bfd273-dec2-4759-941a-f10ee7f02127	9
885	10	1	16bfd273-dec2-4759-941a-f10ee7f02127	10
886	10	4	85647961-9427-4dff-a362-b64e542382fd	1
887	10	2	85647961-9427-4dff-a362-b64e542382fd	2
888	10	5	85647961-9427-4dff-a362-b64e542382fd	3
889	10	3	85647961-9427-4dff-a362-b64e542382fd	4
890	10	9	85647961-9427-4dff-a362-b64e542382fd	5
891	10	8	85647961-9427-4dff-a362-b64e542382fd	6
892	10	6	85647961-9427-4dff-a362-b64e542382fd	7
893	10	1	85647961-9427-4dff-a362-b64e542382fd	8
894	10	11	85647961-9427-4dff-a362-b64e542382fd	9
895	10	12	85647961-9427-4dff-a362-b64e542382fd	10
896	10	4	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	1
897	10	17	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	2
898	10	2	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	3
899	10	14	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	4
900	10	9	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	5
901	10	5	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	6
902	10	6	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	7
903	10	1	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	8
904	10	3	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	9
905	10	12	cc874efb-5e64-4f9a-bcc5-9b4754d816a2	10
906	10	1	2d277587-5706-4678-9457-98c236e8db39	1
907	10	7	2d277587-5706-4678-9457-98c236e8db39	2
908	10	14	2d277587-5706-4678-9457-98c236e8db39	3
909	10	3	2d277587-5706-4678-9457-98c236e8db39	4
910	10	9	2d277587-5706-4678-9457-98c236e8db39	5
911	10	17	2d277587-5706-4678-9457-98c236e8db39	6
912	10	15	2d277587-5706-4678-9457-98c236e8db39	7
913	10	11	2d277587-5706-4678-9457-98c236e8db39	8
914	10	6	2d277587-5706-4678-9457-98c236e8db39	9
915	10	2	2d277587-5706-4678-9457-98c236e8db39	10
916	10	7	694fc3d2-25cf-4b5d-bb01-696b796edcb1	1
917	10	15	694fc3d2-25cf-4b5d-bb01-696b796edcb1	2
918	10	6	694fc3d2-25cf-4b5d-bb01-696b796edcb1	3
919	10	5	694fc3d2-25cf-4b5d-bb01-696b796edcb1	4
920	10	8	694fc3d2-25cf-4b5d-bb01-696b796edcb1	5
921	10	9	694fc3d2-25cf-4b5d-bb01-696b796edcb1	6
922	10	12	694fc3d2-25cf-4b5d-bb01-696b796edcb1	7
923	10	10	694fc3d2-25cf-4b5d-bb01-696b796edcb1	8
924	10	1	694fc3d2-25cf-4b5d-bb01-696b796edcb1	9
925	10	2	694fc3d2-25cf-4b5d-bb01-696b796edcb1	10
926	10	7	84acf6ef-3010-49b8-b31d-712d98375769	1
927	10	13	84acf6ef-3010-49b8-b31d-712d98375769	2
928	10	17	84acf6ef-3010-49b8-b31d-712d98375769	3
929	10	2	84acf6ef-3010-49b8-b31d-712d98375769	4
930	10	11	84acf6ef-3010-49b8-b31d-712d98375769	5
931	10	1	84acf6ef-3010-49b8-b31d-712d98375769	6
932	10	14	84acf6ef-3010-49b8-b31d-712d98375769	7
933	10	9	84acf6ef-3010-49b8-b31d-712d98375769	8
934	10	4	84acf6ef-3010-49b8-b31d-712d98375769	9
935	10	10	84acf6ef-3010-49b8-b31d-712d98375769	10
936	10	9	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	1
937	10	6	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	2
938	10	8	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	3
939	10	14	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	4
940	10	15	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	5
941	10	10	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	6
942	10	4	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	7
943	10	11	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	8
944	10	2	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	9
945	10	7	f77b4ccb-6a48-418f-9b39-22ea3aedf7e9	10
946	10	8	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	1
947	10	9	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	2
948	10	12	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	3
949	10	3	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	4
950	10	13	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	5
951	10	17	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	6
952	10	6	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	7
953	10	2	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	8
954	10	4	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	9
955	10	14	5b4bca6f-3e92-444a-832e-6ed1dd8ce9c6	10
956	10	10	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	1
957	10	3	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	2
958	10	7	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	3
959	10	4	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	4
960	10	9	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	5
961	10	11	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	6
962	10	13	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	7
963	10	5	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	8
964	10	14	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	9
965	10	1	77d8ba99-4c00-4c87-b7aa-1b433e736ac2	10
966	10	9	726315e5-0597-4a24-bebb-8cbcb7e0fa64	1
967	10	13	726315e5-0597-4a24-bebb-8cbcb7e0fa64	2
968	10	4	726315e5-0597-4a24-bebb-8cbcb7e0fa64	3
969	10	3	726315e5-0597-4a24-bebb-8cbcb7e0fa64	4
970	10	8	726315e5-0597-4a24-bebb-8cbcb7e0fa64	5
971	10	2	726315e5-0597-4a24-bebb-8cbcb7e0fa64	6
972	10	11	726315e5-0597-4a24-bebb-8cbcb7e0fa64	7
973	10	10	726315e5-0597-4a24-bebb-8cbcb7e0fa64	8
974	10	12	726315e5-0597-4a24-bebb-8cbcb7e0fa64	9
975	10	7	726315e5-0597-4a24-bebb-8cbcb7e0fa64	10
976	10	13	32039077-1e25-4dd3-a222-1a48ed178856	1
977	10	17	32039077-1e25-4dd3-a222-1a48ed178856	2
978	10	11	32039077-1e25-4dd3-a222-1a48ed178856	3
979	10	6	32039077-1e25-4dd3-a222-1a48ed178856	4
980	10	2	32039077-1e25-4dd3-a222-1a48ed178856	5
981	10	9	32039077-1e25-4dd3-a222-1a48ed178856	6
982	10	8	32039077-1e25-4dd3-a222-1a48ed178856	7
983	10	1	32039077-1e25-4dd3-a222-1a48ed178856	8
984	10	10	32039077-1e25-4dd3-a222-1a48ed178856	9
985	10	3	32039077-1e25-4dd3-a222-1a48ed178856	10
986	10	10	b0451566-9c22-4aa6-90dc-2e48e146f967	1
987	10	13	b0451566-9c22-4aa6-90dc-2e48e146f967	2
988	10	4	b0451566-9c22-4aa6-90dc-2e48e146f967	3
989	10	9	b0451566-9c22-4aa6-90dc-2e48e146f967	4
990	10	2	b0451566-9c22-4aa6-90dc-2e48e146f967	5
991	10	8	b0451566-9c22-4aa6-90dc-2e48e146f967	6
992	10	3	b0451566-9c22-4aa6-90dc-2e48e146f967	7
993	10	12	b0451566-9c22-4aa6-90dc-2e48e146f967	8
994	10	1	b0451566-9c22-4aa6-90dc-2e48e146f967	9
995	10	14	b0451566-9c22-4aa6-90dc-2e48e146f967	10
996	10	8	5e03957c-535a-441c-86f8-80db8a65c824	1
997	10	11	5e03957c-535a-441c-86f8-80db8a65c824	2
998	10	17	5e03957c-535a-441c-86f8-80db8a65c824	3
999	10	2	5e03957c-535a-441c-86f8-80db8a65c824	4
1000	10	15	5e03957c-535a-441c-86f8-80db8a65c824	5
1001	10	6	5e03957c-535a-441c-86f8-80db8a65c824	6
1002	10	7	5e03957c-535a-441c-86f8-80db8a65c824	7
1003	10	14	5e03957c-535a-441c-86f8-80db8a65c824	8
1004	10	5	5e03957c-535a-441c-86f8-80db8a65c824	9
1005	10	13	5e03957c-535a-441c-86f8-80db8a65c824	10
1006	10	11	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	1
1007	10	17	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	2
1008	10	1	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	3
1009	10	3	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	4
1010	10	13	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	5
1011	10	15	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	6
1012	10	14	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	7
1013	10	12	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	8
1014	10	9	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	9
1015	10	4	ef4e7f58-d99d-4d5b-ad53-183585f9cce1	10
1016	11	5	c2c60109-e4a6-432f-ade0-09a445d1c7da	1
1017	11	6	c2c60109-e4a6-432f-ade0-09a445d1c7da	2
1018	11	10	c2c60109-e4a6-432f-ade0-09a445d1c7da	3
1019	11	7	c2c60109-e4a6-432f-ade0-09a445d1c7da	4
1020	11	17	c2c60109-e4a6-432f-ade0-09a445d1c7da	5
1021	11	11	c2c60109-e4a6-432f-ade0-09a445d1c7da	6
1022	11	14	c2c60109-e4a6-432f-ade0-09a445d1c7da	7
1023	11	2	c2c60109-e4a6-432f-ade0-09a445d1c7da	8
1024	11	1	c2c60109-e4a6-432f-ade0-09a445d1c7da	9
1025	11	3	c2c60109-e4a6-432f-ade0-09a445d1c7da	10
1026	11	17	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	1
1027	11	9	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	2
1028	11	6	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	3
1029	11	3	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	4
1030	11	12	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	5
1031	11	10	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	6
1032	11	14	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	7
1033	11	7	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	8
1034	11	2	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	9
1035	11	13	5593ea9b-5c60-43a9-8f0b-8ef6eae21cbc	10
1036	11	4	2e853f62-1615-4cd4-ab95-db28a421ed3b	1
1037	11	3	2e853f62-1615-4cd4-ab95-db28a421ed3b	2
1038	11	13	2e853f62-1615-4cd4-ab95-db28a421ed3b	3
1039	11	11	2e853f62-1615-4cd4-ab95-db28a421ed3b	4
1040	11	8	2e853f62-1615-4cd4-ab95-db28a421ed3b	5
1041	11	12	2e853f62-1615-4cd4-ab95-db28a421ed3b	6
1042	11	10	2e853f62-1615-4cd4-ab95-db28a421ed3b	7
1043	11	14	2e853f62-1615-4cd4-ab95-db28a421ed3b	8
1044	11	9	2e853f62-1615-4cd4-ab95-db28a421ed3b	9
1045	11	1	2e853f62-1615-4cd4-ab95-db28a421ed3b	10
1046	11	11	802cf4a8-cc16-4b20-b4d9-324218bd3e09	1
1047	11	10	802cf4a8-cc16-4b20-b4d9-324218bd3e09	2
1048	11	5	802cf4a8-cc16-4b20-b4d9-324218bd3e09	3
1049	11	9	802cf4a8-cc16-4b20-b4d9-324218bd3e09	4
1050	11	6	802cf4a8-cc16-4b20-b4d9-324218bd3e09	5
1051	11	12	802cf4a8-cc16-4b20-b4d9-324218bd3e09	6
1052	11	4	802cf4a8-cc16-4b20-b4d9-324218bd3e09	7
1053	11	2	802cf4a8-cc16-4b20-b4d9-324218bd3e09	8
1054	11	14	802cf4a8-cc16-4b20-b4d9-324218bd3e09	9
1055	11	7	802cf4a8-cc16-4b20-b4d9-324218bd3e09	10
1056	11	2	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	1
1057	11	6	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	2
1058	11	5	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	3
1059	11	3	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	4
1060	11	11	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	5
1061	11	15	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	6
1062	11	10	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	7
1063	11	12	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	8
1064	11	1	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	9
1065	11	13	5cb07bfa-88f8-4eaf-a1e1-3a41d5289eda	10
1066	14	10	78fc7858-86a2-4219-b879-605ea9dc7016	1
1067	14	6	78fc7858-86a2-4219-b879-605ea9dc7016	2
1068	14	17	78fc7858-86a2-4219-b879-605ea9dc7016	3
1069	14	11	78fc7858-86a2-4219-b879-605ea9dc7016	4
1070	14	13	78fc7858-86a2-4219-b879-605ea9dc7016	5
1071	14	3	78fc7858-86a2-4219-b879-605ea9dc7016	6
1072	14	4	78fc7858-86a2-4219-b879-605ea9dc7016	7
1073	14	5	78fc7858-86a2-4219-b879-605ea9dc7016	8
1074	14	9	78fc7858-86a2-4219-b879-605ea9dc7016	9
1075	14	14	78fc7858-86a2-4219-b879-605ea9dc7016	10
1076	11	7	fb483b51-11cb-4985-9e21-532b29f2b596	1
1077	11	2	fb483b51-11cb-4985-9e21-532b29f2b596	2
1078	11	4	fb483b51-11cb-4985-9e21-532b29f2b596	3
1079	11	11	fb483b51-11cb-4985-9e21-532b29f2b596	4
1080	11	13	fb483b51-11cb-4985-9e21-532b29f2b596	5
1081	11	1	fb483b51-11cb-4985-9e21-532b29f2b596	6
1082	11	5	fb483b51-11cb-4985-9e21-532b29f2b596	7
1083	11	12	fb483b51-11cb-4985-9e21-532b29f2b596	8
1084	11	8	fb483b51-11cb-4985-9e21-532b29f2b596	9
1085	11	3	fb483b51-11cb-4985-9e21-532b29f2b596	10
1086	11	8	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	1
1087	11	4	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	2
1088	11	14	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	3
1089	11	13	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	4
1090	11	2	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	5
1091	11	10	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	6
1092	11	9	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	7
1093	11	15	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	8
1094	11	1	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	9
1095	11	5	aefa5d2c-f6a8-40ec-8c24-3a54e79f9fa7	10
1096	11	12	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	1
1097	11	15	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	2
1098	11	17	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	3
1099	11	1	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	4
1100	11	10	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	5
1101	11	8	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	6
1102	11	2	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	7
1103	11	9	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	8
1104	11	5	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	9
1105	11	14	5053ee27-7dbc-48d4-8e2c-67f8af0a2803	10
1106	11	17	d3700268-cfcd-44a8-9389-7e9305cafb30	1
1107	11	9	d3700268-cfcd-44a8-9389-7e9305cafb30	2
1108	11	5	d3700268-cfcd-44a8-9389-7e9305cafb30	3
1109	11	15	d3700268-cfcd-44a8-9389-7e9305cafb30	4
1110	11	7	d3700268-cfcd-44a8-9389-7e9305cafb30	5
1111	11	12	d3700268-cfcd-44a8-9389-7e9305cafb30	6
1112	11	8	d3700268-cfcd-44a8-9389-7e9305cafb30	7
1113	11	14	d3700268-cfcd-44a8-9389-7e9305cafb30	8
1114	11	10	d3700268-cfcd-44a8-9389-7e9305cafb30	9
1115	11	1	d3700268-cfcd-44a8-9389-7e9305cafb30	10
1116	11	13	482e23cd-fd74-41af-8d11-139480e0095b	1
1117	11	7	482e23cd-fd74-41af-8d11-139480e0095b	2
1118	11	6	482e23cd-fd74-41af-8d11-139480e0095b	3
1119	11	4	482e23cd-fd74-41af-8d11-139480e0095b	4
1120	11	8	482e23cd-fd74-41af-8d11-139480e0095b	5
1121	11	10	482e23cd-fd74-41af-8d11-139480e0095b	6
1122	11	14	482e23cd-fd74-41af-8d11-139480e0095b	7
1123	11	15	482e23cd-fd74-41af-8d11-139480e0095b	8
1124	11	2	482e23cd-fd74-41af-8d11-139480e0095b	9
1125	11	3	482e23cd-fd74-41af-8d11-139480e0095b	10
1126	15	3	7a34f000-f285-435b-afec-b4a7950c3bac	1
1127	15	1	7a34f000-f285-435b-afec-b4a7950c3bac	2
1128	15	12	7a34f000-f285-435b-afec-b4a7950c3bac	3
1129	15	7	7a34f000-f285-435b-afec-b4a7950c3bac	4
1130	15	13	7a34f000-f285-435b-afec-b4a7950c3bac	5
1131	15	2	7a34f000-f285-435b-afec-b4a7950c3bac	6
1132	15	17	7a34f000-f285-435b-afec-b4a7950c3bac	7
1133	15	8	7a34f000-f285-435b-afec-b4a7950c3bac	8
1134	15	14	7a34f000-f285-435b-afec-b4a7950c3bac	9
1135	15	9	7a34f000-f285-435b-afec-b4a7950c3bac	10
1136	15	4	43099699-cfe4-4668-8a26-ae87d8915969	1
1137	15	9	43099699-cfe4-4668-8a26-ae87d8915969	2
1138	15	1	43099699-cfe4-4668-8a26-ae87d8915969	3
1139	15	10	43099699-cfe4-4668-8a26-ae87d8915969	4
1140	15	5	43099699-cfe4-4668-8a26-ae87d8915969	5
1141	15	13	43099699-cfe4-4668-8a26-ae87d8915969	6
1142	15	7	43099699-cfe4-4668-8a26-ae87d8915969	7
1143	15	3	43099699-cfe4-4668-8a26-ae87d8915969	8
1144	15	14	43099699-cfe4-4668-8a26-ae87d8915969	9
1145	15	6	43099699-cfe4-4668-8a26-ae87d8915969	10
1146	15	1	7ec80b6d-230b-48de-b796-6a3ac4afe791	1
1147	15	14	7ec80b6d-230b-48de-b796-6a3ac4afe791	2
1148	15	6	7ec80b6d-230b-48de-b796-6a3ac4afe791	3
1149	15	8	7ec80b6d-230b-48de-b796-6a3ac4afe791	4
1150	15	3	7ec80b6d-230b-48de-b796-6a3ac4afe791	5
1151	15	9	7ec80b6d-230b-48de-b796-6a3ac4afe791	6
1152	15	12	7ec80b6d-230b-48de-b796-6a3ac4afe791	7
1153	15	5	7ec80b6d-230b-48de-b796-6a3ac4afe791	8
1154	15	2	7ec80b6d-230b-48de-b796-6a3ac4afe791	9
1155	15	13	7ec80b6d-230b-48de-b796-6a3ac4afe791	10
\.


--
-- Name: choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yourusername
--

SELECT pg_catalog.setval('public.choices_id_seq', 64, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yourusername
--

SELECT pg_catalog.setval('public.questions_id_seq', 17, true);


--
-- Name: userquizsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yourusername
--

SELECT pg_catalog.setval('public.userquizsessions_id_seq', 1155, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yourusername
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- PostgreSQL database dump complete
--
