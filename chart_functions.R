
#############################
#graphing functions
#############################

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

   m <- lm(yField ~ xField, data);
   r2 <- format(summary(m)$r.squared, digits = 3)

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

ggScatterAutoNoRLim <-  function(data, xField, yField, method, title,
                       xLabel, yLabel, source){

   m <- lm(yField ~ xField, data);
   r2 <- format(summary(m)$r.squared, digits = 3)

  ggplot(data, aes(x = xField, y = yField)) +
  geom_point(color="#b2ddf2") +
  geom_smooth(method = method,color="#008fd5",se=0) +
  coord_cartesian(ylim = c(75, 150)) +
  theme_minimal(base_size=9) +
  labs(title= paste(title),
    subtitle=paste("R-squared = ",r2),
     x=xLabel,
     y=yLabel,
     caption=paste("Source:",source)) +
     theme(plot.subtitle = element_text(color="#666666"),
          plot.caption = element_text(color="#AAAAAA", size=6))
}


ggBarTime<- function(data, title, xfield, yfield, xlabel, ylabel, source){

  ggplot(data) +
  geom_bar(aes(as.factor(xfield),  yfield),
            position = "dodge", stat = "summary", fun.y = "max",fill="#b2ddf2", color="#b2ddf2") +
  # scale_x_discrete(
  #                 breaks = c(18501.1, 19001.1, 19501.1, 20001.1),
  #                 labels = c("1850", "1900", "1950", "2000")) +
  # ggplot(data, aes(x = xfield, y=yfield)) +
  # geom_bar(stat="summary", fun.y="sum") +
  # geom_bar(stat = "identity",  position = "dodge") +
  # geom_smooth(method = "loess", color="#008fd5", se = FALSE) +
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6),
                 axis.text.x=element_text(angle=90, size=3),
                 axis.ticks.x=element_blank(),
               panel.grid.minor = element_blank(),
           panel.background = element_blank())
}

makeBreaks <- function(field){
  max_value <- max(unlist(field), na.rm = TRUE)
  min_value <- min(unlist(field), na.rm = TRUE)

  diff <- max_value - min_value

  break_value <- diff/10



}

ggBarMaxAll<- function(data, title, xfield, yfield, xlabel, ylabel, source){

  m <- lm(yfield ~ xfield, data);
  r2 <- format(summary(m)$r.squared, digits = 3)

  b_breaks = c(185101.1, 190001.1, 193001.1, 195001.1, 196001.1, 197001.1, 198001.1,  199001.1, 200001.1, 201001.1)
  b_labels = c("1850",  "1900",   "1930",   "1950",  "1960",   "1970",  "1980",     "1990",    "2000",  "2010")

  #adjust per basin
  if (str_sub(xfield[1], -1, -1) == 2){
    b_breaks = c(185101.2, 190001.2, 193001.2, 195001.2, 196001.2, 197001.2, 198001.2,  199001.2, 200001.2, 201001.2)
    b_labels = c("1850",  "1900",   "1930",   "1950",   "1960",   "1970",   "1980",     "1990",   "2000",  "2010")
  }

  ggplot(data,aes(as.factor(xfield),  yfield)) +
  geom_bar(position = "dodge", stat = "summary", fun.y = "max", fill="#b2ddf2", color="#b2ddf2", alpha = 0.25) +
  scale_x_discrete(
                  breaks = b_breaks,
                  labels = b_labels) +
  geom_smooth(method = "loess", color="#008fd5", se = FALSE) +
  # , minor_breaks = seq(0, 4.8, 0.1)
  theme_minimal(base_size=9) +
   labs(title= paste(title),
        subtitle="",
        x=xlabel,
        y=ylabel,
        caption=paste("Source:",source)) +
        theme(plot.subtitle = element_text(color="#666666"),
                 plot.caption = element_text(color="#AAAAAA", size=6),
                #  axis.text.x=element_blank(),
                #  axis.ticks.x=element_blank(),
               panel.grid.minor = element_blank(),
            #  panel.grid.major = element_line(color="grey60"),
           panel.background = element_blank())
}



  # facet_wrap(reformulate(facet_name), ncol = 5)
