
authentificate <- function(req, res) {
  apikey <- req$HTTP_APIKEY
  if (is.null(apikey)) {
    res$status = 417
    list("No APIKEY supplied.")
  } else if (apikey != Sys.getenv("APIKEY")) {
    res$status <- 401
    list("Invalid APIKEY supplied")
  } else {
    logger::log_success("Authentification OK")
    plumber::forward()
  }
}