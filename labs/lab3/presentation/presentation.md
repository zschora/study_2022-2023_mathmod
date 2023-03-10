---
## Front matter
lang: ru-RU
title: Лабораторная 3
subtitle: Модель боевых действий
author:
  - Шалыгин Г. Э.
institute:
  - Российский университет дружбы народов, Москва, Россия
date:

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

  * Шалыгин Георгий Эдуардович
  * студент НФИ-02-20
  * Российский университет дружбы народов

# Вводная часть

## Актуальность

- Математическое моделирование - важная часть компетенции в образовательном треке НФИ

## Цели и задачи

- Изучить построение математической модели боевых действий.
- Задачи:
  - Построить модель боевых действий между регулярными войсками
  - Построить модель ведение боевых действий с участием регулярных войск и партизанских отрядов. 
  - Построить графики 


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

## Содержание исследования

Между страной Х и страной У идет война. Численность состава войск исчисляется от начала войны, и являются временными функциями $x(t)$ и $y(t)$. В начальный момент времени страна Х имеет армию численностью 30 000 человек, а в распоряжении страны У армия численностью в 17 000 человек. Для упрощения модели считаем, что коэффициенты a b c h постоянны. Также считаем P(t) и Q(t) непрерывные функции.



## 

# Результаты

## Модель боевых действий между регулярными войсками

Описывается системой:![модель 1](image\eq0.PNG){#fig:001 width=50%}

## Боевые действия с участием регулярных войск и партизанских отрядов

Модель:

![модель 1](image\eq1.PNG){#fig:002 width=50%}

## Построение графиков

Построим график для первой модели

![Результаты](image\j02.PNG){#fig:003 width=70%}

## Построение графиков

Построим график для второй модели

![Результаты](image\om2g.PNG){#fig:004 width=70%}

## 

# Вывод

В итоге были рассмотрены две модели боевых действий. С использованием Julia и OpenModelica построены графики изменения численности войск.
