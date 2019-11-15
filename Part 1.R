library(dplyr)
library(data.table)
library(readxl)
library(tidyverse)

rm(list=ls())

data_2018 <- read_excel("C:/Uni/Project/2018 Worlds data.xlsx")

plot(data_2018$fbtime, data_2018$gdat15)

data_2018$game


game_number <- seq(1, 119, 1) %>% rep(12) %>% sort 


data_2018_1 <- data_2018 %>% mutate("gameNum" = game_number,
                                    "kda" = (k+a)/ifelse(d==0, 1, d))
data_2018_1$dmgshare <- data_2018_1$dmgshare*100


data_2018_1 %>% summary()


data_2018_1 <- data_2018_1 %>% as.data.table

team_stats <- data_2018_1 %>% filter(is.na(champion))
indiv_stats <- data_2018_1 %>% filter(!is.na(champion))


team_stats$result[team_stats$result==1] <- "win"
team_stats$result[team_stats$result==0] <- "loss"

c9_stats <- team_stats %>% filter(team == "Cloud9") %>% data.table()

team_list <- team_stats$team %>% unique
team_select <- team_list[24]

ggplot(team_stats %>% filter(team == team_select)) +
  geom_point(aes(x=seq(1, length(gameNum), 1), y=gdat10, color=result)) +
  labs(x='Game Played by selected team',
       y="Gold difference at 15 minutes")

indiv_stats$position <- factor(indiv_stats$position, levels = c("Top", "Jungle", "Middle", "ADC", "Support"))

indiv_stats$position

ggplot(indiv_stats) +
  geom_bar(aes(x=team, y=dmgshare, fill = position), stat="identity", position = "fill") +
  theme_bw()+
  theme(axis.text.x = element_text(angle=90))

