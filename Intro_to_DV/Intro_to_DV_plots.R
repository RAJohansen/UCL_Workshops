library(tidyverse)

mpg <- mpg
mpg$cyl <- as.factor(mpg$cyl)
mpg$manufacturer <- as.factor(mpg$manufacturer)
ggplot(mpg) + geom_point(aes(displ,hwy, col = manufacturer), size= 3)+ theme_bw()

jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/mpg_manufacturer.jpg",
     width = 5, height = 5, units = "in",
     res = 300) 
dev.off()

diamonds <- diamonds
diamonds 

ggplot(diamonds) +
  geom_bar(aes(cut, fill = clarity), position = "stack") + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Diamonds_Cut_Clarity.jpg",
     width = 5, height = 5, units = "in",
     res = 300) 
dev.off()


ND <- tibble::tibble(
  x = seq(1,5),
  y = seq(1,5))

ggplot(ND) + geom_point(aes(x,y), size= 3)+ theme_bw()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/ND_Discrete.jpg",
     width = 5, height = 5, units = "in",
     res = 300) 
dev.off()

ggplot(ND) + geom_line(aes(x,y), size= 2, col = "darkred")+
  geom_point(aes(x,y), size= 3) + theme_bw()

jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/ND_Cont.jpg",
     width = 5, height = 5, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_bar(aes(Genre)) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Bar.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_bar(aes(Genre)) + 
  coord_flip() + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Bar_Flip.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_histogram(aes(Runtime), col = "white", binwidth = 10) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_RT_10.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_histogram(aes(Runtime), col = "white", binwidth = 20) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_RT_20.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_point(aes(Rating, Runtime, col = Genre), size = 3) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Scatter_Col.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_point(aes(Rating, Runtime, size = Rank)) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Bubble.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()


ggplot(movies_df) +
  geom_boxplot(aes(Genre, Rating)) + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Boxplot.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()


ggplot(movies_df) +
  geom_violin(aes(Genre, Rating)) + 
  geom_point(aes(Genre, Rating), size = 3) +
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Violin_Points.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()


ggplot(diamonds) +
  geom_bar(aes(cut, fill = clarity), position = "stack") + 
  coord_polar() + 
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Diamonds_Polar.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_point(aes(Runtime, Rating)) +
  facet_wrap(~Genre, nrow = 2) +
  theme_bw()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Facet.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(movies_df) +
  geom_point(aes(Runtime, Rating)) +
  geom_smooth(aes(Runtime, Rating)) +
  theme_bw()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Movies_Combined_Chart.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

ggplot(diamonds, aes(x=carat,y=price))+
  stat_binhex(colour="white",na.rm=TRUE)+
  scale_fill_gradientn(colours=c("lightgrey","red"),name = "Frequency",na.value="white") +
  theme_classic()
jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Diamonds_Hex.jpg",
     width = 7, height = 7, units = "in",
     res = 300) 
dev.off()

library(maps)

all_states <- map_data("state")
all_states
head(all_states)

voters$region <- voters$state
voters$region <- tolower(voters$region)
Total <- merge(all_states, voters, by="region")
head(Total)

ggplot() +
  geom_polygon(data=Total, aes(x=long, y=lat, group = group, fill=Total$eligible_voters),colour="white") +
  scale_fill_continuous(low = "thistle2", high = "darkred", guide="colorbar") +
  theme_bw()  +
  labs(fill = "Number of Voters" ,title = "Voter Turnout by State for 2016 Presidential Election", x="", y="") +
  scale_y_continuous(breaks=c()) +
  scale_x_continuous(breaks=c()) +
  theme(panel.border =  element_blank())

jpeg("C:/R_Packages/UCL_Workshops/Intro_to_DV/Plots/Voters_Map.jpg",
     width = 7, height = 5, units = "in",
     res = 300) 
dev.off()


