shinyServer(
	function(input, output, session) {

		generateData <- reactive({
			out <- lapply(1:5, function(ii){
				Sys.sleep(1)
				return(rnorm(200*ii, ii, .2))
				})
			return(do.call(c, out))
			})

		output$timer <- renderText({
			if(!is.null(generateData()))
				return(1)
			return(NULL)
			})

		output$Plot <- renderPlot({
			X <- generateData()

			par(bg = "#7f8c8d", col.axis = "#efefef", col.lab="#efefef",
				bty = "n", cex.lab = 1.5, cex.axis=1.25, las = 1)
			hist(X, freq = FALSE, breaks = input$bins,
				col = "cyan", border="purple", main = "")

			})

		session$onSessionEnded(function() { stopApp() })
	}
)
