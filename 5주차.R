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
exam 










