server <- function(input, output, session) {

	output$timer <- renderText({
		Sys.sleep(5)
		return(1)
		})

	output$Plot <- renderPlot({

		par(bg = "#7f8c8d", col.axis = "#efefef", col.lab="#efefef",
			bty = "n", cex.lab = 1.5, cex.axis=1.25, las = 1)
		hist(rnorm(1000), freq = FALSE, nclass = 10,
			col = "cyan", border="purple", main = "")

		})

	session$onSessionEnded(function() { stopApp() })
}

ui <- fluidPage(

	tags$head(
        tags$link(rel="stylesheet", type="text/css", href="styling.css")
        ),

	tags$h1(id="page-title", class="center", "Progress Bar"),

	column(6, offset = 3, class="well",
		h6(verbatimTextOutput("timer"),
                        style="visibility: collapse; height: 0px;"),
		conditionalPanel("output.timer != '1'",
			tags$h2(class="center", "Loading data...", img(id="ajax-loader", src="ajax-loader.gif"))
			),
		conditionalPanel("output.timer == '1'",
			tags$h2(class="center", "Done!"),
			plotOutput("Plot")
			)
		)
)

shinyApp(ui = ui, server = server)
