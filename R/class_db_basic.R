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

class_db_basic <-
  R6::R6Class(
    classname = "db_basic",
    inherit   = class_db_raw,
    public =
      list(

      )
  )

