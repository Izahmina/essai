---
  title: "test engie"
output: word_document
---
  
  ```{r préalable}
library(data.table)
```


```{r préalable1}

setwd("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv")
airports<-fread("airports.csv", dec = ",")
head(airports)

```
```{r préalable2}
airlines<-fread("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv/airlines.csv")
head(airlines)
```

```{r préalable3}
flights<-data.frame(fread("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv/flights.csv" , dec = ","))
head(flights)
```

```{r préalable4}
planes<-fread("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv/planes.csv", dec = ",")
head(planes)
```

```{r préalable5}
states_airports<-fread("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv/states_airports.csv", dec = ",")
head(states_airports)
```

```{r préalable6}

weather<-fread("C:/Users/minak/OneDrive/Bureau/2021 2022/test engie/datasets/csv/weather.csv", dec = ",")
head(weather)
```

```{r QUEST1}
library(dplyr)
temp=flights  %>%
  inner_join(weather,  by=c("origin","time_hour"))

num=c("arr_delay", "pressure","arr_time", "sched_arr_time", "precip", "humid", "visib")
temp2<-temp%>%
  select(num) %>%
  na.omit()%>%
  filter(arr_delay<0)
round(cor(temp2 ),2)
```

```{r QUEST2}
f<-flights%>%
  group_by(dest) %>%
  na.omit()  %>%
  summarise(duree_moyenne=mean(arr_delay), duree_cumul=sum(arr_delay))
f
```