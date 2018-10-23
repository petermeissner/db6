#' db_get_info
#'
#' @param con
#'
#' @export
#'
#'
db_get_info <-
  function(con){
    switch(
      class(con),
      SQLiteConnection     = db_get_info_SQLiteConnection(con),
      AnsiConnection       = db_get_info_AnsiConnection(con),
      PostgreSQLConnection = db_get_info_PostgreSQLConnection(con),
      list()
    )
  }



#' @rdname db_get_info
db_get_info_SQLiteConnection <-
  function(con) {
      list(
        class  = "SQLiteConnection",
        dbname = con@dbname
      )
    }

#' @rdname db_get_info
db_get_info_AnsiConnection <-
  function(con) {
    list(
      class  = "AnsiConnection",
      dbname = NULL
    )
  }


#' @rdname db_get_info
db_get_info_PostgreSQLConnection <-
  function(con) {
    info <- DBI::dbGetInfo(con)
    list(
      class            = "PostgreSQLConnection",
      version          = info$serverVersion,
      dbname           = info$dbname,
      user             = info$user,
      host             = info$host,
      port             = info$port,
      protocol_version = info$protocolVersion,
      backen_pip       = info$backendPID,
      rs_id            = info$rsId
    )
  }
