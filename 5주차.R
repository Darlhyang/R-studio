install.packages("ggplot2")
install.packages("dplyr")

#06-3

exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class == 1) %>% select(english)

exam %>%
  filter(class ==1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>%
  select(id, math) %>% 
  head(10)

#혼자서 해보기 과제

#Q1
mpg %>%
  select(class, cty)

#Q2
df <- mpg %>%
  filter(class == "suv") %>% select("cty")

dff <- mpg %>%
  filter(class == "compact") %>% select("cty")

mean(df$cty)
mean(dff$cty)  

#06-04
exam %>% arrange(math) #math 오름차순 정렬
exam %>% arrange(desc(math)) #math 내림차순 정렬
exam %>% arrange(class, math) #class 및 math 오름차순 정렬

#혼자서 해보기 과제
#Q1
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

#06-05
exam %>% 
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math +english +science,
         mean = (math + english + science)/3 ) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>%
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

#혼자서 해보기 과제
#Q1
df_mpg <- mpg
df_mpg

df_mpg %>%
  mutate(total= cty + hwy)


#Q2
df_mpg %>%
  mutate(mean = total/2)

#Q3
df_mpg %>%
  arrange(desc(mean)) %>%
  head(3)

#Q4
mpg %>%
  mutate(total = cty + hwy) %>% 
  mutate(mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)

#06 - 6 집단별로 요약하기

exam %>% summarise(mean_math = mean(math))

exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>%
  mutate(tot = (cty+hwy/2)) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

#혼자서 해보기 과제

#Q1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty))

#Q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty))

#Q3
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(3)

#Q4
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count = n())%>% 
  arrange(desc(count))

#06-7 데이터 합치기
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2

total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_a
group_b

group_all <- bind_rows(group_a, group_b)
group_all

#혼자서 해보기

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
#Q1
mpg <- as.data.frame(ggplot2::mpg)
mpg <- left_join(mpg, fuel, by ="fl")

#Q2
mpg %>% 
  select(model,fl,price_fl) %>% 
  head(5)

#분석 도전
#Q1
midwest <- as.data.frame(ggplot2::midwest)

midwest <- midwest %>% 
  mutate(ratio_child = (poptotal-popadults)/poptotal*100)

#Q2
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)

#Q3
midwest <- midwest %>% 
  mutate(grade = ifelse(ratio_child >= 40, "large",
                        ifelse(ratio_child >= 30, "middle", "small")))
table(midwest$grade)

#Q4
midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
