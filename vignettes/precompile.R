# Precompiled vignettes that depend on `vdat.exe`

# borrowed from https://github.com/ropensci/eia/blob/master/vignettes/precompile.R
# and this blog post https://ropensci.org/blog/2019/12/08/precompute-vignettes/

# Changed file naming construct from .Rmd.Orig to _(.*).Rmd as pkgdown will
#   skip compiling Rmd files starting with "_", but it stil allows me to
#   build/knit/work locally.
# https://github.com/r-lib/pkgdown/issues/1593

library(knitr)
knit("vignettes/_how-to-use-rvdat.Rmd", "vignettes/how-to-use-rvdat.Rmd")
knit("vignettes/_vdat-data-structure.Rmd", "vignettes/vdat-data-structure.Rmd")
