module NewtonMethod

using LinearAlgebra, Statistics, ForwardDiff

function newtonroot(f, f_prime; x0, tol=1E-7, maxiter=1000)
    # setup the algorithm
    x_old = x0
    normdiff = Inf
    iter = 0
    while normdiff > tol && iter <= maxiter
        x_new = x_old-f(x_old)/f_prime(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if iter <= maxiter
        return (x_old, normdiff, iter)
    else
        return (nothing, normdiff, iter) # hope it is correct!
    end
end

export newtonroot


###


function newtonroot2(f; x0, tol=1E-7, maxiter=1000)
    D(f) = x -> ForwardDiff.derivative(f, x)
    f_prime = D(f)
    # setup the algorithm
    x_old = x0
    normdiff = Inf
    iter = 0
    while normdiff > tol && iter <= maxiter
        x_new = x_old-f(x_old)/f_prime(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if iter <= maxiter
        return (x_old, normdiff, iter)
    else
        return (nothing, normdiff, iter)
    end
end

export(newtonroot2)

end
