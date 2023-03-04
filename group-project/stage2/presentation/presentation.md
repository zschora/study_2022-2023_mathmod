---
## Front matter
lang: ru-RU
title: Неравновесная агрегация, фракталы
subtitle: Этап 2
author:
  - Шалыгин Г. Э.
  - Низамова А. А.
  - Голощапова И. Б.
  - Серегин Д. А.
  - Пиняева А. А.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 04 марта 2023

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
 - \usepackage[ruled,vlined,linesnumbered]{algorithm2e}
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Серегин Денис Алексеевич
  * НФИ-02-20
  * Российский университет дружбы народов

:::
::: {.column width="30%"}

:::
::::::::::::::

# Вводная часть

## Актуальность

- У неравновесной агрегации есть модели.
- Для изучения строятся алгоритмы.
- Модели сложные, ресурсы ограничены, значит необходимы эффективные алгоритмы. 

## Объект и предмет исследования

- Математические модели неравновесной агрегации.
- Построение алгоритмов решения задачи моделирования процесса неравновесной агрегации. 

## Цели и задачи

Цель:

- Изучить алгоритмы моделирования неравновесной агрегации.

Задачи:

- Рассмотреть методы используемые в построении алгоритмов неравновесной агрегации.
- Построить алгоритмы модели неравновесной агрегации.
- Построить алгоритм вычисления фрактальной размерности.

# Используемые методы

## Генерация псевдослучайных чисел

- Алгоритм, порождающий последовательность чисел, элементы которой почти независимы друг от друга и подчиняются заданному распределению (обычно дискретному равномерному).
- Линейный когруэнтный метод:
  1. Начальные условия: $m$ -- достаточно большое натуральное число, $a$ -- множитель, $c$ -- приращение, $X_0$ -- начальное значение.
  2. Возвращаемые значения: последовательность $X_1, X_2, ...$ 
  3. Последовательность описывается формулой:  $$X_{n+1} = (a\cdot X_n + c) \mod m$$

# Алгоритмы для DLA	

## Генерация псевдослучайных чисел

Глобальные переменные: a, m, c, xcur.

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{}
\Output{x - равномерно распределенное случайное число из (0, 1)}

\BlankLine

x = (xcur * a + c) mod m\;

xcur = x;

return x / m;

\caption{Get random}
\end{algorithm}

## Генерация координат следующей частицы

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{x', y', r - координаты центра и радиус текущего агрегата}
\Output{x, y - координаты новой частицы}

\BlankLine

r = r + max(10, r);

angle = 2*PI * random();

x = r * cos(angle) + x';

y = r * sin(angle) + y';

return x, y;

\caption{Get next particular}
\end{algorithm}

## Блуждание частицы

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{x, y,  ref X, ref Y, x', y', r - координаты текущей частицы, координаты кластера, координаты центра, радиус }
\Output{Добавление координат в X, Y}

\BlankLine

step = 1; dx = [1, -1, 0, 0]; dy = [0, 0, 1, -1];

\While{step < 500 and (xl - x  > r or x - xr > r or y - yu > r or yd - y > r}{

\If{частица оказалась по соседству с кластером}{
        X.append(x); Y.append(y);

​		return; }

i = ceil(100*random()) mod 4;

x += dx[i]; y += dy[i]; step++; }

\caption{Random walk}
\end{algorithm}

## Псевдокод модели

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{x0, y0, t - координаты первой частицы, количество итераций}
\Output{X, Y - координаты частиц через время t}

\BlankLine

xl = x0; xr = x0; yu = y0;  yd = y0;

\For{i=1..t}{

​	r = sqrt(pow((xr - xl), 2) + pow((yu - yd), 2))/2;

​	x, y = Get next particular((xr - xl)/2, (yu-yd)/2, r);

​	Random walk(x, y, X, Y, x0, y0, r);

}

return X, Y;

\caption{DLA}
\end{algorithm}

## Фрактальная размерность

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{X, Y, cnt, maxR - координаты частиц агрегата, количество сфер, максимальный радиус}
\Output{d - фрактальная размерность}

\BlankLine

d = -1

\For{i=1..cnt}{

​	r = random()*maxR; m = количество частиц кластера внутри i-той сферы;

​	newD = ln(m) / ln(r);

\eIf{d == -1 or abs(d - newD) < 1e-10}{

​	d = newD;

}{return -1;}

return d;

}

\caption{Fractal uniformity}
\end{algorithm}

# Другие модели

- **Бессеточная**: добавляется выбор случайной длины шага.
- **Химически-ограниченная**: вводится условие прилипания.
- **Баллистическая**: метод случаного блуждания изменяется на прямолинейную траекторию.

# Итоги

- Рассмотренные алгоритмы позволяют построить комплексы программ для вычислительных экспериментов.
