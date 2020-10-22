using NewtonMethod2
using Test

@testset "NewtonMethod2.jl" begin

### 2 & 3 & 4
f(x)=x^2+2*x-3
f_prime(x)=2*x+2
x0=2.0
t2=newtonroot(f, f_prime; x0, tol=1E-7, maxiter=1000)[1]
t3=newtonroot2(f; x0, tol=1E-7, maxiter=1000)[1]
t4=newtonroot(f, f_prime; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
t5=newtonroot2(f; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
@test t2 ≈ 1.0
@test t3 ≈ 1.0
@test t4 ≈ 1.0
@test t5 ≈ 1.0

f(x)=x^2+2*x-8
f_prime(x)=2*x+2
x0=1.0
t2=newtonroot(f, f_prime; x0, tol=1E-7, maxiter=1000)[1]
t3=newtonroot2(f; x0, tol=1E-7, maxiter=1000)[1]
t4=newtonroot(f, f_prime; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
t5=newtonroot2(f; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
@test t2 ≈ 2.0
@test t3 ≈ 2.0
@test t4 ≈ 2.0
@test t5 ≈ 2.0

f(x)=x-2
f_prime(x)=1
x0=0.0
t2=newtonroot(f, f_prime; x0, tol=1E-7, maxiter=1000)[1]
t3=newtonroot2(f; x0, tol=1E-7, maxiter=1000)[1]
t4=newtonroot(f, f_prime; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
t5=newtonroot2(f; x0=BigFloat(x0), tol=1E-7, maxiter=1000)[1]
@test t2 ≈ 2.0
@test t3 ≈ 2.0
@test t4 ≈ 2.0
@test t5 ≈ 2.0



end
