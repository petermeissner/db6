context("class_db_con")


test_that(
  "connecting works at all",
  {
    expect_true({
      if ( require(RSQLite) == TRUE ) {
        new_db_con(RSQLite::SQLite)

        TRUE == TRUE
      }
    })
  })


test_that(
  "info works",
  {
    expect_true({
      if ( require(RSQLite) == TRUE ) {
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$info()

        TRUE == TRUE
      }
    })
  })


test_that(
  "re-connecting works",
  {
    expect_true({
      if ( require(RSQLite) == TRUE ) {
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$connect()
        dbcon$disconnect()
        dbcon$info()

        DBI::dbIsValid(dbcon$con) == TRUE
      }
    })

    expect_true({
      if ( require(RSQLite) == TRUE ) {
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$disconnect()

        DBI::dbIsValid(dbcon$con) == TRUE
      }
    })
  })







