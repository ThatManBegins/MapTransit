shinyApp(
  ui = dashboardPage(
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
    sidebar = dashboardSidebar(),
    body = dashboardBody(
      box(background = "red"),
      box(background = "blue"),
      box(background = "navy"),
      box(
        title = "Update box sidebar",
        closable = TRUE,
        width = 12,
        height = "500px",
        solidHeader = FALSE,
        collapsible = TRUE,
        actionButton("update", "Toggle card sidebar"),
        sidebar = boxSidebar(
          id = "mycardsidebar",
          p("Sidebar Content")
        )
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
    title = "DashboardPage"
  ),
  server = function(input, output, session) {
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
  }
)


