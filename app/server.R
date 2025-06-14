# server


# Define the server logic
server <- function(input, output, session) {
  
  
  observe(print(input$mycardsidebar))
  observeEvent(input$update, {
    updateBoxSidebar("mycardsidebar")
  })
  observeEvent(input$sidebar, {
    if (input$sidebar) {
      showModal(modalDialog(
        title = "Alert",
        "The sidebar is opened.",
        easyClose = TRUE,
        footer = NULL
      ))
    }
  })
  observeEvent(input$sidebarToggle, {
    updateSidebar("sidebar")
  })
  observe({
    print(input$sidebar)
  })
  
  
  # Render the initial map with the default tile provider
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("OpenStreetMap.Mapnik", group = "base") %>%
      setView(lng = 0, lat = 0, zoom = 2)
  })
  
  # Update the map when a new tile provider is selected
  observeEvent(input$tile_provider, {
    leafletProxy("map") %>%
      clearGroup("base") %>%
      addProviderTiles(input$tile_provider, group = "base")
  })
  
  # Handle country selection with Canvas renderer
  observeEvent(input$selected_countries, {
    leafletProxy("map") %>%
      clearGroup("countries") %>%
      addPolygons(
        data = countries,
        fillColor = ifelse(countries$name %in% input$selected_countries, "red", "white"),
        weight = 1,
        fillOpacity = 0.5,
        group = "countries",
        label = ~name
        # ,
        # renderer = leaflet::canvasRenderer()
      )
  })
  
  # Handle city selection
  observeEvent(input$selected_cities, {
    leafletProxy("map") %>%
      clearGroup("cities") %>%
      addCircleMarkers(
        data = cities,
        lng = ~lng,
        lat = ~lat,
        color = ifelse(cities$name %in% input$selected_cities, "blue", "gray"),
        radius = 5,
        fillOpacity = 0.8,
        group = "cities",
        label = ~name
      )
  })
  
  # Set initial view
  observeEvent(input$set_initial, {
    leafletProxy("map") %>%
      setView(lng = input$init_lng, lat = input$init_lat, zoom = input$init_zoom)
  })
  
  # Handle transition
  observeEvent(input$transition, {
    leafletProxy("map") %>%
      flyTo(
        lng = input$final_lng,
        lat = input$final_lat,
        zoom = input$final_zoom,
        options = list(duration = input$transition_time)
      )
  })
}
