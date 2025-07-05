make_id <-
  function() {
    id <- paste(
      sample(
        c(sample(LETTERS, 4, replace = TRUE),
          sample(1:9, 4, replace = TRUE)),
        8
      ),
      sep = "",
      collapse = ""
    )
    return(id)
  }