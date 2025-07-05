port <- httpuv::randomPort()

plumberSession <-
  callr::r_bg(
    func = function(port) {
      # Die aktuellste Paket Version wird geladen
      devtools::load_all()
      # plumber.R File wird aus dem inst/ Order des ueTEC Paketes in den root gelegt
      sysdir <- system.file("api", package = "bestPlumber")
      # plumber.R File wird ausgeführt
      plumber::pr(file.path(sysdir, "plumber.R")) |>
        plumber::pr_run(host = "0.0.0.0", port = port)
    },
    args = list(port = port),
    env = c(STAGE = Sys.getenv("STAGE"), APIKEY = Sys.getenv("APIKEY")),
    package = TRUE
  )

# Wartet bis die API gestartet wurde
for (i in 1:20) {
  apiReady <- try(
    suppressWarnings(
      expr = {
        socketConnection(
          "localhost",
          port = port,
          open = "r+",
          blocking = TRUE,
          timeout = 0.5
        )
      }
    ),
    silent = TRUE
  )
  if (!inherits(apiReady, "try-error")) {
    # Wenn die Verbindung erfolgreich ist
    # wird der loop abgebrochen
    close(apiReady)
    break
  }
  Sys.sleep(0.5)
}

# Öffnet die Swagger Oberfläche im Standard Browser
browseURL(
  url = sprintf("http://localhost:%s/__docs__/", port),
  browser = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
)
