library(shiny); library(stargazer)


shinyUI(

    navbarPage("Bivariate linear regression",

        tabPanel("Overview",
            fluidRow(
                column(2, 
                    p("")
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("", "$$N$$", min = 1, max = 300, value = 50, 
                                step = 2, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("", "$$\\beta_0$$", min = 0, max = 10, 
                                value = 5, step = 0.5, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("", "$$\\beta_1$$", min = -10, max = 10, 
                                value = 1, step = 0.25, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("", "$$\\sigma$$", min = 0, max = 3, 
                                value = 0.075, step = 0.025, width = "100%"))
                ),
                column(2,
                    p("")
                )
            ),
            fluidRow(
                column(1, 
                    p("")
                ),
                column(10, 
                    h3("Description"),
                    p("The purpose of this application is to aid in the 
                      comprehension of bivariate linear regression. Specifically
                      it serves as an intro to the linear model. To accomplish 
                      this, the app fits a linear equation to simulated data using 
                      the linear formula:"),
                    withMathJax(
                        helpText("$$y = \\beta_0 + \\beta_1X_1 + \\epsilon$$")),
                    p("The x- and y-values are random uniform values given a 
                      linear relationship using the formula:"),
                    p("$$\\beta_0 + x * \\beta_1 + N$$"),
                    p("Where the slope, intercept and standard deviation are 
                      user defined via input sliders (see above). This is 
                      accomplished in R via",
                      code("y = beta0 + x * beta1 + rnorm(n, sd = sigma)"),"The 
                      result is plotted and the best fit line obtained using 
                      least squares estimation is shown in purple, along 
                      with the mean of x and y. The model output is displayed 
                      via the package", code("stargazer"), "and also updates in 
                      real time. Finally, residual plots are displayed to obtain
                      a better understanding of model fit. The source code is 
                      available on github (see below).")
                ),
                column(1, 
                    p("")
                )
            ),
            br(), br(), br(),
            fluidRow(
                column(1,
                    p("")
                ),
                column(10,
                    wellPanel(
                    p(strong("Created by:"), 
                    tags$a("Joseph V. Casillas", href="http://www.jvcasillas.com"),
                    br(), strong("Source code:"), 
                    tags$a("Github", href="https://github.com/jvcasill/shiny_bivariate_regression/"))
                    )
                ),
                column(1, 
                       p("")
                )
            )
        ),
    
        tabPanel("Plot",
            fluidRow(
                column(2, 
                    p("")
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("n", "$$N$$", min = 1, max = 300, value = 50, 
                                step = 2, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("beta0", "$$\\beta_0$$", min = 0, max = 10, 
                                value = 5, step = 0.5, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("beta1", "$$\\beta_1$$", min = -10, max = 10, 
                                value = 1, step = 0.25, width = "100%"))
                ),
                column(2,
                    div(align = "center", 
                    sliderInput("sigma", "$$\\sigma$$", min = 0, max = 3, 
                                value = 0.075, step = 0.025, width = "100%"))
                ),
                column(2,
                    p("")
                )
            ),

            fluidRow(
                column(1,
                    p("")
                ),
                column(5,
                br(),
                tabsetPanel(type = "tabs",
                    tabPanel("Plot", plotOutput("modPlot")),
                    tabPanel("Residuals", plotOutput("resid"))
                    )
                ),
                column(5,
                    br(),br(),br(),br(),br(),br(),br(),br(),
                    div(align = "center", tableOutput("values"))
                ),
                column(1, 
                    p("")
                )
            ),
            br(),
            fluidRow(
                column(1,
                    p("")
                ),
                column(10,
                    wellPanel(
                    p(strong("Created by:"), 
                    tags$a("Joseph V. Casillas", href="http://www.jvcasillas.com"),
                    br(), strong("Source code:"), 
                    tags$a("Github", href="https://github.com/jvcasill/shiny_bivariate_regression/"))
                    )
                ),
                column(1, 
                    p("")
                )
            )
        )
    )
)