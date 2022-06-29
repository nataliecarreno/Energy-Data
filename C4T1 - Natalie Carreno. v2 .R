#INSTALLING RMySQL
install.packages("RMySQL")

# loading libray RMySQL
library(RMySQL)

#Connecting to Data POA 
con = dbConnect(MySQL(), user='deepAnalytics', password='Sqltask1234!', dbname='dataanalytics2018', host='data-analytics-2018.cbrosir2cswx.us-east-1.rds.amazonaws.com')

#----CONNECTION USING RMariaDB---- 
install.packages("RMariaDB")

library(RMariaDB)
con = dbConnect(MariaDB(), user='deepAnalytics', password='Sqltask1234!', dbname='dataanalytics2018', host='data-analytics-2018.cbrosir2cswx.us-east-1.rds.amazonaws.com')

#List tables contained in database
dbListTables(con)
#[1] "iris"    "yr_2006" "yr_2007" "yr_2008" "yr_2009"
#[6] "yr_2010"

#List attributes in iris table
dbListFields(con,'iris')
#[1] "id"            "SepalLengthCm" "SepalWidthCm" 
#[4] "PetalLengthCm" "PetalWidthCm"  "Species"    

#Download ALL Attributes from Iris 
irisALL <- dbGetQuery(con, "SELECT * FROM iris")

#Download only specific attributes for Iris (using SELECT)
irisSELECT <- dbGetQuery(con, "SELECT SepalLengthCm, SepalWidthCm FROM iris")

#List attributes from yr_2006 table
dbListFields(con, 'yr_2006')
#[1] "id"                    "Date"                 
#[3] "Time"                  "Global_active_power"  
#[5] "Global_reactive_power" "Global_intensity"     
#[7] "Voltage"               "Sub_metering_1"       
#[9] "Sub_metering_2"        "Sub_metering_3"   


#Download tables yr_2006 to yr_2010  (names have to start with letters)  WARNINGS ARE FROM WHEN I HAD ALL 10 VARIABLES
sixALL <- dbGetQuery(con, "SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 FROM yr_2006")
#Warning message:
# In .local(conn, statement, ...) :
#  Unsigned INTEGER in col 0 imported as numeric

sevenALL <- dbGetQuery(con, "SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 FROM yr_2007")
#Warning message:
#  In .local(conn, statement, ...) :
#  Unsigned INTEGER in col 0 imported as numeric

eightALL <- dbGetQuery(con, "SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 FROM yr_2008")
#Warning message:
#  In .local(conn, statement, ...) :
#  Unsigned INTEGER in col 0 imported as numeric

nineALL <- dbGetQuery(con, "SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 FROM yr_2009")
#Warning message:
#  In .local(conn, statement, ...) :
#  Unsigned INTEGER in col 0 imported as numeric

tenALL <- dbGetQuery(con, "SELECT Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 FROM yr_2010")
#Warning message:
#  In .local(conn, statement, ...) :
#  Unsigned INTEGER in col 0 imported as numeric

#INVESTIGATE EACH DATA FRAME
str(sixALL)
#'data.frame':	21992 obs. of  10 variables:
#  $ id                   : num  1 2 3 4 5 6 7 8 9 10 ...
#$ Date                 : chr  "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" ...
#$ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
#$ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
#$ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
#$ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
#$ Voltage              : num  235 234 233 234 236 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
#$ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

 summary(sixALL)
#id            Date          
#Min.   :    1   Length:21992      
#1st Qu.: 5499   Class :character  
#Median :10998   Mode  :character  
#Mean   :10998                     
#3rd Qu.:16496                     
#Max.   :21996                     
#Time           Global_active_power
#Length:21992       Min.   :0.194      
#Class :character   1st Qu.:0.496      
#Mode  :character   Median :1.708      
#Mean   :1.901      
#3rd Qu.:2.692      
#Max.   :9.132      
#Global_reactive_power Global_intensity
#Min.   :0.0000        Min.   : 0.80   
#1st Qu.:0.0000        1st Qu.: 2.20   
#Median :0.1140        Median : 7.20   
#Mean   :0.1314        Mean   : 8.03   
#3rd Qu.:0.1980        3rd Qu.:11.40   
#Max.   :0.8000        Max.   :39.40   
#Voltage      Sub_metering_1   Sub_metering_2  
#Min.   :228.2   Min.   : 0.000   Min.   : 0.000  
#1st Qu.:238.8   1st Qu.: 0.000   1st Qu.: 0.000  
#Median :241.7   Median : 0.000   Median : 0.000  
#Mean   :241.4   Mean   : 1.249   Mean   : 2.215  
#3rd Qu.:244.4   3rd Qu.: 0.000   3rd Qu.: 1.000  
#Max.   :251.7   Max.   :77.000   Max.   :74.000  
#Sub_metering_3 
#Min.   : 0.00  
#1st Qu.: 0.00  
#Median : 0.00  
#Mean   : 7.41  
#3rd Qu.:17.00  
#Max.   :20.00  

 head(sixALL)
#id       Date     Time Global_active_power
#1  1 2006-12-16 17:24:00               4.216
#2  2 2006-12-16 17:25:00               5.360
#3  3 2006-12-16 17:26:00               5.374
#4  4 2006-12-16 17:27:00               5.388
#5  5 2006-12-16 17:28:00               3.666
#6  6 2006-12-16 17:29:00               3.520
#Global_reactive_power Global_intensity Voltage
#1                 0.418             18.4  234.84
#2                 0.436             23.0  233.63
#3                 0.498             23.0  233.29
#4                 0.502             23.0  233.74
#5                 0.528             15.8  235.68
#6                 0.522             15.0  235.02
#Sub_metering_1 Sub_metering_2 Sub_metering_3
#1              0              1             17
#2              0              1             16
#3              0              2             17
#4              0              1             17
#5              0              1             17
#6              0              2             17

tail(sixALL)
#id       Date     Time Global_active_power
#21987 21991 2006-12-31 23:54:00               2.576
#21988 21992 2006-12-31 23:55:00               2.574
#21989 21993 2006-12-31 23:56:00               2.576
#21990 21994 2006-12-31 23:57:00               2.586
#21991 21995 2006-12-31 23:58:00               2.648
#21992 21996 2006-12-31 23:59:00               2.646
#Global_reactive_power Global_intensity Voltage
#21987                 0.132             10.6  241.90
#21988                 0.132             10.6  241.89
#21989                 0.132             10.6  242.06
#21990                 0.134             10.6  242.61
#21991                 0.212             11.0  241.93
#21992                 0.236             11.0  241.89
#Sub_metering_1 Sub_metering_2 Sub_metering_3
#21987              0              0              0
#21988              0              0              0
#21989              0              0              0
#21990              0              0              0
#21991              0              0              0
#21992              0              0              0

str(sevenALL)
#'data.frame':	521669 obs. of  10 variables:
#  $ id                   : num  1 2 3 4 5 6 7 8 9 10 ...
#$ Date                 : chr  "2007-01-01" "2007-01-01" "2007-01-01" "2007-01-01" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : num  2.58 2.55 2.55 2.55 2.55 ...
#$ Global_reactive_power: num  0.136 0.1 0.1 0.1 0.1 0.1 0.096 0 0 0 ...
#$ Global_intensity     : num  10.6 10.4 10.4 10.4 10.4 10.4 10.4 10.2 10.2 10.2 ...
#$ Voltage              : num  242 242 242 242 242 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

summary(sevenALL)
#id             Date               Time           Global_active_power Global_reactive_power Global_intensity
#Min.   :     1   Length:521669      Length:521669      Min.   : 0.082      Min.   :0.0000        Min.   : 0.400  
#1st Qu.:130423   Class :character   Class :character   1st Qu.: 0.278      1st Qu.:0.0000        1st Qu.: 1.200  
#Median :264606   Mode  :character   Mode  :character   Median : 0.504      Median :0.1000        Median : 2.400  
#Mean   :263456                                         Mean   : 1.117      Mean   :0.1174        Mean   : 4.764  
#3rd Qu.:395178                                         3rd Qu.: 1.548      3rd Qu.:0.1860        3rd Qu.: 6.400  
#Max.   :525600                                         Max.   :10.670      Max.   :1.1480        Max.   :46.400  
#Voltage      Sub_metering_1   Sub_metering_2   Sub_metering_3  
#Min.   :223.5   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
#1st Qu.:236.9   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
#Median :239.7   Median : 0.000   Median : 0.000   Median : 0.000  
#Mean   :239.4   Mean   : 1.232   Mean   : 1.638   Mean   : 5.795  
#3rd Qu.:241.8   3rd Qu.: 0.000   3rd Qu.: 1.000   3rd Qu.:17.000  
#Max.   :252.1   Max.   :78.000   Max.   :78.000   Max.   :20.000  

str(eightALL)
#'data.frame':	526905 obs. of  10 variables:
#  $ id                   : num  1 2 3 4 5 6 7 8 9 10 ...
#$ Date                 : chr  "2008-01-01" "2008-01-01" "2008-01-01" "2008-01-01" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : num  1.62 1.63 1.62 1.61 1.61 ...
#$ Global_reactive_power: num  0.07 0.072 0.072 0.07 0.07 0 0 0 0 0 ...
#$ Global_intensity     : num  6.6 6.6 6.6 6.6 6.6 6.4 6.4 6.4 6.4 6.4 ...
#$ Voltage              : num  241 242 242 241 241 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  18 18 18 18 18 17 18 18 18 18 ...

summary(eightALL)
#id             Date               Time           Global_active_power Global_reactive_power Global_intensity
#Min.   :     1   Length:526905      Length:526905      Min.   : 0.076      Min.   :0.0000        Min.   : 0.200  
#1st Qu.:131732   Class :character   Class :character   1st Qu.: 0.300      1st Qu.:0.0460        1st Qu.: 1.400  
#Median :263461   Mode  :character   Mode  :character   Median : 0.566      Median :0.0940        Median : 2.400  
#Mean   :263474                                         Mean   : 1.072      Mean   :0.1171        Mean   : 4.552  
#3rd Qu.:395191                                         3rd Qu.: 1.518      3rd Qu.:0.1840        3rd Qu.: 6.400  
#Max.   :527040                                         Max.   :10.348      Max.   :1.3900        Max.   :44.600  
#Voltage      Sub_metering_1  Sub_metering_2   Sub_metering_3  
#Min.   :224.6   Min.   : 0.00   Min.   : 0.000   Min.   : 0.000  
#1st Qu.:238.9   1st Qu.: 0.00   1st Qu.: 0.000   1st Qu.: 0.000  
#Median :240.7   Median : 0.00   Median : 0.000   Median : 1.000  
#Mean   :240.6   Mean   : 1.11   Mean   : 1.256   Mean   : 6.034  
#3rd Qu.:242.5   3rd Qu.: 0.00   3rd Qu.: 1.000   3rd Qu.:17.000  
#Max.   :250.9   Max.   :80.00   Max.   :76.000   Max.   :31.000  

str(nineALL)
#'data.frame':	521320 obs. of  10 variables:
#  $ id                   : num  1 2 3 4 5 6 7 8 9 10 ...
#$ Date                 : chr  "2009-01-01" "2009-01-01" "2009-01-01" "2009-01-01" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : num  0.484 0.484 0.482 0.482 0.482 0.57 0.59 0.588 0.586 0.586 ...
#$ Global_reactive_power: num  0.062 0.062 0.062 0.06 0.062 0 0.078 0.078 0.078 0.078 ...
#$ Global_intensity     : num  2.2 2.2 2.2 2.2 2.2 2.6 2.6 2.6 2.6 2.6 ...
#$ Voltage              : num  248 248 248 248 247 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...

summary(nineALL)
id             Date               Time           Global_active_power Global_reactive_power Global_intensity
#Min.   :     1   Length:521320      Length:521320      Min.   : 0.122      Min.   :0.0000        Min.   : 0.400  
#1st Qu.:130398   Class :character   Class :character   1st Qu.: 0.318      1st Qu.:0.0520        1st Qu.: 1.400  
#Median :264038   Mode  :character   Mode  :character   Median : 0.622      Median :0.1060        Median : 2.800  
#Mean   :262890                                         Mean   : 1.079      Mean   :0.1314        Mean   : 4.555  
#3rd Qu.:395266                                         3rd Qu.: 1.514      3rd Qu.:0.2060        3rd Qu.: 6.200  
#Max.   :525600                                         Max.   :11.122      Max.   :1.2400        Max.   :48.400  
#Voltage      Sub_metering_1   Sub_metering_2   Sub_metering_3  
#Min.   :223.2   Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
#1st Qu.:240.1   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
#Median :241.9   Median : 0.000   Median : 0.000   Median : 1.000  
#Mean   :241.9   Mean   : 1.137   Mean   : 1.136   Mean   : 6.823  
#3rd Qu.:243.6   3rd Qu.: 0.000   3rd Qu.: 1.000   3rd Qu.:18.000  
#Max.   :254.2   Max.   :82.000   Max.   :77.000   Max.   :31.000  

str(tenALL)
#'data.frame':	457394 obs. of  10 variables:
#  $ id                   : num  1 2 3 4 5 6 7 8 9 10 ...
#$ Date                 : chr  "2010-01-01" "2010-01-01" "2010-01-01" "2010-01-01" ...
#$ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Global_active_power  : num  1.79 1.78 1.78 1.75 1.69 ...
#$ Global_reactive_power: num  0.236 0.234 0.234 0.186 0.102 0.1 0.1 0.102 0.072 0 ...
#$ Global_intensity     : num  7.4 7.4 7.4 7.2 7 7 7 7 6.8 6.6 ...
#$ Voltage              : num  241 240 240 240 240 ...
#$ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3       : num  18 18 19 18 18 19 18 18 19 18 ...

summary(tenALL)
#id             Date               Time           Global_active_power Global_reactive_power Global_intensity
#Min.   :     1   Length:457394      Length:457394      Min.   :0.138       Min.   :0.0000        Min.   : 0.600  
#1st Qu.:119509   Class :character   Class :character   1st Qu.:0.336       1st Qu.:0.0540        1st Qu.: 1.400  
#Median :233860   Mode  :character   Mode  :character   Median :0.700       Median :0.1000        Median : 3.000  
#Mean   :236335                                         Mean   :1.061       Mean   :0.1294        Mean   : 4.478  
#3rd Qu.:355437                                         3rd Qu.:1.512       3rd Qu.:0.2000        3rd Qu.: 6.200  
#Max.   :475023                                         Max.   :9.724       Max.   :1.1240        Max.   :43.000  
#Voltage      Sub_metering_1    Sub_metering_2   Sub_metering_3  
#Min.   :225.3   Min.   : 0.0000   Min.   : 0.000   Min.   : 0.000  
#1st Qu.:239.8   1st Qu.: 0.0000   1st Qu.: 0.000   1st Qu.: 1.000  
#Median :241.5   Median : 0.0000   Median : 0.000   Median : 1.000  
#Mean   :241.5   Mean   : 0.9875   Mean   : 1.102   Mean   : 7.244  
#3rd Qu.:243.2   3rd Qu.: 0.0000   3rd Qu.: 1.000   3rd Qu.:18.000  
#Max.   :253.5   Max.   :88.0000   Max.   :80.000   Max.   :31.000  

#LOAD dplyr
library(dplyr)

#Create a new Dataframe combining all the years 2006-2010
newDF <-bind_rows(sevenALL, eightALL, nineALL)

#checked my environment and I see it there with 2027288 observations 



#inspect newDF
str(newDF)
#'data.frame':	2027288 obs. of  5 variables:
#  $ Date          : chr  "2007-01-01" "2007-01-01" "2007-01-01" "2007-01-01" ...
#$ Time          : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Sub_metering_1: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3: num  0 0 0 0 0 0 0 0 0 0 ...

summary(newDF)
#Date               Time           Sub_metering_1   Sub_metering_2   Sub_metering_3  
#Length:2027288     Length:2027288     Min.   : 0.000   Min.   : 0.000   Min.   : 0.000  
#Class :character   Class :character   1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.: 0.000  
#Mode  :character   Mode  :character   Median : 0.000   Median : 0.000   Median : 1.000  
#Mean   : 1.121   Mean   : 1.289   Mean   : 6.448  
#3rd Qu.: 0.000   3rd Qu.: 1.000   3rd Qu.:17.000  
#Max.   :88.000   Max.   :80.000   Max.   :31.000  

head(newDF)
#Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3
#1 2007-01-01 00:00:00 2007-01-01 00:00:00              0              0              0
#2 2007-01-01 00:01:00 2007-01-01 00:01:00              0              0              0
#3 2007-01-01 00:02:00 2007-01-01 00:02:00              0              0              0
#4 2007-01-01 00:03:00 2007-01-01 00:03:00              0              0              0
#5 2007-01-01 00:04:00 2007-01-01 00:04:00              0              0              0
#6 2007-01-01 00:05:00 2007-01-01 00:05:00              0              0              0

tail(newDF)
#Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3

sum(newDF$Sub_metering_1)
#[1] 1,819,989
sum(newDF$Sub_metering_2)
#[1] 2,108,410
sum(newDF$Sub_metering_3)
#[1] 9,758,843


#---PREPROCESSING----

#Combine Date and Time
newDF <-cbind(newDF,paste(newDF$Date,newDF$Time), stringsAsFactors=FALSE)

#check columns
names(newDF)
#[1] "Date"                          "Time"                         
#[3] "Sub_metering_1"                "Sub_metering_2"               
#[5] "Sub_metering_3"                "paste(newDF$Date, newDF$Time)"

#change name of new column 
colnames(newDF)[6] <-"DateTime"

#review names of columns
names(newDF)
#[1] "Date"           "Time"           "Sub_metering_1" "Sub_metering_2" "Sub_metering_3"
#[6] "DateTime"      

#move new column "DateTime" to top

newDF <- newDF[,c(ncol(newDF), 1:(ncol(newDF)-1))]

#check the column order
head(newDF)
#DateTime id       Date     Time Global_active_power Global_reactive_power Global_intensity Voltage
#1 2006-12-16 17:24:00  1 2006-12-16 17:24:00               4.216                 0.418             18.4  234.84
#2 2006-12-16 17:25:00  2 2006-12-16 17:25:00               5.360                 0.436             23.0  233.63
#3 2006-12-16 17:26:00  3 2006-12-16 17:26:00               5.374                 0.498             23.0  233.29
#4 2006-12-16 17:27:00  4 2006-12-16 17:27:00               5.388                 0.502             23.0  233.74
#5 2006-12-16 17:28:00  5 2006-12-16 17:28:00               3.666                 0.528             15.8  235.68
#6 2006-12-16 17:29:00  6 2006-12-16 17:29:00               3.520                 0.522             15.0  235.02
#Sub_metering_1 Sub_metering_2 Sub_metering_3
#1              0              1             17
#2              0              1             16
#3              0              2             17
#4              0              1             17
#5              0              1             17
#6              0              2             17

#convert DateTime from character to POSIXct 
newDF$DateTime <- as.POSIXct(newDF$DateTime, "%Y/%m/%d %H:%M:%S")
#Warning messages:
#  1: In strptime(xx, f, tz = tz) : unknown timezone '%Y/%m/%d %H:%M:%S'
#2: In as.POSIXct.POSIXlt(x) : unknown timezone '%Y/%m/%d %H:%M:%S'
#3: In strptime(x, f, tz = tz) : unknown timezone '%Y/%m/%d %H:%M:%S'
#4: In as.POSIXct.POSIXlt(as.POSIXlt(x, tz, ...), tz, ...) :
#  unknown timezone '%Y/%m/%d %H:%M:%S'

#assign timezone to TimeDate attribute
attr(newDF$DateTime, "tzone") <- "GMT"

#check data types
str(newDF)
#'data.frame':	2027288 obs. of  6 variables:
#  $ DateTime      : POSIXct, format: "2007-01-01 00:00:00" "2007-01-01 00:01:00" "2007-01-01 00:02:00" ...
#$ Date          : chr  "2007-01-01" "2007-01-01" "2007-01-01" "2007-01-01" ...
#$ Time          : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Sub_metering_1: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3: num  0 0 0 0 0 0 0 0 0 0 ...

#install lubridate
#install.packages("lubridate")

#load lubridate
library(lubridate)

#create year attribute
newDF$year <- year(newDF$DateTime)

#create month attribute
newDF$month <-month(newDF$DateTime)

#create date attribute
newDF$day <- day(newDF$DateTime)

#create quarter attribute
newDF$quarter <- quarter(newDF$DateTime, with_year = FALSE, fiscal_start = 1)

#create week attribute
newDF$week <- week(newDF$DateTime)

#create weekday attribute
newDF$wday <-wday(newDF$DateTime)

#create hour
newDF$Hour <- hour(newDF$DateTime)

#create minute
newDF$minute <-minute(newDF$DateTime)


#review new attributes
str(newDF)
#'data.frame':	2027288 obs. of  13 variables:
#  $ DateTime      : POSIXct, format: "2007-01-01 00:00:00" "2007-01-01 00:01:00" "2007-01-01 00:02:00" ...
#$ Date          : chr  "2007-01-01" "2007-01-01" "2007-01-01" "2007-01-01" ...
#$ Time          : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
#$ Sub_metering_1: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_2: num  0 0 0 0 0 0 0 0 0 0 ...
#$ Sub_metering_3: num  0 0 0 0 0 0 0 0 0 0 ...
#$ year          : num  2007 2007 2007 2007 2007 ...
#$ month         : num  1 1 1 1 1 1 1 1 1 1 ...
#$ quarter       : int  1 1 1 1 1 1 1 1 1 1 ...
#$ week          : num  1 1 1 1 1 1 1 1 1 1 ...
#$ wday          : num  2 2 2 2 2 2 2 2 2 2 ...
#$ Hour          : int  0 0 0 0 0 0 0 0 0 0 ...
#$ minute        : int  0 1 2 3 4 5 6 7 8 9 ...

#summary(newDF)
#DateTime                       Date               Time           Sub_metering_1   Sub_metering_2  
#Min.   :2007-01-01 00:00:00   Length:1569894     Length:1569894     Min.   : 0.000   Min.   : 0.000  
#1st Qu.:2007-10-03 06:39:15   Class :character   Class :character   1st Qu.: 0.000   1st Qu.: 0.000  
#Median :2008-07-01 20:05:30   Mode  :character   Mode  :character   Median : 0.000   Median : 0.000  
#Mean   :2008-07-02 01:54:14                                         Mean   : 1.159   Mean   : 1.343  
#3rd Qu.:2009-03-31 12:32:45                                         3rd Qu.: 0.000   3rd Qu.: 1.000  
#Max.   :2009-12-31 23:59:00                                         Max.   :82.000   Max.   :78.000  
#Sub_metering_3        year          month             day           quarter          week            wday  
#Min.   : 0.000   Min.   :2007   Min.   : 1.000   Min.   : 1.00   Min.   :1.00   Min.   : 1.00   Min.   :1  
#1st Qu.: 0.000   1st Qu.:2007   1st Qu.: 4.000   1st Qu.: 8.00   1st Qu.:2.00   1st Qu.:13.00   1st Qu.:2  
#Median : 1.000   Median :2008   Median : 7.000   Median :16.00   Median :3.00   Median :27.00   Median :4  
#Mean   : 6.216   Mean   :2008   Mean   : 6.528   Mean   :15.71   Mean   :2.51   Mean   :26.62   Mean   :4  
#3rd Qu.:17.000   3rd Qu.:2009   3rd Qu.:10.000   3rd Qu.:23.00   3rd Qu.:4.00   3rd Qu.:40.00   3rd Qu.:6  
#Max.   :31.000   Max.   :2009   Max.   :12.000   Max.   :31.00   Max.   :4.00   Max.   :53.00   Max.   :7  
#Hour          minute     
#Min.   : 0.0   Min.   : 0.00  
#1st Qu.: 6.0   1st Qu.:14.25  
#Median :12.0   Median :30.00  
#Mean   :11.5   Mean   :29.50  
#3rd Qu.:18.0   3rd Qu.:44.00  
#Max.   :23.0   Max.   :59.00  

glimpse(newDF)
#Rows: 2,027,288
#Columns: 14
#$ DateTime       <dttm> 2007-01-01 00:00:00, 2007-01-01 00:01:00, 2007-01-01 00:02:00, 200…
#$ Date           <chr> "2007-01-01", "2007-01-01", "2007-01-01", "2007-01-01", "2007-01-01…
#$ Time           <chr> "00:00:00", "00:01:00", "00:02:00", "00:03:00", "00:04:00", "00:05:…
#$ Sub_metering_1 <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
#$ Sub_metering_2 <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1…
#$ Sub_metering_3 <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
#$ year           <dbl> 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2007, 2…
#$ month          <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#$ quarter        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#$ week           <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#$ wday           <dbl> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2…
#$ Hour           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
#$ minute         <int> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 1…
#$ day            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…


head(arrange(newDF, desc(Sub_metering_1)))
head(arrange(newDF, desc(Sub_metering_2)))
head(arrange(newDF, desc(Sub_metering_3)))
# Filter(): filter data - - - -

#Filter by summer months only June-August 
summer <- filter(newDF, month>=6, month<=8)

winter <- filter(newDF, month<=2)
head(winter)
summary(winter)
head(arrange(winter, desc(Sub_metering_1)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year month day
#1 2009-01-24 12:51:00 2009-01-24 12:51:00             82              0             17 2009     1  24
#2 2009-01-24 12:50:00 2009-01-24 12:50:00             81              0             17 2009     1  24
#3 2009-01-24 12:52:00 2009-01-24 12:52:00             81              5             17 2009     1  24
#4 2009-01-24 12:57:00 2009-01-24 12:57:00             81             34             18 2009     1  24
#5 2009-01-24 12:54:00 2009-01-24 12:54:00             80             27             17 2009     1  24
#6 2009-01-24 12:55:00 2009-01-24 12:55:00             80             36             17 2009     1  24
#quarter week wday Hour minute
#1       1    4    7   12     51
#2       1    4    7   12     50
#3       1    4    7   12     52
#4       1    4    7   12     57
#5       1    4    7   12     54
#6       1    4    7   12     55

head(arrange(winter,desc(Sub_metering_2)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year month day
#1 2007-01-17 15:03:00 2007-01-17 15:03:00              0             78             18 2007     1  17
#2 2007-01-17 15:04:00 2007-01-17 15:04:00              0             77             17 2007     1  17
#3 2007-01-17 15:05:00 2007-01-17 15:05:00              0             77             18 2007     1  17
#4 2007-01-17 15:06:00 2007-01-17 15:06:00              0             77             18 2007     1  17
#5 2009-01-17 16:28:00 2009-01-17 16:28:00              0             77              0 2009     1  17
#6 2009-01-28 15:15:00 2009-01-28 15:15:00              0             77             18 2009     1  28
#quarter week wday Hour minute
#1       1    3    4   15      3
#2       1    3    4   15      4
#3       1    3    4   15      5
#4       1    3    4   15      6
#5       1    3    7   16     28
#6       1    4    4   15     15

head(arrange(winter,desc(Sub_metering_3)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year month day
#1 2007-01-25 23:04:00 2007-01-25 23:04:00              0              0             20 2007     1  25
#2 2007-02-07 05:59:00 2007-02-07 05:59:00              0              0             20 2007     2   7
#3 2008-01-03 02:15:00 2008-01-03 02:15:00              0              0             20 2008     1   3
#4 2009-01-02 04:53:00 2009-01-02 04:53:00              0              0             20 2009     1   2
#5 2009-01-04 05:33:00 2009-01-04 05:33:00              0              0             20 2009     1   4
#6 2009-01-04 05:56:00 2009-01-04 05:56:00              0              0             20 2009     1   4
#quarter week wday Hour minute
#1       1    4    5   23      4
#2       1    6    4    5     59
#3       1    1    5    2     15
#4       1    1    6    4     53
#5       1    1    1    5     33
#6       1    1    1    5     56




#summary(summer)
#DateTime                       Date               Time           Sub_metering_1   
#Min.   :2007-06-01 00:00:00   Length:393039      Length:393039      Min.   : 0.0000  
#1st Qu.:2007-08-08 08:54:30   Class :character   Class :character   1st Qu.: 0.0000  
#Median :2008-07-15 14:38:00   Mode  :character   Mode  :character   Median : 0.0000  
#Mean   :2008-07-13 03:53:08                                         Mean   : 0.8714  
#3rd Qu.:2009-06-24 03:24:30                                         3rd Qu.: 0.0000  
#Max.   :2009-08-31 23:59:00                                         Max.   :79.0000  
#Sub_metering_2   Sub_metering_3        year          month            day       
#Min.   : 0.000   Min.   : 0.000   Min.   :2007   Min.   :6.000   Min.   : 1.00  
#1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:2007   1st Qu.:6.000   1st Qu.: 8.00  
#Median : 0.000   Median : 1.000   Median :2008   Median :7.000   Median :16.00  
#Mean   : 1.059   Mean   : 4.595   Mean   :2008   Mean   :7.017   Mean   :15.86  
#3rd Qu.: 1.000   3rd Qu.: 4.000   3rd Qu.:2009   3rd Qu.:8.000   3rd Qu.:24.00  
#Max.   :75.000   Max.   :31.000   Max.   :2009   Max.   :8.000   Max.   :31.00  
#quarter           week            wday           Hour           minute    
#Min.   :2.000   Min.   :22.00   Min.   :1.00   Min.   : 0.00   Min.   : 0.0  
#1st Qu.:2.000   1st Qu.:25.00   1st Qu.:2.00   1st Qu.: 6.00   1st Qu.:15.0  
#Median :3.000   Median :29.00   Median :4.00   Median :12.00   Median :30.0  
#Mean   :2.679   Mean   :28.72   Mean   :3.99   Mean   :11.51   Mean   :29.5  
#3rd Qu.:3.000   3rd Qu.:32.00   3rd Qu.:6.00   3rd Qu.:18.00   3rd Qu.:45.0  
#Max.   :3.000   Max.   :35.00   Max.   :7.00   Max.   :23.00   Max.   :59.0  

head(summer)
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year
#1 2007-06-01 00:00:00 2007-06-01 00:00:00              0              2              0 2007
#2 2007-06-01 00:01:00 2007-06-01 00:01:00              0              1              0 2007
#3 2007-06-01 00:02:00 2007-06-01 00:02:00              0              2              0 2007
#4 2007-06-01 00:03:00 2007-06-01 00:03:00              0              1              0 2007
#5 2007-06-01 00:04:00 2007-06-01 00:04:00              0              2              0 2007
#6 2007-06-01 00:05:00 2007-06-01 00:05:00              0              1              0 2007
#month day quarter week wday Hour minute
#1     6   1       2   22    6    0      0
#2     6   1       2   22    6    0      1
#3     6   1       2   22    6    0      2
#4     6   1       2   22    6    0      3
#5     6   1       2   22    6    0      4
#6     6   1       2   22    6    0      5

tail(summer)
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3
#393034 2009-08-31 23:54:00 2009-08-31 23:54:00              0              0              0
#393035 2009-08-31 23:55:00 2009-08-31 23:55:00              0              0              1
#393036 2009-08-31 23:56:00 2009-08-31 23:56:00              0              0              1
#393037 2009-08-31 23:57:00 2009-08-31 23:57:00              0              0              0
#393038 2009-08-31 23:58:00 2009-08-31 23:58:00              0              0              1
#393039 2009-08-31 23:59:00 2009-08-31 23:59:00              0              0              1
#year month day quarter week wday Hour minute
#393034 2009     8  31       3   35    2   23     54
#393035 2009     8  31       3   35    2   23     55
#393036 2009     8  31       3   35    2   23     56
#393037 2009     8  31       3   35    2   23     57
#393038 2009     8  31       3   35    2   23     58
#393039 2009     8  31       3   35    2   23     59

# ARRANGE FUNCTION
# 2. arrange(): reorder rows ----

head(arrange(summer, desc(Sub_metering_1)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year
#1 2008-07-12 15:38:00 2008-07-12 15:38:00             79              0             17 2008
#2 2008-07-12 15:39:00 2008-07-12 15:39:00             79              1             17 2008
#3 2008-07-12 15:40:00 2008-07-12 15:40:00             79              0             18 2008
#4 2008-07-12 15:41:00 2008-07-12 15:41:00             79              0             17 2008
#5 2008-07-12 15:42:00 2008-07-12 15:42:00             79              0             17 2008
#6 2008-07-12 15:43:00 2008-07-12 15:43:00             79              0             18 2008
#month day quarter week wday Hour minute
#1     7  12       3   28    7   15     38
#2     7  12       3   28    7   15     39
#3     7  12       3   28    7   15     40
#4     7  12       3   28    7   15     41
#5     7  12       3   28    7   15     42
#6     7  12       3   28    7   15     43

head(arrange(summer, desc(Sub_metering_2)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year
#1 2009-06-10 13:21:00 2009-06-10 13:21:00              0             75              1 2009
#2 2009-06-10 13:22:00 2009-06-10 13:22:00              0             75              1 2009
#3 2009-06-10 13:23:00 2009-06-10 13:23:00              0             75              0 2009
#4 2009-06-10 13:24:00 2009-06-10 13:24:00              0             75              1 2009
#5 2009-07-07 20:38:00 2009-07-07 20:38:00              6             75              0 2009
#6 2009-07-07 20:42:00 2009-07-07 20:42:00              1             75              1 2009
#month day quarter week wday Hour minute
#1     6  10       2   23    4   13     21
#2     6  10       2   23    4   13     22
#3     6  10       2   23    4   13     23
#4     6  10       2   23    4   13     24
#5     7   7       3   27    3   20     38
#6     7   7       3   27    3   20     42
head(arrange(summer, desc(Sub_metering_3)))
#DateTime       Date     Time Sub_metering_1 Sub_metering_2 Sub_metering_3 year
#1 2008-06-24 23:26:00 2008-06-24 23:26:00              1              0             31 2008
#2 2008-06-25 06:24:00 2008-06-25 06:24:00              0              1             31 2008
#3 2008-06-29 23:34:00 2008-06-29 23:34:00              0              0             31 2008
#4 2008-06-30 23:22:00 2008-06-30 23:22:00              0              1             31 2008
#5 2008-07-02 06:28:00 2008-07-02 06:28:00              0              2             31 2008
#6 2008-07-02 06:29:00 2008-07-02 06:29:00              0              1             31 2008
#month day quarter week wday Hour minute
#1     6  24       2   26    3   23     26
#2     6  25       2   26    4    6     24
#3     6  29       2   26    1   23     34
#4     6  30       2   26    2   23     22
#5     7   2       3   27    4    6     28
#6     7   2       3   27    4    6     29

summary(summer)
#DateTime                       Date               Time           Sub_metering_1   
#Min.   :2007-06-01 00:00:00   Length:393039      Length:393039      Min.   : 0.0000  
#1st Qu.:2007-08-08 08:54:30   Class :character   Class :character   1st Qu.: 0.0000  
#Median :2008-07-15 14:38:00   Mode  :character   Mode  :character   Median : 0.0000  
#Mean   :2008-07-13 03:53:08                                         Mean   : 0.8714  
#3rd Qu.:2009-06-24 03:24:30                                         3rd Qu.: 0.0000  
#Max.   :2009-08-31 23:59:00                                         Max.   :79.0000  
#Sub_metering_2   Sub_metering_3        year          month            day       
#Min.   : 0.000   Min.   : 0.000   Min.   :2007   Min.   :6.000   Min.   : 1.00  
#1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:2007   1st Qu.:6.000   1st Qu.: 8.00  
#Median : 0.000   Median : 1.000   Median :2008   Median :7.000   Median :16.00  
#Mean   : 1.059   Mean   : 4.595   Mean   :2008   Mean   :7.017   Mean   :15.86  
#3rd Qu.: 1.000   3rd Qu.: 4.000   3rd Qu.:2009   3rd Qu.:8.000   3rd Qu.:24.00  
#Max.   :75.000   Max.   :31.000   Max.   :2009   Max.   :8.000   Max.   :31.00  
#quarter           week            wday           Hour           minute    
#Min.   :2.000   Min.   :22.00   Min.   :1.00   Min.   : 0.00   Min.   : 0.0  
#1st Qu.:2.000   1st Qu.:25.00   1st Qu.:2.00   1st Qu.: 6.00   1st Qu.:15.0  
#Median :3.000   Median :29.00   Median :4.00   Median :12.00   Median :30.0  
#Mean   :2.679   Mean   :28.72   Mean   :3.99   Mean   :11.51   Mean   :29.5  
#3rd Qu.:3.000   3rd Qu.:32.00   3rd Qu.:6.00   3rd Qu.:18.00   3rd Qu.:45.0  
#Max.   :3.000   Max.   :35.00   Max.   :7.00   Max.   :23.00   Max.   :59.0  

#Export Summer
write.table(summer, "/Users/nataliecarreno/Desktop/ESCUELA/COURSE 4/summerdata.txt", sep="\t")

#Creating Summer by Years
summer07 <- filter(newDF, month>=6, month<=8,year == 2007)
summer08 <- filter(newDF, month>=6, month<=8,year == 2008)
summer09 <- filter(newDF, month>=6, month<=8, year ==2009)

#summary by summer and year
summary(summer07)
#DateTime                       Date               Time           Sub_metering_1  
#Min.   :2007-06-01 00:00:00   Length:132284      Length:132284      Min.   : 0.000  
#1st Qu.:2007-06-23 23:52:45   Class :character   Class :character   1st Qu.: 0.000  
#Median :2007-07-17 01:14:30   Mode  :character   Mode  :character   Median : 0.000  
#Mean   :2007-07-17 00:14:24                                         Mean   : 1.051  
#3rd Qu.:2007-08-09 00:47:15                                         3rd Qu.: 0.000  
#Max.   :2007-08-31 23:59:00                                         Max.   :78.000  
#Sub_metering_2   Sub_metering_3        year          month            day       
#Min.   : 0.000   Min.   : 0.000   Min.   :2007   Min.   :6.000   Min.   : 1.00  
#1st Qu.: 0.000   1st Qu.: 0.000   1st Qu.:2007   1st Qu.:6.000   1st Qu.: 8.00  
#Median : 0.000   Median : 0.000   Median :2007   Median :7.000   Median :16.00  
#Mean   : 1.326   Mean   : 4.302   Mean   :2007   Mean   :7.011   Mean   :15.84  
#3rd Qu.: 1.000   3rd Qu.:12.000   3rd Qu.:2007   3rd Qu.:8.000   3rd Qu.:24.00  
#Max.   :74.000   Max.   :20.000   Max.   :2007   Max.   :8.000   Max.   :31.00  
#quarter           week            wday            Hour           minute    
#Min.   :2.000   Min.   :22.00   Min.   :1.000   Min.   : 0.00   Min.   : 0.0  
#1st Qu.:2.000   1st Qu.:25.00   1st Qu.:2.000   1st Qu.: 5.00   1st Qu.:15.0  
#Median :3.000   Median :29.00   Median :4.000   Median :11.00   Median :30.0  
#Mean   :2.674   Mean   :28.64   Mean   :4.024   Mean   :11.49   Mean   :29.5  
#3rd Qu.:3.000   3rd Qu.:32.00   3rd Qu.:6.000   3rd Qu.:17.00   3rd Qu.:45.0  
#Max.   :3.000   Max.   :35.00   Max.   :7.000   Max.   :23.00   Max.   :59.0  

#summary summer 2008
summary(summer08)
#DateTime                       Date               Time           Sub_metering_1   
#Min.   :2008-06-01 00:00:00   Length:132475      Length:132475      Min.   : 0.0000  
#1st Qu.:2008-06-23 23:59:30   Class :character   Class :character   1st Qu.: 0.0000  
#Median :2008-07-17 00:00:00   Mode  :character   Mode  :character   Median : 0.0000  
#Mean   :2008-07-16 23:59:13                                         Mean   : 0.9052  
#3rd Qu.:2008-08-08 23:59:30                                         3rd Qu.: 0.0000  
#Max.   :2008-08-31 23:59:00                                         Max.   :79.0000  
#Sub_metering_2    Sub_metering_3        year          month            day       
#Min.   : 0.0000   Min.   : 0.000   Min.   :2008   Min.   :6.000   Min.   : 1.00  
#1st Qu.: 0.0000   1st Qu.: 0.000   1st Qu.:2008   1st Qu.:6.000   1st Qu.: 8.00  
#Median : 0.0000   Median : 1.000   Median :2008   Median :7.000   Median :16.00  
#Mean   : 0.9823   Mean   : 4.506   Mean   :2008   Mean   :7.011   Mean   :15.84  
#3rd Qu.: 1.0000   3rd Qu.: 1.000   3rd Qu.:2008   3rd Qu.:8.000   3rd Qu.:23.50  
#Max.   :74.0000   Max.   :31.000   Max.   :2008   Max.   :8.000   Max.   :31.00  
#quarter           week            wday            Hour          minute    
#Min.   :2.000   Min.   :22.00   Min.   :1.000   Min.   : 0.0   Min.   : 0.0  
#1st Qu.:2.000   1st Qu.:25.50   1st Qu.:2.000   1st Qu.: 5.0   1st Qu.:14.5  
#Median :3.000   Median :29.00   Median :4.000   Median :11.0   Median :30.0  
#Mean   :2.674   Mean   :28.78   Mean   :3.967   Mean   :11.5   Mean   :29.5  
#3rd Qu.:3.000   3rd Qu.:32.00   3rd Qu.:6.000   3rd Qu.:17.0   3rd Qu.:44.5  
#Max.   :3.000   Max.   :35.00   Max.   :7.000   Max.   :23.0   Max.   :59.0  

#summary 2009
summary(summer09)
#DateTime                       Date               Time           Sub_metering_1   
#Min.   :2009-06-01 00:00:00   Length:128280      Length:128280      Min.   : 0.0000  
#1st Qu.:2009-06-25 13:34:45   Class :character   Class :character   1st Qu.: 0.0000  
#Median :2009-07-17 20:08:30   Mode  :character   Mode  :character   Median : 0.0000  
#Mean   :2009-07-17 15:42:35                                         Mean   : 0.6518  
#3rd Qu.:2009-08-09 02:38:15                                         3rd Qu.: 0.0000  
#Max.   :2009-08-31 23:59:00                                         Max.   :75.0000  
#Sub_metering_2    Sub_metering_3        year          month           day       
#Min.   : 0.0000   Min.   : 0.000   Min.   :2009   Min.   :6.00   Min.   : 1.00  
#1st Qu.: 0.0000   1st Qu.: 1.000   1st Qu.:2009   1st Qu.:6.00   1st Qu.: 8.00  
#Median : 0.0000   Median : 1.000   Median :2009   Median :7.00   Median :16.00  
#Mean   : 0.8618   Mean   : 4.989   Mean   :2009   Mean   :7.03   Mean   :15.91  
#3rd Qu.: 1.0000   3rd Qu.: 9.000   3rd Qu.:2009   3rd Qu.:8.00   3rd Qu.:24.00  
#Max.   :75.0000   Max.   :31.000   Max.   :2009   Max.   :8.00   Max.   :31.00  
#quarter           week            wday            Hour           minute     
#Min.   :2.000   Min.   :22.00   Min.   :1.000   Min.   : 0.00   Min.   : 0.00  
#1st Qu.:2.000   1st Qu.:26.00   1st Qu.:2.000   1st Qu.: 6.00   1st Qu.:14.75  
#Median :3.000   Median :29.00   Median :4.000   Median :12.00   Median :30.00  
#Mean   :2.689   Mean   :28.73   Mean   :3.978   Mean   :11.52   Mean   :29.50  
#3rd Qu.:3.000   3rd Qu.:32.00   3rd Qu.:6.000   3rd Qu.:18.00   3rd Qu.:45.00  
#Max.   :3.000   Max.   :35.00   Max.   :7.000   Max.   :23.00   Max.   :59.00  


#max consumption by meter during summer months 
maxreading <- summer%>%
  group_by(month, year)%>%
  summarize(maxreading = max(Sub_metering_1))
  
maxreading  


#SUMMARIZING IN GROUPS BY MONTH
library(tidyr)
MonthlySum <-newDF %>%
  group_by(year, month) %>%
  summarise(across(starts_with('Sub'), sum))

MonthlySumGather <- gather(MonthlySum, 'Sub_metering_1','Sub_metering_2', 'Sub_metering_3', key ="Sub_Metering", value ='amount')

summary(MonthlySumGather)
  
#PLOT
library(plotly)
library(ggplot2)

plot(newDF$Sub_metering_1)

houseWeek <-filter(newDF, year== 2008 & week== 2)
plot(houseWeek$Sub_metering_1)

houseDay <- filter(newDF, year == 2008 & month == 1 & day == 9)
plot_ly(houseDay, x = ~houseDay$DateTime, y = ~houseDay$Sub_metering_1, type = 'scatter', mode = 'lines')

plot_ly(houseDay, x = ~houseDay$DateTime, y = ~houseDay$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~houseDay$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~houseDay$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption January 9th, 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

## Subset the 9th day of January 2008 - 10 Minute frequency  (WEDNESDAY)
houseDay10 <- filter(newDF, year == 2008 & month == 1 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))

## Plot sub-meter 1, 2 and 3 with title, legend and labels - 10 Minute frequency
plot_ly(houseDay10, x = ~houseDay10$DateTime, y = ~houseDay10$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~houseDay10$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~houseDay10$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption January 9th, 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#Jan 9 2007
jan907 <- filter(newDF, year == 2007 & month == 1 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(jan907, x = ~jan907$DateTime, y = ~jan907$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~jan907$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~jan907$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption January 9th, 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#Jan 9 2009
jan909 <- filter(newDF, year == 2009 & month == 1 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(jan909, x = ~jan909$DateTime, y = ~jan909$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~jan909$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~jan909$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption January 9th, 2009",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))


#Plot Monthly Sum by Year
subset(MonthlySumGather) %>%
ggplot(aes(month,amount, color=Sub_Metering)) +
  geom_line(size=1) +
  facet_grid(year~.) +
  theme_bw() +
  theme(aspect.ratio = .25,
        legend.position = 'top',
        legend.justification = 'left',
        legend.margin=margin(0,0,0,6),
        legend.box.margin=margin(0,-10,-10,0)) +
  scale_color_brewer(palette = 'Set1', name = 'Submeter: ', labels = c('Kitchen', 'Laundry', 'Water Heater & AC')) +
  scale_x_discrete(limits=c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) +
  xlab('\nTime') +
  ylab('Power (Watt-hours)\n') +
  ggtitle('Monthly Energy Use by Year')


#Plot meters during summer time 
plot_ly(summer08, x = ~summer08$DateTime, y = ~summer08$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~summer08$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~summer08$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption Summer 2008",
          xaxis = list(title = "Time"),
          yaxis = list (title = "Power (watt-hours)"))

plot_ly(summer07, x = ~summer07$DateTime, y = ~summer07$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~summer07$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~summer07$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption Summer 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

plot_ly(summer09, x = ~summer09$DateTime, y = ~summer09$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~summer09$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~summer09$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption Summer 2009",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

ggplot(data=summer08, aes(x=wday, y=Sub_metering_1, fill=Sub_metering_1)) + geom_bar(stat = "identity")+
ggtitle("Power Consumption Meter 1 Summer 2008")+
       xlab("Weekday")+
       ylab("Power (watt-hours)")

#filtering first week of August Aug 4 - Aug 10
august08week1 <- filter(summer08, month==08 & week==32)
head(arrange(august08week1, desc(Sub_metering_1)))
summary(august08week1)

plot_ly(august08week1, x = ~august08week1$DateTime, y = ~august08week1$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
add_trace(y = ~august08week1$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
add_trace(y = ~august08week1$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
            layout(title = "Power Consumption August 4 - August 10 2008",
            xaxis = list(title = "Time"),
            yaxis = list (title = "Power (watt-hours)"))

plot_ly(august08week1, x = ~august08week1$DateTime, y = ~august08week1$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  layout(title = "Kitchen Power Consumption August 4 - August 10 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))


#filtering first week of June June 2 - June 8
june08week1 <- filter(summer08, month==06 & week==23)
head(arrange(june08week1, desc(Sub_metering_1)))
summary(june08week1)

#August 6 - August 12
august07week1 <- filter(summer07, month==08 & week==32)
head(arrange(august07week1, desc(Sub_metering_1)))
summary(august07week1)

plot_ly(august07week1, x = ~august07week1$DateTime, y = ~august07week1$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~august07week1$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~august07week1$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 6 - August 12 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

## Subset the 9th day of August 2008 - 10 Minute frequency
house9 <- filter(newDF, year == 2008 & month ==8 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))

## Plot sub-meter 1, 2 and 3 with title, legend and labels - 10 Minute frequency
plot_ly(house9, x = ~house9$DateTime, y = ~house9$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house9$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house9$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 9th, 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

## Subset the 9th day of August 2007 - 10 Minute frequency   (THURSDAY)
house7 <- filter(newDF, year == 2007 & month ==8 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))

## Plot sub-meter 1, 2 and 3 with title, legend and labels - 10 Minute frequency
plot_ly(house7, x = ~house7$DateTime, y = ~house7$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house7$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house7$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 9th, 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))


# JUNE 9 2007
jun907 <- filter(newDF, year == 2007 & month ==6 & day ==9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house7, x = ~house7$DateTime, y = ~house7$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house7$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house7$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 9th, 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

# AUGUST 9 2009
aug909 <- filter(newDF, year == 2009 & month ==8 & day == 9 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house7, x = ~aug909$DateTime, y = ~aug909$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~aug909$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~aug909$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 9th, 2009",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))
summary(aug909)

#SUBSET THE 6TH DAY OF AUGUST 2007 - 10 MIN FREQUENCY (MONDAY)
house6 <- filter(newDF, year == 2007 & month ==8 & day == 6 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house6, x = ~house6$DateTime, y = ~house6$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house6$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house6$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 6th, 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#SUBSET 3RD MONDAY OF AUG 20 2007 
house20 <- filter(newDF, year == 2007 & month ==8 & day == 20 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house20, x = ~house20$DateTime, y = ~house20$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house20$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house20$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 20 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))
#SUBSET 4TH MONDAY OF AUG 27
house27 <- filter(newDF, year == 2007 & month ==8 & day == 27 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house27, x = ~house27$DateTime, y = ~house27$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house27$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house27$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 27 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#SUBSET 3RD MONDAY OF AUG 
house13 <- filter(newDF, year == 2007 & month ==8 & day == 13 & (minute == 0 | minute == 10 | minute == 20 | minute == 30 | minute == 40 | minute == 50))
plot_ly(house6, x = ~house13$DateTime, y = ~house13$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house13$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house13$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 13 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#PLOT AUGUST 2008
august08 <- filter(summer08, month==08)
head(arrange(august08, desc(Sub_metering_1)))
summary(august08)

plot_ly(august08, x = ~august08$DateTime, y = ~august08$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~august08$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~august08$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#kitchen consumption august 2008
plot_ly(august08, x = ~august08$DateTime, y = ~august08$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  layout(title = "Kitchen Power Consumption August 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#laundry august 2008
plot_ly(august08, x = ~august08$DateTime, y = ~august08$Sub_metering_2, name = 'Laundry', type = 'scatter', color = 'orange', mode = 'lines') %>%
  layout(title = "Laundry Power Consumption August 2008",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#PLOT AUGUST 2007
august07 <- filter(summer07, month==08)
plot_ly(august07, x = ~august07$DateTime, y = ~august07$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~august07$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~august07$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 2007",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))

#PLOT AUGUST 2009
august09 <- filter(summer09, month==08)
plot_ly(august07, x = ~august09$DateTime, y = ~august09$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~august09$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~august09$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption August 2009",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))


QuartersbyMeter1 <- newDF%>%
  group_by (quarter)%>%
  summarise(meanM1 <- mean(Sub_metering_1))


# STEP 2
#Subset to one observation per week on Mondays at 8pm for 2007 - 2009

house070809weekly <- filter(newDF, wday == 2 & Hour ==20 & minute ==1)
summary(house070809weekly)
plot_ly(house070809weekly, x = ~house070809weekly$DateTime, y = ~house070809weekly$Sub_metering_1, name = 'Kitchen', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~house070809weekly$Sub_metering_2, name = 'Laundry Room', mode = 'lines') %>%
  add_trace(y = ~house070809weekly$Sub_metering_3, name = 'Water Heater & AC', mode = 'lines') %>%
  layout(title = "Power Consumption Mondays at 8 pm",
         xaxis = list(title = "Time"),
         yaxis = list (title = "Power (watt-hours)"))


#Create TS object with Submeter3 
tsSM3_070809weekly <- ts(house070809weekly$Sub_metering_3, frequency = 52, start = c(2007,1))
#TS with Submeter 1
tsSM1weekly <- ts(house070809weekly$Sub_metering_1, frequency = 52, start = c(2007,1))
#TS with Submeter 2
tsSM2weekly <- ts(house070809weekly$Sub_metering_2, frequency = 52, start = c(2007,1))

#load library
library(ggfortify)

#plot TS with Submeter3
autoplot(tsSM3_070809weekly)

#Plot adding labels and color
autoplot(tsSM3_070809weekly, ts.colour = 'green', xlab = "Time", ylab = "Watt Hours", main = "Sub-meter 3")

autoplot(tsSM1weekly, ts.colour = 'blue', xlab = "Time", ylab = "Watt Hours", main = "Sub-meter 1")

autoplot(tsSM2weekly, ts.colour = 'orange', xlab = "Time", ylab = "Watt Hours", main = "Sub-meter 2")

#Plot submeter 3 with plot.ts
plot.ts(tsSM3_070809weekly)

#SUBMETER1 subset to quaterly  observations at 5:40 pm 
houseSM1quarterly <- filter(newDF, quarter>=1 & day==1 & Hour ==17 & minute ==40)
summary(houseSM1quarterly)
head(houseSM1quarterly)
tail(houseSM1quarterly)


#Create TS object with Submeter1
tsSM1monthly <- ts(houseSM1quarterly$Sub_metering_1, frequency = 12, start = c(2007,1))

#plot TS with submeter1
autoplot(tsSM1monthly, ts.colour = 'blue', xlab = 'Time', ylab = "Watt Hours", main = "Sub-meter 1")

#submeter2 
tsSM2monthly <- ts(houseSM1quarterly$Sub_metering_2, frequency = 12, start = c(2007,1))

autoplot(tsSM2monthly, ts.colour = 'orange', xlab = 'Time', ylab = "Watt Hours", main = "Sub-meter 2")

#submeter3 
tsSM3monthly <- ts(houseSM1quarterly$Sub_metering_3, frequency = 12, start = c(2007,1))

autoplot(tsSM3monthly, ts.colour = 'green', xlab = 'Time', ylab = "Watt Hours", main = "Sub-meter 3")

#SUBMETER 2 - every Friday at 4:15
houseSM2 <- filter(newDF,  wday ==5 & Hour==16 & minute == 15)
head(houseSM2)
tail(houseSM2)
summary(houseSM2)
#DateTime                       Date               Time           Sub_metering_1 Sub_metering_2   
#Min.   :2007-01-04 16:15:00   Length:156         Length:156         Min.   :0      Min.   : 0.0000  
#1st Qu.:2007-10-02 22:15:00   Class :character   Class :character   1st Qu.:0      1st Qu.: 0.0000  
#Median :2008-06-30 04:15:00   Mode  :character   Mode  :character   Median :0      Median : 0.0000  
#Mean   :2008-07-01 01:47:18                                         Mean   :0      Mean   : 0.8205  
#3rd Qu.:2009-03-28 10:15:00                                         3rd Qu.:0      3rd Qu.: 0.0000  
#Max.   :2009-12-31 16:15:00                                         Max.   :0      Max.   :38.0000  
#Sub_metering_3        year          month             day           quarter           week      
#Min.   : 0.000   Min.   :2007   Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   : 1.00  
#1st Qu.: 0.000   1st Qu.:2007   1st Qu.: 3.750   1st Qu.: 8.00   1st Qu.:1.750   1st Qu.:13.75  
#Median : 0.000   Median :2008   Median : 6.500   Median :16.00   Median :2.500   Median :26.50  
#Mean   : 2.788   Mean   :2008   Mean   : 6.487   Mean   :15.69   Mean   :2.506   Mean   :26.63  
#3rd Qu.: 1.000   3rd Qu.:2009   3rd Qu.:10.000   3rd Qu.:23.25   3rd Qu.:4.000   3rd Qu.:40.00  
#Max.   :19.000   Max.   :2009   Max.   :12.000   Max.   :31.00   Max.   :4.000   Max.   :53.00  
#wday        Hour        minute  
#Min.   :5   Min.   :16   Min.   :15  
#1st Qu.:5   1st Qu.:16   1st Qu.:15  
#Median :5   Median :16   Median :15  
#Mean   :5   Mean   :16   Mean   :15  
#3rd Qu.:5   3rd Qu.:16   3rd Qu.:15  
#Max.   :5   Max.   :16   Max.   :15  

tshouseSM2 <- ts(houseSM2$Sub_metering_2, frequency =52, start = c(2007,1))

autoplot(tshouseSM2, ts.colour = 'orange', xlab ='Time', ylab = "Watt Hours", main = "Sub-meter 2" )

tshouseSM3 <- ts(houseSM2$Sub_metering_3, frequency = 52, start = c(2007,1))
autoplot(tshouseSM3, ts.colour = 'green', xlab ='Time', ylab = "Watt Hours", main = "Sub-meter 3" )

#TS Friday at 6:30 pm 
houseSM1 <- filter(newDF,  wday ==5 & Hour==18 & minute == 30)
summary(houseSM1)
#DateTime                       Date               Time           Sub_metering_1    Sub_metering_2   
#Min.   :2007-01-04 18:30:00   Length:156         Length:156         Min.   : 0.0000   Min.   : 0.0000  
#1st Qu.:2007-10-03 00:30:00   Class :character   Class :character   1st Qu.: 0.0000   1st Qu.: 0.0000  
#Median :2008-06-30 06:30:00   Mode  :character   Mode  :character   Median : 0.0000   Median : 0.0000  
#Mean   :2008-07-01 04:02:18                                         Mean   : 0.3782   Mean   : 0.9103  
#3rd Qu.:2009-03-28 12:30:00                                         3rd Qu.: 0.0000   3rd Qu.: 1.0000  
#Max.   :2009-12-31 18:30:00                                         Max.   :38.0000   Max.   :37.0000  
#Sub_metering_3        year          month             day           quarter           week      
#Min.   : 0.000   Min.   :2007   Min.   : 1.000   Min.   : 1.00   Min.   :1.000   Min.   : 1.00  
#1st Qu.: 0.000   1st Qu.:2007   1st Qu.: 3.750   1st Qu.: 8.00   1st Qu.:1.750   1st Qu.:13.75  
#Median : 0.000   Median :2008   Median : 6.500   Median :16.00   Median :2.500   Median :26.50  
#Mean   : 4.038   Mean   :2008   Mean   : 6.487   Mean   :15.69   Mean   :2.506   Mean   :26.63  
#3rd Qu.: 1.000   3rd Qu.:2009   3rd Qu.:10.000   3rd Qu.:23.25   3rd Qu.:4.000   3rd Qu.:40.00  
#Max.   :19.000   Max.   :2009   Max.   :12.000   Max.   :31.00   Max.   :4.000   Max.   :53.00  
#wday        Hour        minute  
#Min.   :5   Min.   :18   Min.   :30  
#1st Qu.:5   1st Qu.:18   1st Qu.:30  
#Median :5   Median :18   Median :30  
#Mean   :5   Mean   :18   Mean   :30  
#3rd Qu.:5   3rd Qu.:18   3rd Qu.:30  
#Max.   :5   Max.   :18   Max.   :30 

tshouseSM1 <- ts(houseSM1$Sub_metering_1, frequency = 52, start = c(2007,1))
autoplot(tshouseSM1, ts.colour = 'blue', xlab ='Time', ylab = "Watt Hours", main = "Sub-meter 1" )

tshSM2 <- ts(houseSM1$Sub_metering_2, frequency = 52, start = c(2007,1))
autoplot(tshSM2, ts.colour = 'orange', xlab ='Time', ylab = "Watt Hours", main = "Sub-meter 2" )

#3 FORECAST

install.packages("forecast")

##Apply time series linear regression to the sub-meter 3 ts object and use summary to obtain R2 and RMSE from the model you built

library(forecast)
fitSM3 <- tslm(tsSM3_070809weekly ~ trend + season) 
summary(fitSM3)
#Call:
#  tslm(formula = tsSM3_070809weekly ~ trend + season)

#Residuals:
#  Min       1Q   Median       3Q      Max 
#-12.7430  -6.0000  -0.3333   5.5903  18.3333 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)
#(Intercept)  7.62123    4.71391   1.617    0.109
#trend        0.01429    0.01682   0.850    0.397
#season2      8.94054    6.92151   1.292    0.199
#season3     -2.74041    6.92051  -0.396    0.693
#season4     -2.75470    6.91955  -0.398    0.691
#season5     -2.43566    6.91863  -0.352    0.726
#season6     -2.78328    6.91775  -0.402    0.688
#season7      3.20243    6.91691   0.463    0.644
#season8      3.18814    6.91612   0.461    0.646
#season9     -8.49281    6.91536  -1.228    0.222
#season10    -2.84043    6.91465  -0.411    0.682
#season11    -2.85472    6.91397  -0.413    0.681
#season12    -2.86901    6.91334  -0.415    0.679
#season13    -2.88330    6.91274  -0.417    0.677
#season14     3.43575    6.91219   0.497    0.620
#season15     3.42146    6.91168   0.495    0.622
#season16    -2.25950    6.91121  -0.327    0.744
#season17     3.72622    6.91078   0.539    0.591
#season18    -8.28807    6.91039  -1.199    0.233
#season19    -2.30236    6.91004  -0.333    0.740
#season20    -2.64998    6.90974  -0.384    0.702
#season21     4.00240    6.90947   0.579    0.564
#season22    -2.34523    6.90924  -0.339    0.735
#season23    -2.69285    6.90906  -0.390    0.698
#season24     0.95953    6.90892   0.139    0.890
#season25    -2.38809    6.90881  -0.346    0.730
#season26     1.93095    6.90875   0.279    0.780
#season27    -8.41667    6.90873  -1.218    0.226
#season28    -6.43095    6.90875  -0.931    0.354
#season29    -2.44524    6.90881  -0.354    0.724
#season30     2.54047    6.90892   0.368    0.714
#season31    -8.80715    6.90906  -1.275    0.205
#season32    -2.82144    6.90924  -0.408    0.684
#season33    -8.50240    6.90947  -1.231    0.221
#season34    -8.51668    6.90974  -1.233    0.221
#season35    -8.86431    6.91004  -1.283    0.202
#season36     1.12141    6.91039   0.162    0.871
#season37    -8.22622    6.91078  -1.190    0.237
#season38    -2.57384    6.91121  -0.372    0.710
#season39     3.41187    6.91168   0.494    0.623
#season40    -2.93575    6.91219  -0.425    0.672
#season41    -8.61670    6.91274  -1.246    0.215
#season42     3.03568    6.91334   0.439    0.661
#season43    -2.64528    6.91397  -0.383    0.703
#season44    -8.99290    6.91465  -1.301    0.196
#season45     2.65948    6.91536   0.385    0.701
#season46    -6.02148    6.91612  -0.871    0.386
#season47     2.63090    6.91691   0.380    0.704
#season48    -2.71672    6.91775  -0.393    0.695
#season49    -3.39768    6.91863  -0.491    0.624
#season50    -8.74530    6.91955  -1.264    0.209
#season51     3.24041    6.92051   0.468    0.641
#season52    -3.10721    6.92151  -0.449    0.654

#Residual standard error: 9.046 on 104 degrees of freedom
#Multiple R-squared:  0.263,	Adjusted R-squared:  -0.1055 
#F-statistic: 0.7138 on 52 and 104 DF,  p-value: 0.9105

## Create the forecast for sub-meter 3. Forecast ahead 20 time periods 
forecastfitSM3 <- forecast(fitSM3, h=20)
## Plot the forecast for sub-meter 3. 
plot(forecastfitSM3)


## Create sub-meter 3 forecast with confidence levels 80 and 90
forecastfitSM3c <- forecast(fitSM3, h=20, level=c(80,90))

## Plot sub-meter 3 forecast, limit y and add labels
plot(forecastfitSM3c, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time")


# SAME MODEL BUT METER 1   FROM TS OBJECT ts object 070809weekly 
fitSM1weekly <-tslm(tsSM1weekly ~ trend + season) 
summary (fitSM1weekly)
#Call:
#  tslm(formula = tsSM1weekly ~ trend + season)

#Residuals:
#  Min       1Q   Median       3Q      Max 
#-12.9283  -0.2617   0.0000   0.2617  25.3333 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) -3.976e-01  1.850e+00  -0.215  0.83027    
#trend        5.032e-03  6.600e-03   0.762  0.44749    
#season2      7.925e-01  2.716e+00   0.292  0.77107    
#season3      1.208e-01  2.716e+00   0.044  0.96462    
#season4      1.157e-01  2.716e+00   0.043  0.96608    
#season5      1.107e-01  2.715e+00   0.041  0.96755    
#season6      1.057e-01  2.715e+00   0.039  0.96902    
#season7      1.006e-01  2.715e+00   0.037  0.97050    
#season8      9.561e-02  2.714e+00   0.035  0.97197    
#season9      9.058e-02  2.714e+00   0.033  0.97344    
#season10     8.555e-02  2.714e+00   0.032  0.97491    
#season11     8.052e-02  2.713e+00   0.030  0.97638    
#season12     7.549e-02  2.713e+00   0.028  0.97786    
#season13     7.045e-02  2.713e+00   0.026  0.97933    
#season14     7.321e-01  2.713e+00   0.270  0.78779    
#season15     6.039e-02  2.713e+00   0.022  0.98228    
#season16     5.536e-02  2.712e+00   0.020  0.98376    
#season17     5.032e-02  2.712e+00   0.019  0.98523    
#season18     4.529e-02  2.712e+00   0.017  0.98671    
#season19     4.026e-02  2.712e+00   0.015  0.98818    
#season20     3.523e-02  2.712e+00   0.013  0.98966    
#season21     3.019e-02  2.712e+00   0.011  0.99114    
#season22     2.516e-02  2.712e+00   0.009  0.99261    
#season23     2.013e-02  2.711e+00   0.007  0.99409    
#season24     1.510e-02  2.711e+00   0.006  0.99557    
#season25     1.006e-02  2.711e+00   0.004  0.99705    
#season26     5.032e-03  2.711e+00   0.002  0.99852    
#season27     3.268e-15  2.711e+00   0.000  1.00000    
#season28     1.266e+01  2.711e+00   4.670 9.04e-06 ***
#  season29     1.990e+00  2.711e+00   0.734  0.46465    
#season30    -1.510e-02  2.711e+00  -0.006  0.99557    
#season31    -2.013e-02  2.711e+00  -0.007  0.99409    
#season32    -2.516e-02  2.712e+00  -0.009  0.99261    
#season33    -3.019e-02  2.712e+00  -0.011  0.99114    
#season34    -3.523e-02  2.712e+00  -0.013  0.98966    
#season35     2.931e-01  2.712e+00   0.108  0.91415    
#season36    -4.529e-02  2.712e+00  -0.017  0.98671    
#season37     6.163e-01  2.712e+00   0.227  0.82067    
#season38    -5.536e-02  2.712e+00  -0.020  0.98376    
#season39     2.729e-01  2.713e+00   0.101  0.92004    
#season40    -6.542e-02  2.713e+00  -0.024  0.98081    
#season41    -7.045e-02  2.713e+00  -0.026  0.97933    
#season42     2.578e-01  2.713e+00   0.095  0.92447    
#season43    -8.052e-02  2.713e+00  -0.030  0.97638    
#season44    -8.555e-02  2.714e+00  -0.032  0.97491    
#season45    -9.058e-02  2.714e+00  -0.033  0.97344    
#season46     2.377e-01  2.714e+00   0.088  0.93038    
#season47    -1.006e-01  2.715e+00  -0.037  0.97050    
#season48    -1.057e-01  2.715e+00  -0.039  0.96902    
#season49    -1.107e-01  2.715e+00  -0.041  0.96755    
#season50    -1.157e-01  2.716e+00  -0.043  0.96608    
#season51    -1.208e-01  2.716e+00  -0.044  0.96462    
#season52     7.208e+00  2.716e+00   2.653  0.00922 ** 
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 3.55 on 104 degrees of freedom
#Multiple R-squared:  0.3248,	Adjusted R-squared:  -0.01278 
#F-statistic: 0.9622 on 52 and 104 DF,  p-value: 0.5529

forecastfitSM1weekly <- forecast(fitSM1weekly, h=20)
plot(forecastfitSM1weekly)
plot(forecastfitSM1weekly, ylim = c(0, 20), ylab = "Watt-Hours", xlab="Time") 

#Same but with SM2
fitSM2weekly <-tslm(tsSM2weekly ~ trend + season) 
summary (fitSM2weekly)
#Residuals:
#  Min       1Q   Median       3Q      Max 
#-13.1885  -0.8551   0.0000   0.8551  24.6667 
#Residual standard error: 5.98 on 104 degrees of freedom
#Multiple R-squared:  0.3152,	Adjusted R-squared:  -0.02725 
#F-statistic: 0.9204 on 52 and 104 DF,  p-value: 0.6239

#got negative values in plot 
forecastfitSM2weekly <- forecast(fitSM2weekly, h=20)
plot(forecastfitSM2weekly)

#adding confidence level and parameters to plot 
forecastfitSM2weeklyc <- forecast(fitSM2weekly, h=20, level=c(80,90))
plot(forecastfitSM2weeklyc, ylim = c(0, 20), ylab = "Watt-Hours", xlab="Time")


#TSLM/FORECAST WITH TS OBJECT OBSERVATIONS 1ST DAY OF MONTH AT 5:40 PM 
fitSM1monthly <- tslm(tsSM1monthly ~ trend + season)
summary(fitSM1monthly)
#Residuals:
#  Min      1Q  Median      3Q     Max 
#-12.333  -3.042   0.000   3.042  21.625 
#Residual standard error: 8.351 on 23 degrees of freedom
#Multiple R-squared:  0.379,	Adjusted R-squared:  0.05496 
#F-statistic:  1.17 on 12 and 23 DF,  p-value: 0.3586

#negative values on forecast
forecastfitSM1monthly<- forecast(fitSM1monthly, h=20)
plot(forecastfitSM1monthly)

#adding confidence level 90
forecastfitSM1monthlyc <- forecast(fitSM1monthly, h=20, level = c(90))
plot(forecastfitSM1monthlyc, ylim = c(0, 20), ylab = "Watt-Hours", xlab="Time")

#same with SM2 
fitSM2monthly <- tslm(tsSM2monthly ~ trend + season)
summary(fitSM2monthly)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-6.0417 -0.3437 -0.0417  0.3438  9.0000 
#Residual standard error: 2.419 on 23 degrees of freedom
#Multiple R-squared:  0.4797,	Adjusted R-squared:  0.2083 
#F-statistic: 1.767 on 12 and 23 DF,  p-value: 0.1163

forecastfitSM2monthly <- forecast(fitSM2monthly, h=20)
plot(forecastfitSM2monthly)
plot(forecastfitSM2monthly, ylim = c(0,20), ylab= "Watt-Hours", xlab ="Time")

#same but with SM3
fitSM3monthly <- tslm(tsSM3monthly ~ trend + season)
summary(fitSM3monthly)
#Residuals:
#  Min       1Q   Median       3Q      Max 
#-13.5417  -4.4583  -0.1667   1.5417  12.5417 

#Residual standard error: 7.105 on 23 degrees of freedom
#Multiple R-squared:  0.3156,	Adjusted R-squared:  -0.04148 
#F-statistic: 0.8838 on 12 and 23 DF,  p-value: 0.5741

forecastfitSM3monthly <- forecast(fitSM3monthly, h=20, level = c(90))
plot(forecastfitSM3monthly, ylim = c(0,20), ylab= "Watt-Hoiurs", xlab="Time")


forecastfitSM1 <- forecast(fitSM1, h=20, level=c(80,90))
plot(forecastfitSM1)
plot(forecastfitSM1, ylim = c(0, 20), ylab = "Watt-Hours", xlab="Time")


#4 - DECOMPOSITION 

#Decompose Sub Meter 3 into trend, seasonal and remainder

components070809SM3weekly <- decompose(tsSM3_070809weekly)

#plot decomposed submeter 3 
plot(components070809SM3weekly)

#summary
summary(components070809SM3weekly)
#Length Class  Mode     
#x        157    ts     numeric  
#seasonal 157    ts     numeric  
#trend    157    ts     numeric  
#random   157    ts     numeric  
#figure    52    -none- numeric  
#type       1    -none- character

componentsSM1monthly <- decompose(tsSM1monthly)

plot(componentsSM1monthly)

summary(componentsSM1monthly)
#Length Class  Mode     
#x        36     ts     numeric  
#seasonal 36     ts     numeric  
#trend    36     ts     numeric  
#random   36     ts     numeric  
#figure   12     -none- numeric  
#type      1     -none- character

componentsSM2Friday <- decompose(tshouseSM2)
plot(componentsSM2Friday)
summary(componentsSM2Friday)
#Length Class  Mode     
#x        156    ts     numeric  
#seasonal 156    ts     numeric  
#trend    156    ts     numeric  
#random   156    ts     numeric  
#figure    52    -none- numeric  
#type       1    -none- character

componentsSM2monthly <- decompose(tsSM2monthly)
plot(componentsSM2monthly)
summary(componentsSM2monthly)
#Length Class  Mode     
#x        36     ts     numeric  
#seasonal 36     ts     numeric  
#trend    36     ts     numeric  
#random   36     ts     numeric  
#figure   12     -none- numeric  
#type      1     -none- character


componentsSM3monthly <- decompose(tsSM3monthly)
plot(componentsSM3monthly)
summary(componentsSM3monthly)
#Length Class  Mode     
#x        36     ts     numeric  
#seasonal 36     ts     numeric  
#trend    36     ts     numeric  
#random   36     ts     numeric  
#figure   12     -none- numeric  
#type      1     -none- character

## Seasonal adjusting sub-meter 3 by subtracting the seasonal component & plot
tsSM3_070809Adjusted <- tsSM3_070809weekly - components070809SM3weekly$seasonal

autoplot(tsSM3_070809Adjusted)

#seasonal adjusting sub meters by subtracting seasonal component & plot  USING TS Monthly
tsSM1monthlyAdj <- tsSM1monthly - componentsSM1monthly$seasonal
autoplot(tsSM1monthlyAdj)

tsSM2monthlyAdj <- tsSM2monthly - componentsSM2monthly$seasonal
autoplot(tsSM2monthlyAdj)

tsSM3monthlyAdj <- tsSM3monthly - componentsSM3monthly$seasonal
autoplot(tsSM3monthlyAdj)

## Test Seasonal Adjustment by running Decompose again. Note the very, very small scale for Seasonal
plot(decompose(tsSM3_070809Adjusted))

plot(decompose(tsSM1monthlyAdj))
plot(decompose(tsSM2monthlyAdj))
plot(decompose(tsSM3monthlyAdj))

## Holt Winters Exponential Smoothing & Plot
tsSM3_HW070809 <- HoltWinters(tsSM3_070809Adjusted, beta=FALSE, gamma=FALSE)
plot(tsSM3_HW070809, ylim = c(0, 25))

tsSM1monthlyHW <- HoltWinters(tsSM1monthlyAdj, beta=FALSE, gamma=FALSE)
plot(tsSM1monthlyHW, ylim = c(0, 25))

tsSM2monthlyHW <- HoltWinters(tsSM2monthlyAdj, beta=FALSE, gamma=FALSE )
plot(tsSM2monthlyHW, ylim = c(0, 25))

tsSM3monthlyHW <-HoltWinters(tsSM3monthlyAdj, beta=FALSE, gamma=FALSE )
plot(tsSM3monthlyHW, ylim = c(0, 25))

## HoltWinters forecast & plot
tsSM3_HW070809for <- forecast(tsSM3_HW070809, h=25)
plot(tsSM3_HW070809for, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 3")

tsSM1monthlyfor <- forecast(tsSM1monthlyHW, h=25)
plot(tsSM1monthlyfor, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 1 - Kitchen")

tsSM2monthlyfor <- forecast(tsSM2monthlyHW, h=25)
plot(tsSM2monthlyfor, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 2 - Laundry Room")

tsSM3monthlyfor <- forecast(tsSM3monthlyHW, h=25)
plot(tsSM3monthlyfor, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 3 - Water Heater & AC")

## Forecast HoltWinters with diminished confidence levels
tsSM3_HW070809forC <- forecast(tsSM3_HW070809, h=25, level=c(10,25))

tsSM1HWmonthlyforC <- forecast(tsSM1monthlyHW, h=25, level=c(10,25))
tsSM2HWmonthlyforC <- forecast(tsSM2monthlyHW, h=25, level=c(10,25))
tsSM3HWmonthlyforC <- forecast(tsSM3monthlyHW, h=25, level=c(10,25))


## Plot only the forecasted area
plot(tsSM3_HW070809forC, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 3", start(2010))
plot(tsSM1HWmonthlyforC, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 1", start(2010))
plot(tsSM2HWmonthlyforC, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 2", start(2010))
plot(tsSM3HWmonthlyforC, ylim = c(0, 20), ylab= "Watt-Hours", xlab="Time - Sub-meter 3", start(2010))
