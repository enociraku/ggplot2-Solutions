# 1.

mod <- loess(hwy ~ displ, data = mpg)
smoothed <- data.frame(displ = seq(1.6, 7, length = 50))
pred <- predict(mod, newdata = smoothed, se = TRUE)
smoothed$hwy <- pred$fit
smoothed$hwy_lwr <- pred$fit - 1.96 * pred$se.fit
smoothed$hwy_upr <- pred$fit + 1.96 * pred$se.fit

ggplot(data = smoothed, aes(displ, hwy)) +
  geom_line(size = 1, color = "blue") +
  geom_ribbon(aes(ymin = hwy_lwr, ymax = hwy_upr), alpha = 0.3)





# 2.

# a. stat_ecdf
ggplot(data = mpg, aes(displ)) +
  stat_ecdf()
# b. stat_qq
ggplot(data = mpg, aes(sample = displ)) +
  stat_qq(size = 4)
# c. stat_density, stat_function
ggplot(data = mpg, aes(displ)) +
  stat_density(aes(color = "data"), geom = "line", position = "identity") +
  stat_function(aes(color = "normal"), fun = dnorm, args = c(mean = mean(mpg$displ), sd = sd(mpg$displ))) +
  scale_color_manual(name = "Dist", values = c("normal" = "blue", "data" = "red"),
                     labels = c("normal", "data"))





# 3.

ggplot(mpg, aes(drv, trans)) + 
  geom_count(aes(size = ..prop.., group = 1))

ggplot(mpg, aes(drv, trans)) + 
  geom_count(aes(size = ..prop.. * 100, group = 1), show.legend = F) +
  stat_sum(aes(label = paste(round(..prop.. * 100, 2), "%", sep = ""), group = 1), 
           geom = "text", hjust = -0.4, size = 3)