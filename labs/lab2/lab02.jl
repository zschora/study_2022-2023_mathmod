using Plots

F(x) = sin(x) + cos(2x) + 0.5cos(x)

x = collect(1:0.01:4pi)
y = F.(x)

plt = plot(
	aspect_ratio=:equal,
	dpi=300,
	lagand=false
)

plot!(
	plt,
	x,
	y,
	xlabel="x",
	ylabel="y",
	color=:red,
	title="Example"
)

savefig(plt, "lab2.png")
