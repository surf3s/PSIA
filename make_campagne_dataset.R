library(Morpho)

campagne_data_path = 'O:\\Research Projects\\Lithics\\Igor_scanning_GM_project\\Complete Dataset\\lms_and_independent_data'
f = paste(campagne_data_path, 'lms_2019.txt', sep = '\\')
landmarks = vecx(read.table(file = f, header = TRUE, sep="\t"), revert = TRUE, lmdim = 3)

f = paste(campagne_data_path, 'independent_2019.txt', sep = '\\')
attributes = read.table(f, stringsAsFactors = FALSE)

# (ventral face towards me)
# 1 - POP
# 2 - Left PW
# 3 - Right PW
# 4 - 8 - Exterior platform edge
# 9 - Right midpoint between POP and right PW
# 10 - Left midpoint between POP and left PW
# 11:39 - Edge
# 40:62 - Platform
# 63:248 - Interior surface
# 249:431 - Exterior surface

landmarks = landmarks[c(1,2,3,6),,]
saveRDS(landmarks, 'campagne_landmarks.RDS')

attributes = attributes$Technique
saveRDS(attributes, 'campagne_attributes.RDS')

