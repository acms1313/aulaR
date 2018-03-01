> #para verificar uma funcao colocar "?" antes do nome da Funcao
  
  #lista os arquivos do diretorio
  list.files()

#verifica a primeira coluna do banco
acidentes.transito.2016[,1]

#verifica a primeira coluna do banco
acidentes.transito.2016[1,]

#cria um objeto que o resultado é um novo banco eliminando a 5 linha e coluna
acidentes.manipulado<- (acidentes.transito.2016[-5,-5])

#visualiza o banco de dados
View(acidentes.transito.2016)

#cria um objeto que o resultado é um novo banco eliminando a linha de 1 a 10
acidentes.manipulado.2 <- acidentes.manipulado[-c(1:10), ]

# visualiza as primeiras linhas do banco de dados
head(acidentes.manipulado.2)
head(acidentes.transito.2016)

#cria um objeto com uma coluna especifica do banco de dados
situacao <- acidentes.transito.2016[, c("situacao")]

View(situacao)

# o cifrao seleciona uma variável dentro do banco de dados
acidentes.transito.2016$natureza

#as.fator transforma a variável para o tipo fator
acidentes.transito.2016$tipo<-as.factor(acidentes.transito.2016$tipo)
levels(acidentes.transito.2016$tipo)

acidentes.transito.com.vitima<-acidentes.transito.2016[acidentes.transito.2016$tipo=="COM VÍTIMA" & acidentes.transito.2016$situacao=="FINALIZADA" ,]

acidentes.transito.com.vitima<-acidentes.transito.2016[acidentes.transito.2016$tipo=="COM VÍTIMA" | acidentes.transito.2016$situacao=="FINALIZADA" ,]

# "| " (barra reta) significa "ou"e "&" significa "E"


#carregar o banco de dados sem ir na barra import dataset
acidentes.transito.2016 <- read.csv("~/OneDrive/Aula R 2018/acidentes-transito-2016.csv", sep=";", stringsAsFactors=FALSE)

#selecionar uma dado especifico no banco
acid <- acidentes.transito.2016[acidentes.transito.2016$tipo =="COM VÍTIMA",]

#transformar a variável ciclista que esra do tipo carcatec em  numérica
acid$ciclista<-as.numeric(acid$ciclista)

#Selecionar dentro do banco apenas os casos iguais a 1
acid.ciclista <- acid[acid$ciclista == 1,]

#selecionar apenas os casos completos, pois na importacao tambem aparecem os NAs
acid.ciclista<-acid.ciclista[complete.cases(acid.ciclista),]

#visualizar o banco de dados 
acid.ciclista

#======================
#baixar pacote de graficos com todos os pacotes que ele depende 

install.packages("gpglot2", dependencies = T)

#carregar pacote
 library(ggplot2)

#contar o numeto de vezes que uma informacao aparece na variavel

table(acid.ciclista$bairro)

#criar um banco a partir da variável que foi contada
data.frame(table(acid.ciclista$bairro))

#atribuir o resultado a um objeto
acid.ciclista.bairro<-data.frame(table(acid.ciclista$bairro))
View(acid.ciclista.bairro)

#ordenar o banco de dados

acid.ciclista.bairro<-acid.ciclista.bairro[order(acid.ciclista.bairro$Freq),]
acid.ciclista.bairro

acid.ciclista.bairro.15<-acid.ciclista.bairro[31:45,]
getwd()

write.csv(acid.ciclista.bairro.15, file = "bairro15.csv")
list.files()

ggplot(acid.ciclista.bairro.15, aes(x= Var1, y=Freq)) + geom_col()

acid.ciclista.bairro.15$Var1 <- factor(acid.ciclista.bairro.15$Var1, acid.ciclista.bairro.15$Var1[order(acid.ciclista.bairro.15$Freq)])

ggplot(acid.ciclista.bairro.15, aes(x= Var1, y=Freq)) + 
  geom_col(fill="blue") + 
  coord_flip()
