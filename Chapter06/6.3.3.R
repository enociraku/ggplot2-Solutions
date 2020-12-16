# 1.

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(quote(Highway * " " (miles/gallon))) +
  scale_x_continuous("Displacement", breaks = 2:7, labels = paste(2:7, "L"))





# 2.

# According to documentation, break takes one of the following:
# - NULL for no breaks.
# - waiver() for the default breaks computed by the transformation object.
# - A numeric vector of positions.
# - A function that takes the limits as input and returns breaks as output 
#   (e.g., a function returned by scales::extended_breaks()).

# While label:
# - NULL for no labels
# - waiver() for the default labels computed by the transformation object
# - A character vector giving labels (must be same length as breaks)
# - A function that takes the breaks as input and returns labels as output

# So we notice break and label differ in the third point, where break takes
# numeric vector of positions, while label takes a character vector.





# 3.

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  scale_color_discrete(name = "drv", labels = c('4' = '4wd', 'f' = 'fwd', 'r' = 'rwd'))





# 4.

# quote() - allows creation of mathmatical expressions
# label_ordinal() - formats numbers in rank order: 1st, 2nd, 3rd etc.





# 5.

# The three most important arguments are: name, breaks, labels.
# name -> sets the name of the axis/legend
# breaks -> sets which axis/legend values are to be shown.
# labels -> sets how the axis/legend values in break are to be named.