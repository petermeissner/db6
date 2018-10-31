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
class_db_table <-
  R6::R6Class(
    classname = "db_table",
    inherit   = "db_table_prototype",


    ##### PRIVATE --------------------------------------------------------------
    private =
      list(
      ),


    ##### PUBLIC ---------------------------------------------------------------
    public =
      list(

        # method -- initialize
        initialize =
          function(
          ){

          },

        # method -- table_append -----------------------------------------------
        append =
          function(){

          },

        # method -- table_append -----------------------------------------------
        replace =
          function(){

          },

        # method -- table_delete -----------------------------------------------
        delete =
          function(){

          }
      ),

    ##### ACTIVE ---------------------------------------------------------------

    active =
      list(
      )
  )






















