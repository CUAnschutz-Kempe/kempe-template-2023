# Authors: Rachel A Wilson and Lasy Johnson
# Date: 2023-01-24
# Purpose: design Kempe template for graphs




# INSTRUCTIONS ------------------------------------------------------------



# Install everything in the `install-packages` section once.
# Then just press ctrl+alt+r to run this whole file whenever you want to
# start making graphs with the Kempe theme.




# install-packages --------------------------------------------------------
# Remove `#` so you can run the code. You only need to install packages once
# For the `remotes` installs, your console will ask where you want to install
# the package from. Press `1` and `Enter` to install "All" mecessary parts.

# install.packages(c("tidyverse", "quantreg", "maps", "sysfonts", "showtext", "gganimate", "rayshader", "remotes"))
# remotes::install_github("DavideCannata/cutR")
# remotes::install_github("davidsjoberg/ggsankey")
# remotes::install_github("coolbutuseless/ggpattern")

# load-packages -----------------------------------------------------------
# these packages are necessary for the Kempe theme leave this part active.

requireNamespace("sysfonts") # install.packages("sysfonts")
requireNamespace("showtext") # install.packages("showtext")
requireNamespace("ggplot2")  # install.packages("tidyverse")
requireNamespace("grid")

# fonts -------------------------------------------------------------------

# load fonts
sysfonts::font_add_google(name = "Montserrat" , family = "Montserrat" )
sysfonts::font_add_google(name = "Roboto"     , family = "Roboto"     )

# activate fonts for new graphs
showtext::showtext_auto(enable = TRUE, record = TRUE)

# color-palettes ----------------------------------------------------------
kempe_palette <- c(
  "#004C97", # cerulean
  "#FFC845", # sunshine
  "#002855", # navy
  "#B1B3B3", # cement
  "#6BA5C5", # dusty sky
  "#F58C35", # bright marigold
  "#749671", # meadow grass
  "#A05A9D") # lilac

# set default color for monochromatic graphs as cerulean
ggplot2::update_geom_defaults("point"   , list(fill = kempe_palette[1], color = kempe_palette[1] ))
ggplot2::update_geom_defaults("line"    , list(fill = kempe_palette[1], color = kempe_palette[1] ))
ggplot2::update_geom_defaults("bar"     , list(fill = kempe_palette[1]                           ))
ggplot2::update_geom_defaults("tile"    , list(fill = kempe_palette[1]                           ))
ggplot2::update_geom_defaults("density" , list(                         color = kempe_palette[1] ))
ggplot2::update_geom_defaults("segment" , list(                         color = kempe_palette[1] ))

# set default palette for multichromatic graphs as Kempe palette
scale_fill_kempe  <- function(...) {ggplot2::scale_fill_manual(..  , values = kempe_palette)}
scale_color_kempe <- function(...) {ggplot2::scale_color_manual(... , values = kempe_palette)}

# set default palette for gradients from 0 -> +Inf as Cerulean -> Sunshine
scale_fill_gradient_kempe   <- function(...) {ggplot2::scale_fill_gradient(...   , low = kempe_palette[1], high = kempe_palette[2])}
scale_color_gradient_kempe  <- function(...) {ggplot2::scale_color_gradient(...  , low = kempe_palette[1], high = kempe_palette[2])}

# set default palette for gradients from -Inf -> 0 -> +Inf as Cerulean -> Cement -> Sunshine
scale_fill_gradient2_kempe  <- function(...) {ggplot2::scale_fill_gradient2(...  , low = kempe_palette[1], high = kempe_palette[2], mid = kempe_palette[4])}
scale_color_gradient2_kempe <- function(...) {ggplot2::scale_color_gradient2(... , low = kempe_palette[1], high = kempe_palette[2], mid = kempe_palette[4])}

# theme -------------------------------------------------------------------

# this argument ovderwrite isn't working
# facet_grid <- function() {ggplot2::facet_grid(switch = "y")}

# set default text as Roboto and title text as Montserrat
# other defaults come from theme_bw
theme_kempe <- function() {
  ggplot2::`%+replace%`(
    ggplot2::theme_bw(),
    ggplot2::theme(
      
      # set text elements
      text        = ggplot2::element_text(family = "Roboto"     , size = ggplot2::rel(1), face = "plain" , margin = ggplot2::margin(t=8,r=8,b=8,l=8, unit="pt")),
      title       = ggplot2::element_text(family = "Montserrat" , size = ggplot2::rel(1.25), face = "bold"  ),# , margin = ggplot2::margin(t=8,b=8                   )),
      strip.text  = ggplot2::element_text(                        size = ggplot2::rel(1.1),                   margin = ggplot2::margin(t=12,b=12                  )),
      axis.text.y = ggplot2::element_text(                                                    margin = ggplot2::margin(r=0,b=0, unit="pt")),
      axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t=0,b=0)),
      # # set rectangular elements
      # panel.border     = ggplot2::element_rect(fill = NA       , color = "grey20" ),
      # strip.background = ggplot2::element_rect(fill = "grey85" , color = "grey20" ),
      # panel.background = ggplot2::element_rect(fill = "white"  , color = NA       ),
      # legend.key       = ggplot2::element_rect(fill = "white"  , color = NA       ),
      
      # set panel elements
      # plot.margin      = ggplot2::margin(t=16,r=16,b=16,l=16, unit="pt"),

      panel.spacing    = ggplot2::unit(0, "points"), # 4
      # panel.spacing.x = grid::unit(0, "points"),
      # panel.spacing.y = grid::unit(0, "points"),
      
      # panel.grid       = ggplot2::element_line(color = "grey92"              ), 
      # panel.grid.minor = ggplot2::element_line(linewidth = ggplot2::rel(0.5) ),
      complete = TRUE
    )
  )
}

ggplot2::theme_set(theme_kempe())
