---
## Front matter
title: "Отчет по лабораторной работе 2"
subtitle: "Задача о погоне."
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

Изучить построение математической модели для задачи преследования.

# Задание

1. Запишите уравнение, описывающее движение катера, с начальными условиями для двух случаев (в зависимости от расположения катера относительно лодки в начальный момент времени).
2. Постройте траекторию движения катера и лодки для двух случаев. 
3. Найдите точку пересечения траектории катера и лодки 

# Теоретическое введение

### Постановка задачи

На море в тумане катер береговой охраны преследует лодку браконьеров. Через определенный промежуток времени туман рассеивается, и лодка обнаруживается на расстоянии 11,7 км от катера. Затем лодка снова скрывается в тумане и уходит прямолинейно в неизвестном направлении. Известно, что скорость катера в 3,7 раза больше скорости браконьерской лодки.

Подробнее в [@pres].

### Решение

#### Начальные условия

Введем полярную систему координат, ноль - точка нахождения лодки в момент обнаружения. Ось направлена к катеру.

Сначала добьемся того, чтобы катер и лодка находились на одном расстоянии от полюса. х - путь, который пройдет катер до этого момента.

Здесь возможны два случая в зависимости от удаленности катера:
$$
1)t = \frac{x}{v} = \frac{11,7-x}{3,7v}\text{, где } v - \text{скорость лодки}
$$

$$
2)t = \frac{x}{v} = \frac{11,7+x}{3,7v}\text{, где } v - \text{скорость лодки}
$$

Получим два варианта начальной точки:
$$
x_1 = \frac{11.7}{4,7}, x_2 = \frac{11.7}{2,7}
$$

#### Уравнение траектории

Чтобы катер все время находился на том же расстоянии от нуля, что и лодка, его радиальная скорость должна быть равна скорости лодки. Так катер, пройдя полный круг, точно встретится с лодкой, под каким бы углом она не плыла.

Тангенсальную скорость найдем из теоремы Пифагора. Запишем уравнения для скоростей как производных по времени:
$$
v_r = v = \frac{dr}{rt}
$$

$$
v_{\tau} = \sqrt{(3.7v)^2-v^2} = r\frac{d\theta}{dt}
$$

$$
\text{Откуда получаем:  }
\frac{dr}{d\theta} = \frac{r}{\sqrt{3.7^2-1}}
$$



### Работа с Julia

Скрипт запускается так:

```bash
julia script.jl
```

Для построения графиков и решения диффуров нужно добавить пакеты:

```bash
add Plots
add DifferentialEquations
```

Задание функции и решение диффура:

```julia
"""Правая часть ОДУ
u --- переменная (скаляр или массив)
p --- параметры (кортеж, tuple)
t --- аргумент (скаляр, время)"""
function F(u, p, t)
  return u / √(3.7^2-1)
end

"Начальное значение"
const u_0 = 11.7/4.7

"Интервал (кортеж, tuple)"
const T = (0, 1.8π)

# Задача
prob = ODEProblem(F, u_0, T)

# Решение задачи
sol = solve(
  prob,
  dtmax=0.05)
```

Построение графика в полярных координатах:

```julia
plt = plot(
  proj = :polar,
  aspect_ratio=:equal,
  dpi=300,
  legend=true)

plot!(
  plt,
  sol.t,
  sol.u,
  xlabel="θ",
  ylabel="r(t)",
  label="Траектория катера",
  color=:blue,
  title="Катер с бандитами")

```

Подробнее в [@julia].

# Выполнение лабораторной работы

1. Повторим вывод уравнения траектории. Описан выше в теоретическом введении.

2. Запишем решение задачи для уравнения траектории на Julia (@fig:001).

   ![Код для решения задачи](image\code1.PNG){#fig:001 width=70%}

3. Построим график траектории (@fig:002)

   ![Код для построения графика](image\code2.PNG){#fig:002 width=70%}

4. По графику найдем точку пересечения.

   1.  Для первого случая, катер слишком далеко (@fig:003). Встреча произойдет на расстоянии в 5 км.

      ![Траектория в первом случае](image\graph1.PNG){#fig:003 width=70%}

   2.  Для первого случая, катер слишком близко (@fig:004). Встреча произойдет на расстоянии в 9 км.

      ![Траектория во втором случае](image\graph2.PNG){#fig:004 width=70%}

5. Ограничения пакета Open Modelica не позволили оформить решение этой задачи.

# Выводы

В итоге была решена задача о погоне с использованием Julia и построены графики траекторий. Open Modelica для решение этой задачи не подошла.

# Список литературы{.unnumbered}

::: {#refs}
:::
