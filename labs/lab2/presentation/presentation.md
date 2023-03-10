---
## Front matter
lang: ru-RU
title: Лабораторная 2
subtitle: Задача о погоне
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

- Изучить построение математической модели для задачи преследования.
- Задачи:
  - Запишите уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени).
  - Постройте траекторию движения катера и лодки для двух случаев. 
  - Найдите точку пересечения траектории катера и лодки 


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

## Содержание исследования

- Катер преследует лодку. Лодка находится на расстоянии 11,7 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Скорость катера в 3,7 раза больше скорости браконьерской лодки.

- Уравнение траектории:
  $$
  \frac{dr}{d\theta} = \frac{r}{\sqrt{3.7^2-1}}
  $$
  

## 

# Результаты

## Написание скрипта

Запишем решение задачи для уравнения траектории на Julia

![Код для решения задачи](image\code1.PNG){#fig:001 width=50%}

## Построение графиков

Построим график траектории

![Код для построения графика](image\code2.PNG){#fig:002 width=70%}

# Итог

Получившееся графики траекторий

![Траектория в первом случае](image\graph1.PNG){#fig:003 width=40%}![Траектория в первом случае](image\graph2.PNG){#fig:003 width=40%}

# Вывод

В итоге была найдена траектория преследования, построены графики и найдены точки перехвата. Работа выполнена на языке Julia.

