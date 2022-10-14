# ID SCRIPT -----------------------------------------------------
## LEGUAJES DE PROGRAMACION ESTADISTICA
## PROFESOR : CHRISTIAN SUCUZHANAY AREVALO
## ALUMNO : PABLO RIBAS BORREGO, EXP 22041278
## EXAMEN LPE01

# APARTADO 1 ----------------------------------------------------
## Abra R estudio y desde el terminal integrado de la suite, crea
## un directorio en la raíz de su equipo con el nombre lepnumexp,
## entra en la carpeta y setealo como “working directory”. 2 punto
##
## Por Terminal:
## cd .. -> Hasta llegar a root (~)
## mkdir lep22041278
## cd lep22041278
## setwd("C:/Users/pablo/lep22041278") -> Por Consola

# APARTADO 2 ------------------------------------------------------
## Desde la Api de Kaggle ( terminal de Rstudio) lista todos los datasets
## que existan en el mismo utilizando la palabra clave “España”. Si exp PAR.
## Descarga “Catastro”. 2puntos
##
## Por Terminal:
## kaggle d list -s "España"
## kaggle d download -d "datamarket/catastro"
## unzip catastro

# APARTADO 3 -------------------------------------------------------
## Convierte este directorio en un repositorio git y enalazalo con el
## repositorio remoto que crearas en tu cuenta de GitHub con el nombre:
## lepnumexp. 2 puntos
##
## Por Terminal:
## git init
## git add .
## git status
## git commit -m "Initial commit"
## git remote add origin https://github.com/AWDn0n/lep22041278.git
## git push -u origin main

# APARTADO 4 --------------------------------------------------------
## Importa, limpia los nombre para que no haya acentos, espacios en blanco
## ni mayúsculas, obtén la configuración de tu IDE actual y además cambiala
## para que el punto(.) sea el separador de miles. 2 puntos
## 
## Por Consola:
## install.packages (c("tidyverse","httr","janitor"))
## library(tidyverse)
## library(httr)
## library(janitor)
## catastro <- read_csv("C:/Users/pablo/lep22041278/catastro-sample.csv")
## catastro %>% janitor::clean_names() %>% glimpse()
## locale() -> Para ver la configuración del IDE
## catastro_clean <- catastro %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ",", grouping_mark = "."))

# APARTADO 5 ---------------------------------------------------------
## Añade una nueva columna llamada : conforme a lo que te indique el profesor
## Muestra en un tabla el área promedio de los pisos por CCAA.
##
## Nombre de la nueva columna: piso_turistico
## Solo serán pisos turísticos los bajos (pisos "00")
##
## Por Consola:
## catastro_final <- catastro_clean %>% mutate(piso_turistico = floor %in% "00")
## catastro_final %>% select(area, autonomous_region) %>% drop_na() %>% group_by(autonomous_region) %>% summarise(mean(area)) %>% view()
## write.csv(catastro_final,"C:/Users/pablo/lep22041278/catastro_final_22041278.csv", row.names = FALSE)
