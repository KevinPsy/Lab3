install.packages("tidyverse")
library("tidyverse")

install.packages("gapminder")
library("gapminder")

gapminder%>%
  filter(gapminder$year == 2007) -> data2007
as.character(data2007$country)

data2007%>%
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point()+
  geom_text(aes(label=ifelse((data2007$gdpPercap > 40000 & data2007$continent =="Europe"),as.character(data2007$country),"")), hjust=1.1,color="blue")+
  labs(x = "GDP Per Capita", y="Life Expentancy")+
  theme_bw()

data2007%>%
  ggplot(aes(x=gdpPercap,y=lifeExp),label = country)+
  geom_point()+
  geom_rect(aes(xmin=39000,xmax=51000,ymin=76,ymax=83.5), alpha=0.003,fill=2)+
  annotate("text",x=45000,y=73,label="Countries with \n highest GDP")+
  labs(x = "GDP Per Capita", y="Life Expentancy")+
  theme_bw()
