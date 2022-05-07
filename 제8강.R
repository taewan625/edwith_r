getwd()

# 함수를 만들때 f = function(arg1, arg2, ...){
# expression
# return(object)
# }

# basic
fn = function(x, y){ # 내 function은 x,y라는 vector를 가지고
 out = x*10 + y      # out이란 이름을 가지고 이러한 기능을 할것이고
 return(out)         # return이란 함수로 function이 수행된 애들을 뱉어냄 = 함수가 끝이남
}
class(fn)
fn(1,2)

x = matrix(1:4)
y = matrix(1:4)
fn(x,y)

fn1 = function(x=1, y=5){
 print('step01')
  out = x*10 + y      
 print('step02')
  return(out)
 print('step03')
}
fn1()

# 함수안의 변수명은 함수 밖에서는 적용이 안됨
out = NULL
fn2 = function(x=1, y=5){
 out = x*10 + y
 return(out)
}
fn2()
print(out)  # function 내의 out이 적용이 X


# function 내의 변수를 밖에서도 적용 시키는 법
out = NULL
fn3 = function(x=1, y=5){
 out <<- x*10 + y    # <<-를 이용
 return(out)
}
fn3()
print(out)           # function 내의 out이 적용


# 루프 연산_for(), while()
# 주로 for문을 사용

for(var in seq){  # in 앞에는 변수면 뒤에는 vector
 expression
}
# var(변수) 이 seq(vector) 의 각 값을 차례로 취하면서 expression 수행


for (i in 1:5) print(i)  # i라는 변수명에 1에서 5 까지의 수를 print한다라는 것


# while condition이 TRUE인 동안 계속 expression 수행
i=1
while (i <= 5) {
print(i)
 i = i+1
}


# if 조건 연산 for랑 같이 잘 사용
if(condition){
 expression
}
# 특정 condition 일때 expression 하세요

if(condition){
 expression1
} else{
 expression2
}
# if condition일 때 expression1을 수행하고 아닐때(else) expression2를 수행해라

if(condition1){
 expression1
} else if (condition2){
 expression2
} else{
 expression3
}
# 여러 조건을 잡고 싶을 때 사용
# if condition1일때 expression1을 적용하고 else if 로 condition2일 때 expression2를 수행해라
# else(만약 둘다 아니면) expression3을 수행해라

x=c(1,2,3,4)
y=c(9,3,2,1)

for(i in 1:4){
 if(x[i] > y[i]){
  print(x[i])
 } else{
  print(y[i])
 }
}

# 같은 함수 = ifelse()
ifelse(x > y, x,y) # x,y 의 vector 수가 같다고 가정하고 true인 경우 x를 출력 false인 경우 y를 출력


# 실습

cities = c("New York,Ny","Ann Arbor, MI","Chicago, CI")
out = strsplit(cities,',') # 하나의 vector를 조건에 맞게 잘라 주는 것 # list 형태로 출력해줌
print(out)

fn = function(x)return(x[2])
lapply(out, fn)

?lapply

# sapply: lapply와 반대로 list 가 아닌 vector 형태로 나타냄

sapply(out, fn)
sapply(out,function(x) return(x[2]))


f = read.table('breast-cancer-wisconsin.data', sep = ',')
head(f) # 첫 6개의 행을 보여줌_ 확인용도
str(f)  # vector를 다 보여줌 class 도 보여줌

# column 이름 만들기
colnames(f) =c('sampleID','Clump','Cellsize','Cellshape','MarginalAd','SingleSize','BareNuclei','Chromatin','Nucleoli','Mitoses','group')
head(f)

str(f)

# BareNuclei라는 값은 ?를 가지고 있어서 num으로 변환이 필요하다. 강의에서는  BareNuclei가 factor로 나타내서 factor를 character로
# 변환하고 이후에 numeric으로 변환을 하는 과정을 보였는데(factor에서 num으로 바로 넘어가면 factor의 level의 영향으로 실수가 나와서)
# 내껀 바로 character로 되어있어서 num으로 변환해도 될듯하다

# 방법 2가지 factor -> charac -> num
f$BareNuclei = as.numeric(as.character(f$BareNuclei))  # 처음에는 경고가 나오는데 이는 ?를 NA로 변환했다는 것. ? 관련된 numeric이 없어서
f = transform(f, BareNuclei = as.numeric(as.character(BareNuclei)),
              group = factor(group, labels=c('Benign','Malignant')))  # 마지막에 group별로 mean을 나눴는데 이때 이름으로 facotr로 명명하고 싶어서 추가한 코드
str(f)
mean(f$BareNuclei)

# 결측값 다루기
# is.na()
# na.rm=T

ex = c(1,2,3,NA)
mean(ex)
ex[!is.na(ex)]  # !는 원래 is.na가 NA값을 true로 추출하는것이라서 !로 T랑 F를 바꿔줌
mean(ex[!is.na(ex)])

mean(ex, na.rm=T)


for(i in 1:ncol(f)) print(mean(f[,i]))  #ncol:각 column 별
lapply(f,mean) # data.frame도 list의 일종 그래서 lapply 가능

for(i in 1:ncol(f)) print(mean(f[,i], na.rm = T)) # NA 값 빼고 mean 계산산
lapply(f, mean, na.rm=T)

lapply(f, function(x) mean(x, na.rm=T)) # function을 이용하여 할 수도 있다

# function(x) mean(x, na.rm=T) 가 안 익숙할 때 -> fn=function(x) mean(x, na.rm=T) 을 lapply에 넣었다고 생각하기
fn = function(x) mean(x, na.rm=T)
lapply(f, fn)

lapply(f, function(x) mean(x[!is.na(x)]))


# factor를 num으로 바꾸는 법 & NA값 제외하고 계산하는 방법 2가지를 배웠다다

fn = function(x) tapply(x, f$group, mean, na.rm=T)  # tapply는 group별로 구하는 것
lapply(f[,-c(ncol(f))],fn)  # 수치형이 아닌 것을 제외하고 결과가 잘나옴. 경고메시지를 빼고 싶으면 이코드처럼해서 (의미: -c로 마지막 colum)

# data.frame으로 변경
as.data.frame(lapply(f[,-c(ncol(f))], fn))





















       