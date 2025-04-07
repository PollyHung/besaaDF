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

loadCuts <- function(cuts.path) {
  # Select interested columns
  bpdf <- read.delim(cuts.path)
  colnames(bpdf) <- tolower(colnames(bpdf))
  bpdf <- bpdf %>% dplyr::select(chr, arm, cytoband, start, end, direction, telcent)
  bpdf$arm <- ifelse(!grepl("p|q", bpdf$arm),
                     paste0(bpdf$arm, gsub("[0-9]|\\.", "", bpdf$cytoband)),
                     bpdf$arm)
  bpdf$id <- paste0(bpdf$arm, "_", bpdf$telcent, "_", bpdf$direction)

  return(bpdf)
}


files <- list.files("~/Desktop/BESAA/codes/BESAA/docs/breakpoints/", full.names = FALSE)
for(i in files){
  ref2 <- loadCuts(paste0("~/Desktop/BESAA/codes/BESAA/docs/breakpoints/", i))
  i <- gsub(".txt", "", i)
  save(ref2, file = paste0("data/", i, ".RData"))
}
