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
#' @examples
#' @field con
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{gallery(imgpathvector)}}{This method uploads images from vector of file paths \code{imgpathvector} to the server and creates a gallery of these images.}
#'   }


class_db_con <-
  R6::R6Class(
    classname = "db_con",
    public =
      list(
        con = NULL,
        initialize =
          function(
            con  = NULL,
            ...
          ){

            # handle connection information
            # ... or set up connection
            # ... or use ANSI as default
            if ( is.null(con) & length(list(...)) == 0 ){
              # DEV : # con <- DBI::ANSI()
              con <- DBI::dbConnect(RSQLite::SQLite(), dbname =":memory:")
            }else{
              con <- DBI::dbConnect(...)
            }

            # set connection field
            self$con <- con
          }
      )
  )






















