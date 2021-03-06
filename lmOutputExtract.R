lmOutputExtract <- function(mod, signifLevel = 0.05){
      lmOutput <- data.frame(coefficients(summary(mod))[, c(1, 4)], confint(mod)) %>%
            dplyr::select(1, 3, 4, 2) %>% round(., 3) %>%
            `colnames<-`(c("Coefficient", "LCL", "UCL", "P-value")) %>%
            mutate(`P-value` = case_when(`P-value` < 0.001        ~ "<0.001*",
                                         `P-value` < signifLevel  ~ paste0(`P-value`,"*"),
                                         `P-value` >= signifLevel ~ as.character(`P-value`)))
      print(lmOutput)
}
