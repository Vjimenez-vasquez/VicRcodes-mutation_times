library(lubridate)
library(plotly)
library(dplyr)
library(epical)

######################
##### function 1 #####
######################
#extract unique mutation lists from nextclade "results.csv" or #results.tsv" file#
regions <- function(data){
data = data
elements <- unlist(strsplit(data$aaSubstitutions, ","))
a <- sort(unique(elements))
b <- unique(gsub(":.*","",a))
print(b)
}


######################
##### function 2 #####
######################
mutations_time <- function(data,xmin,xmax,ymin,ymax,freq,title,region){
data = data 
xmin = xmin 
xmax = xmax
ymin = ymin
ymax = ymax
freq = freq
title = title
region = paste0(region,":")

#add new column dates#
data <- add_epi_week(data, "date", system="cdc")
data$week_date <- epi_week_date(data$epi_week,data$epi_year,system="cdc")
data <- as.data.frame(data)
data$dec_date <- decimal_date(ymd(data$week_date))
data.frame(names(data))
head(data)

#extract unique mutation lists#
#separate by commas#
elements <- unlist(strsplit(data$aaSubstitutions, ","))
a <- sort(unique(elements))
b <- grep(region,a, value = TRUE)
#unique(gsub(":.*","",a))#

#generate table#

c <- 0
d <- 0 
e <- 0 
f <- 0 
g <- 0 
h <- 0 
j <- 0
for (i in 1:length(b)){
c <- append(c,data[grep(b[i],data$aaSubstitutions),1])
d <- append(d,data[grep(b[i],data$aaSubstitutions),3])
e <- append(e,data[grep(b[i],data$aaSubstitutions),6])
f <- append(f,data[grep(b[i],data$aaSubstitutions),7])
g <- append(g,data[grep(b[i],data$aaSubstitutions),19])
h <- append(h,data[grep(b[i],data$aaSubstitutions),84])
j <- append(j,rep(b[i],length(grep(b[i],data$aaSubstitutions))))
}

k <- data.frame(c,d,e,f,g,h,j)

l <- k%>%group_by(h,j)%>%summarise(n=n())
#plot#
l <- as.data.frame(l)
l$date <- date_decimal(l$h)

names(l) <- c("decimal_date","mutation","freq","week_date")

mut_freqs <- data.frame(table(k$j))
mut_freqs$perc <- (mut_freqs$Freq/nrow(data))*100
mut_selec <- mut_freqs[mut_freqs$perc >= freq,1]
mut_freqs2 <- mut_freqs[order(-mut_freqs$perc),]

m <- l[l$mutation %in% mut_selec,]

fig <- plot_ly(m,x = as.Date(m$week_date,format="%Y-%m-%d"),
y = ~freq, type = 'scatter', name=~mutation,mode = 'lines') %>% layout(xaxis = list(range = as.POSIXct(c(xmin,xmax))),
yaxis = list(range=c(ymin,ymax))) %>% layout(title = title)
print(fig)
print(mut_freqs2)
}