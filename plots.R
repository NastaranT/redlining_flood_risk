
library(dplyr)
library(plotly)

new_orleans= read.csv("C:/Users/nasta/OneDrive - The Pennsylvania State University/Current-2021/PhD/NFIP paper/Redlining/Data/redline_100_intersects/neworleans_intersect_data.txt")
philly= read.csv("C:/Users/nasta/OneDrive - The Pennsylvania State University/Current-2021/PhD/NFIP paper/Redlining/Data/redline_100_intersects/philly_intersect_data.txt")
brooklyn= read.csv("C:/Users/nasta/OneDrive - The Pennsylvania State University/Current-2021/PhD/NFIP paper/Redlining/Data/redline_100_intersects/brooklyn_intersect_data.txt")
miami=read.csv("C:/Users/nasta/OneDrive - The Pennsylvania State University/Current-2021/PhD/NFIP paper/Redlining/Data/redline_100_intersects/maimi_intersect_data.txt")
houston=read.csv("C:/Users/nasta/OneDrive - The Pennsylvania State University/Current-2021/PhD/NFIP paper/Redlining/Data/redline_100_intersects/houston_intersect_data.txt")



df=philly %>% group_by(holc_grade)

df2=df %>% summarise(
  area_sf = sum(area_sf)
)
head(df2)

df2$percent_area= (df2$area_sf/70435582.608474)*100

# neworlean total area of 100 flood: 111727302.334948
# philly total area of 100 flood: 70435582.608474
# brooklyn total area of 100 flood: 39844824.177483
# miami total area of 100 flood:76786307.768851
# houston total area of 100 flood:47499831.314758



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


