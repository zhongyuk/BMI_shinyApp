#setwd('C:/Users/zhongyu/Dropbox/DataScientist/Developing Data Products/BMI_shinyApp')
library(shiny)

# Define UI for randon distrubution application
shinyUI(pageWithSidebar(
    
    # Application Title
    headerPanel("BMI Calculator"),
    
    sidebarPanel(
      sliderInput(inputId='age', 'How old are you?', min=0, max=120, value=20,step=1),
      br(),
      textInput(inputId='weight', 'Please tell us about your weight:'),
      br(),
      radioButtons(inputId='weightUnit', 'Please specify the unit of your weight:', c('pound','kg')),
      br(),
      textInput(inputId='height', 'Please tell us about your height:'),
      br(),
      radioButtons(inputId='heightUnit', 'Please specify the unit of your height:', c('inch','m')),
      br(),
      actionButton('action','Submit')
        ),
    
    mainPanel(
        tabsetPanel(
            tabPanel(
                title = 'Documentation',
                h3('Body Mass Index'),
                h4('What is BMI?'),
                p("BMI is a person's weight in kilograms divided by the square of height in meters."),
                p("BMI does not measure body fat directly, but research has shown that BMI is moderately
                  correlated with more direct measures of body fat."),
                br(),
                h4('What are the BMI trends for adults in United States?'),
                p('The prevalence of adult BMI greater than or equal to 30 kg/m^2 has greatly increased since 1070s.'),
                br(),
                h4('What is BMI used for?'),
                p('BMI can be used for population assessment of overweight and obesity.'),
                br(),
                h4('How to interpret BMI?'),
                p('For adults, BMI less than 18.5 is considered underweight;'),
                p('BMI between 18.5 to 25 is considered healthy weight;'),
                p('BMI between 25 to 30 is considered overweight;'),
                p('BMI larger than 30 is conserdered obses.'),
                p('It is worth mention that for adults, the interpretation of BMI does not depend on sex or age.'),
                p('However, BMI is interpreted differently for children and teens as compared to adults.'),
                br(),
                h4('About BMI Calculator on the left'),
                p("The BMI Calculator computes the BMI based on user's inputs."),
                p("The BMI formula is preprogrammed, and it allows inputs in 4 differnet units."),
                p("The computed BMI analysis output is shown on the Summary tab after user hit submit button the first time."),
                p("The plot tab draws out three BMI border lines along with user's input weight and height info."),
                p("The three BMI border lines seperate four BMI status regions."),
                p("The black dot indicates where the user's BMI lies in."),
                br(),
                br(),
                h6('reference source: Centers for Disease Control and Prevention'),
                h6('http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html')
                ),
            tabPanel(
                title='Summary',
                h3('Body Mass Index Analysis Result'),
                h4('Your age is:'),
                verbatimTextOutput('oage'),
                h4('Your input weight is:'),
                verbatimTextOutput('oweight'),
                h4('Your input height is:'),
                verbatimTextOutput('oheight'),
                h4('Your calculated BMI is:'),
                verbatimTextOutput('oBMI'),
                h4('Your weight status interpreted from BMI:'),
                verbatimTextOutput('ostatus')),
            tabPanel(
                title='Plot',
                h3('Body Mass Index Border Line'),
                plotOutput('oplot')
                )
            
            )
        )
    
    ))