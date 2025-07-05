usethis::use_package("bestPlumber")

renv::init()

renv::snapshot()

desc::desc_add_author(
  given = "Christoph",
  family = "Noller",
  email = "noller.christoph@gmail.com",
  role = c("cre"),
  comment = c(ORCID = "0000-0003-1854-9408")
)

usethis::use_mit_license("Christoph Noller")

usethis::use_pkgdown()

usethis::use_testthat(3)

lintr::use_lintr()

usethis::edit_r_environ(scope = "project")

usethis::use_package("renv")

renv::snapshot()

rmarkdown::render("README.Rmd", output_format = "md_document")
