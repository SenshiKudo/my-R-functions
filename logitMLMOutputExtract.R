logitMLMOutputExtract <- function(mod){
      logitMLMOutput <- data.frame(exp(coefficients(summary(mod)))[, 1],
                                coefficients(summary(mod))[, 4],
                                exp(lme4::fixef(mod)[2] - 1.96 * coefficients(summary(mod)))[, 2],
                                exp(lme4::fixef(mod)[2] + 1.96 * coefficients(summary(mod)))[, 2]) %>%
            dplyr::select(1, 3, 4, 2) %>% round(., 3) %>%
            `colnames<-`(c("Coefficient", "LCL", "UCL", "P-value")) %>%
            mutate(`P-value` = case_when(`P-value` < 0.001 ~ "<0.001*",
                                         `P-value` < 0.05 ~ paste0(`P-value`,"*"),
                                         `P-value` >= 0.05 ~ as.character(`P-value`)))
      print(logitMLMOutput)
}