data_exercice <- read.table("elus-conseillers-municipaux-cm.csv",
                            header = TRUE,
                            sep = ";",
                            fill = TRUE,
                            quote = "")


df_Nantes <- data_exercice[data_exercice$Libellé.de.la.commune == "Nantes",]
df_Faverelles <- data_exercice[data_exercice$Libellé.de.la.commune== "Faverelles",]
df_Loire_Atlantique <- data_exercice[data_exercice$Libellé.du.département== 'Loire-Atlantique',]
df_Gers <- data_exercice[data_exercice$Libellé.du.département== 'Gers',]



#' Jeu de données des élus de la commune de Nantes
#'
#' Ce dataset contient les informations sur les élus de la ville de Nantes contenant par exemple leur nom, prénom, date de naissance, catégorie socio-professionnelle, etc.
#'
#'
#' @format Un data.frame avec 66 lignes et 16 colonnes :
#' \describe{
#'   \item{Code.du.département}{Code du département selon la nomenclature officielle.}
#'   \item{Libellé.du.département}{Nom du département}
#'   \item{Code.de.la.collectivité.à.statut.particulier}{Code de la collectivité territoriale à statut particulier.}
#'   \item{Libellé.de.la.collectivité.à.statut.particulier}{Nom de la collectivité territoriale à statut particulier.}
#'   \item{Code.de.la.commune}{Code officiel de la commune}
#'   \item{Libellé.de.la.commune}{Nom de la commune}
#'   \item{Nom.de.l.élu}{Nom de l’élu}
#'   \item{Prénom.de.l.élu}{Prénom de l’élu}
#'   \item{Code.sexe}{Code indiquant le sexe de l’élu}
#'   \item{Date.de.naissance}{Date de naissance de l’élu}
#'   \item{Code.de.la.catégorie.socio.professionnelle}{Code représentant la catégorie socio-professionnelle de l’élu}
#'   \item{Libellé.de.la.catégorie.socio.professionnelle}{Description de la catégorie socio-professionnelle}
#'   \item{Date.de.début.du.mandat}{Date de début du mandat de l’élu}
#'   \item{Libellé.de.la.fonction}{Fonction occupée par l’élu}
#'   \item{Date.de.début.de.la.fonction}{Date de prise de fonction de l’élu}
#'   \item{Code.nationalité}{Code indiquant la nationalité de l’élu}
#' }
#' @source Données récupérées depuis le site data.gouv [https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a]
"df_Nantes"




#' Jeu de données des élus de la commune de Faverelles
#'
#' Ce dataset contient les informations sur les élus de la commune de Faverelles contenant par exemple leur nom, prénom, date de naissance, catégorie socio-professionnelle, etc.
#'
#'
#' @format Un data.frame avec 10 lignes et 16 colonnes :
#' \describe{
#'   \item{Code.du.département}{Code du département selon la nomenclature officielle.}
#'   \item{Libellé.du.département}{Nom du département}
#'   \item{Code.de.la.collectivité.à.statut.particulier}{Code de la collectivité territoriale à statut particulier.}
#'   \item{Libellé.de.la.collectivité.à.statut.particulier}{Nom de la collectivité territoriale à statut particulier.}
#'   \item{Code.de.la.commune}{Code officiel de la commune}
#'   \item{Libellé.de.la.commune}{Nom de la commune}
#'   \item{Nom.de.l.élu}{Nom de l’élu}
#'   \item{Prénom.de.l.élu}{Prénom de l’élu}
#'   \item{Code.sexe}{Code indiquant le sexe de l’élu}
#'   \item{Date.de.naissance}{Date de naissance de l’élu}
#'   \item{Code.de.la.catégorie.socio.professionnelle}{Code représentant la catégorie socio-professionnelle de l’élu}
#'   \item{Libellé.de.la.catégorie.socio.professionnelle}{Description de la catégorie socio-professionnelle}
#'   \item{Date.de.début.du.mandat}{Date de début du mandat de l’élu}
#'   \item{Libellé.de.la.fonction}{Fonction occupée par l’élu}
#'   \item{Date.de.début.de.la.fonction}{Date de prise de fonction de l’élu}
#'   \item{Code.nationalité}{Code indiquant la nationalité de l’élu}
#' }
#' @source Données récupérées depuis le site data.gouv [https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a]
"df_Faverelles"




#' Jeu de données des élus du département de Loire Atlantique
#'
#' Ce dataset contient les informations sur les élus du département de Loire Atlantique, contenant par exemple leur nom, prénom, date de naissance, catégorie socio-professionnelle, etc.
#'
#'
#' @format Un data.frame avec 4791 lignes et 16 colonnes :
#' \describe{
#'   \item{Code.du.département}{Code du département selon la nomenclature officielle.}
#'   \item{Libellé.du.département}{Nom du département}
#'   \item{Code.de.la.collectivité.à.statut.particulier}{Code de la collectivité territoriale à statut particulier.}
#'   \item{Libellé.de.la.collectivité.à.statut.particulier}{Nom de la collectivité territoriale à statut particulier.}
#'   \item{Code.de.la.commune}{Code officiel de la commune}
#'   \item{Libellé.de.la.commune}{Nom de la commune}
#'   \item{Nom.de.l.élu}{Nom de l’élu}
#'   \item{Prénom.de.l.élu}{Prénom de l’élu}
#'   \item{Code.sexe}{Code indiquant le sexe de l’élu}
#'   \item{Date.de.naissance}{Date de naissance de l’élu}
#'   \item{Code.de.la.catégorie.socio.professionnelle}{Code représentant la catégorie socio-professionnelle de l’élu}
#'   \item{Libellé.de.la.catégorie.socio.professionnelle}{Description de la catégorie socio-professionnelle}
#'   \item{Date.de.début.du.mandat}{Date de début du mandat de l’élu}
#'   \item{Libellé.de.la.fonction}{Fonction occupée par l’élu}
#'   \item{Date.de.début.de.la.fonction}{Date de prise de fonction de l’élu}
#'   \item{Code.nationalité}{Code indiquant la nationalité de l’élu}
#' }
#' @source Données récupérées depuis le site data.gouv [https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a]
"df_Loire_Atlantique"



#' Jeu de données des élus du département du Gers
#'
#' Ce dataset contient les informations sur les élus du département du Gers, contenant par exemple leur nom, prénom, date de naissance, catégorie socio-professionnelle, etc.
#'
#'
#' @format Un data.frame avec 4932 lignes et 16 colonnes :
#' \describe{
#'   \item{Code.du.département}{Code du département selon la nomenclature officielle.}
#'   \item{Libellé.du.département}{Nom du département}
#'   \item{Code.de.la.collectivité.à.statut.particulier}{Code de la collectivité territoriale à statut particulier.}
#'   \item{Libellé.de.la.collectivité.à.statut.particulier}{Nom de la collectivité territoriale à statut particulier.}
#'   \item{Code.de.la.commune}{Code officiel de la commune}
#'   \item{Libellé.de.la.commune}{Nom de la commune}
#'   \item{Nom.de.l.élu}{Nom de l’élu}
#'   \item{Prénom.de.l.élu}{Prénom de l’élu}
#'   \item{Code.sexe}{Code indiquant le sexe de l’élu}
#'   \item{Date.de.naissance}{Date de naissance de l’élu}
#'   \item{Code.de.la.catégorie.socio.professionnelle}{Code représentant la catégorie socio-professionnelle de l’élu}
#'   \item{Libellé.de.la.catégorie.socio.professionnelle}{Description de la catégorie socio-professionnelle}
#'   \item{Date.de.début.du.mandat}{Date de début du mandat de l’élu}
#'   \item{Libellé.de.la.fonction}{Fonction occupée par l’élu}
#'   \item{Date.de.début.de.la.fonction}{Date de prise de fonction de l’élu}
#'   \item{Code.nationalité}{Code indiquant la nationalité de l’élu}
#' }
#' @source Données récupérées depuis le site data.gouv [https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a]
"df_Gers"



