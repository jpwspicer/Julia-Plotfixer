# Julia Plotfixer

A function to standardize Julia's Matplotlib output, similar to a uniform stylesheet in CSS.

Usage:
1. Download `plotfixer.jl` above and move it into Julia's path (with the scripts you'll be calling it from).
2. Edit the parameters in the first section of `plotfixer.jl` script (colors, linewidths, etc.). These are how Plotfixer controls the look and feel of Julia/Matplotlib output.
3. In the script `.jl`/`.ipynb` file(s) where you create the plot, add the following code:
```julia
# Bring plotfixer into the current script:
include("plotfixer.jl")

# Do plotting:
plot(x, y, kwargs...)

# Call plotfixer:
plotfixer()
```