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

    #### OPTIONS ###############################################################
    classname    = "db",
    active       = NULL,
    inherit      = NULL,
    lock_objects = FALSE,
    lock_class   = FALSE,
    class        = TRUE,
    parent_env   = asNamespace('db6'),
    cloneable    = FALSE,



    #### PUBLIC ################################################################
    public =
      list(

        # method -- initialize -------------------------------------------------
        initialize =
          function(drv_fun, ...){

            # initialize con
            private$db_con <- new_db_con(drv_fun = drv_fun, ...)

            # copy public interface to field con
            self$con <- r6_extract_methods(private$db_con)

            # copy public interface to field con
            self$tables$.proto <- new_db_table_prototype(private$db_con)
          },

        # method -- initialize -------------------------------------------------
        finalize =
          function(){
            private$db_con$disconnect()
          },

        # field -- con ---------------------------------------------------------
        con = NULL,

        # field -- tables ------------------------------------------------------
        tables = NULL,


        # method -- info -------------------------------------------------------
        info =
          function(){

          },

        # method -- info_tables ------------------------------------------------
        info_tables =
          function(){
            DBI::dbListTables(private$db_con$con)
          }
      ),



    #### PRIVATE ###############################################################
    private =
      list(
        db_con = NULL
      )
  )















