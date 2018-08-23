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
#' @format \code{\link{R6Class}} object.
#'
#'
#' @field con
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{gallery(imgpathvector)}}{This method uploads images from vector of file paths \code{imgpathvector} to the server and creates a gallery of these images.}
#'   }


class_db_raw <-
  R6::R6Class(
    classname = "db_raw",
    public =
      list(

        # [field] cons
        #   a list of connections
        cons = list(),

        # [field] connection pointer
        connection_pointer = 1,

        # [method] get connection
        get_next_connection =
          function(){
            self$cons[[ (self$connection_pointer %% length(self$cons)) + 1 ]]
          },

        # [method] connect
        connect =
          function(
            con   = NULL,
            ...,
            n_con = 1
          ){
            # check n_con parameter
            stopifnot(n_con >= 1)

            # open connections
            for ( i in seq_len(n_con) ){
              self$cons[[ length(self$cons) + 1 ]] <-
                class_db_con$new(con = con, ...)
            }
          },

        # [method] initialize
        initialize =
          function(con = NULL, ..., n_con = 1){
            self$connect(con = con, ..., n_con = n_con)
          }
      )
  )






















