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
}
#### REQUIRE RSQLite -- END ####################################################



