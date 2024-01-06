# Precompiled vignettes that depend on `vdat.exe`
# borrowed from https://github.com/ropensci/eia/blob/master/vignettes/precompile.R
# and this blog post https://ropensci.org/blog/2019/12/08/precompute-vignettes/

library(knitr)
knit("vignettes/_how-to-use-rvdat.Rmd", "vignettes/how-to-use-rvdat.Rmd")
knit("vignettes/_vdat-data-structure.Rmd", "vignettes/vdat-data-structure.Rmd")
