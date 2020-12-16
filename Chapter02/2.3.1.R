# 1. 

ggplot(mpg, aes(cty, hwy)) +
  geom_point()

# We notice from the plot that there is an almost perfect linear relationship between cty and hwy. What
# this relationship describes is that a car with high cty will have a high hwy and a car with low cty
# will have a low hwy.

# There are two concerns when looking at the plot:
# The first is that we notice that there are many values for a given cty. For example for cty = 15 we notice
# that there are 9 different hwy values. And this is not a special case, the same pattern is repeated 
# for other values as well.
# The second concern is when we run the following function:
count(mpg, cty, hwy)
# What we get is a combination of cty and hwy and how often that specific combination occurrs.
# We have 78 such observations, which means that there are 78 different values of cty and hwy.
# If we look at the first line we have cty = 9, hwy = 12, and n = 5. This means that that specific 
# combination of cty and hwy occurrs 5 times. From a continuous plot we would expect to get 234 different
# points (234 being the size of the dataset), while in the plot shown we only have 78. This means the 
# weight of each point is not the same.





# 2.

ggplot(mpg, aes(model, manufacturer)) + 
  geom_point()
# The plot shows which combination of model and manufacturer occur. It is not particulalry useful
# as no new insight or perspective is derived from the graph.
# To make the plot slightly more informative we can also add information about the number of times
# each combination occurrs. This is done with the geom_count() call.
ggplot(mpg, aes(model, manufacturer)) + 
  geom_count()





# 3.

ggplot(mpg, aes(cty, hwy)) + geom_point()
# data: mpg
# aesthetic mappings: cty mapped to x-axis and hwy mapped to y-axis
# layers: points, meaning scatter plot of the cty and hwy.

ggplot(diamonds, aes(carat, price)) + geom_point()
# data: diamonds dataset
# aesthetic mapping: carat mapped to x-axis and price mapped to y-axis
# layers: points, scatter plot of carat and price.

ggplot(economics, aes(date, unemploy)) + geom_line()
# data: economis dataset
# aesthetic mapping: date in x-axis and unemploy in y-axis
# layers: line graph

ggplot(mpg, aes(cty)) + geom_histogram()
# data: mpg dataset
# aesthetic mapping: cty values in x-axis and number of occurrence of cty values in y-axis
# layers: histogram