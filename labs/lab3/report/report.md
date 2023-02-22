---
## Front matter
title: "Отчет по лабораторной работе 3"
subtitle: "Модель боевых действий"
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

Изучить построение математической модели боевых действий.

# Задание

1. Построить модель боевых действий между регулярными войсками
2. Построить модель ведение боевых действий с участием регулярных войск и партизанских отрядов. 
3. Построить графики 

# Теоретическое введение

## Постановка задачи

Между страной Х и страной У идет война. Численность состава войск исчисляется от начала войны, и являются временными функциями $x(t)$ и $y(t)$. В начальный момент времени страна Х имеет армию численностью 30 000 человек, а в распоряжении страны У армия численностью в 17 000 человек. Для упрощения модели считаем, что коэффициенты a b c h постоянны. Также считаем P(t) и Q(t) непрерывные функции.

Подробнее в [@julia].

## Виды моделей

### Модель боевых действий между регулярными войсками

$$
\frac{dx}{dt} = -ax(t)-by(t)+P(t)
$$

$$
\frac{dy}{dt} = -cx(t)-hy(t)+Q(t)
$$

Потери, не связанные с боевыми действиями, описывают члены $-a(t)x(t)$ и $-h(y)y(t)$ , члены $-b(y)y(t)$ и $-c(t)x(t)$ отражают потери на поле боя. Коэффициенты $b(t)$ и $c(t)$ указывают на эффективность боевых действий со стороны у и х соответственно, $a , h$ - величины, характеризующие степень влияния различных факторов на потери. Функции $P(t), Q(t)$ учитывают возможность подхода подкрепления к войскам Х и У в течение одного дня.

Подробнее в [@pres].

### Боевые действия с участием регулярных войск и партизанских отрядов

$$
\frac{dx}{dt} = -ax(t)-by(t)+P(t)
$$

$$
\frac{dy}{dt} = -cx(t)y(t)-hy(t)+Q(t)
$$

Нерегулярные войска в отличии от постоянной армии менее уязвимы, так как действуют скрытно, в этом случае сопернику приходится действовать неизбирательно, по площадям, занимаемым партизанами. Поэтому считается, что тем потерь партизан, проводящих свои операции в разных местах на некоторой известной территории, пропорционален не только численности армейских соединений, но и численности самих партизан.

Подробнее в [@pres].

### Боевые действия между партизанскими отрядами 

Модель ведение боевых действий между партизанскими отрядами с учетом предположений, сделанном в предыдущем случаем, имеет вид:
$$
\frac{dx}{dt} = -a(t)x(t)-b(t)x(t)y(t)+P(t)
$$

$$
\frac{dy}{dt} = -h(t)y(t)-c(t)x(t)y(t)+Q(t)
$$

Подробнее в [@pres].

# Выполнение лабораторной работы

1. Вариант 27, начальные значения: $x(0) = 88000, y(0) = 99000$.

2. Рассмотрим модель боевых действий между регулярными войсками, заданная системой (@fig:001):

   ![Уравнения для боевых действий между регулярными войсками](image\eq0.PNG){#fig:001 width=70%}

3. Зададим систему и начальные условия на Julia (@fig:002).

   ![Код для первой модели](image\j01.PNG){#fig:002 width=70%}

4. Построим график изменения численности (@fig:003)

   ![График для первой модели](image\j02.PNG){#fig:003 width=70%}

5. Теперь зададим модель в Opemmodelica (@fig:004).

   ![Модель в openmodelica](image\om1.PNG){#fig:004 width=70%}

6. Построим график (@fig:005).

   ![Результаты моделирования в openmodelica](image\om1g.PNG){#fig:005 width=70%}

7. Оба графика показывают, что первая армия проигрывает.

8. Рассмотрим модель боевых действий между регулярными войсками и партизанами, заданная системой (@fig:006):

   ![Уравнения для боевых действий между регулярными войсками и партизанами](image\eq1.PNG){#fig:006 width=70%}

9. Система уравнений в Julia (@fig:007).

   ![Код для второй модели](image\j1.PNG){#fig:007 width=70%}

10. Зададим начальные значения (@fig:008)

   ![Начальные значения во второй модели](image\j2.PNG){#fig:008 width=70%}

11. Построим графики (@fig:009)

    ![Результат моделирования в julia](image\j3.PNG){#fig:009 width=70%}

12. Та же модель в openmodelica (@fig:010)

    ![Код для второй модели](image\om2.PNG){#fig:010 width=70%}

13. И результаты моделирования (@fig:011)

    ![График модели](image\om2g.PNG){#fig:011 width=70%}

14. Вторая модель в обоих случаях показывает, что вторая армия сразу уничтожается, модель, скорее всего, не соответствует реальности.

# Выводы

В итоге были рассмотрены две модели боевых действий. С использованием Julia и OpenModelica построены графики изменения численности войск.

# Список литературы{.unnumbered}

::: {#refs}
:::
