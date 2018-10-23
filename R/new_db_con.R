#' new_db_con
#'
#' @param ... paremeter passed through \code{class_db_con$new(...)} which passes
#'   them through to DBI::dbConnect()
#'
#' @export
#'
new_db_con <- function(...){
  class_db_con$new(...)
}

