# Julia Plotfixer

A function to standardize Julia's Matplotlib output, similar to a uniform stylesheet in CSS.

Usage:
1. Download `plotfixer.jl` above and move it into Julia's path (with the scripts you'll be calling it from).
2. In the script `.jl` or `.ipynb` file where you create the plot, add the following code:
```julia
# Bring plotfixer into the current script:
include("plotfixer.jl")

# Do plotting:
plot(x, y, kwargs...)

# Call plotfixer:
plotfixer()
```