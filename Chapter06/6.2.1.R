# 1.

# Scaling continuous variable to discrete. The x-axis values are removed from the plot. Only label remains.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_discrete()

# Scaling discrete variable to continuous shows an error: 
# Error: Discrete value supplied to continuous scale
ggplot(mpg, aes(drv, hwy)) +
  geom_point() +
  scale_x_continuous()





# 2.

# i.
ggplot(mpg, aes(displ)) +
  scale_y_continuous("Highway mpg") +
  scale_x_continuous() +
  geom_point(aes(y = hwy))

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous("Highway mpg")

# ii.
ggplot(mpg, aes(y = displ, x = class)) +
  scale_y_continuous("Displacement (l)") +
  scale_x_discrete("Car type") +
  scale_x_discrete("Type of car") +
  scale_colour_discrete() +
  geom_point(aes(colour = drv)) +
  scale_colour_discrete("Drive\ntrain")

ggplot(mpg, aes(class, displ)) +
  geom_point(aes(color = drv)) +
  scale_x_discrete("Type of car") +
  scale_y_continuous("Displacement (l)") +
  scale_colour_discrete("Drive\ntrain")