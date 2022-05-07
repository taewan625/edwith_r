# 파일 다루기

x = c(1,2,3,4)
y = c('a','b','c','d')
z = c(T,T,F,F)
df = data.frame(x,y,z)

save(x,y,z,df, file = 'test.RData') # file 생성 후 저장하는 함수
getwd() # get work directory 내가 어디서 일하는지 알려줌
dir()   # 현재 directory의 모든 file 확인 가능
setwd() # 다시 설정하는 것인데 사용하는 법을 잘 모르겠음 ㅋㅋ

# 이제 data 를 지우고 file의 data load를 할 것임 - 우측 environment 지움
load('test.RData') # 생성됨

# save, load 를 이용해 R 객체를 저장, 불러오기 함


# 위와 같이 저장을 하게 되면 시각적으로 file을 파악하기 힘듬
write.table(df, 'df1.txt', row.names = F, col.names = F, quote = F)
# write.table (file 이름, 저장할 file name과 형식, 행이름 넣을지 말지 지정, charactor data 인 경우 ""가 default 값으로 지정되는데 이거 설정)
# 이후 excel file 열어서 이 pc에서 가져오기 폴더로 찾기 하고 나서 -> 무슨 마법사에서 열 나눠지게 해서 열기

write.table(df, 'df1.txt', row.names = F, col.names = F) # "" 가 붙어서 나옴
write.table(df, 'df1.txt', col.names = F, quote = F)
write.table(df, 'df1.txt', row.names = F, quote = F)
write.table(df, 'df1.txt', row.names = F, col.names = F, quote = F, sep = '\t') # space를 tab으로 지정
write.table(df, 'df1.txt', row.names = F, col.names = F, quote = F, sep = ',')  # space를 ,로 지정
write.table(df, 'df1.txt', row.names = T, col.names = T)
?write.table

# read.table()
f = read.table('df1.txt',header=T)
print(f)
class(f)
# 만약 data.frame의 vector가 모두 character 이면 factor로 읽으므로 주의 하여야 함
# factor로 안읽는 방법: options(stringsAsFactors=F) / f=read.table('df1.txt , header=T, as.is=T)

f = read.table('df1.txt',header=T)
print(f)
class(f$y)   # df가 다 chracter형이면 factor로 나왔을 것

f = read.table('df1.txt',header=T, as.is=T)
class(f$y)






