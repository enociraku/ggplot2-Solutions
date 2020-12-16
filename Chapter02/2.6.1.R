# 1. 

# The problem with the following plot is that there are many point overlapping and we do not see the real
# distribution of points.
ggplot(mpg, aes(cty, hwy)) + 
  geom_point()
# We can prove this by using the following line:
count(mpg, cty, hwy)
# In order to view all the points we can add a jitter to the above plot and this provides a better view
# of the spread of points.
ggplot(mpg, aes(cty, hwy)) + 
  geom_point() +
  geom_jitter()





# 2. 

# The problem with the boxplot shown is that the classes are in alphabetical order. This makes it hard to 
# compare, for example which are the top 2 classes (with regards to fuel economy) and by how much they 
# differ from the rest. It would be more useful if there were an order to the classes. This is what the
# reorder function does. It takes the categorical variable class and the numeric variable hwy. Based on
# the subset of values of hwy for each class we reorder the classes.
ggplot(mpg, aes(class, hwy)) + geom_boxplot()
ggplot(mpg, aes(reorder(class, hwy), hwy)) + geom_boxplot()





# 3.

# The distribution of the carat values can best be explored with the histogram geom. Let us use the 
# default values for binwidth first.
ggplot(diamonds, aes(carat)) + geom_histogram()
# The default is bins = 30, so there will be 30 bins in total. By changing the binwidth argument we can
# see different details. The most interesting binwidth for me was binwidth = 0.01 because it reveals
# some interesting pattern when the carat level is near a full values (like 1, or 2) or when the carat
# value is a number like 0.5 or some other "round" number. There is a high peak immediately at the 
# carat level of such a number.





# 4. 

ggplot(diamonds, aes(price)) + geom_freqpoly(binwidth = 30)
ggplot(diamonds, aes(price, color = cut)) + geom_freqpoly()
# The second graph shows the distribution of price with respect to different diamond cuts. Here, we
# do not specify the bindwidth as the default is good enough to get a general overview of how the prices
# vary with different cuts. If we used the binwidth = 30 like in the first plot the result would be too
# "noisy" to understand, but it might be worth trying out.





# 5.

# The geom_violin gives a very good insight to the distribution of values in each category but "it relies
# in density estimates which can be hard to interpret" (quote from textbook). 
# The geom_freqpoly "provide more information about the distribution of a single group than boxplots do, 
# at the expense of needing more space". Also the particular choice of binwidth is crucial to particular
# graphs to find out a more detailed insight. For example we saw in a previous excercise that using
# a binwidth of 0.01 provided the neccessary value to figure out that the number of diamonds spikes at
# "complete" values. This is not entirely obvious without trying trying different values first.
# geom_histogram are similar to geom_freqpoly just they are used with categorical variables.
# facetting provides a good way to compare patterns within categories as they plot one graph
# for each category. The weakness depends on the purpose of the analysis. If we want to compare the values
# for each category it might be hard since they are located in different graphs, and it becomes especially
# harder if the number of categories is large.





# 6.

# If we use the simple geom_bar call we have:
ggplot(mpg, aes(class)) +
  geom_bar()
# This gives a number of cars for those classes.
# If we supply the weight aesthetic than we have:
ggplot(mpg, aes(class)) +
  geom_bar(aes(weight = displ))
# This gives the total sum of displ for each class. And that is what is plotted in the y-axis





# 7.

grouped_data <- mpg %>% 
  group_by(manufacturer, model) %>% 
  select(manufacturer, model) %>% 
  count(model)
# Way 1a: 
ggplot(grouped_data, aes(x=n, y=model)) +
  geom_bar(aes(fill = manufacturer), stat="identity", position="dodge") +
  facet_wrap(~ manufacturer, scales = "free_y")

# Way 1b:
ggplot(grouped_data, aes(y=model, x=n)) +
  geom_bar(aes(fill = manufacturer), stat="identity", position="dodge")

# Way 2: Stacked bar charts:
ggplot(mpg, aes(trans)) + geom_bar(aes(fill = class))

# Way 3: Histograms (dodge option):
ggplot(mpg, aes(cyl)) + 
  geom_bar(aes(fill = trans), position = "dodge", width = 0.8)