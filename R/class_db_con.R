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
#' @return Object of \code{\link{R6Class}} with methods for communication with lightning-viz server.
#'
#' @format \code{\link{R6Class}} object.
#'
#'
#' @field con
#'
#' @section Methods:
#'
#' \describe{
#'   \item{initialize}{will either set up connection}
#' }
class_db_con <-
  R6::R6Class(
    classname = "db_con",

    ##### PRIVATE --------------------------------------------------------------
    private =
      list(
        inits = list(),
        conn  = NULL
      ),


    ##### PUBLIC ---------------------------------------------------------------
    public =
      list(

        # method -- connect
        connect =
          function(){
            private$conn <- do.call(db_connect, private$inits$dots)
          },


        # method -- initialize
        initialize =
          function(
            ...
          ){

            # save inits
            private$inits$dots <- list(...)

            # set connection field
            self$con <- self$connect()
          },


        # method -- info
        info = function() { db_get_info(self$con) },


        # method -- disconnect
        disconnect =
          function(){
            DBI::dbDisconnect(self$con)
          }
      ),

    ##### ACTIVE ---------------------------------------------------------------

    active =
      list(
        con =
          function(value){

            if ( missing(value) ){    # --> # normal return

              # check connection validity
              # and (re-)connect if necessary
              if ( ! DBI::dbIsValid(private$conn) ) {
                self$connect()
              }

              # return connecion
              return(private$conn)

            } else {                  # --> normal assignment

              private$conn <- value

            }
          }
      )
  )






















