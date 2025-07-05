error_handler <-
  function(req, res, err) {
    ID <- make_id()
    logger::log_error(paste(err$message, ID))
    if (inherits(err, "dberror")) {
      res$status <- 500
      resp <- list(
        success = FALSE,
        messages = data.frame(
          status = "error",
          message = paste("Fehler beim Datenbankzugriff.", ID)
        )
      )
    } else if (inherits(err, "myerror")) {
      resp <- list(
        success = FALSE,
        messages = data.frame(
          status = "error",
          message = paste("Fehler mit mehreren Nachrichten.", ID)
        )
      )
    } else if (inherits(err, "error")) {
      if (res$status == 200L) {
        res$status <- 500
        resp <- list(
          success = FALSE,
          messages = data.frame(
            status = "error",
            message = paste("Fehler beim Ausführen der Aktion.", ID)
          )
        )
      } else {
        resp <- list(
          success = FALSE,
          messages = data.frame(
            status = "error",
            message = paste(conditionMessage(err), ID)
          )
        )
      }
    }
    res$setHeader("Content-Type", "application/json")
    res$body <- jsonlite::toJSON(resp, auto_unbox = TRUE)
    return(res$toResponse())
  }