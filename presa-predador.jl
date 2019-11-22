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

## para plotar o grafico da população de presas e predadores em função do tempo
plot(T,U[1,:],color="red",label="Presas")
plot!(T,U[2,:],color="blue",label="Predadores",xlabel="Tempo",ylabel="Pop. Presas e Predadores")

##para plotar o plano de fases, calcule rungekutta4 para diferentes condições iniciais e salve cada um em uma matriz Ui
plot(U1[1,:],U1[2,:],label="Condição 1",xlabel="Presas",ylabel="Predadores") 
plot!(U2[1,:],U2[2,:],label="Condição 2")
plot!(U3[1,:],U3[2,:],label="Condição 3") 

##vetores os dos dados observados na tabela
c = [30 ; 47.2 ; 70.2 ; 77.4 ; 36.3 ; 20.6 ; 18.1; 21.4; 22; 25.4; 27.1; 40.3; 57; 76.6; 52.3; 19.5; 11.2; 7.6; 14.6; 16.2; 24.7]
l = [4; 6.1; 9.8; 35.2; 59.4; 41.7; 19; 13; 8.3; 9.1; 7.4; 8; 12.3; 19.5; 45.7; 51.1; 29.7; 15.8; 9.7; 10.1; 8.6]

##para plotar o gráfico com os dados da tabela juntamente com o modelo ideal
plot(T,U[1,:],color="red",label="Presas Ideal",xlabel="Tempo",ylabel="Pop. Presas e Predadores")
plot!(T,U[2,:],color="blue",label="Predadores Ideal")
scatter!(l, label = "Linces", c=:lightblue, ms=3)
scatter!(c, label="Coelhos", c=:red, ms=3)
