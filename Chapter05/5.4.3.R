# 1.
# i.
ggplot(mpg) +
  geom_point(aes(mpg$disp, mpg$hwy))

ggplot(mpg, aes(disp, hwy)) +
  geom_point()


# ii.
ggplot() +
  geom_point(mapping = aes(y = hwy, x = cty), data = mpg) +
  geom_smooth(data = mpg, mapping = aes(cty, hwy))

ggplot(mpg, aes(cty, hwy)) +
  geom_point() +
  geom_smooth()


# iii.
ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(log(brainwt), log(bodywt)), data = msleep)

ggplot(msleep, aes(log(brainwt), log(bodywt))) +
  geom_point()





# 2.

ggplot(mpg) +
  geom_point(aes(class, cty)) +
  geom_boxplot(aes(trans, hwy))

# The above code shows two different plots in one. The first layer plots a scatterplot of class vs. cty
# while the second layer plots a boxplot of trans vs hwy.
# The code works, there is no error in execution and the plot is shown. However, the plot is hard
# to interpret. The x axis label shows class as its name, but it also has the trans type values as well.
# The scatterplot data is shown on the x-axis where only points are present vertically to the axis.
# The y-axis has a label of cty but there are also the values of hwy. The plot works,
# however it is hard to analyze.





# 3. 

ggplot(mpg) +
  geom_point(aes(class, cty)) +
  geom_boxplot(aes(hwy, cty))

ggplot(mpg) +
  geom_point(aes(hwy, cty)) +
  geom_boxplot(aes(class, cty))
# In the second plot we get -> Error: Discrete value supplied to continuous scale
# In the first one we do get a result but the x-axis scale is not shown.