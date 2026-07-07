# Equation Summary

This document uses SVG equation images so the formulas render consistently in GitHub and standard Markdown previews. Each equation also has a plain-text fallback for readability in raw mode.

## Fourier and Laplace-domain examples

The Fourier transform is treated as the frequency-domain slice of the more general Laplace-domain representation.

![Fourier transform](assets/equations/fourier_transform.svg)

```text
G(omega) = F{f(t)} = integral from 0 to infinity of f(t) * exp(-j*omega*t) dt
```

![Laplace transform](assets/equations/laplace_transform.svg)

```text
F(s) = L{f(t)} = integral from 0 to infinity of f(t) * exp(-s*t) dt,
s = sigma + j*omega
```

For the damped cosine response:

![Damped cosine response](assets/equations/damped_cosine.svg)

```text
f(t) = exp(-2*t) * cos(2*t)
```

The Laplace-domain representation is:

![Damped cosine Laplace transform](assets/equations/damped_cosine_laplace.svg)

```text
F(s) = (s + 2) / ((s + 2)^2 + 4) = (s + 2) / (s^2 + 4*s + 8)
```

The Fourier-domain representation is the slice at `s = j*omega`:

![Damped cosine Fourier-domain slice](assets/equations/damped_cosine_fourier.svg)

```text
G(omega) = F(j*omega) = (2 + j*omega) / (8 - omega^2 + 4*j*omega)
```

## Maxwell model

![Maxwell body model](assets/model_diagrams/maxwell_body.png)

A Maxwell body consists of a spring and dashpot in series. Under constant stress, the creep strain is:

![Maxwell creep](assets/equations/maxwell_creep.svg)

```text
epsilon(t) = sigma_0/E + (sigma_0/eta)*t
```

```text
sigma_0 : Applied force
epsilon : Displacement output
E       : Spring stiffness coeff.
eta     : Dashpot viscosity coeff. 
t       : Time
```

Under ideal step strain, the stress relaxation is:

![Maxwell stress relaxation](assets/equations/maxwell_relaxation.svg)

```text
sigma(t) = E*epsilon_0*exp(-E*t/eta)
```

```text
sigma     : Force output
epsilon_0 : Applied Displacement
E         : Spring stiffness coeff.
eta       : Dashpot viscosity coeff. 
t         : Time
```

## Kelvin-Voigt model

![Kelvin-Voigt body model](assets/model_diagrams/kelvin_voigt_body.png)

A Kelvin-Voigt body consists of a spring and dashpot in parallel. Under constant stress, the creep strain is:

![Kelvin-Voigt creep](assets/equations/kelvin_voigt_creep.svg)

```text
epsilon(t) = (sigma_0/E) * (1 - exp(-E*t/eta))
```

```text
sigma_0 : Applied force
epsilon : Displacement output
E       : Spring stiffness coeff.
eta     : Dashpot viscosity coeff. 
t       : Time
```

## Standard linear solid / Kelvin-body-style relaxation

![Standart linear solid body model](assets/model_diagrams/standard_linear_solid_body.png)

A compact standard linear solid representation under constant stress, the creep strain is:

![Standard linear solid creep](assets/equations/sls_creep.svg)

```text
epsilon(t) = sigma_0/E_1 * (1 - (E_2/(E_1 + E_2)) * exp(-t/tau_c))

tau_c = eta*(E_1+E_2)/(E_1*E_2)
```

```text
sigma_0   : Applied force
epsilon   : Displacement output
E_1       : Parallel spring stiffness coeff.
E_2       : Maxwell / serial spring stiffness coeff.
eta       : Dashpot viscosity coeff. 
t         : Time
tau_c     : Time constant
```

A compact standard linear solid representation is used for Kelvin-body-style stress relaxation:

![Standard linear solid relaxation](assets/equations/sls_relaxation.svg)

```text
sigma(t) = epsilon_0 * (E_1 + E_2*exp(-E_2*t/eta))
```

```text
sigma     : Force output
epsilon_0 : Applied Displacement
E_1       : Parallel spring stiffness coeff.
E_2       : Maxwell / serial spring stiffness coeff.
eta       : Dashpot viscosity coeff. 
t         : Time
```

This captures an immediate elastic response followed by partial relaxation to a nonzero equilibrium stress.

## Hill-type twitch response

![hill_type_muscle_model](assets/model_diagrams/hill_type_muscle_model.png)

The twitch impulse response is represented as the difference of two exponentials filtered by serial/parallel elastic and damping terms:

![Hill-type twitch response](assets/equations/hill_twitch.svg)

```text
F(t) = A_1 * k_SE/[tau_1*(k_SE+k_PE)-b] * [exp(-t/tau_1) - exp(-(k_SE+k_PE)*t/b)]
     - A_2 * k_SE/[tau_2*(k_SE+k_PE)-b] * [exp(-t/tau_2) - exp(-(k_SE+k_PE)*t/b)]
```

```text
A(t) = A1 * exp(-t/tau_1) - A2 * exp(-t/tau_2)
```
```text
for this workout:
A1    = 48144
A2    = 45845
tau_1 = 0.0326
tau_2 = 0.034 
A_1   = A1 * tau_1 = 1570
A_2   = A2 * tau_2 = 1559
```

```text
F(t)         : Muscle-force output
A(t)         : Active-force input
A1, A2       : Amplitude coefficients of the active-force input
tau_1, tau_2 : Exponential decay time constants
A_1, A_2     : Time-scaled amplitude coefficients
k_SE         : Serial spring stiffness coeff.
k_PE         : Parallel spring stiffness coeff.
b            : Dashpot viscosity coeff.
t            : Time
```

For repeated stimulation, twitch responses are superposed at each stimulation time:

![Twitch train superposition](assets/equations/twitch_train.svg)

```text
F_train(t) = sum from n=0 to N of F(t - n*T),
T = 1/f_stim
```

Only terms satisfying `t - n*T >= 0` contribute to the sum.

```text
F_train(t) : Total muscle force generated by repeated twitch responses
F(t)       : Single-twitch force response
n          : Stimulation index
T          : Time interval between consecutive stimulation pulses
f_stim     : Stimulation frequency
t          : Time  
```


