### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 6288d3de-b1d3-11ed-0106-674beb4b6c23
begin
	import Pkg
	Pkg.activate()
	Pkg.add("LaTeXStrings")
	using DifferentialEquations
	using LaTeXStrings
	
	import Plots
end

# ╔═╡ 10022063-4e2a-47a0-9c20-95a4315a52b0
md""" Решаем систему ОДУ следующего вида:

$$\begin{aligned}
	\frac{\mathrm{d} x}{\mathrm{d} t} = +y\\
	\frac{\mathrm{d} y}{\mathrm{d} t} = -x
\end{aligned}
\quad
\Leftrightarrow
\quad
\frac{\mathrm{d} \mathbf{u}}{\mathrm{d} t} = \mathbf{F}(\mathbf{u}),
\quad
\mathbf{u}(t) = 
\begin{bmatrix}u_1(t)\\u_2(t)\end{bmatrix}=
\begin{bmatrix}x(t)\\y(t)\end{bmatrix},
\quad
\mathbf{F}(\mathbf{u}) = 
\begin{pmatrix}+y\\-x\end{pmatrix}$$

с начальными условиями $t_0 = 0$, $x(0) = x_0$, $y(0) = y_0$
"""

# ╔═╡ af9dc9f3-582f-41c7-9a48-a032f6fe1514
"""Правая часть нашей системы, p, t не используются
u[1] -- x, u[2] -- y
"""
function F!(du, u, p, t)
	du[1] = u[2]
	du[2] = -5.5u[1]-4.4u[2] + 2cos(0.5t)
end

# ╔═╡ 61dfb4fd-094b-4f85-8ecc-7f0ecf90ecdb
begin
	u₀ = [-0.7, 0.7]
	T = (0.0, 67)
	prob = ODEProblem(F!, u₀, T)
end

# ╔═╡ db3a7e3e-cfd3-4bea-a004-187bfbb180f6
sol = solve(prob, saveat=0.01)

# ╔═╡ a1e3c3fa-6e81-42e1-bfd0-1c5925df68f8
begin
	Time = sol.t
	const X = Float64[]
	const Y = Float64[]
	for u in sol.u
		x, y = u
		push!(X, x)
		push!(Y, y)
	end
	X, Y
end

# ╔═╡ 73795260-515d-4d44-8704-a3a7a40cc1ea
begin
	# Просто заготовка для будущих графиков
	fig = Plots.plot(
		layout=(1, 2),
		dpi=150,
		grid=:xy,
		gridcolor=:black,
		gridwidth=1,
		background_color=:antiquewhite,
		# aspect_ratio=:equal,
		size=(800, 400),
		plot_title="Грфик изменения численности",
	)

	Plots.plot!(
		fig[1],
		Time,
		[X Y],
		xlabel=L"$t$",
		ylabel=L"$x(t)$, $y(t)$",
		color=[ :red :blue ],
		label=[L"$x(t)$" L"$y(t)$"]
	)

	Plots.plot!(
		fig[2],
		X,
		Y,
		color=:green,
		xlabel=L"$x(t)$",
		ylabel=L"$y(t)$",
		label="Фазовый портер"
	)
	# Plots.scatter!(
	# 	fig[1],
	# 	Time,
	# 	[X Y],
	# 	color=[:red :blue],
	# 	label=false
	# )

	
end

# ╔═╡ Cell order:
# ╠═6288d3de-b1d3-11ed-0106-674beb4b6c23
# ╟─10022063-4e2a-47a0-9c20-95a4315a52b0
# ╠═af9dc9f3-582f-41c7-9a48-a032f6fe1514
# ╠═61dfb4fd-094b-4f85-8ecc-7f0ecf90ecdb
# ╠═db3a7e3e-cfd3-4bea-a004-187bfbb180f6
# ╠═a1e3c3fa-6e81-42e1-bfd0-1c5925df68f8
# ╠═73795260-515d-4d44-8704-a3a7a40cc1ea
