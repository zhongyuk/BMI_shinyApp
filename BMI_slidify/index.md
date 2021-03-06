---
title       : BMI Calculator shinyApp
subtitle    : Reproducible Pitch Presentation for BMI Calculator shinyApp
author      : Zhongyu K.
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About Body Mass Index (BMI)
### BMI formula

$BMI = \frac{ WEIGHT (KG) }{ (HEIGHT (M))^2 }$

or

$BMI = \ 703 * \frac{ WEIGHT (BL) }{ (HEIGHT (IN))^2 }$

* BMI does not measure body fat directly
* However research has shown that BMI is moderately correlated with body fat
* The prevalence of adult BMI greater than or equal to 30 kg/m^2 has greatly increased since 1070s
* BMI can be used for population assessment of overweight and obesity
* A well developed [BMI Calculator ShinyApp](https://zhongyuk.shinyapps.io/BMI_shinyApp)

* refence: [Centers for Disease Control and Prevention](http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html)

--- .class #id 2

## BMI Interpretation

#### For Adults
* BMI < 18.5          :       underweight
* 18.5 <=  BMI < 25   :       healthy weight
* 25 <= BMI < 30      :       overweight
* BMI >= 30           :       obese
The interpretation of BMI does not depend on sex and age for adults (>=20 years old)

#### For Children and Teens

* BMI is interpretated differently for children and teens.

* For more details please read on:
[What is a BMI percentile and how it is interpreted?](http://www.cdc.gov/healthyweight/assessing/bmi/childrens_bmi/about_childrens_bmi.html#percentile)

--- .class #id 3

## BMI Calculator ShinyApp

#### The BMI Calculator ShinyApp user inputs:

* Age
* Weight and user's preferable unit for weight (kg or bl)
* Height and user's preferable unit for height (m or in)
* A reactive submit button

#### The BMI Calculator ShinyApp user outputs:

* Summary Tab
    1. Computed BMI result
    2. Interpreted Weight status

* Plot Tab
    1. Draws BMI weight status border lines
    2. Draws a black point indicates where user's weight status lies in

--- .class #id 4

## BMI Calculator Demo

### Emily is 25 years old and 65 inches tall, and she weights 120 pounds, what's her BMI?

```r
EmilyBMI <- calcBMI(weight=120,wUnit='pound',height=65,hUnit='inch')
EmilyStatus <- BMIstatus(age=25,BMI=EmilyBMI)
messageBMI  <- paste("Emily's BMI is:",round(EmilyBMI,2),sep=' ')
messageStatus <- paste("Emily's weight stauts is:", EmilyStatus,sep=' ')
print(messageBMI); print(messageStatus)
```

```
## [1] "Emily's BMI is: 19.97"
```

```
## [1] "Emily's weight stauts is: Healthy Weight"
```





