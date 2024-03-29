convTransProb <- function(ratio, oldTP){
      newTP = 1 - (1 - oldTP) ^ ratio
      # newTP is the transition probability over time period b we wish to estimate
      # oldTP is the known probability over time period a 
      # ratio is b:a (e.g., when converting from annual to monthly, ratio = 1/12)
      return(newTP)
}
