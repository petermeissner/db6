#' Class describing object of type db
#'
#' @docType class
#'
#' @importFrom R6 R6Class
#'
#' @export
#'
#' @keywords data
#'
#' @return Object of \code{\link{R6Class}} with methods for communication with lightning-viz server.
#'
#' @format \code{\link[R6]{R6Class}} object.
#'
#'
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{method()}}{description}
#'   }

class_db <-
  R6::R6Class(
    classname    = "db",
    active       = NULL,
    inherit      = NULL,
    lock_objects = FALSE,
    lock_class   = FALSE,
    class        = TRUE,
    parent_env   = asNamespace('db6'),
    cloneable    = FALSE,

    public =
      list(
        initialize =
          function(drv_fun, ...){
            private$dbcon <- new_db_con(drv_fun = drv_fun, ...)
          }
      ),

    private =
      list(
        dbcon = NULL
      )
  )


