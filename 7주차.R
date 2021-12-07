library(dplyr)
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv,-mean_hwy), y = mean_hwy)) + geom_col()
ggplot(data=mpg, aes(x=drv))+ geom_bar()
ggplot(data = mpg, aes(x=hwy)) + geom_bar()

#Q1

df <- mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

ggplot(data=df, aes(x=reorder(manufacturer,-mean_cty), y= mean_cty))+geom_col()

#Q2
ggplot(data=mpg, aes(x=class)) + geom_bar()

ggplot(data = economics, aes(x=date, y=unemploy))+geom_line()

#혼자서 해보기
ggplot(data = economics, aes(x=date, y= psavert))+geom_line()

#상자그림만들기
ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()

#혼자서 해보기
class_mpg <- mpg %>% 
  filter(class %in% c("compact", "subcompact", "suv"))

ggplot(data=class_mpg, aes(x=class, y=cty))+geom_boxplot()

install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

welfare <- raw_welfare

head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)








