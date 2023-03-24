library(tidyverse)
# Join
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
LL %>% left_join(RR)

## right join
merge(LL, RR, all=TRUE)
merge(LL, RR, by=c('sid', 'name'), all.y = TRUE)
LL %>% right_join(RR)

## inner join
merge(LL, RR)
merge(LL,RR, by=c('sid', 'name'))
LL %>% inner_join(RR)

## full join
merge(LL, RR, all=TRUE)
merge(LL, RR, by=c('sid', 'name'), all = TRUE)
LL %>% full_join(RR)

## left join - key : sid
merge(LL, RR, by=c('sid'), all.x = TRUE)
LL %>% left_join(RR, by = 'sid')

## right join - key : sid
merge(LL, RR, by=c('sid'), all.y = TRUE)
LL %>% right_join(RR, by = 'sid')

## inner join - key : sid
merge(LL,RR, by=c('sid'))
LL %>% inner_join(RR, by = 'sid')

## full join - key : sid
merge(LL, RR, by=c('sid'), all = TRUE)
LL %>% full_join(RR, by = 'sid')

# matrix operation
## make factor
bld <- c('B','AB','O')
factor(bld)
factor(bld, levels=c('A','B','AB','O'))

levels(bld) 
nlevels(bld) 
ordered(bld) 
# relevel(bld,'O')
### tv::recode_factor() plyr::revalue() plyr::mapvalues()

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

## mathmatics
A %*% C

## binding
rbind(A, B)
cbind(A, B)

## vector to diagnol matrix
D <- diag(diag(C))
d <- diag(C)

## solving equation
x <- solve(C,b)

x <- invC%*%b

# Linear Regression
x <- matrix(c(1, 1, 1, 2, 1, 0), nr = 3, byrow = TRUE)
y <- matrix(c(1, 2, 3), nr = 3, byrow= TRUE)