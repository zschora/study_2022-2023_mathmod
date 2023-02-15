using DifferentialEquations

function F(u, p, t)
	return u / sqrt(3)
end

const u_0 = 1.0

const T = (0.0, 0.1)

prob = ODEProblem(F, u_0, T)

sol = solve(prob)

@show sol.t
@show sol.u
