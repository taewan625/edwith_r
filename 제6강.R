# R data 객체구조 3
# data.frame : matrix와 다른 점은 열별로 data type 다를 수 있다 vector 간 숫자가 동일해야되는 조건을 빼고 list와 성격이 같다

# data.frame은 수가 같아야 한다 data.frame: 길이가 같은 vector의 lsit이다 -> 각 column은 길이가 같은 독립적인 vector
x = c(1,2,3,4)
y = c('ㄱ','ㄴ','ㄷ','ㄹ')
z = c(T,T,F,F)

# data.frame
df = data.frame(x,y,z)
print(class(df))
print(df)

# matrix와 차이점
mat = as.matrix(df)
print(class(mat))
print(mat)


# 위의 class 비교 _ df는 class가 raw data 그대로 나오고 matrix는 character로 나옴
class(df[,1])
class(df[,2])
class(df[,3])

class(mat[,1])
class(mat[,2])
class(mat[,3])

# 추출
df[,'x']
df[1,]
df$x
df[2]
df[[2]]

# list
# list는 vector들의 특성을 유지시켜 준다

L = list(c(1,2,3),mat,df)
print(L)

L[[1]]


# list function : lapply, sapply
# lapply(list, function)
x1 = c(1,2,3)
x2 = c(10,20,30)
x3 = c(100,200,300)

Lst = list(x1, x2, x3)
Lst

lapply(Lst, mean)

# df에도 적용해보기
df = data.frame(x1,x2,x3)
print(df)

lapply(df, mean)

# names : list 이름
names(Lst)
names(Lst) = c('a','b','c')
print(Lst)

Lst['a']
Lst[['a']]
Lst$a

# [[]], [] 차이점
# out data의 객체 type이 달라짐


L = list(c(1,2,3),mat,df)
print(L)

L[[2]]      # data frame으로 나옴 [[]] 일때
print(class(L[[2]]))
L[[3]]      # vector
L[[2]][1,2] # 2번째 list에 1행2열의 vector 추출

L[2]        # list로 나옴
print(class(L[2]))
L[2][1,2]   # list여서 불가능능

df
df[[2]]    # vector
print(class(df[[2]]))
df[[2]][2] # 2열의 vector에서 2번째 vector
df[2]      # data.frmae 으로 나옴
print(class(df[2]))
df[c(1,3)] # 새로운 data frame이 만들어짐


# 심화
cities = c("New York,Ny","Ann Arbor,MI","Chicago,CI")
print(cities)
out = strsplit(cities,',') # 하나의 vector를 조건에 맞게 잘라 주는 것 # list 형태로 출력해줌
print(out)

# 방법 unlist function 사용
out1 = unlist(out)
out1[c(2,4,6)]
out1[seq(2,length(out1),2)]  # seq(시작점, 마지막, k_몇씩 증가)
out1[nchar(out1) ==2]  # nchar(문자의 수)








