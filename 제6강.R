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























