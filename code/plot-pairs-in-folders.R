theCols <- c('pobl_tot', 'nacimientos', 'prestadores', 'ipm_hacinam_p', 'ipm_templeof_p', 'pib_percapita', 'gpc', 'gini', 'ipm_analf_p', 'minorias', 'parques', 'religioso', 'estado', 'otras')

for (main_column in theCols) {
    dir.create( str_c( 'figures/', main_column ) )
    for (column in theCols[theCols != main_column]) {
        png( str_c( 'figures/', main_column, '/', column, '.png' ) ) # png ~ dev.on
        plot ( jitter( colombia[, main_column] )
             , jitter( colombia[, column]      )
               # jitter prevents clouds from looking like points
             , xlab = main_column, ylab = column
             , pch = 19, cex = .5, col = 'blue'
             )
        dev.off()
    }
}
