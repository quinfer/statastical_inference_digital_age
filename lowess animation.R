set.seed(123)
S1=100
t=100
Price=vector(length = t)
noise=runif(t,min = -5,max = 5)
for (tt in 1:t) {
  if (tt==1) {
    Price[tt]=S1
  }
  else{
    Price[tt] = Price[tt-1] + noise[tt]
  }
}
factor<-Price + runif(t,1,8)^2 # <<

library(animation)
library(tidyverse)
ani.options(nmax = 20, interval = 0.05)

df<-tibble(Price,factor)
boot.lowess(x=df$factor,y=df$Price,line.col = "red",f=10,iter=20, 
             xlab = "factor", ylab = "Price") %>% 
   saveGIF("lowess_ani.gif")
