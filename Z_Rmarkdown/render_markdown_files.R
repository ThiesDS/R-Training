rmarkdown::render('Z_Rmarkdown/B0_Erste_Schritte.Rmd', output_file = '../B0_Erste_Schritte.pdf')
rmarkdown::render('Z_Rmarkdown/B1_Daten_einlesen.Rmd', output_file = '../B1_Daten_einlesen.pdf')
rmarkdown::render('Z_Rmarkdown/B2_Daten_aufbereiten.Rmd', output_file = '../B2_Daten_aufbereiten.pdf')
rmarkdown::render('Z_Rmarkdown/B3_Daten_explorieren.Rmd', output_file = '../B3_Daten_explorieren.pdf')
rmarkdown::render('Z_Rmarkdown/B4_Daten_modellieren.Rmd', output_file = '../B4_Daten_modellieren.pdf')

# Clean all unnecessary files after compiling
rules <- c('.log', '.vrb', '.nav', '.snm', '.toc', 
           '-tikzDictionary', '.tex', '.synctex.gz')
file.remove(list.files(pattern = paste0('\\',rules ,'$', collapse = '|')))


