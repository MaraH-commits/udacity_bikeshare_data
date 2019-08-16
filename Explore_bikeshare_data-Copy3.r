
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

summary(chi)

#import of library
library('ggplot2')

getwd()

list.files()

names(chi)

theme_set(theme_minimal(20))

ggplot(aes(x = Trip.Duration), data = subset(chi, !is.na(Gender))) +
    geom_histogram(binwidth = 1) +
    scale_x_continuous(limits = c(0,800), breaks = seq(0,800,200)) +
    facet_wrap(~Gender)+
    xlab('Trip Duration')+
    ylab('Count of Customers')+
    ggtitle('Histogram of Chicagos Trip Duration by Gender')+
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
       title=element_text(size=14,face="bold"))

by(wash$Start.Station, wash$X, summary)

qplot(x =Trip.Duration, data = subset(wash, Start.Station=='Lincoln Memorial')) +
    geom_histogram(binwidth = 100) +
    ggtitle('Histogram of Trip Duration by Start Station "Lincoln Memorial"')+
    labs(x = 'Trip Duration')+
    labs(y = 'Count of Customers')+
     theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
       title=element_text(size=8,face="bold"))+xlim(0,1000)

summary(wash)

by(ny$Birth.Year, ny$Gender, summary)

qplot(x = Birth.Year, data = subset(ny, !is.na(Gender))) +
    geom_histogram(binwidth = 5) +
    facet_wrap(~Gender) +
    ggtitle('Histogram of Number of Customers separated by Age and Birthyear')+
    labs(x = 'Birthyear')+
    labs(y = 'Count of Customers')+
     theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
       title=element_text(size=8,face="bold"))

summary(ny)

# system('python -m nbconvert Explore_bikeshare_data.ipynb')
