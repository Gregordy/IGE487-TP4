/*
-- =========================================================================== A
Activité : IGE487
Trimestre : Automne 2015
Composant : ige487_alim.sql
Encodage : UTF-8
Plateforme : Oracle
Responsable : Luc.Lavoie@USherbrooke.ca
Version : 3.4
Statut : en vigueur
-- =========================================================================== A
*/

/*
-- =========================================================================== B
Alimentation initiale de la base de données temporalisée à partir de la base 
de données transactionnelle.

Note:
A n'appliquer que si le schéma a déjà été crée
-- =========================================================================== B
*/

SET SERVEROUTPUT ON; 

/* Nous allons d'abord créer un lien vers la base de données transactionnelle (BDT) pour pouvoir 
 * l'interroger et ainsi remplir notre entrepôt
*/
CREATE PUBLIC DATABASE LINK entrepot_bd
CONNECT TO system IDENTIFIED BY Wd44op88$29
USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=10.44.88.229)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=orcl)))';

/* Procédure permettant d'insérer dans la dimension Employe@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_EMPLOYE_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO EMPLOYE_SINCE SELECT NO_EMPLOYE,dateValidation,NAS,dateValidation,NOM,dateValidation,PRENOM,dateValidation FROM EMPLOYE@entrepot_bd;
	    dbms_output.put_line('insert into employe_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_EMPLOYE_SINCE(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Dossier_patient_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Dossier_patient_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Dossier_patient_since 
  SELECT NO_DOSSIER,dateValidation,NOM,dateValidation,PRENOM,dateValidation,NOM_MERE,dateValidation,PRENOM_MERE,dateValidation,NAM,dateValidation,DATE_DE_NAISSANCE,dateValidation
  FROM DOSSIER_PATIENT@entrepot_bd;

  dbms_output.put_line('insert into Dossier_patient_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Dossier_patient_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table DOSSIER_PATIENT de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Dossier_patient_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Unite_de_soin_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Unite_de_soin_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Unite_de_soin_since 
  SELECT NO_UNITE,dateValidation,NOM_UNITE,dateValidation,ETAGE,dateValidation
  FROM Unite_de_soin@entrepot_bd;

  dbms_output.put_line('insert into Unite_de_soin_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Unite_de_soin_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Unite_de_soin de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Unite_de_soin_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Chambre_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Chambre_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Chambre_since 
  SELECT NO_CHAMBRE,dateValidation,NO_UNITE,dateValidation
  FROM Chambre@entrepot_bd;

  dbms_output.put_line('insert into Chambre_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Chambre_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Chambre de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Chambre_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Lit_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Lit_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Lit_since 
  SELECT NO_LIT,dateValidation,NO_CHAMBRE,dateValidation
  FROM Lit@entrepot_bd;

  dbms_output.put_line('insert into Lit_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Lit_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Lit de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Lit_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Sejour_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Sejour_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Sejour_since 
  SELECT NO_SEJOUR,dateValidation,NO_DOSSIER,dateValidation,NO_UNITE,dateValidation,DATE_ARRIVEE,dateValidation,DATE_DEPART,dateValidation
  FROM Sejour@entrepot_bd;

  dbms_output.put_line('insert into Sejour_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Sejour_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Sejour de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Sejour_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Occupation_des_lits_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_occupation_lits_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Occupation_des_lits_since 
  SELECT NO_SEJOUR,NO_LIT,dateValidation
  FROM Occupation_des_lits@entrepot_bd;

  dbms_output.put_line('insert into Occupation_des_lits_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Occupation_des_lits_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Occupation_des_lits de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_occupation_lits_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la table Medecin_traitant_since, les données correspondantes 
 * dans la base de données transactionnelle avec en paramètre la date de validation
 */
CREATE OR REPLACE PROCEDURE Insert_Medecin_traitant_since(dateValidation DATE) AS
BEGIN
  -- On insère les données correspondantes
  INSERT INTO Medecin_traitant_since 
  SELECT NO_SEJOUR,NO_EMPLOYE,dateValidation,D_DEBUT,dateValidation,D_FIN,dateValidation
  FROM Medecin_traitant@entrepot_bd;

  dbms_output.put_line('insert into Medecin_traitant_since done.');   
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    dbms_output.put_line('Cette clé primaire existe déjà dans la table Medecin_traitant_since');
  WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('La table Medecin_traitant de la base de données transactionnelle est vide');
  WHEN OTHERS THEN
    dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute Insert_Medecin_traitant_since(CURRENT_DATE);


/* Procédure permettant d'insérer dans la dimension Specialite@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_SPECIALITE_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO SPECIALITE_SINCE SELECT NO_ROLE,NO_EMPLOYE,dateValidation FROM SPECIALITE@entrepot_bd;
	    dbms_output.put_line('insert into specialite_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_SPECIALITE_SINCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension PLAGE_HORAIRE@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_PLAGE_HORAIRE_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO PLAGE_HORAIRE_SINCE SELECT DATE_JOUR,QUART_DE_TRAVAIL,dateValidation FROM PLAGE_HORAIRE@entrepot_bd;
	    dbms_output.put_line('insert into specialite_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_PLAGE_HORAIRE_SINCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension AFFECTATION@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_AFFECTATION_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO AFFECTATION_SINCE SELECT NO_UNITE,NO_EMPLOYE,DATE_JOUR,QUART_DE_TRAVAIL,dateValidation FROM AFFECTATION@entrepot_bd;
	    dbms_output.put_line('insert into specialite_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_AFFECTATION_SINCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Role@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_ROLE_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO ROLE_SINCE SELECT NO_ROLE,dateValidation,NOM_ROLE,dateValidation FROM ROLE@entrepot_bd;
	    dbms_output.put_line('insert into role_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_ROLE_SINCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Habilitation@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
CREATE OR REPLACE PROCEDURE INSERT_HABILITATION_SINCE(dateValidation DATE) AS	
BEGIN
	-- On insère les données correspondantes
	    INSERT INTO HABILITATION_SINCE SELECT NO_ROLE,NO_VOIE_ADMINISTRATION,dateValidation FROM HABILITATION@entrepot_bd;
	    dbms_output.put_line('insert into habilitation_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END;
/

/* On exécute la procédure pour insérer les données
 */
execute INSERT_HABILITATION_SINCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Medicament@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_MEDICAMENT(dateValidation DATE) AS 
BEGIN
  	-- On insère les données correspondantes
	    INSERT INTO MEDICAMENT_SINCE SELECT DIN,dateValidation FROM MEDICAMENT@entrepot_bd;
	    dbms_output.put_line('insert into medicament_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_MEDICAMENT;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_MEDICAMENT(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Voie administration@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_VOIE_ADMIN(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO VOIE_ADMINISTRATION_SINCE SELECT NO_VOIE_ADMINISTRATION,dateValidation,NOM_VOIE,dateValidation FROM VOIE_ADMINISTRATION@entrepot_bd;
	    dbms_output.put_line('insert into voie_administration_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_VOIE_ADMIN;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_VOIE_ADMIN(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Voie administration Medicaments@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_VOIE_ADMIN_MED(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO VOIE_ADMIN_MED_SINCE SELECT DIN, NO_VOIE_ADMINISTRATION,dateValidation FROM VOIE_ADM_MEDICAMENT@entrepot_bd;
	    dbms_output.put_line('insert into voie_admin_med_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_VOIE_ADMIN_MED;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_VOIE_ADMIN_MED(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Voie administration Medicaments@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_VOIE_ADMIN_MED(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO VOIE_ADMIN_MED_SINCE SELECT DIN, NO_VOIE_ADMINISTRATION,dateValidation FROM VOIE_ADM_MEDICAMENT@entrepot_bd;
	    dbms_output.put_line('insert into voie_admin_med_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_VOIE_ADMIN_MED;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_VOIE_ADMIN_MED(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Ordonnance@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_ORDONNANCE(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO ORDONNANCE_SINCE SELECT NO_ORDONNANCE,dateValidation,NO_DOSSIER,dateValidation, NO_EMPLOYE,dateValidation FROM ORDONNANCE@entrepot_bd;
	    dbms_output.put_line('insert into ordonnance_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_ORDONNANCE;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_ORDONNANCE(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Prescription@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_PRESCRIPTION(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO PRESCRIPTION_SINCE SELECT NO_PRESCRIPTION,dateValidation,NO_ORDONNANCE,dateValidation, DIN,dateValidation ,FREQUENCE,dateValidation, DOSAGE,dateValidation FROM PRESCRIPTION@entrepot_bd;
	    dbms_output.put_line('insert into prescription_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_PRESCRIPTION;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_PRESCRIPTION(CURRENT_DATE);

/* Procédure permettant d'insérer dans la dimension Affectation Prescription@VS, les données correspondantes 
 * dans la base de données transactionnelle
 */
 
create or replace PROCEDURE INSERT_AFFECT_PRESCRIPT(dateValidation DATE) AS 
BEGIN
  -- On insère les données correspondantes
	    INSERT INTO AFFECTATION_PRESC_SINCE SELECT NO_PRESCRIPTION, DATE_JOUR, QUART_DE_TRAVAIL, NO_EMPLOYE, dateValidation FROM AFFECTATION_PRESCRIPTION@entrepot_bd;
	    dbms_output.put_line('insert into affectation_presc_since done.'); 	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('La requete a renvoye une ligne vide');
	WHEN OTHERS THEN
		dbms_output.put_line(TO_CHAR(SQLCODE) || '->' || SQLERRM);
END INSERT_AFFECT_PRESCRIPT;

/* On exécute la procédure pour insérer les données
 */
execute INSERT_AFFECT_PRESCRIPT(CURRENT_DATE);

commit;

/*
-- =========================================================================== Z
Contributeurs :
(MBB) Mamadou.Bobo.Bah@USherbrooke.ca    (matricule 15 130 742)
(SK)  Soumia.Kherbache@USherbrooke.ca    (matricule 14 181 440)
(JA)  Julien.Aspirot@USherbrooke.ca 	 (matricule 15 146 398)
(PMA) Pierre-Marie.Airiau@USherbrooke.ca (matricule 15 138 398)

-- -----------------------------------------------------------------------------
-- fin de ige487_alim.sql
-- =========================================================================== Z
*/