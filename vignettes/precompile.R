# Precompiled vignettes that depend on `vdat.exe`

# borrowed from
#   https://github.com/ropensci/eia/blob/master/vignettes/precompile.R
# and this blog post
#   https://ropensci.org/blog/2019/12/08/precompute-vignettes/

# Changed file naming construct from .Rmd.Orig to _(.*).Rmd as pkgdown will
#   skip compiling Rmd files starting with "_", but it stil allows me to
#   build/knit/work locally.
# https://github.com/r-lib/pkgdown/issues/1593

# Workflow:
#   1. Edit the _(.*).Rmd file
#   2. Click RStudio "knit" button as needed
#   3. When ready to add changes, run the resepective "knit()" below
#   4. Commit/push to GitHub

library(knitr)
knit("vignettes/_how-to-use-rvdat.Rmd", "vignettes/how-to-use-rvdat.Rmd")
knit("vignettes/_vdat-data-structure.Rmd", "vignettes/vdat-data-structure.Rmd")
knit("vignettes/_vdat-data-columns.Rmd", "vignettes/vdat-data-columns.Rmd")
