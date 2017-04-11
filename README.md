# Julia Plotfixer

A function to standardize Julia's Matplotlib output, similar to a uniform stylesheet in CSS.

Usage:

```julia
include("plotfixer.jl")

# Do plotting
plot(x, y, kwargs...)

# Call plotfixer
plotfixer()
```