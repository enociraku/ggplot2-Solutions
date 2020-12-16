# 1. 

ggplot(mpg, aes(displ, cty)) +
  geom_point() +
  facet_wrap(~hwy)

# If we facet by a continuous variable we will get as many plots as there are distinct points in the variable.
# This makes the faceting not very useful to analyze the data, because there are too many plots created.
# If we facet by cyl which is a discrete varibale we are creating a plot for each cylinder. Since there are
# only four cylinders than we can better understand the difference in displ and hwy.





# 2. 

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~cyl)

# By faceting with number of cylinders we add another dimension to our information of displ and hwy.
# We not only see the relationship between hwy and displ but also how that relationship is affected
# by number of cylinders. 





# 3. 
?facet_wrap

# To control number of rows and columns we use the nrow and ncol arguments.
# This plot displays all the sub-plots in 1 row.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~cyl, nrow = 1, ncol = 4)

# Or we can display them in different rows.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~cyl, nrow = 4, ncol = 1)





# 4. 

# The sub-plots created with faceting by default have the same axis ranges. We can change this
# to "free_x" or "free_y" to change the axis to individual sub-plots when the ranges of the data
# in the sub-plots are very different from each other.