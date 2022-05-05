# 데이터의 요약
# 1) numeric data 분석 : 평균, 분산, 표준편차, 분포...
# 2) non-numeric data 분석 : bar plot
# 수치가 아닌 data를 다루기 편하도록 하는 data방법이 존재 -> factor
# *factor; 1차원 vector에 level을 붙인 것
# 1) 수치형
# 자료 자체가 크기,무게, 개수 등과 같은 양을 나타내느 숫자로 표현된 것
# - 수의 의미, 대소 비교, 사칙 연산, 연산 결과가 의미 가짐
# 2) 범주형
# 질적 데이터_명목형 혹은 순서형

# 범주형 data는 factor라는 package를 통해서 생성
?factor

data_numeric = c(1,1,2,2,2)
class(data_numeric)

data_factor = factor(data_numeric)
class(data_factor)

print(data_factor)

data_factor = factor(data_numeric, labels=c('male', 'female'))
print(data_factor)

mean(data_factor)

table(data_factor)
plot(data_factor)
barplot(height = 10, width = 1, data_factor) # 얘한테 height를 줘야된다는데 뭘까??
?barplot

# numeric data
my_score = c(80, 81, 90, 75, 70)
mean(my_score)
summary(my_score)
plot(my_score)

# factor data
gender = c('male','male','male','female','female','male','female')
table(gender)
summary(factor(gender)) # summary는 input data 형태에 따라서 output이 달라지는 함수
plot(factor(gender))


# level 다루기
data1=c('F','M','F','F','M')
data2=c('F','F','F','F','F')

table(data1) # 잘 작동
plot(data1)  # plot은 위의 data를 factor를 이용하여서 범주형 data로 변경하지 않아 error

f11 = factor(data1)
f12 = factor(data2)

plot(f11)
plot(f12)  # level을 적용하지 않아서 F만 보여줌

# level 지정
f21 = factor(data1, levels=c('F',"M"))
f22 = factor(data2, levels=c('F', 'M'))  # level 적용으로 M도 생성

table(f22)
plot(f22)

f23 = droplevels(f22)  # levels와 반대로 존재하지 않는 levels를 없애주는 기능
table(f23)
plot(f23)

# level의 순서 _ default : 문자형일 경우 알파벳 순, 숫자형일 경우 숫자 순서순

f31 = factor(data1, levels=c('M','F'))  # levels를 이용하여 내가 원하는 순서를 지정이 가능
table(f31)
sort(f31)  # data 값 정렬

# sort : data 순서 정렬
sort(c(2,3,1))
sort(f11)

#level 순서 응용
out = factor(c(2,3,1), levels=c(3,1,2))  # 내가 지정한 숫자의 level 순서대로 나옴
sort(out)


#  tapply function : tapply(vector,factor,function)
?tapply

gender  = c('male','male','female','female','male','male')
heights = c(178, 172, 161, 158, 182, 170)

h1 = heights[gender=='female']
h2 = heights[gender=='male']

mean(h1)
mean(h2)

t1 = tapply(heights, gender, mean)
barplot(t1)
