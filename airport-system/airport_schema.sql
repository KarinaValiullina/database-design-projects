-- База данных: `aero`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Aeraport`
--

CREATE TABLE `Aeraport` (
  `ID_Aeraporta` int(11) NOT NULL,
  `Naimenovanie` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Gorod` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Strana` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code_IATA` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Bilet`
--

CREATE TABLE `Bilet` (
  `ID_Bileta` int(11) NOT NULL,
  `Data_prodaji` date DEFAULT NULL,
  `Tsena` decimal(10,2) DEFAULT NULL,
  `Status_bileta` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'готов',
  `Sposob_oplati` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_Passajir` int(11) NOT NULL,
  `ID_Reisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Bilet_Ysluga`
--

CREATE TABLE `Bilet_Ysluga` (
  `ID_Bileta_Ysluga` int(11) NOT NULL,
  `Kolichestvo` int(11) DEFAULT NULL,
  `ID_Bileta` int(11) NOT NULL,
  `ID_Yslugi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Doljnost`
--

CREATE TABLE `Doljnost` (
  `ID_Doljnost` int(11) NOT NULL,
  `Naimenovanie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Model_Samoleta`
--

CREATE TABLE `Model_Samoleta` (
  `Nazvanie_modeli` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Proizvoditel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Vmestitelnost_Passajirov` int(11) DEFAULT NULL,
  `Vmestitelnoct_bagaja` int(11) DEFAULT NULL,
  `ID_Modeli_Samoleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Naznachenie_samoleta`
--

CREATE TABLE `Naznachenie_samoleta` (
  `ID_Naznachenia` int(11) NOT NULL,
  `ID_Reisa` int(11) NOT NULL,
  `ID_Samoleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Passajir`
--

CREATE TABLE `Passajir` (
  `ID_Passajir` int(11) NOT NULL,
  `Passport` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Familia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ima` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Otchestvo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pol` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_rojdenia` date DEFAULT NULL,
  `Zagran_passport` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nomer_telefona` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Reis`
--

CREATE TABLE `Reis` (
  `ID_Reisa` int(11) NOT NULL,
  `Nomer_Reisa` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_vileta` date DEFAULT NULL,
  `data_prileta` date DEFAULT NULL,
  `ID_Aeraporta_otpravitela` int(11) NOT NULL,
  `ID_Aeraport_Poluchatela` int(11) NOT NULL,
  `ID_Tip_reisa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Samolet`
--

CREATE TABLE `Samolet` (
  `Bortovoi_nomer` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status_samoleta` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'готов',
  `ID_Modeli_Samoleta` int(11) NOT NULL,
  `ID_Samoleta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Структура таблицы `Sotrudnik`
--

CREATE TABLE `Sotrudnik` (
  `ID_Sotrudnik` int(11) NOT NULL,
  `Passport` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Familia` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ima` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Otchestvo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pol` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nomer_telefona` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_priema_na_rabotu` date DEFAULT NULL,
  `ID_Aeraporta` int(11) DEFAULT NULL,
  `ID_Doljnost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tip_reisa`
--

CREATE TABLE `Tip_reisa` (
  `ID_Tip_reisa` int(11) NOT NULL,
  `Naimenovanie` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Структура таблицы `Ysluga`
--

CREATE TABLE `Ysluga` (
  `ID_Yslugi` int(11) NOT NULL,
  `Naimenovanie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type_Yslugi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tsena` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Aeraport`
--
ALTER TABLE `Aeraport`
  ADD PRIMARY KEY (`ID_Aeraporta`);

--
-- Индексы таблицы `Bilet`
--
ALTER TABLE `Bilet`
  ADD PRIMARY KEY (`ID_Bileta`),
  ADD KEY `R_2` (`ID_Passajir`),
  ADD KEY `R_3` (`ID_Reisa`);

--
-- Индексы таблицы `Bilet_Ysluga`
--
ALTER TABLE `Bilet_Ysluga`
  ADD PRIMARY KEY (`ID_Bileta_Ysluga`),
  ADD KEY `R_4` (`ID_Bileta`),
  ADD KEY `Билет_Услуга` (`ID_Yslugi`);

--
-- Индексы таблицы `Doljnost`
--
ALTER TABLE `Doljnost`
  ADD PRIMARY KEY (`ID_Doljnost`);

--
-- Индексы таблицы `Model_Samoleta`
--
ALTER TABLE `Model_Samoleta`
  ADD PRIMARY KEY (`ID_Modeli_Samoleta`);

--
-- Индексы таблицы `Naznachenie_samoleta`
--
ALTER TABLE `Naznachenie_samoleta`
  ADD PRIMARY KEY (`ID_Naznachenia`),
  ADD KEY `R_8` (`ID_Reisa`),
  ADD KEY `R_9` (`ID_Samoleta`);

--
-- Индексы таблицы `Passajir`
--
ALTER TABLE `Passajir`
  ADD PRIMARY KEY (`ID_Passajir`);

--
-- Индексы таблицы `Reis`
--
ALTER TABLE `Reis`
  ADD PRIMARY KEY (`ID_Reisa`),
  ADD KEY `Аэропорт_Отправление` (`ID_Aeraporta_otpravitela`),
  ADD KEY `Аэропорт_Назначение` (`ID_Aeraport_Poluchatela`),
  ADD KEY `R_15` (`ID_Tip_reisa`);

--
-- Индексы таблицы `Samolet`
--
ALTER TABLE `Samolet`
  ADD PRIMARY KEY (`ID_Samoleta`),
  ADD KEY `R_14` (`ID_Modeli_Samoleta`);

--
-- Индексы таблицы `Sotrudnik`
--
ALTER TABLE `Sotrudnik`
  ADD PRIMARY KEY (`ID_Sotrudnik`),
  ADD KEY `R_18` (`ID_Aeraporta`),
  ADD KEY `R_20` (`ID_Doljnost`);

--
-- Индексы таблицы `Tip_reisa`
--
ALTER TABLE `Tip_reisa`
  ADD PRIMARY KEY (`ID_Tip_reisa`);

--
-- Индексы таблицы `Ysluga`
--
ALTER TABLE `Ysluga`
  ADD PRIMARY KEY (`ID_Yslugi`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Bilet`
--
ALTER TABLE `Bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`ID_Passajir`) REFERENCES `Passajir` (`ID_Passajir`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`ID_Reisa`) REFERENCES `Reis` (`ID_Reisa`);

--
-- Ограничения внешнего ключа таблицы `Bilet_Ysluga`
--
ALTER TABLE `Bilet_Ysluga`
  ADD CONSTRAINT `bilet_ysluga_ibfk_1` FOREIGN KEY (`ID_Bileta`) REFERENCES `Bilet` (`ID_Bileta`),
  ADD CONSTRAINT `bilet_ysluga_ibfk_2` FOREIGN KEY (`ID_Yslugi`) REFERENCES `Ysluga` (`ID_Yslugi`);

--
-- Ограничения внешнего ключа таблицы `Naznachenie_samoleta`
--
ALTER TABLE `Naznachenie_samoleta`
  ADD CONSTRAINT `naznachenie_samoleta_ibfk_1` FOREIGN KEY (`ID_Reisa`) REFERENCES `Reis` (`ID_Reisa`),
  ADD CONSTRAINT `naznachenie_samoleta_ibfk_2` FOREIGN KEY (`ID_Samoleta`) REFERENCES `Samolet` (`ID_Samoleta`);

--
-- Ограничения внешнего ключа таблицы `Reis`
--
ALTER TABLE `Reis`
  ADD CONSTRAINT `reis_ibfk_1` FOREIGN KEY (`ID_Aeraporta_otpravitela`) REFERENCES `Aeraport` (`ID_Aeraporta`),
  ADD CONSTRAINT `reis_ibfk_2` FOREIGN KEY (`ID_Aeraport_Poluchatela`) REFERENCES `Aeraport` (`ID_Aeraporta`),
  ADD CONSTRAINT `reis_ibfk_3` FOREIGN KEY (`ID_Tip_reisa`) REFERENCES `Tip_reisa` (`ID_Tip_reisa`);

--
-- Ограничения внешнего ключа таблицы `Samolet`
--
ALTER TABLE `Samolet`
  ADD CONSTRAINT `samolet_ibfk_1` FOREIGN KEY (`ID_Modeli_Samoleta`) REFERENCES `Model_Samoleta` (`ID_Modeli_Samoleta`);

--
-- Ограничения внешнего ключа таблицы `Sotrudnik`
--
ALTER TABLE `Sotrudnik`
  ADD CONSTRAINT `sotrudnik_ibfk_1` FOREIGN KEY (`ID_Aeraporta`) REFERENCES `Aeraport` (`ID_Aeraporta`),
  ADD CONSTRAINT `sotrudnik_ibfk_2` FOREIGN KEY (`ID_Doljnost`) REFERENCES `Doljnost` (`ID_Doljnost`);
COMMIT;

