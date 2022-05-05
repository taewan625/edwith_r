# 벡터의 인덱싱 : 벡터 전체에서 일부분을 선택하는 기법, [ ] 이용

x = c(150, 160, 170, 155, 170)

# 인덱스 사용
x[c(3,5)]     # 3,5 번째 data 넣겠다
x[-c(1,2,4)]  # 1,2,4 번째 data 빼겠다

# logical vector
x[c(F,F,T,F,T)]  # F는 선택 안하고 T는 선택함 - 수가 많아질 때 힘듬

# 대체법
# 벡터의 인덱싱에 필요 + 조건문에 필요
x=TRUE
!x

c(1,3,5) > c(3, 3, 3)
c(1,3,5) > 3

x=c(1,3,5)
x[c(F,F,T)]
x[x>3]
x[x<=3]
x[x<3]
x[x==3]
x[x==3 | x==5]
x[!(x==3)]

# 벡터의 인덱싱과 값 치환
x = c(150, 160, 170, 155, 170)
x[c(3,5,6)]<-0
print(x)
# 6번째는 없어서 뒤에 붙여줌


# matrix(데이터 벡터, nrow=행의 수, ncol=열의 수, byrow=FALSE)
# byrow=FALSE값이 default 값이라서 원래는 세로(=열)로 채워지고 행으로 채우고
# 싶을때는 byrow=T 라고 하면 된다

mat1 = matrix(1:9, ncol = 3)
print(mat1)

mat1[,3]
mat1[2,]
mat1[2,3]


# 행열에 이름 추가하는 법
colnames(mat1) =c('가','나','다')
mat1[]
rownames(mat1) = c('A','B','C')
mat1[]

mat1[c('A','B'),] # 대문자 A,B에 해당하는 행과 전체 열을 포함하는 것을 의미
mat1['A', '가']   # A 행과 가 열의 vector 뽑기


# 추가 - vector 이름 넣기
x =1:3
names(x)
names(x) = c('a', 'b', 'c')  # matrix와 같이 vector에도 이름을 넣을 수 있고
x

x['b']                       # 이름을 지정후 이름으로 원하는 vector 추출 가능















