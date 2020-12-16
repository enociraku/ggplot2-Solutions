# 1.

# binwidth = 0.01 shows an interesting pattern. There are spike counts at certain carat values.
ggplot(diamonds, aes(carat)) +
  geom_histogram(binwidth = 0.01)





# 2.

# We should try different binwidth values. Using binwidth = 10 we notice that there is a gap meaning no 
# values present for price around 1300.
ggplot(diamonds, aes(price)) +
  geom_histogram(binwidth = 10)





# 3. 

# There are two ways we can see this distribution:
# a.
ggplot(diamonds, aes(price)) +
  geom_histogram(aes(fill = clarity), binwidth = 50, position = "fill",
                 na.rm = TRUE)

# b.
ggplot(diamonds, aes(price, color = clarity)) +
  geom_freqpoly(binwidth = 1000)
# Adjust the value of binwidth accordingly. bindwidth = 10 also works well.





# 4.

legend.color <- c("freqpoly" = "red", "density" = "blue")

ggplot(diamonds, aes(depth)) +
  geom_freqpoly(aes(y = ..density.., color = "freqpoly")) +
  geom_density(aes(color = "density")) +
  xlab("Diamond Depth") +
  ylab("Distribution") +
  scale_color_manual(values = legend.color)