library(magrittr)
library(dplyr)

# Make the datasets used in the PSIA paper
beveldata = readRDS('data/dibble exp data full.RDS') %>%
  filter(dataclass == 'complete') %>%
  filter(EPA != 76) %>%
  filter(PD < 11) %>%
  filter(!is.na(EPA) & !is.na(WEIGHT) & !is.na(PD) & !is.na(PW)) %>%
  filter(HAMMER == 'STEEL') %>%
  filter(CORETYPE == 'SEMISPHERICAL') %>%
  filter(FORCETYPE != 'ON-EDGE') %>%
  select(ID, WEIGHT, PD, PW, AOB, EPA, LENGTH, WIDTH, THICK, BEVEL)

beveldata$Beveling = 'None'
beveldata$Beveling[beveldata$BEVEL=='GRINDER' | beveldata$BEVEL=='SANDER'] = 'Beveled'

expdata = beveldata %>%
  filter(BEVEL == 'NONE')

saveRDS(beveldata, 'data/Dibble_flakes_including_bevel.RDS')
saveRDS(expdata, 'data/Dibble_flakes_no_bevel.RDS')


psia_marcel = read.csv('data\\PSIA_Marcel_data.csv')
names(psia_marcel) = c('ID','PSIA_GONIOMETER','Notes')

saveRDS(psia_marcel %>% select(PSIA_GONIOMETER), 'data/MPI_flakes.RDS')


# The remeasure Dibble flakes dataset
measures = read.csv('data/psia_actual_measures.csv')
names(measures)[1] = c('ID')
names(measures)[2] = c('PSIA_GONIOMETER')
measures = measures %>% select(-COMMENTS)

#infered_measures = read.csv('data/psia_dibble_flakes.csv')

#psia_data = merge(measures, infered_measures, by = c('ID'))

saveRDS(measures, 'data/Dibble_flakes_remeasurements.RDS')
