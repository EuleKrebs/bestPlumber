library(plumber)

# Filter --------------------------------------------------------
#* Checks for the APIKEY in request header
#* @filter auth-user
function(req, res) {
  authentificate(req, res)
}

# Endpoint ------------------------------------------------------
#* @param x
#* @get /echo
function(
  req,
  res,
  x) {
    list(x)
}