Linf <- 55.0                 # define values for the von B growth function
K <- 0.3
t0 <- -0.3
age <- seq(0,10)             # create vector of 11 ages from zero to ten
# use vector arithmetic to calc len for all 11 ages at once
len <- Linf*(1-exp(-K*(age-t0)))  
len                          # show the resulting vector of length for each age
lw.alpha <- 0.00005          # set up length weight relationship parameters
lw.beta <- 3.01              # note beta is a function, so use lw.beta instead
wt <- lw.alpha * len^lw.beta # now getting vector of weights for all 11 lengths
wt                           # take a look at the vector
plot(len,wt)