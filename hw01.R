# 과제 1번 - Join
## make LL
LL <- data.frame(
  sid = c(1, 2, 3, 4, 5),
  name = c('원반', '이벙헌', '이벙헌', '한식구', '헌빈'),
  gnd = factor(c('M', 'M', 'F', 'M', 'M')))

## open RR with read.csv()
RR <- read.csv('RR.csv')

## left join
merge(LL, RR, all=TRUE)
merge(LL, RR, by=c('sid', 'name'), all.x = TRUE)

## right join
merge(LL, RR, all=TRUE)
merge(LL, RR, by=c('sid', 'name'), all.y = TRUE)

## inner join
merge(LL, RR)
merge(LL,RR, by=c('sid', 'name'))

## full join
merge(LL, RR, all=TRUE)
merge(LL, RR, by=c('sid', 'name'), all = TRUE)

## left join - key : sid
merge(LL, RR, by=c('sid'), all.x = TRUE)

## right join - key : sid
merge(LL, RR, by=c('sid'), all.y = TRUE)

## inner join - key : sid
merge(LL,RR, by=c('sid'))

## full join - key : sid
merge(LL, RR, by=c('sid'), all = TRUE)



# 과제 2번 - matrix operation
## make factor
bld <- c('B','AB','O')
factor(bld, levels=c('A','B','AB','O'))
factor(bld)

levels(bld) 
nlevels(bld) 
ordered(bld) 

## make Vector
b <-c(1,1,1)
length(b)
names(b)
NROW(b)
NCOL(b)

## make matrix - 1
A <-matrix(c(1,0,0,5,3,0),nr=2)
dim(A) 
nrow(A)
NROW(A) 
ncol(A)
NCOL(A)

## make matrix - 2
B <-matrix(c(1,2,0,4,0,6),nr=2,byrow=T)
dimnames(B) 
rownames(B) 
colnames(B)

## mathmatics
A + B
A - B
A * B
A/B

## Transpose
t(B)

## extraction
B[, c(1,3)]
B[, 1]
B[,1,drop=F]
## make matrix
c1 <- rep(1,3)
c2 <- c(1,0,-1)
c3 <- c(0,1,-1)
C <- cbind(c1,c2,c3)
sum(diag(C))
det(C)
invC <- solve(C)
invC

# 항등행렬 확인하기
round(invC %*% C, 4)

## mathmatics
A %*% C

## binding
rbind(A, B)
cbind(A, B)

## vector to diagnol matrix
D <- diag(diag(C))
d <- diag(C)

## solving equation
solve(C,b)

invC%*%b


# 과제 3번 - Linear Regression
## 01
X <- matrix(c(1, 1, 1, 2, 1, 0), nr = 3, byrow = TRUE) # 계수행렬 (식 3개 미지수 2개)

## 02
y<- matrix(c(1, 2, 3), nr = 3, byrow= TRUE)

## 03
XTX <- t(X) %*% X
XTX

XTy <- t(X) %*% y
XTy

## 04
det(XTX)

InvXTX <- solve(XTX)
InvXTX

b <-InvXTX%*%XTy
b

## 05
solve(XTX, XTy)

## 06
hatmat <- X %*% InvXTX %*% t(X)
hatmat

hatmat%*%hatmat

trH <- sum(diag(hatmat))
trH

det(hatmat)

## 07
yhat <- hatmat%*% y
yhat

yhat2 <- X %*% b
yhat2

## 08
res <- y - yhat
res

sse <- t(res) %*% res
sse

## 10 
x <- c(1, 2, 0)
y <- c(1, 2, 3)
m <- lm(y~x)
coef(m)
predict(m)
residuals(m)
summary(m)
anova(m)
plot(x,y)
abline(a = coef(m)[1], b = coef(m)[2])
