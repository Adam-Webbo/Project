
indiv_stats[1,]

ggplot(indiv_stats %>% filter(position == "Top")) +
  geom_boxplot(aes(x=player, y=dmgshare)) +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits=c(0, max(indiv_stats$dmgshare)))+ 
  theme(axis.text.x = element_text(angle=90)) +
theme_bw()

ggplot(indiv_stats %>% filter(position == "Top")) +
  geom_boxplot(aes(x=player, y=csdat15)) +theme_bw()+
  #scale_y_continuous(breaks = seq(0, 1, 0.1), limits=c(0, max(indiv_stats$dmgshare)))+ 
  theme(axis.text.x = element_text(angle=90)) 


ggplot(indiv_stats %>% filter(position == "Top")) +
  geom_boxplot(aes(x=player, y=kda)) +
  theme_bw() +
 # scale_y_continuous(breaks = seq(0, 1, 0.1), limits=c(0, max(indiv_stats$dmgshare)))+ 
  theme(axis.text.x = element_text(angle=90))


indiv_stats$kda
