# 1.

df <- data.frame(x = 1:3, y = 1:3, z = c("a", "b", "c"))
base <- ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z), size = 3) +
  xlab(NULL) +
  ylab(NULL)

base + theme(legend.position = "left")





# 2.

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = drv, shape = drv)) +
  scale_colour_discrete("Drive train")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = drv, shape = drv)) +
  scale_colour_discrete("Drive train") +
  scale_shape_discrete("Drive train")

# In the first plot there are two legends shown. But since they map the same data to the same variable
# then it would be better if they were combined in one legend. There are two legends because the name
# of the first legend was different from the name of the second. So, in order to create one legend 
# we can either remove the scale_colour_discrete function or name the second legend the same as the 
# first.





# 3.

ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 1))