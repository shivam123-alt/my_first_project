#unemployment_rate_by_age_groups.csv has been taken from kaggle

library(dplyr)

unemployment <-read.csv("C:/Users/User/Downloads/unemployment_rate_by_age_groups.csv")
head(unemployment)
View(unemployment)
# what if i want to extract a specific one or two columns from the dataset 
# for that we will be using the select function which is in the dplyr package

unemployment %>% select(1,2) -> unemployment1_2     # pipe operator is used to join the dataframe and methods
View(unemployment1_2)

unemployment %>% select(3:6) -> unemployment1_2
View(unemployment1_2)


unemployment %>% select("Area.Name","Year","Age.16.19") -> unemployment1
View(unemployment1)


unemployment %>% select(starts_with("Y")) ->P
View(P)


unemployment %>% select(ends_with("e")) ->s
View(s)


# now by using the filter function we can extract the specific records
# on the basis of the conditions

unemployment %>% filter(Year=="2008") ->com
View(com)


unemployment %>% filter(Year>2008) ->mon
View(mon)
str(unemployment) # for checking the structure of the data


unemployment %>% filter(Year=="2010" & Year>2008) -> a
View(a)


# we can use the select and the filter function in single command

unemployment %>% select("Area.Name","Year","Age.16.19") %>% filter(Year=="2008") ->b
View(b)


-------------------------
  
  
# Viewing the Data Visualization By GGPLOT2

# ggplot2 is a package which is build on the grammar of graphics 

# it is divided into different layers
  # Data layer (which decides that on which layer do you want to visualize)
  # Aesthetic layer (we can map the different columns on different aesthetic for eg x-axis, y-axis, color, shape)
  # geometry layers (we can make different types of plots for eg geom_bar, geom_histogram)
    
library(ggplot2)
View(unemployment)

ggplot()
ggplot(data = unemployment)

#histogram it is basically used for understanding the distribution of the numeric-continuous values   
ggplot(data = unemployment,aes(x=Age.16.19))
ggplot(data = unemployment,aes(x=Age.16.19))+geom_histogram()
ggplot(data = unemployment,aes(x=Age.16.19))+geom_histogram(fill= "red")
ggplot(data = unemployment,aes(x=Age.16.19))+geom_histogram(fill= "orange",col="red") # col = color


#bar-plot it is basically used for understanding the distribution of the categorical, factors values  

ggplot(data = unemployment,aes(x=Age.20.24))+geom_bar()
ggplot(data = unemployment,aes(x=Age.20.24))+geom_bar(fill= "blue")
ggplot(data = unemployment,aes(x=Age.20.24,fill= Age.20.24))+geom_bar() 

#scatter-plot 

ggplot(data = unemployment,aes(x=Year,y=Age.25.34))+geom_point()
ggplot(data = unemployment,aes(x=Date,y=Age.35.44,col=Year))+geom_point()


#box-plot it is used to understand the variation btw 
#the categorical and continuous value
ggplot(data = unemployment,aes(x= Age.20.24,y=Year))+geom_boxplot()
ggplot(data = unemployment,aes(x= Year,y=Age.16.19,fill=Date))+geom_boxplot()


#faceting it is used when we are working on the complex data 
#like we are plotting the different 
#types of plots in the same visualization in that case we 
#use the faceting it basically makes the groups.

ggplot(data = unemployment,aes(x=Age.20.24,y=Age.16.19,fill=Year))+geom_boxplot()+facet_grid(~Year)
