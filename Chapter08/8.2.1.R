# 1.

df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()

base + theme_base() + ggtitle("theme_base()")
base + theme_calc() + ggtitle("theme_calc()")
base + theme_clean() + ggtitle("theme_clean()")
base + theme_economist() + ggtitle("theme_economist()")
base + theme_excel() + ggtitle("theme_excel()")
base + theme_excel_new() + ggtitle("theme_excel_new()")
base + theme_few() + ggtitle("theme_few()")
base + theme_fivethirtyeight() + ggtitle("theme_fivethirtyeight()")
base + theme_gdocs() + ggtitle("theme_gdocs()")
base + theme_hc() + ggtitle("theme_hc()")
base + theme_igray() + ggtitle("theme_igray()")
base + theme_map() + ggtitle("theme_map()")
base + theme_pander() + ggtitle("theme_pander()")
base + theme_par() + ggtitle("theme_par()")
base + theme_solarized() + ggtitle("theme_solarized()")
base + theme_solid() + ggtitle("theme_solid()")
base + theme_stata() + ggtitle("theme_stata()")
base + theme_tufte() + ggtitle("theme_tufte()")
base + theme_wsj() + ggtitle("theme_wsj()")

# My personal favorites are: theme_gdocs and theme_pander





# 2.

# The nice thing about the default theme is the gray background which makes it more agreeable to the eye
# compared to the white one.
# One thing which I like in other themes compared to the default is the border around the graph object.
# One thing that could be improved would be to add border around the graph, and/or make horizontal as
# well as vertical dashed panel-strips.