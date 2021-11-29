library(readr)
ciref<-read_csv2("C:/Users/helen/Dropbox/Lab/Proyectos/1. Candidatos volátiles/3. Búsqueda genes/QTL_CIREF.csv")

matriz<-as.matrix(ciref) 
rownames(matriz) <- matriz[,1] ##name columns
matriz2 = subset(matriz, select = -c(Code) ) ##quit first column


content<-c(rep("low" , 18) , rep("high" , 12))
linea<-c("37.1","37.2","37.3","50.1","50.2","50.3","103.1","103.2","103.3","98.1","98.2","98.3", "51.1","51.2","51.3", "40.1", "40.2", "40.3", "122.1","122.2","122.3", "125.1","125.2","125.3", "126.1","126.2","126.3","71.1","71.2", "71.3") ##assign names

dir = "C:/Users/helen/OneDrive/Escritorio/graficas/"
dir2 = ".png"

library(ggplot2)
for (i in 1:272) { 
  expresion<-c(matriz2[i,]) #row 2
  data<-data.frame(content,linea,expresion)
  contenido=c(2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1) ##appears the way it has been assigned

  print(ggplot(data, aes(x=reorder(linea,contenido), y=expresion, fill=content)) + 
    geom_bar(position=position_dodge("content"),stat="identity") +
    scale_fill_grey() +
    ggtitle(matriz[i,1]) +
    xlab("línea") +
    ylab("Expresión"))

  file_save1 = paste(dir, matriz[i,1], sep="")
  file_save2 = paste(file_save1, dir2, sep="")
  ggsave(file_save2,width=12, height=8)
  print(file_save2)
}


