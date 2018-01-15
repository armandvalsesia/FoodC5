# Author: docker
###############################################################################


get_extdata_dir <- function(pkgname) {
  ### do not use devtools shimmed system.file
  dir <- base::system.file("extdata", package = pkgname)
  if (identical(dir, '')) {
    dir <- base::system.file("inst", "extdata", package = pkgname)
    if (!nzchar(dir)) stop(sprintf('can not find extdata dir for pkg "%s"', pkgname))
  }
  dir
}
