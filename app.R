# importamos datos
cv_vacuna = read.csv("https://github.com/owid/covid-19-data/blob/master/public/data/vaccinations/vaccinations.csv")
cv_tipos = read.csv("https://github.com/owid/covid-19-data/blob/master/public/data/vaccinations/vaccinations-by-manufacturer.csv")

head(cv_tipos)

# rellenamos datos faltantes
for(i in 1:ncol(cv_vacuna))
  for (j in 1:nrow(cv_vacuna))
    if (is.null(cv_vacuna[i,j]) & (j=0)) {
      cv_vacuna[i,j]=0
    }
    if (is.null(cv_vacuna[i,j]) & j!=0) {
      cv_vacuna[i,j]=cv_vacuna[i,j-1]
    }