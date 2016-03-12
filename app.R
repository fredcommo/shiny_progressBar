# server <- function(input, output, session) {

# 	generateData <- reactive({
# 		out <- lapply(1:5, function(ii){
# 			Sys.sleep(1)
# 			return(rnorm(200*ii, ii, .2))
# 			})
# 		return(do.call(c, out))
# 		})

# 	output$timer <- renderText({
# 		if(!is.null(generateData()))
# 			return(1)
# 		return(NULL)
# 		})

# 	output$Plot <- renderPlot({
# 		X <- generateData()

# 		par(bg = "#7f8c8d", col.axis = "#efefef", col.lab="#efefef",
# 			bty = "n", cex.lab = 1.5, cex.axis=1.25, las = 1)
# 		hist(X, freq = FALSE, breaks = input$bins,
# 			col = "cyan", border="purple", main = "")

# 		})

# 	session$onSessionEnded(function() { stopApp() })
# }

# ui <- fluidPage(

# 	tags$head(
#         tags$link(rel="stylesheet", type="text/css", href="styling.css")
#         ),

# 	tags$h1(id="page-title", class="center", "Progress Bar"),

# 	column(6, offset = 3, class="well",

# 		h6(verbatimTextOutput("timer"),
# 			style="visibility: collapse; height: 0px;"),

# 		conditionalPanel("output.timer != '1'",
# 			tags$h2(class="center", "Loading data...", img(id="ajax-loader", src="ajax-loader.gif"))
# 			),
		
# 		conditionalPanel("output.timer == '1'",
# 			tags$h2(class="center", "Done!"),
# 			plotOutput("Plot"),
# 			sliderInput("bins", label = "bins", min = 10, max = 90, value = 10, step = 20)
# 			)
# 		)
# )

# shinyApp(ui = ui, server = server)
