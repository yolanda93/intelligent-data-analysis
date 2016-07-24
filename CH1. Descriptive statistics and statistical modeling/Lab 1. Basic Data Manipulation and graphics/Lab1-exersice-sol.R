#scratch notes for Parsing XML. Warning: some commands may not work
#first load package XML

datum=xmlParse("http://charts.realclearpolitics.com/charts/1171.xml")
### navigating the xml tree structure
root=xmlRoot(datum)
names(root)
xmlSize(root)
xmlName(root)
children=xmlChildren(root)
xmlSize(children)
xmlName(children[[1]])
xmlName(children[[2]])
children1=xmlChildren(children[[2]])
xmlSize(children1)
xmlName(children1[[1]])
xmlName(children1[[2]])
xmlAttrs(children1[[1]])
xmlAttrs(children1[[2]])
xmlSize(children1[[1]])
xmlSize(children1[[2]])
children11=xmlChildren(children1[[1]])
xmlSize(children11)
xmlName(children11[[1]])
xmlAttrs(children11[[1]])
xmlValue(children11[[1]])

### extracting (from datum) Obama, Romney and dates:
dates=xpathSApply(datum,"/chart/series/value",xmlValue)
dates=as.Date(fechas,"%m/%d/%Y")
Obama=Obama[1:645]
fechas=fechas[1:645]
serie1=zoo(x=Obama, order.by=fechas)
str(serie1)
Romney=as.numeric(xpathSApply(datum,"/chart/graphs/graph[@gid='2']/value",xmlValue))
Romney=Romney[1:645]
plot(fechas, Obama, type="l", ylim=c(40,50))
lines(fechas, Romney, col='blue')


## Only Obama's series
xyplot(serie1)


# ticks only
plot(serie1, xaxt="n")
axis(1, at=seq(times[1],times[length(times)],by="months"), labels=FALSE)

# with package zoo
times=time(serie1)
seq(times[1],times[length(times)],by="weeks")
ticks=seq(times[1],times[length(times)],by="months")
fmt <- "%Y-%m"
labs <- format(tricks, fmt)

plot(serie1, xaxt="n")
axis(1, at=seq(times[1],times[length(times)],by="months"), labels=labs)

aggregate(serie1, as.yearqtr, mean)
aggregate(serie1, as.yearmon, mean)
## with ggplot2, Only Obama's series

autoplot(serie1) + geom_point(col = "blue") + xlab("Index") + ylab("Values")

## with ggplot2, Obama and Romney series
Romney1=data.frame(x=fechas,y=Romney[1:645])
Obama1=data.frame(x=fechas,y=Obama)
ggplot(Obama1,aes(x,y))+geom_line(aes(color="Obama"))+geom_line(data=Romney1,aes(color="Romney"))+labs(color="Candidate")

#Botanical example plant catalog
xlm.1=xmlParse("http://www.stat.berkeley.edu/~spector/s133/data/plant_catalog.xml")
root=xmlRoot(xlm.1)
xmlName(root)
xmlSize(root)
names(root)
children=xmlChildren(root)
children[[1]]
xmlSize(cildren[[1]])
children1=xmlChildren(cildren[[1]])
xmlName(cildren1[[1]])
xmlName(cildren1[[2]])
xmlName(cildren1[[3]])


### Extracting variables
common=xpathSApply(xlm.1,"//PLANT/COMMON",xmlValue)
botanical=xpathSApply(xlm.1,"//PLANT/BOTANICAL",xmlValue)
zone=xpathSApply(xlm.1,"//PLANT/ZONE",xmlValue)
light=xpathSApply(xlm.1,"//PLANT/LIGHT",xmlValue)
price=xpathSApply(xlm.1,"//PLANT/PRICE",xmlValue)
availability=xpathSApply(xlm.1,"//PLANT/AVAILABILITY",xmlValue)
price=sub("$","", price, fixed=T)
price=as.numeric(price)
zone[28]
zone[28]=3
table(zone)
zone=as.factor(zone)
availability=as.numeric(availability)
plants=data.frame(common, botanical, zone, light, price, availability)
head(plants)
boxplot(price~zone)
boxplot(price~light)
hist(availability)
max(availability)
hist(price)
hist(price, plot=F)



