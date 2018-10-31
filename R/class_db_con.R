#' A database connection
#'
#'
#' Provides wrapper object around DBIConnection objects.
#'
#' @section Features:
#'
#' \describe{
#'   \item{persistant connection information}{By capturing the connection
#'   creation function as well as all parameter needed to create connection in
#'   the first place, db_con objects are able to re-use these information.}
#'   \item{self aware}{Db_con objects can check the validity of their connection.}
#'   \item{auto reconnect}{Validity checking is used to decide whether or not the
#'   persistant conenction information should be used to reconnect because - e.g.
#'   connection timed out or was closed in the meantime.}
#' }
#'
#'
#' @docType class
#'
#' @importFrom R6 R6Class
#'
#' @export
#'
#' @keywords data
#'
#'
#' @format \code{\link{R6Class}} object.
#'
#' @section Active Bindings:
#'
#' \describe{
#'   \item{\code{con}}{Gives access to the actual DBIConnection object that is wrapped in db_con object. The active bindings (1) gives easy access to the connection as field adn (2) the active binding allows for validity checking and reconnecting in case of invalid connections leading to always fresh connections.}
#' }
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{connect(drv_fun, ...)}}{will connect to database if not already connected -- see \link{db_connect}}
#'   \item{\code{finalize()}}{will close connection}
#'   \item{\code{initialize()}}{will open connection and store all information necessary to create new connection}
#'   \item{\code{info()}}{will provide some basic information about connection}
#'   \item{\code{disconnect()}}{will close connection}
#' }
#'
#' @seealso new_db_con
#'
class_db_con <-
  R6::R6Class(
    classname = "db_con",

    ##### PRIVATE --------------------------------------------------------------
    private =
      list(
        inits       = list(),
        connection  = NULL
      ),


    ##### PUBLIC ---------------------------------------------------------------
    public =
      list(

        # method -- connect
        connect =
          function(){
            private$connection <- do.call(db_connect, private$inits$dots)
          },

        # method -- finalize

        finalize =
          function(){
            self$disconnect
          },

        # method -- initialize
        initialize =
          function(
            ...,
            auto_connect = TRUE,
            .dots = NULL
          ){

            # save inits
            if ( is.null(.dots) ){
              private$inits$dots <- list(...)
            } else {
              private$inits$dots <- .dots
            }

            private$inits$auto_connect <- auto_connect

            # set connection field
            self$connect()
          },

        # method -- duplicate
        duplicate =
          function(){
            param              <- private$inits$dots
            param$auto_connect <- private$inits$auto_connect
            do.call("new_db_con", param)
          },


        # method -- info
        info = function() { db_get_info(self$con) },


        # method -- disconnect
        disconnect =
          function(){
            DBI::dbDisconnect(private$connection)
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
              if ( !DBI::dbIsValid(private$connection) ) {
                if ( private$inits$auto_connect == TRUE ){
                  self$connect()
                } else{
                  stop("Connection is not longer valid (use db_con$connect() to reconnect to database)")
                }
              }

              # return connecion
              private$connection

            } else {                  # --> normal assignment

              private$connection <- value

            }
          }
      )
  )






















