---
## Front matter
lang: ru-RU
title: Лабораторная 3
subtitle: Модель гармонических колебаний
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

- Изучить построение математической модели осциллятора.
- Задачи:
  - Построить решение уравнения гармонического осциллятора без затухания.
  - Записать уравнение свободных колебаний гармонического осциллятора с затуханием, построить его решение. Построить фазовый портрет гармонических колебаний с затуханием. 
  - Записать уравнение колебаний гармонического осциллятора, если на систему действует внешняя сила, построить его решение. Построить фазовый портрет колебаний с действием внешней силы.


## Материалы и методы

- Процессор `pandoc` для входного формата Markdown
- Результирующие форматы
  - `pdf`
  - `html`
- Автоматизация процесса создания: `Makefile`
- Компилятор Julia
- OpenModelica

## Содержание исследования

Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$
\ddot{x} + 2\gamma\dot{x} + \omega^2_0x = 0
$$
где $x$ – переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.),  $\gamma$ – параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ – собственная частота колебаний, $t$ – время.

# Результаты

## Колебания гармонического осциллятора без затухания и без действий внешней силы

Описывается системой:![модель 1](image\s2.PNG){#fig:001 width=30%}

Фазовый портрет

![Результаты моделирования в openmodelica](image\om12.PNG){ width=70%}

## Колебания гармонического осциллятора c затуханием и без действий внешней силы

Модель:

![модель 2](image\s22.PNG){ width=25%}

Фазовый портрет

![Результаты моделирования 2 в openmodelica](image\om22.PNG){width=70%}

## колебания гармонического осциллятора c затуханием и действием внешней силы

Модель:

![модель 2](image\s3.PNG){ width=30%}

Фазовый портрет

![Результаты моделирования 2 в openmodelica](image\om32.PNG){width=70%}



# Вывод

В итоге были рассмотрены три модели гармонических колебаний. С использованием Julia и OpenModelica построены фазовые портреты.
