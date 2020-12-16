# 1.

# Facetting by cut and grouping by carat
ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  facet_wrap(~cut)

# Facetting by carat and grouping by cut.
diamonds$carat_int <- cut_interval(diamonds$carat, 10)

ggplot(diamonds, aes(price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500, position = "dodge") +
  facet_wrap(~carat_int)

# Facetting by cut is preferable because the number of plots is smaller as we have a discrete variable, 
# while facceting by carat involves tweaking of the interaval by which we are working and additional
# tweaking of binwidth.





# 2.

ggplot(diamonds, aes(carat, price)) +
  geom_point(aes(color = color))
# The groups are hard to compare because there too many data points, so distinguishing cleary between
# groups becomes hard as there are many overlapping data points. 
# Also, even though seven groups, like here, are not much the distinction between
# different colors starts to become hard.


# In this case faceting is more helpful to get a more detailed picture for each group.





# 3.

# We usually want to compare the distribution of certain varibles accoring to one group. So, we want
# to notice how our variables of interest change accoring to the values in that group. This is what
# facet_wrap does. It facets according to a single variable.
# facet_grisd takes two (usually discrete) variables and it creates a grid of their combination.
# However, showing the change for 2 variables is harder to interpret than 1 variable, so face_wrap
# is used more often.





# 4.

mpg2 <- subset(mpg, cyl != 5 & drv %in% c("4", "f") & class != "2seater")

# Remove the class variable from the geom_smooth layer:
ggplot(mpg2, aes(displ, hwy)) +
  geom_smooth(data=select(mpg2,-class), se = F) +
  geom_point(size = 2) +
  facet_wrap(~class)