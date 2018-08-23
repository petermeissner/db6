#' Class describing object of type db
#'
#' @docType class
#' @keywords data
#' @importFrom R6 R6Class
#'
#' @export
#'
#'
#' @return Object of \code{\link{R6Class}}
#'
#' @format \code{\link{R6Class}} object.
#'
#' @field con
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{gallery(imgpathvector)}}{This method uploads images from vector of file paths \code{imgpathvector} to the server and creates a gallery of these images.}
#'   }

class_db_test <-
  R6::R6Class(
    classname = "db_test",
    inherit   = class_db_basic,
    public =
      list(

        # [methods] info
        info =
          list(
            list_tables =
              function(){
                DBI::dbListFields(self$get_next_connection())
              },
            list_connections =
              function(){
                browser()
              }
          ),

        # [method] initialize
        initialize =
          function(
            con = DBI::dbConnect(RSQLite::SQLite(), dbname ="test.db"),
            n_con = 2
          ){
            self$connect(con = con, n_con = n_con)
          }
      )
  )

