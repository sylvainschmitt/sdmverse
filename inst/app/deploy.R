library(devtools)
install_github("sylvainschmitt/sdmverse",
                         upgrade = "never", force = TRUE)
rsconnect::deployApp(appName = "smdverse", appDir = "./inst/app",
                     account = "sylvainschmitt", forceUpdate = TRUE)
