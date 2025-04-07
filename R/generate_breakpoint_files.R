# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


files <- list.files("~/Desktop/BESAA/codes/BESAA/docs/breakpoints/", full.names = FALSE)
for(i in files){
  ref2 <- read.delim(paste0("~/Desktop/BESAA/codes/BESAA/docs/breakpoints/", i))
  ref2 <- paste0(ref2$arm, "_", ref2$telcent, "_", ref2$direction)
  i <- gsub(".txt", "", i)
  save(ref2, file = paste0("data/", i, ".RData"))
}
