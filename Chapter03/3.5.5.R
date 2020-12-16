# 1.

# We need to set the group aesthetic:
ggplot(mpg, aes(cyl, hwy)) +
  geom_boxplot(aes(group = cyl))





# 2.

ggplot(mpg, aes(displ, cty)) +
  geom_boxplot(aes(group = displ))





# 3.

# When one of the variables is a categorical value than we need to specify grouping in order to override
# the default grouping behavior, which is to group by the categorical variable plotted (in x- or y-axis).
# So when we want the line in the example to be connected we need to specify group = 1. It does not matter
# if we specify group = 1 or group = 2, the result will be the same:
df <- data.frame(x = 1:3, y = 1:3, colour = c(1,3,5))

# Points connected
ggplot(df, aes(x, y, colour = factor(colour))) +
  geom_line(aes(group = 1), size = 2) +
  geom_point(size = 5)

# Points not connected
ggplot(df, aes(x, y, colour = factor(colour))) +
  geom_line(size = 2) +
  geom_point(size = 5)

# When the variables are continuous than it makes no difference if we specity the group = 1 aesthetic
# or not as no assumption can be made about the grouping from the continuous variables. In other words
# it means the following lines of code will give the same plot:
ggplot(df, aes(x, y, colour = colour)) +
  geom_line(aes(group = 1), size = 2) +
  geom_point(size = 5)

ggplot(df, aes(x, y, colour = colour)) +
  geom_line(size = 2) +
  geom_point(size = 5)





# 4. 

# 3 bars:
ggplot(mpg, aes(drv)) +
  geom_bar()

# 46 bars:
ggplot(mpg, aes(drv, fill = hwy, group = hwy)) +
  geom_bar()

count(mpg, drv, hwy)

# 234 bars:
mpg2 <- mpg %>% arrange(hwy) %>% mutate(id = seq_along(hwy))
ggplot(mpg2, aes(drv, fill = hwy, group = id)) +
  geom_bar(color = "white")





# 5.

# If we plot the following code we notice that there is a general increase in the name "Hadley" 
# throughout the years but the line has a strange oscillation of ups and downs.
library(babynames)
hadley <- dplyr::filter(babynames, name == "Hadley")
ggplot(hadley, aes(year, n)) +
  geom_line()

# If we look at the hadley dataset (created from babynames) we notice that there are two categories
# males and females and that the number of females with the name "Hadley" is much larger than the
# number of males. To understand this better we can plot the lines based on the categories and use 
# an different color to better distinguish them:
ggplot(hadley, aes(year, n)) +
  geom_line(aes(group = sex, color = sex))

# The reason why this graph makes Hadley Wickham unhappy is that "Hadley" seems to be a female name. :)