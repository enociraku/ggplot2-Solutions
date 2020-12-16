# 1.

?position_nudge
# position_nudge is usually used with geom_text in order for the label not to overlap with the points
# they are labeling.





# 2.

# Error bars cannot be stacked because the range of the error than would not make sense. If two error bars
# have ranges from 0 to 10, you cannot make the second error bar have range from 10 to 20. Same reasons 
# apply for boxplots. In boxplot how do you determine where the next boxplot starts? 
# A geom must be independent of particular values, only range must be important. Also maybe the geoms
# should have the stat = "count" argument, for both stackable and dodgable.





# 3.

# geom_jitter - Advantage: visually better to see the distribution of points.
#               Disadvantage: the points are removed from their initial (true) positions.
# geom_count -  Advantage: gain a better quantitative understanding of how the points are distributed.
#               Disadvantage: does not help to gain a broad understanding of the distributions
#               especially if the categories are large in number.





# 4.

# "A stacked area chart 'stacks' trends on top of each other to illustrate how a part-to-whole
# distribution changes over time. Combined with a table calculation that computes
# the percent of total for each dimension member in the visualization, stacked
# area charts are an effective way to evaluate distributions." (Ryan Sleeper)

# "However, if it is more important to know the individual trends of each sub-category,
# that becomes difficult to assess with a stacked area chart. The reason is that after the
# trend on the bottom of the stack, each subsequent trend inherits the trend below it." (Ryan Sleeper)