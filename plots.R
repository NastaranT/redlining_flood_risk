
library(dplyr)
library(plotly)

new_orleans= read.csv("data/neworleans_intersect_data.txt")
philly= read.csv("data/philly_intersect_data.txt")
brooklyn= read.csv("data/brooklyn_intersect_data.txt")
miami=read.csv("data/maimi_intersect_data.txt")
houston=read.csv("data/houston_intersect_data.txt")



df=philly %>% group_by(holc_grade)

df2=df %>% summarise(
  area_sf = sum(area_sf)
)
head(df2)

df2$percent_area= (df2$area_sf/70435582.608474)*100

# neworlean total area of 100 flood intersect: 111727302.334948 sq ft
# philly total area of 100 flood intersect: 70435582.608474  sq ft
# brooklyn total area of 100 flood intersect: 39844824.177483  sq ft
# miami total area of 100 flood intersect:76786307.768851  sq ft
# houston total area of 100 flood intersect:47499831.314758  sq ft



p4 <- plot_ly() %>% 
  add_trace(type = "bar",
            x = df2$holc_grade,
            y = df2$percent_area,
            marker = list(color = c("#e0e0e0",
                                    "#b8b8b8",
                                    "#8f8f8f",
                                    "#696969"
                                              ))) %>% 
  layout(title = "Philadelphia",
         xaxis = list(title = "Redlining grade",
                      zeroline = FALSE),
         yaxis = list(title = "Percentage of area of 100-year flood zone",
                      zeroline = FALSE))
p4


