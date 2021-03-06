-   [A convenience R6 class framework around
    DBI](#a-convenience-r6-class-framework-around-dbi)
    -   [Package Info](#package-info)
    -   [Objects](#objects)
    -   [Connections](#connections)

<!-- README.md is generated from README.Rmd. Please edit that file -->
A convenience R6 class framework around DBI
===========================================

**Status**

[![Project Status:
WIP.](https://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
<a href="https://travis-ci.org/petermeissner/db6">
<img src="https://api.travis-ci.org/petermeissner/db6.svg?branch=master">
<a/> <a href="https://cran.r-project.org/package=db6">
<img src="http://www.r-pkg.org/badges/version/db6"> </a> [![cran
checks](https://cranchecks.info/badges/summary/reshape)](https://cran.r-project.org/web/checks/check_results_reshape.html)
<a href="https://codecov.io/gh/petermeissner/db6">
<img src="https://codecov.io/gh/petermeissner/db6/branch/master/graph/badge.svg" alt="Codecov" />
</a> <img src="http://cranlogs.r-pkg.org/badges/grand-total/db6">
<img src="http://cranlogs.r-pkg.org/badges/db6">

*lines of R code:* 261, *lines of test code:* 73

Package Info
------------

**Version**

0.1.3 ( 2018-10-31 14:49:32 )

**Description**

A convenience R6 class framework around DBI that provides classes for
connection, db, table, … with methods around SQL verbs create, insert,
update, delete, select, … and many more.

**License**

MIT + file LICENSE <br>Peter Meissner \[aut, cre\], \[ctb\]

**Installation**

Stable version from CRAN:

    install.packages("db6")

Latest development version from Github:

    devtools::install_github("petermeissner/db6")

------------------------------------------------------------------------

Objects
-------

**db** : A representation of a database within R. The object allows to
get information about the database and objects stored in it (tables and
such), to retrieve objects from it, and to manipulate it via queries and
convenience methods.

**db\_con** : The heart and work horse of all db objects and responsible
for the actual information flow between R and the database with methods
for connect, disconnect, reconnect, querying, and manipulating the
database.

**tb\_table** : A representation of a database table with particular
methods to interact with tables - create, delete, append, copy,
retrieve, filter, peak, and update.

------------------------------------------------------------------------

Connections
-----------

**loading packages**

    # packages
    library(RSQLite)
    library(db6)

### A New Connection Object

    # creating con object
    db_con <- new_db_con(drv_fun = SQLite, ":memory:")

### Connection Infos

    # connection infos
    db_con$con

    ## <SQLiteConnection>
    ##   Path: :memory:
    ##   Extensions: TRUE

    db_con$info()

    ## $class
    ## [1] "SQLiteConnection"
    ## 
    ## $dbname
    ## [1] ":memory:"

### Auto Reconnect on Stale Connections

    # Auto reconnect
    db_con$disconnect()
    db_con$con

    ## <SQLiteConnection>
    ##   Path: :memory:
    ##   Extensions: TRUE

    db_con$info()

    ## $class
    ## [1] "SQLiteConnection"
    ## 
    ## $dbname
    ## [1] ":memory:"

    db_con$con

    ## <SQLiteConnection>
    ##   Path: :memory:
    ##   Extensions: TRUE
