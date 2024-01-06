# Precompiled vignettes that depend on `vdat.exe`
# borrowed from https://github.com/ropensci/eia/blob/master/vignettes/precompile.R
# and this blog post https://ropensci.org/blog/2019/12/08/precompute-vignettes/

library(knitr)
knit("vignettes/how-to-use-rvdat_RAW.Rmd", "vignettes/how-to-use-rvdat.Rmd")
knit("vignettes/vdat-data-structure_RAW.Rmd", "vignettes/vdat-data-structure.Rmd")
