using PyCall, PyPlot
@pyimport matplotlib.font_manager as fm

# Function to standardize Julia Matplotlib output, similar to a stylesheet in CSS.
# Usage:

#       include("plotfixer.jl")
#       plot(x, y, kwargs...)
#       plotfixer()

# Author: James Spicer, 2017.

function plotFixer()
    #################   EDIT BELOW THIS LINE   #################
    
    # Figure Font
#     fontPath = "/Windows/Fonts/OpenSans-Regular.ttf"
#     fontPath = "/Windows/Fonts/ITCKRIST.TTF"
    fontPath = "/Library/Fonts/OpenSans-Regular.ttf"
    
    # Areas
    facecolor_leg = "white"
    alpha_leg     = 1
    color_axes    = "white"
    layout_tight  = true
    
    
    # Line Colors
    color_axis = "k"
    color_grid = rgb(139,140,148)
    color_tick = "k" # Also sets tickLabel colors
    color_leg  = "k"
    
    
    # Line Widths
    width_axis = 0.5
    width_grid = 0.5
    width_leg  = 0.5
    width_tick = 0.5
    
    
    # Text Colors
    color_title     = "k"
    color_axisLabel = "k"
    color_legText   = "k"
    color_legTitle  = "k"
    
    
    # Text Sizes
    size_title     = 14
    size_axisLabel = 12
    size_tickLabel = 12
    size_legText   = 10
    size_legTitle  = 12
    
    
    # Padding - Distance from Axes
    pad_tick      = 10
    pad_title     = 1.1
    pad_axisLabel = -0.11
    
    
    ##############   DON'T EDIT BELOW THIS LINE   ##############
        
    fig = gcf()
    
    for ax in fig[:get_axes]()
        
        # Background Color
        ax[:set_axis_bgcolor](color_axes)

        # Title
        titleFont = fm.FontProperties(fname=fontPath, size=size_title)
        setp(ax[:title], color=color_title, fontproperties=titleFont, y=pad_title)


        # Tick Label Fonts (colors are set in 'Ticks')
        tickLabelFont = fm.FontProperties(fname=fontPath, size=size_tickLabel)
        [setp(axis[:get_ticklabels](), fontproperties=tickLabelFont) for axis in [ax[:xaxis], ax[:yaxis]]]

        
        # Ticks
        [ax[:tick_params](axis=axis, colors=color_tick, pad=pad_tick, width=width_tick) for axis in ["x", "y"]]


        # Legend
        setp(ax[:get_legend]()[:get_frame](), linewidth=width_leg, facecolor=facecolor_leg, alpha=alpha_leg)

        
        # Legend Texts
        legTextFont = fm.FontProperties(fname=fontPath, size=size_legText)
        setp(ax[:get_legend]()[:get_texts](), color=color_legText, fontproperties=legTextFont)
        
        # Legend Title
        legTitleFont = fm.FontProperties(fname=fontPath, size=size_legTitle)
        setp(ax[:get_legend]()[:get_title](), color=color_legTitle, fontproperties=legTitleFont)


        # Grid
        [setp(lines, color=color_grid, linewidth=width_grid) for lines in [ax[:get_xgridlines](), ax[:get_ygridlines]()]]


        # Axis Labels
        axisLabelFont = fm.FontProperties(fname=fontPath, size=size_axisLabel)
        [setp(axis[:label], color=color_axisLabel, fontproperties=axisLabelFont) for axis in [ax[:xaxis], ax[:yaxis]]]
        ax[:xaxis][:set_label_coords](0.5, pad_axisLabel) 
        ax[:yaxis][:set_label_coords](pad_axisLabel, 0.5) 


        # Axes
        [setp(ax[:spines][axis], color=color_axis, lw=width_axis) for axis in ["bottom", "left", "top", "right"]]

        ax[:set_axisbelow](true)
    end

    layout_tight && fig[:tight_layout]()
end