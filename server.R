#setwd('C:/Users/zhongyu/Dropbox/DataScientist/Developing Data Products/BMI_shinyApp')
library(shiny)

calcBMI  <- function(weight,wUnit,height,hUnit){
    weight <- as.numeric(weight)
    height <- as.numeric(height)
    if (wUnit=='pound' & hUnit=='inch'){
        BMI  <- 703*weight/(height)^2
    } else if (wUnit=='kg' & hUnit=='m'){
        BMI  <- weight/(height)^2
    } else if (wUnit=='pound' & hUnit=='m'){
        cWeight  = weight/2.2046
        BMI  <- cWeight/(height)^2
    } else {
        cWeight = weight*2.2046
        BMI  <- 703*cWeight/(height)^2
    }
    BMI
}

BMIstatus <- function(age,BMI){
    if (age>=20){
        if (BMI<18.5){
            status = "Underweight"
        } else if (BMI>=18.5 & BMI<24.9) {
            status = "Healthy Weight"
        } else if (BMI>=24.9 & BMI<29.9) {
            status = "overweight"
        } else {
            status = "Obese"
        }
    } else {
        status = "For children and teens, BMI is interpreted differently from adults.\n
        For more information about BMI for children and teens, please refer to BMI percentile.\n
        (http://www.cdc.gov/healthyweight/assessing/bmi/childrens_bmi/about_childrens_bmi.html#percentile)" 
    }
    status   
}

plotBMI <- function(iweight,wUnit,iheight,hUnit){
    library(ggplot2)
    library(reshape2)
    iweight <- as.numeric(iweight)
    iheight <- as.numeric(iheight)
    if (wUnit=='pound') {iweight = iweight/2.2046}

    if (hUnit=='inch') {iheight = iheight/39.370}
    iweight = round(iweight,0)
    weight = seq(30,160,1)
    underweight_healthy = sqrt(weight/18.5)
    healthy_overweight = sqrt(weight/25)
    overweight_obses = sqrt(weight/30)
    BMI = data.frame(weight,underweight_healthy,healthy_overweight,overweight_obses)
    BMI_long = melt(BMI,id='weight')
    height = NaN*BMI_long$weight
    id = which(BMI_long$weight==iweight,arr.ind=TRUE)
    height[id] = iheight
    BMI_long$height=height
    ggplot(BMI_long,aes(x=weight,y=value,colour=variable)) + geom_line(size=1.5) + 
        scale_colour_manual(values=c('green','orange','red')) +
        labs(title="BMI Border Line",size=2) + labs(x="weight(kilograms)") + 
        labs(y="height(meters)") + coord_cartesian(xlim = c(30, 160)) + 
        coord_cartesian(ylim=c(1.0,2.5)) + geom_point(aes(y=height),colour='black',size=5)
        
#     ggplot(BMI,aes(x=weight,y=healthy)) + geom_line(aes(y=healthy,color='green')) +
#         geom_line(aes(y=overweight,color='yellow')) + geom_line(aes(y=obses,color='red'))+
#         geom_ribbon(aes(ymin=overweight,ymax=healthy,fill='green'))+
#         geom_ribbon(aes(ymin=obses,ymax=overweight,fill='red'))
}

shinyServer(
    function(input,output){
        output$oage <- renderText({input$age})
        output$oweight <- renderText({paste(input$weight,input$weightUnit,sep=' ')})
        output$oheight <- renderText({paste(input$height,input$heightUnit,sep=' ')}) 
        output$oBMI  <- renderText({if (input$action!=0)
            calcBMI(input$weight,input$weightUnit,input$height,input$heightUnit)})
        output$ostatus <- renderText({if (input$action!=0)
            BMIstatus(input$age, calcBMI(input$weight,input$weightUnit,input$height,input$heightUnit))})
        output$oplot <- renderPlot({if (input$action!=0) 
            plotBMI(input$weight,input$weightUnit,input$height,input$heightUnit)})
    }
    
    )