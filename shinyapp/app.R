library(shiny)
library(readxl)
devtools::install_github("International-Soil-Radiocarbon-Database/ISRaD/Rpkg")
library(ISRaD)

# Define UI for data upload app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel(title = div(img(src = "ISRaDlogoTextBelow_small2.png", 
                             height = 104, width = 177),
                         "QA/QC",
                         style = "font-family:Avenir Roman;font-size:64px;")),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("file1", "Choose .xlsx file",
                multiple = TRUE,
                accept = c(".xlsx")),
      
      # Horizontal line ----
      tags$hr(),
      
      downloadButton('report', "Generate Report")),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Data file ----
      textOutput("myFileName")
      
    )
    
  )
)

# Define server logic to read selected file ----

server <- function(input, output){
  file_name <- function() {
    paste0("QAQC_", gsub("\\.xlsx", ".txt", basename(input$file1$name)))
  }
  content <- function(file){
      QAQC(input$file1)
    }
}

# Run the app ----
shinyApp(ui, server)













