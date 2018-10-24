#' new_db_con
#'
#' @param drv_fun A function returning a database driver - e.g.: DBI::ANSI,
#'     RSQLite::SQLite, ...
#' @param ... paremeter passed through \code{class_db_con$new(...)} which passes
#'   them through to DBI::dbConnect(drv_fun(), ...) - see \link[DBI]{dbConnect}.
#'
#' @export
#'
new_db_con <- function(drv_fun, ...){
  stopifnot(is.function(drv_fun))
  class_db_con$new(drv_fun, ...)
}

