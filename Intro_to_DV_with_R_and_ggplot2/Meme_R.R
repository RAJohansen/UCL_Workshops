if (.Platform$OS.type == "windows") {
  windowsFonts(
    Impact = windowsFont("Impact"),
    Courier = windowsFont("Courier")
  )
}
install.packages("ggimage")

library(meme)
library(ggplot2)
library(ggimage)
library(grid)
m <- "https://cdn.vox-cdn.com/thumbor/o8TKj2Jno_XKcdI2PPwmPqZuv9Y=/0x0:2048x858/920x613/filters:focal(834x251:1160x577):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/57442421/hulk_agnarok.0.jpg"
meme(mm, "Its ", "Plotting Time!")

mm <- meme(m, "Its", "Plotting Time!", size=5, color='firebrick', bgcolor=NULL, vjust = 0.1)

xx <- seq(0, 2*pi , length.out=10)
yy <- sin(xx)

d <- data.frame(x = xx, y = yy)
ggplot(d, aes(x, y)) +
  geom_subview(x = 0.5, y = 0, subview=mm+aes(size=5), width=Inf, height=Inf) +
  geom_line() + geom_point(aes(size=5),color="blue") + theme_classic()
