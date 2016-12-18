/*
-- =========================================================================== A
Activité : IGE487
Trimestre : Automne 2015
Composant : ige487_req.sql
Encodage : UTF-8
Plateforme : Oracle
Responsable : Luc.Lavoie@USherbrooke.ca
Version : 1.1
Statut : en vigueur
-- =========================================================================== A
*/

/*
-- =========================================================================== B
Requêtes temporelles mettant en évidence la couverture et la qualité 
des schémas
-- =========================================================================== B
*/


/* Requête permettant de trouver le nombre de changement historique sur le prenom des employes
*/
SELECT employe_since.no_employe, Coalesce(t.nbChangement, 0) AS nbChangement 
FROM employe_since 
LEFT JOIN (	SELECT no_employe, count(no_employe) as nbChangement 
			FROM employe_prenom_during 
			GROUP BY no_employe) t 
ON employe_since.no_employe = t.no_employe;

RESULTS :
/*NO_EMPLOYE, nbChangement*/
11	1
10	2
5	0
8	0
3	0
1	0
2	0
6	0
7	0
4	0
9	0

/*
+++++++++++++++++++++++++++++++++++++++++++++++++++
*/

/* Requête permettant de trouver le nombre d'ordonnances ayant été attribuées à un patient
*/
SELECT dossier_patient_since.no_dossier, Coalesce(t.nbOrdonnance, 0) AS nbOrdonnance 
FROM dossier_patient_since 
LEFT JOIN (	SELECT no_dossier, count(no_ordonnance) as nbOrdonnance 
			FROM ordonnance_dossier_during 
			GROUP BY no_dossier) t 
ON dossier_patient_since.no_dossier = t.no_dossier;

RESULTS :
/*NO_DOSSIER, nbOrdonnance*/
1 2

/* Requête permettant d'afficher les patients ayant changer de numero d'assurance maladie
*/
SELECT nom,prenom FROM Dossier_patient_since s, Dossier_patient_nam_during nam, Dossier_patient_during d
WHERE s.NO_DOSSIER = d.NO_DOSSIER AND s.NO_DOSSIER = nam.NO_DOSSIER AND s.NAM_SINCE < CURRENT_DATE

RESULTS :
martial	anthony

/*
-- =========================================================================== Z
Contributeurs :
(MBB) Mamadou.Bobo.Bah@USherbrooke.ca    (matricule 15 130 742)
(SK)  Soumia.Kherbache@USherbrooke.ca    (matricule 14 181 440)
(JA)  Julien.Aspirot@USherbrooke.ca      (matricule 15 146 398)
(PMA) Pierre-Marie.Airiau@USherbrooke.ca (matricule 15 138 398)

-- -----------------------------------------------------------------------------
-- fin de ige487_req.sql
-- =========================================================================== Z
*/