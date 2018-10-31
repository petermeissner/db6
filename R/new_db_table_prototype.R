#' new_db_table_prototype
#'
#' @param db_con a object of class db_con -- see \link{new_db_con}, \link{class_db_con}
#'
#' @export
#'
new_db_table_prototype <- function(db_con){
  class_db_table_prototype$new(db_con = db_con)
}