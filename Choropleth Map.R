

# 코드 작성 중 패키지 오류가 생길 경우에만 R studio을 재시작하고 나서 실행함. 실행하고 나서 library 별로 다시 실행 해주어야 함.
remove.packages(c("ggiraphExtra", "tibble", "ggplot2"))
install.packages(c("ggiraphExtra", "tibble", "ggplot2"))

#미국 주별 강력 범죄율 단계 구분도 만들기
install.packages("mapproj")
install.packages("ggiraphExtra")
library(ggiraphExtra)

#미국 주별 범죄 데이터 준비하기
#USArrests data = 1973년 미국 주(State)별 강력 범죄율 정보
str(USArrests)
head(USArrests)

#행 이름을 state 변수로 바꿔 새 데이터 프레임을 만듦
library(tibble)
crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

str(crime)

#미국 주 지도 데이터 준비하기
install.packages("maps") #미국 위도, 경도 정보
library(ggplot2)
states_map <- map_data("state")
str(states_map)

#단계 구분도 만들기
ggChoropleth(data = crime,    #지도에 표현할 데이터
             aes(fill = Murder, #색깔로 표현할 변수
                 map_id = state), #지역 기준 변수
             map = states_map)  # 지도 데이터

#인터랙티브 단계 구분도 만들기
ggChoropleth(data = crime, #지도에 표현할 데이터
             aes(fill = Murder, #색깔로 표현할 변수
                 map_id = state), # 지역 기준 변수
             map = states_map, #지도 데이터
             interactive =T) #인터랙티브브


#대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
#패키지 준비하기
install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)


str(changeCode(korpop1))
library(dplyr)
rm(korpop1)
korpop1 <- rename(korpop1, pop = 총인구_명, name = 행정구역별_읍면동)
options(scipen = 999)
korpop1$name <- iconv(korpop1$name, "UTF-8", "CP949")

str(changeCode(kormap1))

ggChoropleth(data = korpop1, #지도에 표현할 데이터
             aes(fill = pop, #색깔로 표현할 변수
                 map_id = code, # 지역 기준 변수
                 tooltip = name), #지도 위에 표시할 지역명
             map = kormap1, #지도 데이터
             interactive =T) #인터랙티브
options(encoding = "UTF-8")

#대한민국 시도별 결핵 환자 수 단계 구분도 만들기
rm(tbc)
str(changeCode(tbc))
tbc$name <- iconv(tbc$name, "UTF-8", "CP949")
ggChoropleth(data = tbc, #지도에 표현할 데이터
             aes(fill = NewPts, #색깔로 표현할 변수
                 map_id = code, # 지역 기준 변수
                 tooltip = name), #지도 위에 표시할 지역명
             map = kormap1, #지도 데이터
             interactive =T) #인터랙티브

us_states <- read.csv("us-states.csv")
rm(us_states2)
us_states2 <- us_states %>% 
  filter(date=="2021-11-28")

us_states2 <- tolower(us_states2$state)
str(us_states2)
rm(states_map)
states_map <- map_data("state")
str(states_map)

options(scipen = 999)
ggChoropleth(data = us_states2, #지도에 표현할 데이터
             aes(fill = cases, #색깔로 표현할 변수
                 map_id = state), # 지역 기준 변수
             map = states_map, #지도 데이터
             interactive =T) #인터랙티브

ggChoropleth(data = us_states2, #지도에 표현할 데이터
             aes(fill = deaths, #색깔로 표현할 변수
                 map_id = state, # 지역 기준 변수
                 tooltip = state), #지도 위에 표시할 지역명
             map = states_map, #지도 데이터
             interactive =T) #인터랙티브






