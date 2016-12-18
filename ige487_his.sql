/*
-- =========================================================================== A
Activité : IGE487
Trimestre : Automne 2015
Composant : ige487_his.sql
Encodage : UTF-8
Plateforme : Oracle
Responsable : Luc.Lavoie@USherbrooke.ca
Version : 1.1
Statut : en vigueur
-- =========================================================================== A
*/

/*
-- =========================================================================== B
Ajout de tuples historiques dans l’entrepôt (qui permettront d’illustrer les requêtes du fichier ige487_req.sql)
-- =========================================================================== B
*/

--Tuples pour la requête sur le nombre de changement de prenom
INSERT INTO "BDT"."EMPLOYE_PRENOM_DURING" (NO_EMPLOYE, PRENOM_DEBUT, PRENOM_FIN, PRENOM) VALUES ('10', TO_DATE('2015-12-19 02:38:46', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-12-20 02:38:51', 'YYYY-MM-DD HH24:MI:SS'), 'Jean');
INSERT INTO "BDT"."EMPLOYE_PRENOM_DURING" (NO_EMPLOYE, PRENOM_DEBUT, PRENOM_FIN, PRENOM) VALUES ('10', TO_DATE('2015-12-20 03:36:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-12-18 03:36:24', 'YYYY-MM-DD HH24:MI:SS'), 'Raymond');
INSERT INTO "BDT"."EMPLOYE_PRENOM_DURING" (NO_EMPLOYE, PRENOM_DEBUT, PRENOM_FIN, PRENOM) VALUES ('11', TO_DATE('2015-12-08 03:36:37', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2015-12-10 03:36:41', 'YYYY-MM-DD HH24:MI:SS'), 'Luc');

--Tuples pour la requete sur le nombre d'ordonnance par dossier
INSERT INTO ORDONNANCE_DURING VALUES (920, '11-NOV-15', '15-NOV-15');
INSERT INTO ORDONNANCE_DURING VALUES (1020, '11-DEC-15', '15-DEC-15');

INSERT INTO ORDONNANCE_DOSSIER_DURING VALUES (920, 1, '11-NOV-15', '15-NOV-15');
INSERT INTO ORDONNANCE_DOSSIER_DURING VALUES (1020, 1, '11-DEC-15', '15-DEC-15');

/* Trigger permettant d'insérer automatiquement dans la table NAM during une fois qu'on modifie le NAM la table since */
CREATE OR REPLACE TRIGGER INSERT_Dos_patient_nam_during AFTER UPDATE OF nam ON Dossier_patient_since
FOR EACH ROW 
BEGIN	
	INSERT INTO Dossier_patient_nam_during VALUES (OLD.NO_DOSSIER, OLD.nam, OLD.NAM_SINCE, CURRENT_DATE);
	UPDATE Dossier_patient_since SET NAM_SINCE = CURRENT_DATE WHERE NO_DOSSIER = OLD.NO_DOSSIER;
END;
/

/*
-- =========================================================================== Z
Contributeurs :
(MBB) Mamadou.Bobo.Bah@USherbrooke.ca    (matricule 15 130 742)
(SK)  Soumia.Kherbache@USherbrooke.ca    (matricule 14 181 440)
(JA)  Julien.Aspirot@USherbrooke.ca      (matricule 15 146 398)
(PMA) Pierre-Marie.Airiau@USherbrooke.ca (matricule 15 138 398)

-- -----------------------------------------------------------------------------
-- fin de ige487_his.sql
-- =========================================================================== Z
*/