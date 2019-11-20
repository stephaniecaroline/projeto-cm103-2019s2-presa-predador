using Plots

function rungekutta4(F, t0, tf, u0, n)

    t = t0
    h = (tf - t0) / n
    U = zeros(2,n+1)
    U[:,1] = u0
    T = zeros(n+1)
    T[1] = t

    for i= 1:n
        k1 = F(t, U[:,i])
        k2 = F(t + 0.5 * h, U[:,i] + 0.5 * h * k1)
        k3 = F(t + 0.5 * h, U[:,i] + 0.5 * h * k2)
        k4 = F(t + h, U[:,i] + h * k3)
        U[:,i+1] = U[:,i] + ((1/6) * h) * (k1 + 2 * k2 + 2 * k3 + k4)
        t = t+h
        T[i+1] = t
    end
    
    return U, T
end

plot(T,U[1,:],color="red",label="Presas")
plot!(T,U[2,:],color="blue",label="Predadores",xlabel="Tempo",ylabel="Pop. Presas e Predadores")
