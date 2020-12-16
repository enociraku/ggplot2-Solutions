# 1. 

ggplot(mpg, aes(displ, hwy, color = class)) + geom_point()
ggplot(mpg, aes(displ, hwy, size = class)) + geom_point()
ggplot(mpg, aes(displ, hwy, shape = class)) + geom_point()

# The following plot (tries to) map shape to a continuous variable. It will give an error because shape 
# does not have meaning for continuity. There is no order to shape, circle coming before or after triangle
# is not interpretable.
ggplot(mpg, aes(displ, hwy, shape = hwy)) + geom_point()

# If we use color with a continuous varible the legend will show how it is scaled, the darker colors
# have lower values than the brighter ones.
ggplot(mpg, aes(displ, hwy, color = hwy)) + geom_point()

# Size also works with continuous variables as higher values are scaled to larger points.
ggplot(mpg, aes(displ, hwy, size = hwy)) + geom_point()


# With categorical variables things are easier as the exact mapping is shown in the legend. However,
# if there are too many categories it might become harder to gain insight from the graph.

# When we try to use size for discrete variable we get a warning "Using size for a discrete variable is 
# not advised". This is because size usually relates to quantity, however in the following plot 2seater
# having smaller points than suv does not show any comparison between the two categories, just that they
# are different classes.
ggplot(mpg, aes(displ, hwy, size = class)) + geom_point()

# We can use color to map categories to unique colors. Again if there too many categories it might 
# become hard to distinguish between the categories.
ggplot(mpg, aes(displ, hwy, color = class)) + geom_point()

# The shape aesthetic also works but it is limited to a maximum of 6 categories. If there are more
# than 6 they are not shown.
ggplot(mpg, aes(displ, hwy, shape = class)) + geom_point()


# If we use more than one aesthetic on a plot than the legends for each of the aesthetic is shown
# and each of the points is mapped to both aesthetics:
ggplot(mpg, aes(displ, hwy, size = hwy, color = class)) + geom_point()





# 2. 

# If we map continuous variables to shape we get an error because continuous variables have an order
# meaning that smaller values indicate smaller quantity. On the other hand shapes have no such order.
# Tringale is not smaller or higher than circle.

# If we map trans to shape we only get the mapping for 6 different categories. The other categories are
# not shown in the plot. This is because it becomes visually hard to distinguish the categories if 
# there are more than 6 different shapes.





# 3. 

ggplot(mpg, aes(displ, hwy, color = drv)) + geom_point()
# This plot gives an overview of fuel economy and engine size and we have added the color aesthetic
# to drive type. We notice that the front-wheel drive is the one with the highest effiency in fuel
# consumption (this maybe also due to the fact that these cars have smaller engine sizes). The 
# distinction between rear-wheel drive and 4-wheel drive is not too obvious from the graph. So, we
# cannot reach a conclusion for these 2 types.

# As noticed from the above graph front-wheel cars have lower engine sizes than the other types. 4-wheel
# cars have on average higher engine size than forward-wheel but lower than rear-wheel type.

# The following plot gives an overview of engine size, class and type of drive.
ggplot(mpg, aes(class, displ, color = drv)) + geom_point()