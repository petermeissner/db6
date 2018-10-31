context("class_db")



#### REQUIRE RSQLite -- START ##################################################
if ( require("RSQLite") == TRUE ) {

  test_that(
    "db works at all",
    {
      expect_true({
        db <- new_db(RSQLite::SQLite)
        rm(db)
        TRUE == TRUE
      })
    })

  test_that(
    "connection duplication works at all",
    expect_true({
      db <- new_db(RSQLite::SQLite, tempfile())
      db$db_exec("create table abc (a int)")
      db$db_exec("insert into abc (a) values (1),(2),(3)")
      db$db_get("select * from abc")
      db_con2 <- db$con$duplicate()
      DBI::dbListTables(db_con2$con) == "abc"
    })
  )
}
#### REQUIRE RSQLite -- END ####################################################



