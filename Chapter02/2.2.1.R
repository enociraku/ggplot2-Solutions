# 1.

# 1. head(mpg) - List the first six rows.
# 2. tail(mpg) - List the last six rows.
# 3. summary(mpg) - Create a summary for every variable.
# 4. distinct(mpg, cylinders) - List the distinct values the cylinders variable takes. Can subsitute 
#                               cylinder with any (categorical) variable you wish to obtain information.
#                               Note that this is a "tidyverse" function.
# 5. range(mpg$displ) - List the min and maximum values the variable displ takes. In other words the range
#                       of values the variable takes. For categorical varibales like model or manufacturer
#                       the results will be shown alphabetically.




# 2.

# Using the following function:
data()
# one can get a list of packages and their associated variables. If you want information about the ggplot2
# package you can scroll to that part and there is a list of the associated datasets.
# Or if you want only ggplot2 use:
data(package = "ggplot2")




# 3.

# cty and hwy are measured in miles per gallon (Found from mpg help page). So we first need to convert
# gallons to liters and miles to kilometers.
# 1 gallon = 3.78541 liters
# 1 mile = 1.60934 kilometers
# miles/gallon -> (1.60934 kilometers) / (3.78541 liters) = 0.4251429 kilometers/liter
# 0.4251429 kilometers/liter -> 2.35215 liters/kilometer -> 235.215 liters/(100 kilometers)
# So 1 mile/gallon is equivalent to 235.215 liters/(100 kilometers)
conversion_factor <- 235.215
mpg %>% 
  mutate(
    hwy_lPer100km = hwy * conversion_factor,
    cty_lPer100km = cty * conversion_factor
  )




# 4.

# Manufacturer with most models can mean the manufacturer with most cars in the dataset or it can
# mean with most different models. I will use the first definition, so the manufacturer with most
# cars in the dataset:
mpg %>%
  count(manufacturer) %>%
  arrange(desc(n))
# Result: dodge with 37 cars

# Model with most variations:
mpg %>%
  group_by(manufacturer) %>%
  distinct(model) %>%
  count() %>%
  arrange(desc(n))
# Result: Toyota with 6 different models

# The drive train specifications seem to be 3: quattro, 4wd, and 2wd
pats <- c("quattro|4wd|2wd")
# Now we remove these strings from the models that they appear on. Remember to also remove any
# trailing white space left after removing the string.
mpg %>%
  mutate(model = str_trim(str_replace(model, pats, "")))
# Now we use the same code as before to check the number of models:
mpg %>%
  mutate(model = str_trim(str_replace(model, pats, ""))) %>%
  group_by(manufacturer) %>%
  distinct(model) %>%
  count() %>%
  arrange(desc(n))

# By comparing we notice that only audi changes from 3 models in the first
# problem to 2 when we remove the wheel drive. The others remain unchanged.