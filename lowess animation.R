set.seed(123)
S1=100; t=100; Price=vector(length = t)
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
tibble(Price=Price,factor=factor) %>%
boot.lowess(y = Price,x=factor, f=2/3,iter = 10,line.col = "red", 
             xlab = "factor", ylab = "Price") %>% 
   saveGIF(movie.name = "lowess_ani.gif")
  
  library(animation)

boot.lowess(x=df$factor,y=df$Price, line.col = 'blue',pch=10,xlab="Factor",ylab="Price") 
