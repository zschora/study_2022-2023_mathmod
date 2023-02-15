---
## Front matter
title: "ОТчет по лабораторной работе 1"
subtitle: "Использование git. Использование Markdown для оформления отчётов."
author: "Шалыгин Георгий Эдуардович"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Создать каталоги для работы на основе документа Рабочее пространство для лабораторной работы, освоить гит.

# Задание

Создать каталоги для работы на основе документа Рабочее пространство для лабораторной работы, сделать репозиторий гит для отчетов.

# Теоретическое введение

### Создание репозитория git

Чтобы создать git репозиторий из этого каталога, выполните команду git init.

### Добавление файла в репозиторий git

Добавим файл в репозиторий: git add hello. html git commit -m "Initial Commit"

### Проверка состояние репозитория git

Используйте команду git status, чтобы проверить текущее состояние репозитория.

Команда проверки состояния сообщит, что коммитить нечего. Это означает, что в репозитории хранится текущее состояние рабочего каталога, и нет никаких изменений, ожидающих записи.

### Коммит изменений

Для коммита на гит используйте команду git commit.

# Выполнение лабораторной работы

1. Создадим репозиторий (@fig:001) 

   ![Создание репозитория](D:\work\study\2022-2023\Матмод\mathmod\labs\lab1\report\image\2.PNG){#fig:001}

2. Запустим скрипт для создания структуры каталогов и зальем изменения на гит (@fig:002).

   ![Загрузка изменений](image\3.PNG){#fig:002 width=70%}

3. Получившееся пространство курса на @fig:003

   ![Каталог курса](image\1.PNG){#fig:003 width=70%}

# Выводы

В итоге было создано протстранство каталогов для курса и репозиторий на гит.

# Список литературы{.unnumbered}

::: {#refs}
:::

