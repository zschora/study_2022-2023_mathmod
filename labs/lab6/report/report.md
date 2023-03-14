---
## Front matter
title: "Отчет по лабораторной работе 6"
subtitle: "Задача об эпидемии"
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

Изучить построение математической модели задачи об эпидемии.

# Задание

1. Построить графики изменения числа особей в каждой из трех групп.
2. Рассмотрите, как будет протекать эпидемия в случае:
   1. если $I(0) < I^*$
   2. если $I(0) > I^*$


# Теоретическое введение

## Постановка задачи

На одном острове вспыхнула эпидемия. Известно, что из всех проживающих на острове ($N=11 300$) в момент начала эпидемии ($t=0$) число заболевших людей (являющихся распространителями инфекции) $I(0)=240$, А число здоровых людей с иммунитетом к болезни $R(0)=46$. Таким образом, число людей восприимчивых к болезни, но пока здоровых, в начальный момент времени $S(0)=N-I(0)- R(0)$.

Подробнее в [@julia].

## Модель

### Скорость изменения $S(t), I(t), R(t)$ 

$S(t)$ меняется по следующему закону:
$$
\dfrac{dS}{dt} = 
\begin{cases}
 -\alpha S,& \text{если } I(t) > I^* \\
 0,& \text{если } I(T)<I^*  
\end{cases}
$$
Поскольку каждая восприимчивая к болезни особь, которая, в конце концов, заболевает, сама становится инфекционной, то скорость изменения числа инфекционных особей представляет разность за единицу времени между заразившимися и теми, кто уже болеет и лечится, т.е.:
$$
\dfrac{dI}{dt} = 
\begin{cases}
 \alpha S + \beta I,& \text{если } I(t) > I^* \\
 -\beta I,& \text{если } I(T)<I^*  
\end{cases}
$$
А скорость изменения выздоравливающих особей (при этом приобретающие иммунитет к болезни)
$$
\dfrac{dR}{dt} = \beta I
$$
Постоянные пропорциональности $\alpha, \beta$, - это коэффициенты заболеваемости и выздоровления соответственно. Для того, чтобы решения соответствующих уравнений определялось однозначно, необходимо задать начальные условия .Считаем, что на начало эпидемии в момент времени $t=0$ нет особей с иммунитетом к болезни $R(0)=0$, а число инфицированных и восприимчивых к болезни особей $I(0)$ и $S(0)$.

Для анализа картины протекания эпидемии необходимо рассмотреть два случая:  если $I(0) < I^*$, если $I(0) > I^*$.

Подробнее в [@pres].

# Выполнение лабораторной работы

1. Вариант 27, начальные значения: $N = 11300, I(0) = 240, R(0) = 46, S(0)=N-I(0)-R(0)$.

2. Рассмотрим первый случай, если $I(0) < I^*$.

3. Зададим систему и начальные условия на Julia (@fig:001).

   ![Код для первой модели](image\j11.PNG){#fig:001 width=70%}

4. Построим график изменения численности (@fig:002)

   ![График для первой модели](image\j12.PNG){#fig:002 width=70%}

5. Теперь зададим модель в Opemmodelica (@fig:003).

   ![Модель в openmodelica](image\om11.PNG){#fig:003 width=70%}

6. Построим график (@fig:004).

   ![Результаты моделирования в openmodelica](image\om12.PNG){#fig:004 width=70%}

7. Рассмотрим второй случай, если $I(0) > I^*$.

8. Система уравнений в Julia (@fig:005).

   ![Код для второй модели](image\j21.PNG){#fig:005 width=70%}

11. Построим графики (@fig:006)

    ![Результат моделирования в julia](image\j22.PNG){#fig:006 width=70%}

12. Та же модель в openmodelica (@fig:007)

    ![Код для второй модели](image\om21.PNG){#fig:007 width=70%}

13. И результаты моделирования (@fig:008)

    ![График модели](image\om22.PNG){#fig:008 width=70%}

# Выводы

В итоге была рассмотрена простейшая модель эпидемии. С использованием Julia и OpenModelica построены графики изменения численности групп здоровых, больных людей и людей с иммунитетом.

# Список литературы{.unnumbered}

::: {#refs}
:::
