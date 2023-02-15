# Решаем ОДУ

using DifferentialEquations
using Plots

"""Правая часть ОДУ
u --- переменная (скаляр или массив)
p --- параметры (кортеж, tuple)
t --- аргумент (скаляр, время)
"""
function F(u, p, t)
  # p и t не используются в нашем примере
  # но нужны в любом случае для библиотеки
  return u / √(3.7^2-1)
end


"Начальное значение"
const u_0 = 11.7

"Интервал (кортеж, tuple)"
const T = (0, 2π)

# Задача
prob = ODEProblem(F, u_0, T)

# Решение задачи
sol = solve(
  prob,
  dtmax=0.001)

@show sol.t
@show sol.u

plt = plot(
  proj = :polar,
  aspect_ratio=:equal,
  dpi=300,
  legend=true)

# воскл. знак в названии обязателен 
# в данном случае! 
plot!(
  plt,
  sol.t,
  sol.u,
  xlabel="θ",
  ylabel="r(t)",
  label="Траектория катера",
  color=:blue,
  title="Катер с бандитами")


  """plot!(
    plt,
    [],
    [0, 100]
  )"""
  

savefig(plt, "ex03.png")
