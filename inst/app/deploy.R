devtools::install_github("sylvainschmitt/sdmverse", upgrade = "never")
rsconnect::deployApp(appName = "smdverse", appDir = "./inst/app", account = 'sylvainschmitt')
