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
#   1. Add the _(.*).Rmd file to .Rbuildignore
#   2. Edit the _(.*).Rmd file
#   3. Click RStudio "knit" button as needed
#   4. When ready to add changes, run the respective "knit()" below
#   5. Commit/push to GitHub
#   6. Repeat 2-5 as needed

library(knitr)

# Need to change workind directory to get the figure paths correct.
#   see Note section in ?knitr::knit
orig_wd <- getwd()
setwd(file.path(orig_wd, "vignettes"))

knit("_how-to-use-rvdat.Rmd", "how-to-use-rvdat.Rmd")
knit("_vdat-data-structure.Rmd", "vdat-data-structure.Rmd")
knit("_vdat-data-columns.Rmd", "vdat-data-columns.Rmd")
knit("_matos-rvdat.Rmd", "matos-rvdat.Rmd")

setwd(orig_wd)
