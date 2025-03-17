# set.seed(1)
# 
# #different sample sizes
# n <- seq(2, 1000, by = 2)
# 
# #simulate from normal with different sample sizes
# samples <- map(n, \(n) Pareto::rPareto(n, 10, 3))
# 
# #sample sd for each sample
# SSD <- map_dbl(samples, \(.x) sd(.x))
# 
# #SE of mean of each sample
# SE <- map_dbl(samples, \(.x) sd(.x)/sqrt(length(.x)))
# 
# ggplot() +
#   geom_line(data = tibble(n, SE), aes(n, SE, color = "SE"), linewidth = .9) +
#   geom_line(data = tibble(n, SSD), aes(n, SSD, color = "SSD"), linewidth = .9
#   ) +
#  # geom_hline(aes(yintercept = sqrt(2/100^2), color = "SD"), linewidth = .9) +
#   geom_hline(yintercept = 0, linetype = 2, linewidth = .9, color  = "darkgreen") +
#   scale_color_manual(name = "",
#                      values = c("SE" = "blue","SSD" = "red","SD" = "black"))+
#   xlim(2, max(n)) +
#   labs(y = "SD/SSD/SE")
# 
# 
# 
# 
# f <- function(x) replicate(100, (rchisq(x, df = 100))[1]) |> sd()
# 
# 
# out <- map_dbl(n, \(.x) f(.x))
# 
# tibble(n, out) |> 
#   ggplot()+
#   geom_line(aes(n, out))
# 
