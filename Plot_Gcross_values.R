#############################################
# Plot Gcross Values
#############################################

#usando un barplot
par(mfrow = c(2,2))
boxplot(GAB_ea[,c(3,4,5)], outline = FALSE, main = "Entire area", ylim = c(0,1), 
        col = c("khaki", "lightsteelblue", "palegreen4"))
boxplot(GAB_F3C[,c(3,4,5)], outline = FALSE, main = "F3C", ylim = c(0,1), 
        col = c("khaki", "lightsteelblue", "palegreen4"))
boxplot(GAB_G20G3A[,c(3,4,5)], outline = FALSE, main = "G2O - G3A", ylim = c(0,1), 
        col = c("khaki", "lightsteelblue", "palegreen4"))
boxplot(GAB_G3BG3C[,c(3,4,5)], outline = FALSE, main = "G3B - G3B", ylim = c(0,1), 
        col = c("khaki", "lightsteelblue", "palegreen4"))
################################################################################


#density with ggplot
#è necessario manipolare i dati per creare dei plot cumulativi della densità


SA_ea = rep("Entire area", 513)
SA_F3C = rep("F3C", 513)
SA_G2OG3A = rep("G2O-G3A", 513)
SA_G3BG3C = rep("G3B-G3C", 513)


GAB_ea['area'] = SA_ea
GAB_F3C['area'] = SA_F3C
GAB_G20G3A['area'] = SA_G2OG3A
GAB_G3BG3C['area'] = SA_G3BG3C



df_list = list(GAB_ea, GAB_F3C, GAB_G20G3A, GAB_G3BG3C)

df_compl = rbind(GAB_ea, GAB_F3C, GAB_G20G3A, GAB_G3BG3C) #merging dataframe



library(ggplot2)
library(ggthemes)

ggplot(df_compl, aes(han, colour = area, fill = area)) + 
  geom_density(alpha = 0.3) + theme_clean()

ggplot(df_compl, aes(km, colour = area, fill = area)) + 
  geom_density(alpha = 0.3) + theme_clean()

ggplot(df_compl, aes(rs, colour = area, fill = area)) + 
  geom_density(alpha = 0.3) + theme_clean()

#funziona meglio il boxplot


p1 = ggplot(df_compl, aes(y=han, colour = area, fill = area)) + 
  geom_boxplot(alpha = 0.3) + theme_clean()

p2 = ggplot(df_compl, aes(y=km, colour = area, fill = area)) + 
  geom_boxplot(alpha = 0.3) + theme_clean()

p3 = ggplot(df_compl, aes(y=rs, colour = area, fill = area)) + 
  geom_boxplot(alpha = 0.3) + theme_clean()

library(gridExtra)

grid.arrange(p1, p2, p3, ncol = 1)


