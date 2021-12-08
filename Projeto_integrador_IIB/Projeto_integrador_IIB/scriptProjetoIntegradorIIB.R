# Projeto integrador II B

# Instalção de pacotes:
install.packages("dplyr")
install.packages("formattable")
install.packages("ggplot2")
library("dplyr")
library("formattable")
library("ggplot2")

# Importando csv e colocando eles dentro do dataset:

# Mostrar o diretório padrão do projeto.
getwd() 

# Importando os dados baixados do dados.gov.br que estão
# armazenados do diretório padrão do projeto e guardando em
# variaveis por ano:
dados2011 <- read.csv("eixo3_estudatrabalha_2011.csv", encoding = "UTF-8")
dados2012 <- read.csv("eixo3_estudatrabalha_2012.csv", encoding = "UTF-8")
dados2013 <- read.csv("eixo3_estudatrabalha_2013.csv", encoding = "UTF-8")
dados2014 <- read.csv("eixo3_estudatrabalha_2014.csv", encoding = "UTF-8")
dados2015 <- read.csv("eixo3_estudatrabalha_2015.csv", encoding = "UTF-8")
dados2016 <- read.csv("eixo3_estudatrabalha_2016.csv", encoding = "UTF-8")
dados2017 <- read.csv("eixo3_estudatrabalha_2017.csv", encoding = "UTF-8")
dados2018 <- read.csv("eixo3_estudatrabalha_2018.csv", encoding = "UTF-8")
dados2019 <- read.csv("eixo3_estudatrabalha_2019.csv", encoding = "UTF-8")

# Incluindo a coluna ano ao dataframe
dados2011 <- mutate(dados2011, Ano=2011, .before = UF)
dados2012 <- mutate(dados2012, Ano=2012, .before = UF)
dados2013 <- mutate(dados2013, Ano=2013, .before = UF)
dados2014 <- mutate(dados2014, Ano=2014, .before = UF)
dados2015 <- mutate(dados2015, Ano=2015, .before = UF)
dados2016 <- mutate(dados2016, Ano=2016, .before = UF)
dados2017 <- mutate(dados2017, Ano=2017, .before = UF)
dados2018 <- mutate(dados2018, Ano=2018, .before = UF)
dados2019 <- mutate(dados2019, Ano=2019, .before = UF)

# Checando se cada variavel foi imporada como uma dataframe:
class(dados2011)
class(dados2012)
class(dados2013)
class(dados2014)
class(dados2015)
class(dados2016)
class(dados2017)
class(dados2018)
class(dados2019)

# Checando se as colunas possuem os mesmo nomes::

names(dados2011) == names(dados2012)
names(dados2012) == names(dados2013)
names(dados2013) == names(dados2014)
names(dados2014) == names(dados2015)
names(dados2015) == names(dados2016)   
names(dados2016) == names(dados2017)
names(dados2017) == names(dados2018)
names(dados2018) == names(dados2019)

# Entre os dados de 2011 a 2015 e de 2016 a 2019 existem diferenças entre os 
# nomes das colunas

ncol(dados2015)
ncol(dados2016)

names(dados2015)
names(dados2016)

# Diferença de colunas:
# "EstudaNaoAtivo"
# "EstudaNaoAtivo..."
# "NaoEstudaNaoAtivo"      
# "NaoEstudaNaoAtivo..."

# Para fins academicos, por não ter encontado referência sobre o tema,
# as colunas "EstudaNaoAtivo" e "EstudaNaoAtivo..." serão somadas as 
# colunas "EstudaDesocupado" e "EstudaDesocupado...".

# O mesmo que mencionado acima será feito para as colunas "NaoEstudaNaoAtivo" e
# "NaoEstudaNaoAtivo..." serão somadas as colunas "NaoEstuda_Desocupado" e
# "NaoEstuda_Desocupado...".

dados2011$EstudaDesocupado <- 
  dados2011$EstudaDesocupado + dados2011$EstudaNaoAtivo
dados2012$EstudaDesocupado <- 
  dados2012$EstudaDesocupado + dados2012$EstudaNaoAtivo
dados2013$EstudaDesocupado <- 
  dados2013$EstudaDesocupado + dados2013$EstudaNaoAtivo
dados2014$EstudaDesocupado <- 
  dados2014$EstudaDesocupado + dados2014$EstudaNaoAtivo
dados2015$EstudaDesocupado <- 
  dados2015$EstudaDesocupado + dados2015$EstudaNaoAtivo

dados2011$NaoEstudaDesocupado <- 
  dados2011$NaoEstudaDesocupado + dados2011$NaoEstudaNaoAtivo
dados2012$NaoEstudaDesocupado <- 
  dados2012$NaoEstudaDesocupado + dados2012$NaoEstudaNaoAtivo
dados2013$NaoEstudaDesocupado <- 
  dados2013$NaoEstudaDesocupado + dados2013$NaoEstudaNaoAtivo
dados2014$NaoEstudaDesocupado <- 
  dados2014$NaoEstudaDesocupado + dados2014$NaoEstudaNaoAtivo
dados2015$NaoEstudaDesocupado <- 
  dados2015$NaoEstudaDesocupado + dados2015$NaoEstudaNaoAtivo

ncol(dados2011)
ncol(dados2016)

names(dados2011)
names(dados2016)

# Renomeando as colunas dos dataframes de 2011 a 2015, igualando as
# colunas dos dataframes de 2016 a 2019:
# dados <- rename(dados, new_name = old_name)

dados2011 <- rename(dados2011, "Estuda_Ocupado" = "EstudaOcupado")
dados2012 <- rename(dados2012, "Estuda_Ocupado" = "EstudaOcupado")
dados2013 <- rename(dados2013, "Estuda_Ocupado" = "EstudaOcupado")
dados2014 <- rename(dados2014, "Estuda_Ocupado" = "EstudaOcupado")
dados2015 <- rename(dados2015, "Estuda_Ocupado" = "EstudaOcupado")

dados2011 <- rename(dados2011, "Estuda_Ocupado..." = "EstudaOcupado...")
dados2012 <- rename(dados2012, "Estuda_Ocupado..." = "EstudaOcupado...")
dados2013 <- rename(dados2013, "Estuda_Ocupado..." = "EstudaOcupado...")
dados2014 <- rename(dados2014, "Estuda_Ocupado..." = "EstudaOcupado...")
dados2015 <- rename(dados2015, "Estuda_Ocupado..." = "EstudaOcupado...")

dados2011 <- rename(dados2011, "NaoEstuda_Ocupado..." = "NaoEstudaOcupado...")
dados2012 <- rename(dados2012, "NaoEstuda_Ocupado..." = "NaoEstudaOcupado...")
dados2013 <- rename(dados2013, "NaoEstuda_Ocupado..." = "NaoEstudaOcupado...")
dados2014 <- rename(dados2014, "NaoEstuda_Ocupado..." = "NaoEstudaOcupado...")
dados2015 <- rename(dados2015, "NaoEstuda_Ocupado..." = "NaoEstudaOcupado...")

dados2011 <- rename(dados2011, "NaoEstuda_Ocupado" = "NaoEstudaOcupado")
dados2012 <- rename(dados2012, "NaoEstuda_Ocupado" = "NaoEstudaOcupado")
dados2013 <- rename(dados2013, "NaoEstuda_Ocupado" = "NaoEstudaOcupado")
dados2014 <- rename(dados2014, "NaoEstuda_Ocupado" = "NaoEstudaOcupado")
dados2015 <- rename(dados2015, "NaoEstuda_Ocupado" = "NaoEstudaOcupado")

dados2011 <- rename(dados2011, "Estuda_Desocupado..." = "EstudaDesocupado...")
dados2012 <- rename(dados2012, "Estuda_Desocupado..." = "EstudaDesocupado...")
dados2013 <- rename(dados2013, "Estuda_Desocupado..." = "EstudaDesocupado...")
dados2014 <- rename(dados2014, "Estuda_Desocupado..." = "EstudaDesocupado...")
dados2015 <- rename(dados2015, "Estuda_Desocupado..." = "EstudaDesocupado...")

dados2011 <- rename(dados2011, "Estuda_Desocupado" = "EstudaDesocupado")
dados2012 <- rename(dados2012, "Estuda_Desocupado" = "EstudaDesocupado")
dados2013 <- rename(dados2013, "Estuda_Desocupado" = "EstudaDesocupado")
dados2014 <- rename(dados2014, "Estuda_Desocupado" = "EstudaDesocupado")
dados2015 <- rename(dados2015, "Estuda_Desocupado" = "EstudaDesocupado")

dados2011 <- rename(dados2011, "NaoEstuda_Desocupado" = "NaoEstudaDesocupado")
dados2012 <- rename(dados2012, "NaoEstuda_Desocupado" = "NaoEstudaDesocupado")
dados2013 <- rename(dados2013, "NaoEstuda_Desocupado" = "NaoEstudaDesocupado")
dados2014 <- rename(dados2014, "NaoEstuda_Desocupado" = "NaoEstudaDesocupado")
dados2015 <- rename(dados2015, "NaoEstuda_Desocupado" = "NaoEstudaDesocupado")

dados2011 <- rename(dados2011, "NaoEstuda_Desocupado..." = "NaoEstudaDesocupado...")
dados2012 <- rename(dados2012, "NaoEstuda_Desocupado..." = "NaoEstudaDesocupado...")
dados2013 <- rename(dados2013, "NaoEstuda_Desocupado..." = "NaoEstudaDesocupado...")
dados2014 <- rename(dados2014, "NaoEstuda_Desocupado..." = "NaoEstudaDesocupado...")
dados2015 <- rename(dados2015, "NaoEstuda_Desocupado..." = "NaoEstudaDesocupado...")

# Removendo colunas desnecessárias dos dataframes de 2011 a 2015:
# Data <- subset( Data, select = -c(d, b ) )
dados2011 <- subset(dados2011, select = -c(EstudaNaoAtivo,
                                           EstudaNaoAtivo...,
                                           NaoEstudaNaoAtivo,
                                           NaoEstudaNaoAtivo...))

dados2012 <- subset(dados2012, select = -c(EstudaNaoAtivo,
                                           EstudaNaoAtivo...,
                                           NaoEstudaNaoAtivo,
                                           NaoEstudaNaoAtivo...))

dados2013 <- subset(dados2013, select = -c(EstudaNaoAtivo,
                                           EstudaNaoAtivo...,
                                           NaoEstudaNaoAtivo,
                                           NaoEstudaNaoAtivo...))

dados2014 <- subset(dados2014, select = -c(EstudaNaoAtivo,
                                           EstudaNaoAtivo...,
                                           NaoEstudaNaoAtivo,
                                           NaoEstudaNaoAtivo...))

dados2015 <- subset(dados2015, select = -c(EstudaNaoAtivo,
                                           EstudaNaoAtivo...,
                                           NaoEstudaNaoAtivo,
                                           NaoEstudaNaoAtivo...))


# Conferindo as mudanças realizadas com relação as colunas somadas e
# renomadas:

ncol(dados2011)
ncol(dados2016)

names(dados2011)
names(dados2016)

# Juntando todos os dataframes:

dados_finais <- bind_rows(dados2011, dados2012, dados2013,
                          dados2014, dados2015, dados2016,
                          dados2017, dados2018, dados2019)


# Listando as informações do data_frame dados_finais:

# Conferindo a classe do dataframe dados_finais, sendo esperado
# um data.frame:
class(dados_finais)

# Número de colunas:
ncol(dados_finais)

# Nome da colunas
names(dados_finais)

# Convertendo colunas em percentual

dados_finais$Estuda_Ocupado...<-percent(dados_finais$Estuda_Ocupado..., 
                                        digits = 2L)
dados_finais$Estuda_Desocupado...<-percent(dados_finais$Estuda_Desocupado..., 
                                           digits = 2L)
dados_finais$NaoEstuda_Ocupado...<-percent(dados_finais$NaoEstuda_Ocupado..., 
                                           digits = 2L)
dados_finais$NaoEstuda_Desocupado...<-percent(dados_finais$NaoEstuda_Desocupado..., 
                                              digits = 2L)

# Exibindo o cabeçalhos e primeiras linhas do dataframe:
head(dados_finais)

# Exibindo um resumo do dataframe:
summary(dados_finais)


ggplot(dados_finais, aes(x = Ano, y = NaoEstuda_Desocupado)) +
  geom_col(aes(fill = Ano))

ggplot(dados_finais, aes(x = Ano, y = NaoEstuda_Desocupado)) +
  geom_bar(stat = "identity")


ggplot(dados_finais, aes(x = Ano, y = NaoEstuda_Desocupado)) +
  geom_col()
