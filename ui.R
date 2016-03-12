shinyUI(
	fluidPage(

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
				plotOutput("Plot"),
				sliderInput("bins", label = "bins", min = 10, max = 90, value = 10, step = 20)
				)
			)
	)
)