# killing the process gracefully
plumberSession$signal(2)
Sys.sleep(2)


# hard cill if necessary
if (isTRUE(plumberSession$is_alive())) {
  plumberSession$kill()
}


if (!isTRUE(plumberSession$is_alive())) {
  cat("Plumber Session erfolgreich beendet.")
}