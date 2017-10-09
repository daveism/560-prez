
#############################
#graphing functions
#############################

ggScatterSimple <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, lowerlimit, upperlimit, source){


  m <- lm(yField ~ xField, data);
  r2 <- format(summary(m)$r.squared, digits = 3)
  pearsons <- format(cor(xField, yField, use = "complete.obs"), digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  theme_minimal(base_size=9) +
  coord_cartesian(ylim = c(lowerlimit, upperlimit)) +
  labs(title= paste(title),
     subtitle=paste("R-squared = ",r2),
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

ggScatterAuto <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, source){


  m <- lm(yField ~ xField, data);
  r2 <- format(summary(m)$r.squared, digits = 3)
  pearsons <- format(cor(xField, yField, use = "complete.obs"), digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  theme_minimal(base_size=9) +
  labs(title= paste(title),
    subtitle=paste("R-squared = ",r2),
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

ggScatterAutoNoR <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, source){

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  theme_minimal(base_size=9) +
  labs(title= paste(title),
     subtitle="",
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

ggScatterAutoNoRLim <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, source){

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  coord_cartesian(ylim = c(75, 150)) +
  theme_minimal(base_size=9) +
  labs(title= paste(title),
     subtitle="",
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

ggScatterType <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, lowerlimit, upperlimit, source, type){

 #doc and other
 base_size <- ifelse(type == "doc", as.numeric(3) , as.numeric(9) )
 text_size <- ifelse(type == "doc", as.numeric(3) , as.numeric(6) )
 point_outline_size <- ifelse(type == "doc", as.numeric(.1) , as.numeric(1) )
 point_size <- ifelse(type == "doc", as.numeric(.05) , as.numeric(1) )
 line_size <- ifelse(type == "doc", as.numeric(.5) , as.numeric(1) )


  m <- lm(yField ~ xField, data);
  r2 <- format(summary(m)$r.squared, digits = 3)
  pearsons <- format(cor(xField, yField, use = "complete.obs"), digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(size = point_outline_size,colour = "black") +
  geom_point(colour="#b2ddf2", size =point_size,  alpha = 0.40 ) +
  geom_smooth(method = method,color="#008fd5", se=0, size=line_size) +
  theme_minimal(base_size=base_size) +
  coord_cartesian(ylim = c(lowerlimit, upperlimit)) +
  labs(title= paste(title),
      subtitle=paste("R-squared = ",r2),
       x=xLabel,
       y=yLabel,
       caption=paste("Source:",source)) +
  theme(plot.subtitle = element_text(color="#666666"),
        plot.caption = element_text(color="#AAAAAA", size=text_size))
}


ggScatterPt <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, lowerlimit, upperlimit, pt_name,
                       pt_title, source){

  m <- lm(yField ~ xField, data);
  r2 <- format(summary(m)$r.squared, digits = 3)
  pearsons <- format(cor(xField, yField, use = "complete.obs"), digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(aes(color = pt_name)) +
  labs(colour=pt_title) +
  geom_smooth(method = method,color="#008fd5",se=0) +
  theme_minimal(base_size=9) +
  coord_cartesian(ylim = c(lowerlimit, upperlimit)) +
  labs(title= paste(title),
    subtitle=paste("R-squared = ",r2),
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

ggScatterTotals <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, lowerlimit, upperlimit, source){

   max_value <- max(unlist(yField), na.rm = TRUE)
   min_value <- min(unlist(yField), na.rm = TRUE)

  m <- lm(yField ~ xField, data);
  r2 <- format(summary(m)$r.squared, digits = 3)
  pearsons <- format(cor(xField, yField, use = "complete.obs"), digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  theme_minimal(base_size=9) +
  coord_cartesian(ylim = c(min_value, max_value)) +
  labs(title= paste(title),
    subtitle=paste("R-squared = ",r2),
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}

geom_bar(stat="summary", fun.y="sum")

ggBarTime<- function(data, title, xfield, yfield, xlabel, ylabel, source){

  ggplot(data, aes(x = xfield, y=yfield)) +
  geom_bar(stat="summary", fun.y="max", fill="grey", color="dark grey") +
  # geom_smooth(method = "loess", color="#008fd5", se = FALSE) +
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6))
}


ggBarMaxAll<- function(data, title, xfield, yfield, xlabel, ylabel, source){

  # max_value <- as.numeric(max(unlist(xfield), na.rm = TRUE))
  # min_value <- as.numeric(min(unlist(xfield), na.rm = TRUE))
  #
  # diff <- max_value - min_value

  ggplot(data, aes(x = xfield, y = yfield)) +
  geom_bar(stat = "identity", fill="grey", color="dark grey") +
  geom_smooth(method = "loess", color="#008fd5", se = FALSE) +
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6),
                 axis.text.x=element_blank(),
                 axis.ticks.x=element_blank(),
               panel.grid.minor = element_blank(),
             panel.grid.major = element_blank(),
           panel.background = element_blank())
}


ggYearCnt <- function(data, title, xfield, yfield, xlabel, ylabel, source){

  max_value <- as.numeric(max(unlist(xfield), na.rm = TRUE))
  min_value <- as.numeric(min(unlist(xfield), na.rm = TRUE))
  print(max_value)

  diff <- max_value - min_value

  ggplot(data, aes(x = xfield)) +
  geom_histogram(stat = "max", fill="grey", color="dark grey", bins=diff) +
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6))
}

ggYear <- function(data, title, dataname, years, source){
  ggplot(data, aes(x = dataname)) +
  geom_histogram(stat = "bin", fill="grey", color="dark grey", bins=years) +
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x="Year",
        y="Max wind in MPH",
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6))
}

ggYearFac <- function(data, dataname, years, facet_name, source){
  ggplot(data, aes(x = dataname)) +
  geom_histogram(stat = "bin", fill="grey", color="dark grey", bins=years) +
  theme_minimal(base_size=9) +
  labs(title= paste("Events by Year 1950-2017"),
        subtitle="",
        x="Year",
        y="Number of events",
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6))+
  facet_wrap(reformulate(facet_name), ncol = 5)
}

ggScatterDigfac2 <-  function(data, xField, yField, xlabel, ylabel, title, facet_name, source){
  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = 'lm',color="#008fd5",se=0) +
  ggtitle(title) +theme_minimal(base_size=9) + coord_cartesian(ylim = c(0, 200)) +
  labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6))+
  facet_wrap(reformulate(facet_name), ncol = 3)
}
