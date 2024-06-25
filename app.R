library(shiny)
library(DBI)
library(RPostgres)
library(dplyr)


get_db_connection <- function() {
  dbConnect(RPostgres::Postgres(),
            dbname = "shop_center",
            host = "localhost",
            port = 5432,
            user = "postgres",
            password = "")
}


fetch_data <- function() {
  conn <- get_db_connection()
  data <- dbGetQuery(conn, "SELECT testowe_id, produkt_nazwa, kategoria_nazwa
                    FROM testowe
                    LEFT JOIN kategorie ON testowe.kategoria_id = kategorie.kategoria_id;")
  # data <- dbGetQuery(conn, "SELECT * FROM klienci")
  dbDisconnect(conn)
  return(data)
}

# Przykładowa aplikacja Shiny
ui <- fluidPage(
  titlePanel("Shiny z PostgreSQL shop_center Adam Matuszczyk 74508"),
  tableOutput("table")
)

server <- function(input, output, session) {
  
  # Pobieranie danych po uruchomieniu serwera
  data <- fetch_data()
  
  # Wyświetlanie danych w tabeli
  output$table <- renderTable({
    data
  })
}

shinyApp(ui, server)

