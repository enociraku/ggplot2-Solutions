# 1.

# Usually when we apply layers to our plot we use the same dataset. So, we do not change the data when we
# apply the layer. The dataset is supplied at the ggplot() function. This means we do not need to write
# mapping explicitly as an argument and can go directly and use it because we are using positional 
# reference to the arguments.





# 2.

library(tidyverse)
class <- mpg %>%
  group_by(class) %>%
  summarise(n = n(), hwy = mean(hwy))

ggplot(mpg, aes(class, hwy)) +
  geom_point(size = 2) +
  geom_jitter(width = 0.08) +
  geom_point(aes(class, hwy), class, color = "red", size = 6) +
  geom_text(aes(x = class, y = 5, label = paste("n =", n)), data = class)