#' db_connect
#'
#' @param drv_fun
#' @param ...
#'
#' @export
#'
db_connect <-
  function(drv_fun, ...){
    DBI::dbConnect(drv_fun(), ...)
  }