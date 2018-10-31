context("class_db_con")



#### REQUIRE RSQLite -- START ##################################################
if ( require("RSQLite") == TRUE ) {

  test_that(
    "class_db_con works at all",
    {
      expect_true({
        new_db_con(RSQLite::SQLite)
        TRUE == TRUE
      })
    })


  test_that(
    "info works",
    {
      expect_true({
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$info()
        TRUE == TRUE
      })
    })


  test_that(
    "re-connecting works",
    {
      expect_true({
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$connect()
        dbcon$disconnect()
        dbcon$info()

        DBI::dbIsValid(dbcon$con) == TRUE
      })

      expect_true({
        dbcon <- new_db_con(RSQLite::SQLite, dbname = ":memory:")
        dbcon$disconnect()

        DBI::dbIsValid(dbcon$con) == TRUE
      })
    })

  test_that(
    "connection duplication works at all",
    expect_true({
      db_con <- new_db_con(RSQLite::SQLite, tempfile())
      DBI::dbExecute(db_con$con, "create table abc (a int)")
      DBI::dbExecute(db_con$con, "insert into abc (a) values (1),(2),(3)")
      DBI::dbGetQuery(db_con$con, "select * from abc")
      db_con2 <- db_con$duplicate()
      DBI::dbListTables(db_con2$con) == "abc"
    })
  )

}
#### REQUIRE RSQLite -- END ####################################################






