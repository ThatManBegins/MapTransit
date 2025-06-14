# global


# install.packages("shinydashboard","shinydashboardPlus",
#                  "shiny", "leaflet", "rnaturalearth")


library(shiny)
library(leaflet)
library(rnaturalearth)
library(shinydashboard)
library(shinydashboardPlus)

# Load country boundaries
countries <- ne_countries(scale = "medium", returnclass = "sf")

# Example city data (replace with your own dataset if needed)
cities <- data.frame(
  name = c("New York", "London", "Tokyo"),
  lng = c(-74.0060, -0.1276, 139.6917),
  lat = c(40.7128, 51.5074, 35.6895)
)
