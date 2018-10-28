#' r6_extract_methods
#'
#' Extract public methods from R6 object instances
#'
#' @param r6 R6 object instance
#'
r6_extract_methods <-
  function(r6){
    names <- ls(r6)
    r6_m <-
      names[
        vapply(
          X   = names,
          FUN =
            function(name){
              class(r6[[name]]) %in% "function" & !(name %in% c("initialize", "finalize", "clone"))
            },
          FUN.VALUE = logical(1)
        )
        ]
    m <- as.list(r6)[r6_m]
    m
  }

