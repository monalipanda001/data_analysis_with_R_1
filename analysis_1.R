

library(tidyverse)
library(plotly)

# view chickweight dataset
ChickWeight %>% 
  view()

#summarize data
summary(ChickWeight) %>% view()

#calculate number of chickens on diet 1 and diet 2
ChickWeight %>% 
  select(Chick,Diet) %>% 
  distinct() %>% 
  group_by(Diet) %>% 
  summarize(count=n()) %>% 
  view()


#calculate average weight by diet

avg_chicken_weight <- ChickWeight %>% 
  select(weight,Diet) %>%
  group_by(Diet) %>%  
summarize(avg_weight=mean(weight))

#plot average weight by diet
p1 <- avg_chicken_weight %>% 
  ggplot() +
  aes(x=Diet, y=avg_weight, colour = Diet, fill = Diet) +
  geom_col()
  
ggplotly(p1)  

  
# #avg weight for time 0 by diet
# p2 <- avg_chicken_weight<-subset(diet,time==0) %>%
# mean_diet_time0 <- mean(weight_time0$value, na.rm=TRUE) %>%
# print(mean_diet_time0) %>%
#   
# library(deplyr)
# 
# mean_diet_time0 <- weight %>%
#   filter(time==0) %>%
#   summarize(mean_diet = mean(diet,na.rm=TRUE)) %>% 
# print(mean_diet_time0) %>% 
#   
avg_chicken_weight_time0 <- ChickWeight %>% 
  select(weight,Diet,Time) %>% 
  filter(Time == 0) %>%  
  group_by(Diet) %>%  
  summarize(avg_weight=mean(weight))

#plot average weight by diet
p1 <- avg_chicken_weight_time0 %>% 
  ggplot() +
  aes(x=Diet, y=avg_weight, colour = Diet, fill = Diet) +
  geom_col()

ggplotly(p1)  

avg_chicken_weight_time4 <- ChickWeight %>% 
  select(weight,Diet,Time) %>% 
  filter(Time == 4) %>% 
  group_by(Diet) %>% 
  summarize(avg_weight=mean(weight))

#plot average weight by Diet 
p1 <- avg_chicken_weight_time4 %>% 
  ggplot() +
  aes(x=Diet, y=avg_weight, colour = Diet, fill = Diet)+
  geom_col()

ggplotly(p1)
  
