
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A convenience R6 class framework around DBI.

**Status**

**\[\[SKETCHING\]\]** | **\[\[WIP\]\]**

<a href="https://travis-ci.org/petermeissner/db6">
<img src="https://api.travis-ci.org/petermeissner/db6.svg?branch=master">
<a/> <a href="https://codecov.io/gh/petermeissner/db6">
<img src="https://codecov.io/gh/petermeissner/db6/branch/master/graph/badge.svg" alt="Codecov" />
</a> <a href="https://cran.r-project.org/package=db6">
<img src="http://www.r-pkg.org/badges/version/db6"> </a>
<img src="http://cranlogs.r-pkg.org/badges/grand-total/db6">
<img src="http://cranlogs.r-pkg.org/badges/db6">

*lines of R code:* 163, *lines of test code:* 0

**Version**

0.1.0 ( 2018-10-23 21:08:25 )

**Description**

**License**

MIT + file LICENSE <br>Peter Meissner \[aut, cre\], \[ctb\]

**Installation**

Stable version from CRAN:

``` r
install.packages("db6")
```

Latest development version from Github:

``` r
devtools::install_github("petermeissner/db6")
```

-----

## Connections

**loading packages**

``` r
# packages
library(RSQLite)
library(db6)
```

**setting up a connection object**

``` r
# creating con object
db_con <- new_db_con(drv_fun = SQLite, ":memory:")
```

**getting infos on the connection**

``` r
# connection infos
db_con$con
```

    ## <SQLiteConnection>
    ##   Path: :memory:
    ##   Extensions: TRUE

``` r
db_con$info()
```

    ## $class
    ## [1] "SQLiteConnection"
    ## 
    ## $dbname
    ## [1] ":memory:"

**doing auto reconnect on stale connections**

``` r
# Auto reconnect
db_con$disconnect()
db_con$con
```

    ## <SQLiteConnection>
    ##   DISCONNECTED

``` r
db_con$info()
```

    ## $class
    ## [1] "SQLiteConnection"
    ## 
    ## $dbname
    ## [1] ":memory:"

``` r
db_con$con
```

    ## <SQLiteConnection>
    ##   Path: :memory:
    ##   Extensions: TRUE
