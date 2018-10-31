#' Class providing object with methods for communication with lightning-viz server
#'
#' @docType class
#'
#' @importFrom R6 R6Class
#'
#' @export
#'
#' @keywords data
#'
#' @format \code{\link{R6Class}} object.
#'
#'
#' @field con
#'
#' @section Methods:
#'
#' \describe{
#'   \item{???}{???}
#' }
#'
#'
class_db_table_prototype <-
  R6::R6Class(

    #### OPTIONS ###############################################################
    classname = "db_table_prototype",
    inherit      = NULL,
    lock_objects = FALSE,
    lock_class   = FALSE,
    class        = TRUE,
    parent_env   = asNamespace('db6'),
    cloneable    = FALSE,



    ##### PRIVATE --------------------------------------------------------------
    private =
      list(
        db_con = NULL
      ),


    ##### PUBLIC ---------------------------------------------------------------
    public =
      list(

        # method -- initialize
        initialize =
          function(
            db_con = NULL
          ){
            private$db_con <- db_con
          },

        # method -- table_copy -------------------------------------------------
        copy =
          function(..., overwrite = TRUE){
            dots = list(...)

            DBI::dbWriteTable(
              conn      = private$db_con$con,
              name      = names(dots)[1],
              value     = dots[[1]],
              overwrite = overwrite,
              row.names = FALSE,
              ...
            )
          },

        # method -- table_create -----------------------------------------------
        create =
          function(...){
            dots <- list(...)
            DBI::dbCreateTable(
              conn   = private$db_con$con,
              name   = names(dots)[1],
              fields = dots[[1]]
            )
          }

      ),

    ##### ACTIVE ---------------------------------------------------------------

    active =
      list(
      )
  )






















