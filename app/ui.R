# Ui

dashboardPage(
  # freshTheme = create_theme(
  #   adminlte_color(
  #     light_blue = "#55e7ff",
  #     blue = "#2011a2",
  #     navy = "#201148",
  #     red = "#ff34b3"
  #   ),
  #   adminlte_sidebar(
  #     dark_bg = "#D8DEE9",
  #     dark_hover_bg = "#81A1C1",
  #     dark_color = "#2E3440"
  #   ),
  #   adminlte_global(
  #     content_bg = "#FFF",
  #     box_bg = "#D8DEE9",
  #     info_box_bg = "#D8DEE9"
  #   )
  # ),
  options = list(sidebarExpandOnHover = TRUE),
  header = dashboardHeader(),
  sidebar = dashboardSidebar(
    
    # Input for tile provider selection
    selectInput("tile_provider", "Select Tile Provider", 
                choices = names(leaflet::providers), 
                selected = "OpenStreetMap.Mapnik"),
    
    # Inputs for initial and final points
    numericInput("init_lng", "Initial Longitude", value = -122.4194),
    numericInput("init_lat", "Initial Latitude", value = 37.7749),
    numericInput("init_zoom", "Initial Zoom", value = 10, min = 0, max = 20),
    numericInput("final_lng", "Final Longitude", value = -74.0060),
    numericInput("final_lat", "Final Latitude", value = 40.7128),
    numericInput("final_zoom", "Final Zoom", value = 12, min = 0, max = 20),
    numericInput("transition_time", "Transition Time (seconds)", value = 5, min = 1),
    actionButton("set_initial", "Set Initial View"),
    actionButton("transition", "Transition"),
    
    # Inputs for country and city selection
    selectInput("selected_countries", "Select Countries", choices = countries$name, multiple = TRUE),
    selectInput("selected_cities", "Select Cities", choices = cities$name, multiple = TRUE)
    
  ),
  body = dashboardBody(
    box(
      title = "Update box sidebar",
      closable = F,
      width = 12,
      height = "5000px",
      solidHeader = FALSE,
      collapsible = TRUE,
      actionButton("update", "Toggle card sidebar"),
      sidebar = boxSidebar(
        id = "mycardsidebar",
        p("Sidebar Content")
      ),
      leafletOutput("map")
    )
  ),
  controlbar = dashboardControlbar(
    id = "controlbar",
    controlbarMenu(
      id = "menu",
      controlbarItem(
        "Tab 1",
        "Welcome to tab 1"
      ),
      controlbarItem(
        "Tab 2",
        "Welcome to tab 2"
      )
    )
  ),
  title = "Map Transit"
)


# Define the UI
# ui <- fluidPage(
#   titlePanel("Map Transit: Interactive Mapping with Transitions"),
#   sidebarLayout(
#     sidebarPanel(
#       # Input for tile provider selection
#       selectInput("tile_provider", "Select Tile Provider", 
#                   choices = names(leaflet::providers), 
#                   selected = "OpenStreetMap.Mapnik"),
#       
#       # Inputs for initial and final points
#       numericInput("init_lng", "Initial Longitude", value = -122.4194),
#       numericInput("init_lat", "Initial Latitude", value = 37.7749),
#       numericInput("init_zoom", "Initial Zoom", value = 10, min = 0, max = 20),
#       numericInput("final_lng", "Final Longitude", value = -74.0060),
#       numericInput("final_lat", "Final Latitude", value = 40.7128),
#       numericInput("final_zoom", "Final Zoom", value = 12, min = 0, max = 20),
#       numericInput("transition_time", "Transition Time (seconds)", value = 5, min = 1),
#       actionButton("set_initial", "Set Initial View"),
#       actionButton("transition", "Transition"),
#       
#       # Inputs for country and city selection
#       selectInput("selected_countries", "Select Countries", choices = countries$name, multiple = TRUE),
#       selectInput("selected_cities", "Select Cities", choices = cities$name, multiple = TRUE)
#     ),
#     mainPanel(
#       leafletOutput("map")
#     )
#   )
# )
