#' db_connect
#'
#' @rdname new_db_con
#'
db_connect <-
  function(drv_fun, ...){
    DBI::dbConnect(drv_fun(), ...)
  }