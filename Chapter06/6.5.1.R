# 1.

fwd <- subset(mpg, drv == "f")
rwd <- subset(mpg, drv == "r")

ggplot(fwd, aes(displ, hwy, colour = class)) + geom_point()
ggplot(rwd, aes(displ, hwy, colour = class)) + geom_point()


ggplot(fwd, aes(displ, hwy, colour = class)) + 
  geom_point() +
  xlim(range(mpg$displ)) +
  ylim(range(mpg$hwy))

ggplot(rwd, aes(displ, hwy, colour = class)) + 
  geom_point() +
  xlim(range(mpg$displ)) +
  ylim(range(mpg$hwy))





# 2.

?expand_limits
# The arguments to expand_list is a named list of aesthetics which specify which value or range of values
# should be included in each scale.





# 3.

df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base
base + xlim(0, 4)
base + xlim(0, 4) + xlim(1, 2)
# Scale for 'x' is already present. Adding another scale for 'x', which will replace the existing scale.
# Warning message:
#  Removed 1 rows containing missing values (geom_point).

# The last scale limit added will be the final limit of the plot replacing any existing scales.
# The reason is that when we do not explicitly specify a limit we are using the range of the data as 
# limit, so in order to provide new limit we need to be able to replace the default limit with the new
# one.





# 4.

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(limits = c(NA, NA))

# The last line does nothing. The values for the x-axes limits will be the default ones.