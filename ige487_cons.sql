/*
-- =========================================================================== A
Activité : IGE487
Trimestre : Automne 2015
Composant : ige487_cons.sql
Encodage : UTF-8
Plateforme : Oracle
Responsable : Luc.Lavoie@USherbrooke.ca
Version : 2.0
Statut : en vigueur
-- =========================================================================== A
*/

/*
-- =========================================================================== B
Création des contraintes via des TRIGGERS pour l'entrepot de données transactionnelle.
-- =========================================================================== B
*/

/* 
 * CREATION DES TRIGGERS
*/

/* Trigger de contrainte 1_2 pour la relation EMPLOYE_SINCE [EMPLOYE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_EMPLOYE_SINCE BEFORE INSERT OR UPDATE ON EMPLOYE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe AND EMPLOYE_DURING.NO_EMPLOYE_FIN >= :NEW.NO_EMPLOYE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20401, 'La contrainte 1_2 est non respectée pour EMPLOYE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation ORDONNANCE_SINCE [ORDONNANCE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_ORDONNANCE_SINCE BEFORE INSERT OR UPDATE ON ORDONNANCE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM ORDONNANCE_DURING WHERE ORDONNANCE_DURING.NO_ORDONNANCE = :NEW.no_ordonnance AND ORDONNANCE_DURING.PK_FIN >= :NEW.ORDONNANCE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20401, 'La contrainte 1_2 est non respectée pour ORDONNANCE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation MEDICAMENT_SINCE [MEDICAMENT@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_MEDICAMENT_SINCE BEFORE INSERT OR UPDATE ON MEDICAMENT_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM MEDICAMENT_DURING WHERE MEDICAMENT_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT AND MEDICAMENT_DURING.PK_FIN >= :NEW.MEDICAMENT_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour MEDICAMENT_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation VOIE_ADMINISTRATION_SINCE [VOIE_ADMINISTRATION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_VOIE_ADMINISTRATION_SINCE BEFORE INSERT OR UPDATE ON VOIE_ADMINISTRATION_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.no_VOIE_ADMINISTRATION AND VOIE_ADMINISTRATION_DURING.PK_FIN >= :NEW.NO_VOIE_ADMINISTRATION_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour VOIE_ADMINISTRATION_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation VOIE_ADMIN_MED_SINCE [VOIE_ADMIN_MED@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_VOIE_ADMIN_MED_SINCE BEFORE INSERT OR UPDATE ON VOIE_ADMIN_MED_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM VOIE_ADMIN_MED_DURING WHERE VOIE_ADMIN_MED_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT AND VOIE_ADMIN_MED_DURING.NO_VOIE_ADMINISTRATION = :NEW.NO_VOIE_ADMINISTRATION AND VOIE_ADMIN_MED_DURING.PK_FIN >= :NEW.ADMIN_MED_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour VOIE_ADMIN_MED_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation PRESCRIPTION_SINCE [PRESCRIPTION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESCRIPTION_SINCE BEFORE INSERT OR UPDATE ON PRESCRIPTION_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION AND PRESCRIPTION_DURING.PK_FIN >= :NEW.NO_PRESCRIPTION_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour PRESCRIPTION_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation AFFECTATION_PRESC_SINCE [AFFECTATION_PRESC@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECTATION_PRESC_SINCE BEFORE INSERT OR UPDATE ON AFFECTATION_PRESC_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM AFFECTATION_PRESC_DURING WHERE AFFECTATION_PRESC_DURING.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION AND AFFECTATION_PRESC_DURING.DATE_JOUR = :NEW.DATE_JOUR AND AFFECTATION_PRESC_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL AND AFFECTATION_PRESC_DURING.PK_FIN >= :NEW.ADMIN_MED_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour AFFECTATION_PRESC_SINCE');
	end if;
END;
/


/* Trigger de contrainte 1_2 pour la relation SPECIALITE_SINCE [SPECIALITE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_SPECIALITE_SINCE BEFORE INSERT OR UPDATE ON SPECIALITE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM SPECIALITE_DURING WHERE SPECIALITE_DURING.NO_EMPLOYE = :NEW.no_employe AND SPECIALITE_DURING.NO_ROLE = :NEW.NO_ROLE AND SPECIALITE_DURING.PK_FIN >= :NEW.SPECIALITE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20402, 'La contrainte 1_2 est non respectée pour SPECIALITE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation PLAGE_HORAIRE_SINCE [PLAGE_HORAIRE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_PLAGE_HORAIRE_SINCE BEFORE INSERT OR UPDATE ON PLAGE_HORAIRE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM PLAGE_HORAIRE_DURING WHERE TRUNC(PLAGE_HORAIRE_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL AND PLAGE_HORAIRE_DURING.PLAGE_HORAIRE_FIN >= :NEW.PLAGE_HORAIRE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20403, 'La contrainte 1_2 est non respectée pour PLAGE_HORAIRE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 1_2 pour la relation ROLE_SINCE [ROLE_@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_ROLE_SINCE BEFORE INSERT OR UPDATE ON ROLE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.NO_ROLE AND ROLE_DURING.NO_ROLE_FIN >= :NEW.NO_ROLE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20404, 'La contrainte 1_2 est non respectée pour ROLE_SINCE');
	end if;
END;
/ 

/* Trigger de contrainte 1_2 pour la relation HABILITATION_SINCE [HABILITATION_@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_HABILITATION_SINCE BEFORE INSERT OR UPDATE ON HABILITATION_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM HABILITATION_DURING WHERE HABILITATION_DURING.NO_ROLE = :NEW.NO_ROLE AND HABILITATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.NO_VOIE_ADMINISTRATION AND HABILITATION_DURING.PK_FIN >= :NEW.HABILITATION_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20405, 'La contrainte 1_2 est non respectée pour HABILITATION_SINCE');
	end if;
END;
/  

/* Trigger de contrainte 1_2 pour la relation AFFECTATION_SINCE [AFFECTATION_@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECTATION_SINCE BEFORE INSERT OR UPDATE ON AFFECTATION_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM AFFECTATION_DURING WHERE AFFECTATION_DURING.NO_UNITE = :NEW.NO_UNITE
													AND AFFECTATION_DURING.NO_EMPLOYE = :NEW.NO_EMPLOYE
													AND TRUNC(AFFECTATION_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) 
													AND AFFECTATION_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL													
													AND AFFECTATION_DURING.PK_FIN >= :NEW.AFFECTATION_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20406, 'La contrainte 1_2 est non respectée pour AFFECTATION_SINCE');
	end if;
END;
/ 

/* Trigger de contrainte 4 + 5 pour la relation EMPLOYE_SINCE [EMPLOYE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_EMPLOYE_SINCE_4_5 BEFORE INSERT OR UPDATE ON EMPLOYE_SINCE
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
	c3 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM EMPLOYE_NAS_DURING WHERE EMPLOYE_NAS_DURING.NO_EMPLOYE = :NEW.no_employe AND EMPLOYE_NAS_DURING.NAS_FIN >= :NEW.NAS_SINCE;
	SELECT COUNT(*) INTO c2 FROM EMPLOYE_NOM_DURING WHERE EMPLOYE_NOM_DURING.NO_EMPLOYE = :NEW.no_employe AND EMPLOYE_NOM_DURING.NOM_FIN >= :NEW.NOM_SINCE;
	SELECT COUNT(*) INTO c3 FROM EMPLOYE_PRENOM_DURING WHERE EMPLOYE_PRENOM_DURING.NO_EMPLOYE = :NEW.no_employe AND EMPLOYE_PRENOM_DURING.PRENOM_FIN >= :NEW.PRENOM_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (c1 > 0)OR(c2 > 0) OR (c3 > 0) then 
		RAISE_APPLICATION_ERROR(-20407, 'La contrainte 4 + 5 est non respectée pour EMPLOYE_SINCE');
	end if;
END;
/  

/* Trigger de contrainte 4 + 5 pour la relation ORDONNANCE_SINCE [ORDONNANCE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_ORDONNANCE_SINCE_4_5 BEFORE INSERT OR UPDATE ON ORDONNANCE_SINCE
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM ORDONNANCE_DOSSIER_DURING WHERE ORDONNANCE_DOSSIER_DURING.NO_DOSSIER = :NEW.no_DOSSIER AND ORDONNANCE_DOSSIER_DURING.NO_DOSSIER_FIN >= :NEW.NO_DOSSIER_SINCE;
	SELECT COUNT(*) INTO c2 FROM ORDONNANCE_EMPLOYE_DURING WHERE ORDONNANCE_EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe AND ORDONNANCE_EMPLOYE_DURING.NO_EMPLOYE_FIN >= :NEW.NO_EMPLOYE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (c1 > 0)OR(c2 > 0) OR (c3 > 0) then 
		RAISE_APPLICATION_ERROR(-20407, 'La contrainte 4 + 5 est non respectée pour ORDONNANCE_SINCE');
	end if;
END;
/  

/* Trigger de contrainte 4 + 5 pour la relation VOIE_ADMINISTRATION_SINCE [VOIE_ADMINISTRATION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_VOIE_ADMINISTRATION_SINCE_4_5 BEFORE INSERT OR UPDATE ON VOIE_ADMINISTRATION_SINCE
FOR EACH ROW 
DECLARE
	c1 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM V_ADMIN_NOM_METHODE_DURING WHERE V_ADMIN_NOM_METHODE_DURING.NOM_METHODE = :NEW.NOM_METHODE AND V_ADMIN_NOM_METHODE_DURING.NOM_METHODE_FIN >= :NEW.NOM_METHODE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (c1 > 0)OR(c2 > 0) OR (c3 > 0) then 
		RAISE_APPLICATION_ERROR(-20407, 'La contrainte 4 + 5 est non respectée pour VOIE_ADMINISTRATION_SINCE');
	end if;
END;
/  

/* Trigger de contrainte 4 + 5 pour la relation PRESCRIPTION_SINCE [PRESCRIPTION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESCRIPTION_SINCE_4_5 BEFORE INSERT OR UPDATE ON PRESCRIPTION_SINCE
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
	c3 NUMBER;
	c4 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM PRESCRIPTION_ORDO_DURING WHERE PRESCRIPTION_ORDO_DURING.NO_ORDONNANCE = :NEW.no_ORDONNANCE AND PRESCRIPTION_ORDO_DURING.NO_ORDONNANCE_FIN >= :NEW.NO_ORDONNANCE_SINCE;
	SELECT COUNT(*) INTO c2 FROM PRESCRIPTION_MED_DURING WHERE PRESCRIPTION_MED_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT AND PRESCRIPTION_MED_DURING.NO_MEDICAMENT_FIN >= :NEW.NO_MEDICAMENT_SINCE;
	SELECT COUNT(*) INTO c2 FROM PRESCRIPTION_FREQ_DURING WHERE PRESCRIPTION_FREQ_DURING.NO_FREQUENCE = :NEW.no_FREQUENCE AND PRESCRIPTION_FREQ_DURING.NO_FREQUENCE_FIN >= :NEW.NO_FREQUENCE_SINCE;
	SELECT COUNT(*) INTO c2 FROM PRESCRIPTION_DOS_DURING WHERE PRESCRIPTION_DOS_DURING.NO_DOSAGE = :NEW.no_DOSAGE AND PRESCRIPTION_DOS_DURING.NO_DOSAGE_FIN >= :NEW.NO_DOSAGE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (c1 > 0)OR(c2 > 0) OR (c3 > 0) then 
		RAISE_APPLICATION_ERROR(-20407, 'La contrainte 4 + 5 est non respectée pour PRESCRIPTION_SINCE');
	end if;
END;
/ 

/* Trigger de contrainte 4 + 5 pour la relation ROLE_SINCE [ROLE_@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_ROLE_SINCE_4_5 BEFORE INSERT OR UPDATE ON ROLE_SINCE
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM ROLE_NOM_DURING WHERE ROLE_NOM_DURING.NO_ROLE = :NEW.NO_ROLE AND ROLE_NOM_DURING.NOM_ROLE_FIN >= :NEW.NOM_ROLE_SINCE;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20408, 'La contrainte 4 + 5 est non respectée pour ROLE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation SPECIALITE_SINCE [SPECIALITE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_SPECIALITE_SINCE_9 BEFORE INSERT OR UPDATE ON SPECIALITE_SINCE
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbRoleSince NUMBER;
	nbRoleDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbRoleSince FROM ROLE_SINCE WHERE ROLE_SINCE.NO_ROLE = :NEW.no_role;	
	SELECT COUNT(*) INTO nbRoleDuring FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.no_role;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ( (nbRoleSince = 0) AND (nbRoleSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20409, 'La contrainte 9 est non respectée pour SPECIALITE_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation SPECIALITE_DURING [SPECIALITE@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_SPECIALITE_DURING_9 BEFORE INSERT OR UPDATE ON SPECIALITE_DURING
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbRoleSince NUMBER;
	nbRoleDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbRoleSince FROM ROLE_SINCE WHERE ROLE_SINCE.NO_ROLE = :NEW.no_role;	
	SELECT COUNT(*) INTO nbRoleDuring FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.no_role;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ( (nbRoleSince = 0) AND (nbRoleSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20410, 'La contrainte 9 est non respectée pour SPECIALITE_DURING');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation HABILITATION_SINCE [HABILITATION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_HABILITATION_SINCE_9 BEFORE INSERT OR UPDATE ON HABILITATION_SINCE
FOR EACH ROW 
DECLARE
	nbVASince NUMBER;
	nbVADuring NUMBER;
	nbRoleSince NUMBER;
	nbRoleDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbVASince FROM VOIE_ADMINISTRATION_SINCE WHERE VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION = :NEW.no_voie_administration;	
	SELECT COUNT(*) INTO nbVADuring FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.no_voie_administration;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbRoleSince FROM ROLE_SINCE WHERE ROLE_SINCE.NO_ROLE = :NEW.no_role;	
	SELECT COUNT(*) INTO nbRoleDuring FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.no_role;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbVASince = 0) AND (nbVADuring = 0)) OR ( (nbRoleSince = 0) AND (nbRoleSince = 0))  then 
	    -- Si la nouvelle clé pour no_voie_administration est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20411, 'La contrainte 9 est non respectée pour HABILITATION_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation HABILITATION_DURING [HABILITATION@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_HABILITATION_DURING_9 BEFORE INSERT OR UPDATE ON HABILITATION_DURING
FOR EACH ROW 
DECLARE
	nbVASince NUMBER;
	nbVADuring NUMBER;
	nbRoleSince NUMBER;
	nbRoleDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbVASince FROM VOIE_ADMINISTRATION_SINCE WHERE VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION = :NEW.no_voie_administration;	
	SELECT COUNT(*) INTO nbVADuring FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.no_voie_administration;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbRoleSince FROM ROLE_SINCE WHERE ROLE_SINCE.NO_ROLE = :NEW.no_role;	
	SELECT COUNT(*) INTO nbRoleDuring FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.no_role;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbVASince = 0) AND (nbVADuring = 0)) OR ( (nbRoleSince = 0) AND (nbRoleSince = 0))  then 
	    -- Si la nouvelle clé pour no_voie_administration est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20412, 'La contrainte 9 est non respectée pour HABILITATION_DURING');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation AFFECTATION_SINCE [AFFECTATION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECTATION_SINCE_9 BEFORE INSERT OR UPDATE ON AFFECTATION_SINCE
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbUniteSince NUMBER;
	nbUniteDuring NUMBER;
	nbPHSince NUMBER;
	nbPHDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbUniteSince FROM UNITE_DE_SOIN_SINCE WHERE UNITE_DE_SOIN_SINCE.NO_UNITE = :NEW.no_unite;	
	SELECT COUNT(*) INTO nbUniteDuring FROM UNITE_DE_SOIN_DURING WHERE UNITE_DE_SOIN_DURING.NO_UNITE = :NEW.no_unite;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPHSince FROM PLAGE_HORAIRE_SINCE WHERE TRUNC(PLAGE_HORAIRE_SINCE.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_SINCE.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;
	SELECT COUNT(*) INTO nbPHDuring FROM PLAGE_HORAIRE_DURING WHERE TRUNC(PLAGE_HORAIRE_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ((nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ((nbUniteSince = 0) AND (nbUniteSince = 0)) OR ((nbPHSince = 0) AND (nbPHSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_unite est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour {no_date_jour,quart_de_travail} est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20413, 'La contrainte 9 est non respectée pour AFFECTATION_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation AFFECTATION_DURING [AFFECTATION@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECTATION_DURING_9 BEFORE INSERT OR UPDATE ON AFFECTATION_DURING
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbUniteSince NUMBER;
	nbUniteDuring NUMBER;
	nbPHSince NUMBER;
	nbPHDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbUniteSince FROM UNITE_DE_SOIN_SINCE WHERE UNITE_DE_SOIN_SINCE.NO_UNITE = :NEW.no_unite;	
	SELECT COUNT(*) INTO nbUniteDuring FROM UNITE_DE_SOIN_DURING WHERE UNITE_DE_SOIN_DURING.NO_UNITE = :NEW.no_unite;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPHSince FROM PLAGE_HORAIRE_SINCE WHERE TRUNC(PLAGE_HORAIRE_SINCE.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_SINCE.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;
	SELECT COUNT(*) INTO nbPHDuring FROM PLAGE_HORAIRE_DURING WHERE TRUNC(PLAGE_HORAIRE_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ((nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ((nbUniteSince = 0) AND (nbUniteSince = 0)) OR ((nbPHSince = 0) AND (nbPHSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_unite est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour {no_date_jour,quart_de_travail} est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20414, 'La contrainte 9 est non respectée pour AFFECTATION_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation ROLE_NOM_DURING [ROLE_NOM@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_ROLE_NOM_DURING_3_6 BEFORE INSERT OR UPDATE ON ROLE_NOM_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM ROLE_DURING WHERE ROLE_DURING.NO_ROLE = :NEW.NO_ROLE AND ROLE_DURING.NO_ROLE_DEBUT <= :NEW.NOM_ROLE_DEBUT AND ROLE_DURING.NO_ROLE_FIN >= :NEW.NOM_ROLE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM ROLE_SINCE WHERE ROLE_SINCE.NO_ROLE = :NEW.NO_ROLE AND ROLE_SINCE.NO_ROLE_SINCE <= :NEW.NOM_ROLE_DEBUT AND ROLE_SINCE.NOM_ROLE_SINCE >= :NEW.NOM_ROLE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20415, 'La contrainte 3_6 est non respectée pour ROLE_NOM_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation EMPLOYE_NAS_DURING [EMPLOYE_NAS@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_EMPLOYE_NAS_DURING_3_6 BEFORE INSERT OR UPDATE ON EMPLOYE_NAS_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_DURING.NO_EMPLOYE_DEBUT <= :NEW.NAS_DEBUT AND EMPLOYE_DURING.NO_EMPLOYE_FIN >= :NEW.NAS_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_SINCE.NO_EMPLOYE_SINCE <= :NEW.NAS_DEBUT AND EMPLOYE_SINCE.NAS_SINCE >= :NEW.NAS_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20416, 'La contrainte 3_6 est non respectée pour EMPLOYE_NAS_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation EMPLOYE_NOM_DURING [EMPLOYE_NOM@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_EMPLOYE_NOM_DURING_3_6 BEFORE INSERT OR UPDATE ON EMPLOYE_NOM_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_DURING.NO_EMPLOYE_DEBUT <= :NEW.NOM_DEBUT AND EMPLOYE_DURING.NO_EMPLOYE_FIN >= :NEW.NOM_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_SINCE.NO_EMPLOYE_SINCE <= :NEW.NOM_DEBUT AND EMPLOYE_SINCE.NOM_SINCE >= :NEW.NOM_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20417, 'La contrainte 3_6 est non respectée pour EMPLOYE_NOM_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation EMPLOYE_PRENOM_DURING [EMPLOYE_PRENOM@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_EMPLOYE_PRENOM_AT_D_3_6 BEFORE INSERT OR UPDATE ON EMPLOYE_PRENOM_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_DURING.NO_EMPLOYE_DEBUT <= :NEW.PRENOM_DEBUT AND EMPLOYE_DURING.NO_EMPLOYE_FIN >= :NEW.PRENOM_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.NO_EMPLOYE AND EMPLOYE_SINCE.NO_EMPLOYE_SINCE <= :NEW.PRENOM_DEBUT AND EMPLOYE_SINCE.PRENOM_SINCE >= :NEW.PRENOM_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour EMPLOYE_PRENOM_DURING');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation VOIE_ADMIN_MED_SINCE [VOIE_ADMIN_MED@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_VOIE_ADMIN_MED_SINCE_9 BEFORE INSERT OR UPDATE ON VOIE_ADMIN_MED_SINCE
FOR EACH ROW 
DECLARE
	nbMedSince NUMBER;
	nbMedDuring NUMBER;
	nbVoieSince NUMBER;
	nbVoieDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbMedSince FROM MEDICAMENT_SINCE WHERE MEDICAMENT_SINCE.NO_MEDICAMENT = :NEW.no_MEDICAMENT;	
	SELECT COUNT(*) INTO nbMedDuring FROM MEDICAMENT_DURING WHERE MEDICAMENT_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbVoieSince FROM VOIE_ADMINISTRATION_SINCE WHERE VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION = :NEW.no_VOIE_ADMINISTRATION;	
	SELECT COUNT(*) INTO nbVoieDuring FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.no_VOIE_ADMINISTRATION;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbMedSince = 0) AND (nbMedDuring = 0)) OR ( (nbVoieSince = 0) AND (nbVoieSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20450, 'La contrainte 9 est non respectée pour MEDICAMENT_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation VOIE_ADMIN_MED_DURING [VOIE_ADMIN_MED@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_VOIE_ADMIN_MED_DURING_9 BEFORE INSERT OR UPDATE ON VOIE_ADMIN_MED_DURING
FOR EACH ROW 
DECLARE
	nbMedSince NUMBER;
	nbMedDuring NUMBER;
	nbVoieSince NUMBER;
	nbVoieDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbMedSince FROM MEDICAMENT_SINCE WHERE MEDICAMENT_SINCE.NO_MEDICAMENT = :NEW.no_MEDICAMENT;	
	SELECT COUNT(*) INTO nbMedDuring FROM MEDICAMENT_DURING WHERE MEDICAMENT_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbVoieSince FROM VOIE_ADMINISTRATION_SINCE WHERE VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION = :NEW.no_VOIE_ADMINISTRATION;	
	SELECT COUNT(*) INTO nbVoieDuring FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.no_VOIE_ADMINISTRATION;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbMedSince = 0) AND (nbMedDuring = 0)) OR ( (nbVoieSince = 0) AND (nbVoieSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20450, 'La contrainte 9 est non respectée pour MEDICAMENT_DURING');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation AFFECTATION_PRESC_SINCE [AFFECTATION_PRESC@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECT_PRESC_SINCE_9 BEFORE INSERT OR UPDATE ON AFFECTATION_PRESC_SINCE
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbPrescSince NUMBER;
	nbPrescDuring NUMBER;
	nbPHSince NUMBER;
	nbPHDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPrescSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION;	
	SELECT COUNT(*) INTO nbPrescDuring FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPHSince FROM PLAGE_HORAIRE_SINCE WHERE TRUNC(PLAGE_HORAIRE_SINCE.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_SINCE.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;
	SELECT COUNT(*) INTO nbPHDuring FROM PLAGE_HORAIRE_DURING WHERE TRUNC(PLAGE_HORAIRE_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ((nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ((nbPrescSince = 0) AND (nbPrescSince = 0)) OR ((nbPHSince = 0) AND (nbPHSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_prescription est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour {no_date_jour,quart_de_travail} est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20413, 'La contrainte 9 est non respectée pour AFFECTATION_PRESC_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation AFFECTATION_PRESC_DURING [AFFECTATION_PRESC@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_AFFECT_PRESC_DURING_9 BEFORE INSERT OR UPDATE ON AFFECTATION_PRESC_DURING
FOR EACH ROW 
DECLARE
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
	nbPrescSince NUMBER;
	nbPrescDuring NUMBER;
	nbPHSince NUMBER;
	nbPHDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPrescSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION;	
	SELECT COUNT(*) INTO nbPrescDuring FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.no_PRESCRIPTION;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbPHSince FROM PLAGE_HORAIRE_SINCE WHERE TRUNC(PLAGE_HORAIRE_SINCE.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_SINCE.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;
	SELECT COUNT(*) INTO nbPHDuring FROM PLAGE_HORAIRE_DURING WHERE TRUNC(PLAGE_HORAIRE_DURING.DATE_JOUR) = TRUNC(:NEW.DATE_JOUR) AND PLAGE_HORAIRE_DURING.QUART_DE_TRAVAIL = :NEW.QUART_DE_TRAVAIL;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ((nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ((nbPrescSince = 0) AND (nbPrescSince = 0)) OR ((nbPHSince = 0) AND (nbPHSince = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_prescription est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour {no_date_jour,quart_de_travail} est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20413, 'La contrainte 9 est non respectée pour AFFECTATION_PRESC_DURING');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation PRESCRIPTION_SINCE [PRESCRIPTION@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESCRIPTION_SINCE_9 BEFORE INSERT OR UPDATE ON PRESCRIPTION_SINCE
FOR EACH ROW 
DECLARE
	nbMedSince NUMBER;
	nbMedDuring NUMBER;
	nbOrdSince NUMBER;
	nbOrdDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbMedSince FROM MEDICAMENT_SINCE WHERE MEDICAMENT_SINCE.NO_MEDICAMENT = :NEW.no_MEDICAMENT;	
	SELECT COUNT(*) INTO nbMedDuring FROM MEDICAMENT_DURING WHERE MEDICAMENT_DURING.NO_MEDICAMENT = :NEW.no_MEDICAMENT;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbOrdSince FROM ORDONNANCE_SINCE WHERE ORDONNANCE_SINCE.NO_ORDONNANCE = :NEW.no_ORDONNANCE;	
	SELECT COUNT(*) INTO nbOrdDuring FROM ORDONNANCE_DURING WHERE ORDONNANCE_DURING.NO_ORDONNANCE = :NEW.no_ORDONNANCE;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbMedSince = 0) AND (nbMedDuring = 0)) OR ( (nbOrdSince = 0) AND (nbOrdSince = 0))  then 
	    -- Si la nouvelle clé pour no_medicament est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_ordonannce est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20450, 'La contrainte 9 est non respectée pour PRESCRIPTION_SINCE');
	end if;
END;
/

/* Trigger de contrainte 9 pour la relation ORDONNANCE_SINCE [ORDONNANCE@VS]*/
CREATE OR REPLACE TRIGGER T_B_I_ORDONNANCE_SINCE_9 BEFORE INSERT OR UPDATE ON ORDONNANCE_SINCE
FOR EACH ROW 
DECLARE
	nbSejourSince NUMBER;
	nbSejourDuring NUMBER;
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbSejourSince FROM DOSSIER_PATIENT_SINCE WHERE DOSSIER_PATIENT_SINCE.NO_DOSSIER = :NEW.no_DOSSIER;	
	SELECT COUNT(*) INTO nbSejourDuring FROM DOSSIER_PATIENT_DURING WHERE DOSSIER_PATIENT_DURING.NO_DOSSIER = :NEW.no_DOSSIER;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/							  
	SELECT COUNT(*) INTO nbEmployeSince FROM EMPLOYE_SINCE WHERE EMPLOYE_SINCE.NO_EMPLOYE = :NEW.no_employe;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM EMPLOYE_DURING WHERE EMPLOYE_DURING.NO_EMPLOYE = :NEW.no_employe;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbSejourSince = 0) AND (nbSejourDuring = 0)) OR ( (nbEmployeSince = 0) AND (nbEmployeDuring = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_séjour est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20450, 'La contrainte 9 est non respectée pour ORDONNANCE_SINCE');
	end if;
END;
/

/*
-- =========================================================================== 
	Trigger de contrainte 1_2
-- =========================================================================== 
*/

/* Relation Dossier_patient_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Dossier_patient_since BEFORE INSERT OR UPDATE ON Dossier_patient_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Dossier_patient_during d WHERE d.NO_DOSSIER = :NEW.NO_DOSSIER AND d.NO_DOSSIER_FIN >= :NEW.NO_DOSSIER_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20001, 'La contrainte 1_2 est non respectée pour Dossier_patient_since');
	end if;
END;
/

/* Relation Unite_de_soin_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Unite_soin_since BEFORE INSERT OR UPDATE ON Unite_de_soin_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Unite_de_soin_during u WHERE u.NO_UNITE = :NEW.NO_UNITE AND u.NO_UNITE_FIN >= :NEW.NO_UNITE_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20002, 'La contrainte 1_2 est non respectée pour Unite_de_soin_since');
	end if;
END;
/

/* Relation Chambre_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Chambre_since BEFORE INSERT OR UPDATE ON Chambre_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Chambre_during c WHERE c.NO_CHAMBRE = :NEW.NO_CHAMBRE AND c.NO_CHAMBRE_FIN >= :NEW.NO_CHAMBRE_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20003, 'La contrainte 1_2 est non respectée pour Chambre_since');
	end if;
END;
/

/* Relation Lit_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Lit_since BEFORE INSERT OR UPDATE ON Lit_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Lit_during l WHERE l.NO_LIT = :NEW.NO_LIT AND l.NO_LIT_FIN >= :NEW.NO_LIT_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20004, 'La contrainte 1_2 est non respectée pour Lit_since');
	end if;
END;
/

/* Relation Sejour_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Sejour_since BEFORE INSERT OR UPDATE ON Sejour_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Sejour_during s WHERE s.NO_SEJOUR = :NEW.NO_SEJOUR AND s.NO_SEJOUR_FIN >= :NEW.NO_SEJOUR_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20005, 'La contrainte 1_2 est non respectée pour Sejour_since');
	end if;
END;
/

/* Relation Occupation_des_lits_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Occupation_lits_since BEFORE INSERT OR UPDATE ON Occupation_des_lits_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Occupation_des_lits_during o WHERE o.NO_SEJOUR = :NEW.NO_SEJOUR AND o.NO_LIT = :NEW.NO_LIT AND o.OCCUPATION_LIT_FIN >= :NEW.OCCUPATION_LIT_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20006, 'La contrainte 1_2 est non respectée pour Occupation_des_lits_since');
	end if;
END;
/

/* Relation Medecin_traitant_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Medecin_traitant_since BEFORE INSERT OR UPDATE ON Medecin_traitant_since
FOR EACH ROW 
DECLARE
	nb NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO nb FROM Medecin_traitant_during m WHERE m.NO_SEJOUR = :NEW.NO_SEJOUR AND m.NO_EMPLOYE = :NEW.NO_EMPLOYE AND m.MEDECIN_TRAITANT_FIN >= :NEW.MEDECIN_TRAITANT_SINCE;
	
	if (nb > 0) then 
		RAISE_APPLICATION_ERROR(-20007, 'La contrainte 1_2 est non respectée pour Medecin_traitant_since');
	end if;
END;
/

/*
-- =========================================================================== 
	Trigger de contrainte 4 + 5
-- =========================================================================== 
*/

/* Relation Dossier_patient_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Dos_patient_since_4_5 BEFORE INSERT OR UPDATE ON Dossier_patient_since
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
	c3 NUMBER;
	c4 NUMBER;
	c5 NUMBER;
	c6 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM Dossier_patient_nom_during n WHERE n.NO_DOSSIER = :NEW.NO_DOSSIER AND n.NOM_FIN >= :NEW.NOM_SINCE;
	SELECT COUNT(*) INTO c2 FROM Dossier_patient_prenom_during p WHERE p.NO_DOSSIER = :NEW.NO_DOSSIER AND p.PRENOM_FIN >= :NEW.PRENOM_SINCE;
	SELECT COUNT(*) INTO c3 FROM Dossier_patient_nomMere_during nm WHERE nm.NO_DOSSIER = :NEW.NO_DOSSIER AND nm.NOM_MERE_FIN >= :NEW.NOM_MERE_SINCE;
	SELECT COUNT(*) INTO c4 FROM Dos_patient_pnomMere_during pm WHERE pm.NO_DOSSIER = :NEW.NO_DOSSIER AND pm.PRENOM_MERE_FIN >= :NEW.PRENOM_MERE_SINCE;
	SELECT COUNT(*) INTO c5 FROM Dossier_patient_nam_during nam WHERE nam.NO_DOSSIER = :NEW.NO_DOSSIER AND nam.NAM_FIN >= :NEW.NAM_SINCE;
	SELECT COUNT(*) INTO c6 FROM Dossier_patient_naiss_during d WHERE d.NO_DOSSIER = :NEW.NO_DOSSIER AND d.DATE_DE_NAISSANCE_FIN >= :NEW.DATE_DE_NAISSANCE_SINCE;
	
	if (c1 > 0) OR (c2 > 0) OR (c3 > 0) OR (c4 > 0) OR (c5 > 0) OR (c6 > 0) then 
		RAISE_APPLICATION_ERROR(-20008, 'La contrainte 4 + 5 est non respectée pour Dossier_patient_since');
	end if;
END;
/ 

/* Relation Unite_de_soin_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Unite_soin_since_4_5 BEFORE INSERT OR UPDATE ON Unite_de_soin_since
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM Unite_de_soin_nom_during n WHERE n.NO_UNITE = :NEW.NO_UNITE AND n.NOM_UNITE_FIN >= :NEW.NOM_UNITE_SINCE;
	SELECT COUNT(*) INTO c2 FROM Unite_de_soin_etage_during e WHERE e.NO_UNITE = :NEW.NO_UNITE AND e.ETAGE_FIN >= :NEW.ETAGE_SINCE;
	
	if (c1 > 0) OR (c2 > 0) then 
		RAISE_APPLICATION_ERROR(-20009, 'La contrainte 4 + 5 est non respectée pour Unite_de_soin_since');
	end if;
END;
/ 

/* Relation Chambre_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Chambre_since_4_5 BEFORE INSERT OR UPDATE ON Chambre_since
FOR EACH ROW 
DECLARE
	c1 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM Chambre_numUnite_during n WHERE n.NO_CHAMBRE = :NEW.NO_CHAMBRE AND n.NO_UNITE_FIN >= :NEW.NO_UNITE_SINCE;
	
	if (c1 > 0) then 
		RAISE_APPLICATION_ERROR(-20010, 'La contrainte 4 + 5 est non respectée pour Chambre_since');
	end if;
END;
/ 

/* Relation Lit_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Lit_since_4_5 BEFORE INSERT OR UPDATE ON Lit_since
FOR EACH ROW 
DECLARE
	c1 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM Lit_numChambre_during n WHERE n.NO_LIT = :NEW.NO_LIT AND n.NO_CHAMBRE_FIN >= :NEW.NO_CHAMBRE_SINCE;
	
	if (c1 > 0) then 
		RAISE_APPLICATION_ERROR(-20011, 'La contrainte 4 + 5 est non respectée pour Lit_since');
	end if;
END;
/

/* Relation Sejour_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Sejour_since_4_5 BEFORE INSERT OR UPDATE ON Sejour_since
FOR EACH ROW 
DECLARE
	c1 NUMBER;
	c2 NUMBER;
	c3 NUMBER;
	c4 NUMBER;
BEGIN	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0							  
	SELECT COUNT(*) INTO c1 FROM Sejour_numDossier_during n WHERE n.NO_SEJOUR = :NEW.NO_SEJOUR AND n.NO_DOSSIER_FIN >= :NEW.NO_DOSSIER_SINCE;
	SELECT COUNT(*) INTO c2 FROM Sejour_numUnite_during nu WHERE nu.NO_SEJOUR = :NEW.NO_SEJOUR AND nu.NO_UNITE_FIN >= :NEW.NO_UNITE_SINCE;
	SELECT COUNT(*) INTO c3 FROM Sejour_arrivee_during a WHERE a.NO_SEJOUR = :NEW.NO_SEJOUR AND a.ARRIVEE_FIN >= :NEW.DATE_ARRIVEE_SINCE;
	SELECT COUNT(*) INTO c4 FROM Sejour_depart_during d WHERE d.NO_SEJOUR = :NEW.NO_SEJOUR AND d.DEPART_FIN >= :NEW.DATE_DEPART_SINCE;

	if (c1 > 0) OR (c2 > 0) OR (c3 > 0) OR (c4 > 0) then 
		RAISE_APPLICATION_ERROR(-20012, 'La contrainte 4 + 5 est non respectée pour Sejour_since');
	end if;
END;
/ 

/*
-- =========================================================================== 
	Trigger de contrainte 3_6
-- =========================================================================== 
*/

/* Relation Unite_de_soin_nom_during */
CREATE OR REPLACE TRIGGER T_B_I_U_Unit_soin_nom_dur_3_6 BEFORE INSERT OR UPDATE ON Unite_de_soin_nom_during
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM Unite_de_soin_during u WHERE u.NO_UNITE = :NEW.NO_UNITE AND u.NO_UNITE_DEBUT <= :NEW.NOM_UNITE_DEBUT AND u.NO_UNITE_FIN >= :NEW.NOM_UNITE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM Unite_de_soin_since u WHERE u.NO_UNITE = :NEW.NO_UNITE AND u.NO_UNITE_SINCE <= :NEW.NOM_UNITE_DEBUT AND u.NO_UNITE_SINCE >= :NEW.NOM_UNITE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20013, 'La contrainte 3_6 est non respectée pour Unite_de_soin_nom_during');
	end if;
END;
/

/* Relation Unite_de_soin_etage_during */
CREATE OR REPLACE TRIGGER T_B_I_U_Unit_soin_etag_dur_3_6 BEFORE INSERT OR UPDATE ON Unite_de_soin_etage_during
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM Unite_de_soin_during u WHERE u.NO_UNITE = :NEW.NO_UNITE AND u.NO_UNITE_DEBUT <= :NEW.ETAGE_DEBUT AND u.NO_UNITE_FIN >= :NEW.ETAGE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM Unite_de_soin_since u WHERE u.NO_UNITE = :NEW.NO_UNITE AND u.NO_UNITE_SINCE <= :NEW.ETAGE_DEBUT AND u.NO_UNITE_SINCE >= :NEW.ETAGE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20014, 'La contrainte 3_6 est non respectée pour Unite_de_soin_etage_during');
	end if;
END;
/

/*
-- =========================================================================== 
	Trigger de contrainte 9
-- =========================================================================== 
*/

/* Relation Occupation_des_lits_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Occupation_lit_since_9 BEFORE INSERT OR UPDATE ON Occupation_des_lits_since
FOR EACH ROW 
DECLARE
	nbLitSince NUMBER;
	nbLitDuring NUMBER;
	nbSejourSince NUMBER;
	nbSejourDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbLitSince FROM Lit_since s WHERE s.NO_LIT = :NEW.NO_LIT;	
	SELECT COUNT(*) INTO nbLitDuring FROM Lit_during d WHERE d.NO_LIT = :NEW.NO_LIT;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbSejourSince FROM Sejour_since s WHERE s.NO_SEJOUR = :NEW.NO_SEJOUR;	
	SELECT COUNT(*) INTO nbSejourDuring FROM Sejour_during d WHERE d.NO_SEJOUR = :NEW.NO_SEJOUR;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbLitSince = 0) AND (nbLitDuring = 0)) OR ( (nbSejourSince = 0) AND (nbSejourDuring = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20015, 'La contrainte 9 est non respectée pour Occupation_des_lits_since');
	end if;
END;
/

/* Relation Occupation_des_lits_during */
CREATE OR REPLACE TRIGGER T_B_I_U_Occupation_lit_dur_9 BEFORE INSERT OR UPDATE ON Occupation_des_lits_during
FOR EACH ROW 
DECLARE
	nbLitSince NUMBER;
	nbLitDuring NUMBER;
	nbSejourSince NUMBER;
	nbSejourDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbLitSince FROM Lit_since s WHERE s.NO_LIT = :NEW.NO_LIT;	
	SELECT COUNT(*) INTO nbLitDuring FROM Lit_during d WHERE d.NO_LIT = :NEW.NO_LIT;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbSejourSince FROM Sejour_since s WHERE s.NO_SEJOUR = :NEW.NO_SEJOUR;	
	SELECT COUNT(*) INTO nbSejourDuring FROM Sejour_during d WHERE d.NO_SEJOUR = :NEW.NO_SEJOUR;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbLitSince = 0) AND (nbLitDuring = 0)) OR ( (nbSejourSince = 0) AND (nbSejourDuring = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20016, 'La contrainte 9 est non respectée pour Occupation_des_lits_during');
	end if;
END;
/

/* Relation Medecin_traitant_since */
CREATE OR REPLACE TRIGGER T_B_I_U_Medecin_trait_since_9 BEFORE INSERT OR UPDATE ON Medecin_traitant_since
FOR EACH ROW 
DECLARE
	nbSejourSince NUMBER;
	nbSejourDuring NUMBER;
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM Employe_since s WHERE s.NO_EMPLOYE = :NEW.NO_EMPLOYE;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM Employe_during d WHERE d.NO_EMPLOYE = :NEW.NO_EMPLOYE;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbSejourSince FROM Sejour_since s WHERE s.NO_SEJOUR = :NEW.NO_SEJOUR;	
	SELECT COUNT(*) INTO nbSejourDuring FROM Sejour_during d WHERE d.NO_SEJOUR = :NEW.NO_SEJOUR;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ( (nbSejourSince = 0) AND (nbSejourDuring = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20017, 'La contrainte 9 est non respectée pour Medecin_traitant_since');
	end if;
END;
/

/* Relation Medecin_traitant_during */
CREATE OR REPLACE TRIGGER T_B_I_U_Medecin_trait_durin_9 BEFORE INSERT OR UPDATE ON Medecin_traitant_during
FOR EACH ROW 
DECLARE
	nbSejourSince NUMBER;
	nbSejourDuring NUMBER;
	nbEmployeSince NUMBER;
	nbEmployeDuring NUMBER;
BEGIN	
	-- Nous validons que les clés étrangères existe soit dans le @VS ou le @VF de la table référencer							  
	SELECT COUNT(*) INTO nbEmployeSince FROM Employe_since s WHERE s.NO_EMPLOYE = :NEW.NO_EMPLOYE;	
	SELECT COUNT(*) INTO nbEmployeDuring FROM Employe_during d WHERE d.NO_EMPLOYE = :NEW.NO_EMPLOYE;
	
	/*Retourne le nombre de fois que la clé saisie est présente dans SINCE et DURING*/
	SELECT COUNT(*) INTO nbSejourSince FROM Sejour_since s WHERE s.NO_SEJOUR = :NEW.NO_SEJOUR;	
	SELECT COUNT(*) INTO nbSejourDuring FROM Sejour_during d WHERE d.NO_SEJOUR = :NEW.NO_SEJOUR;

	
	-- Nous validons que toutes les clés étangères existe dans la table courante ou bien historique de la table référencer
	if ( (nbEmployeSince = 0) AND (nbEmployeDuring = 0)) OR ( (nbSejourSince = 0) AND (nbSejourDuring = 0))  then 
	    -- Si la nouvelle clé pour no_employe est ni présente dans since ou bien during alors erreur
		-- Si la nouvelle clé pour no_role est ni présente dans since ou bien during alors erreur
		RAISE_APPLICATION_ERROR(-20017, 'La contrainte 9 est non respectée pour Medecin_traitant_during');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation V_ADMIN_NOM_METHODE_DURING [V_ADMIN_NOM_METHODE@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_VA_NOM_METHODE_3_6 BEFORE INSERT OR UPDATE ON V_ADMIN_NOM_METHODE_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM VOIE_ADMINISTRATION_DURING WHERE VOIE_ADMINISTRATION_DURING.NO_VOIE_ADMINISTRATION = :NEW.NO_VOIE_ADMINISTRATION AND VOIE_ADMINISTRATION_DURING.PK_DEBUT <= :NEW.NOM_METHODE_DEBUT AND VOIE_ADMINISTRATION_DURING.PK_FIN >= :NEW.NOM_METHODE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM VOIE_ADMINISTRATION_SINCE WHERE VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION = :NEW.NO_VOIE_ADMINISTRATION AND VOIE_ADMINISTRATION_SINCE.NO_VOIE_ADMINISTRATION_SINCE <= :NEW.NOM_METHODE_DEBUT AND VOIE_ADMINISTRATION_SINCE.NOM_METHODE_SINCE >= :NEW.NOM_METHODE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour V_ADMIN_NOM_METHODE_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation PRESCRIPTION_DOS_DURING [PRESCRIPTION_DOS@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESC_DOS_DURING_3_6 BEFORE INSERT OR UPDATE ON PRESCRIPTION_DOS_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_DURING.PK_DEBUT <= :NEW.DOSAGE_DEBUT AND PRESCRIPTION_DURING.PK_FIN >= :NEW.DOSAGE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_SINCE.NO_PRESCRIPTION_SINCE <= :NEW.DOSAGE_DEBUT AND PRESCRIPTION_SINCE.DOSAGE_SINCE >= :NEW.DOSAGE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour PRESCRIPTION_DOS_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation PRESCRIPTION_FREQ_DURING [PRESCRIPTION_FREQ@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESC_FREQ_DURING_3_6 BEFORE INSERT OR UPDATE ON PRESCRIPTION_FREQ_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_DURING.PK_DEBUT <= :NEW.FREQUENCE_DEBUT AND PRESCRIPTION_DURING.PK_FIN >= :NEW.FREQUENCE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_SINCE.NO_PRESCRIPTION_SINCE <= :NEW.FREQUENCE_DEBUT AND PRESCRIPTION_SINCE.DOSAGE_SINCE >= :NEW.FREQUENCE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour PRESCRIPTION_FREQ_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation PRESCRIPTION_MED_DURING [PRESCRIPTION_MED@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESC_MED_DURING_3_6 BEFORE INSERT OR UPDATE ON PRESCRIPTION_MED_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_DURING.PK_DEBUT <= :NEW.NO_MEDICAMENT_DEBUT AND PRESCRIPTION_DURING.PK_FIN >= :NEW.NO_MEDICAMENT_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_SINCE.NO_PRESCRIPTION_SINCE <= :NEW.NO_MEDICAMENT_DEBUT AND PRESCRIPTION_SINCE.NO_MEDICAMENT_SINCE >= :NEW.NO_MEDICAMENT_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour PRESCRIPTION_MED_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation PRESCRIPTION_ORDO_DURING [PRESCRIPTION_ORDO@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_PRESC_ORDO_DURING_3_6 BEFORE INSERT OR UPDATE ON PRESCRIPTION_ORDO_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM PRESCRIPTION_DURING WHERE PRESCRIPTION_DURING.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_DURING.PK_DEBUT <= :NEW.NO_ORDONNANCE_DEBUT AND PRESCRIPTION_DURING.PK_FIN >= :NEW.NO_ORDONNANCE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM PRESCRIPTION_SINCE WHERE PRESCRIPTION_SINCE.NO_PRESCRIPTION = :NEW.NO_PRESCRIPTION AND PRESCRIPTION_SINCE.NO_PRESCRIPTION_SINCE <= :NEW.NO_ORDONNANCE_DEBUT AND PRESCRIPTION_SINCE.NO_ORDONNANCE_SINCE >= :NEW.NO_ORDONNANCE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour PRESCRIPTION_MED_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation ORDONNANCE_DOSSIER_DURING [ORDONNANCE_DOSSIER@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_ORDO_DOS_DURING_3_6 BEFORE INSERT OR UPDATE ON ORDONNANCE_DOSSIER_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM ORDONNANCE_DURING WHERE ORDONNANCE_DURING.NO_ORDONNANCE = :NEW.NO_ORDONNANCE AND ORDONNANCE_DURING.PK_DEBUT <= :NEW.NO_DOSSIER_DEBUT AND ORDONNANCE_DURING.PK_FIN >= :NEW.NO_DOSSIER_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM ORDONNANCE_SINCE WHERE ORDONNANCE_SINCE.NO_ORDONNANCE = :NEW.NO_ORDONNANCE AND ORDONNANCE_SINCE.NO_ORDONNANCE_SINCE <= :NEW.NO_DOSSIER_DEBUT AND ORDONNANCE_SINCE.NO_DOSSIER_SINCE >= :NEW.NO_DOSSIER_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour ORDONNANCE_DOSSIER_DURING');
	end if;
END;
/

/* Trigger de contrainte 3_6 pour la relation ORDONNANCE_EMPLOYE_DURING [ORDONNANCE_EMPLOYE@VF]*/
CREATE OR REPLACE TRIGGER T_B_I_ORDO_EMP_DURING_3_6 BEFORE INSERT OR UPDATE ON ORDONNANCE_EMPLOYE_DURING
FOR EACH ROW 
DECLARE
	nb NUMBER;
	nbSince NUMBER;
BEGIN	
	-- On s'assure que la clé est présente dans DURING et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nb FROM ORDONNANCE_DURING WHERE ORDONNANCE_DURING.NO_ORDONNANCE = :NEW.NO_ORDONNANCE AND ORDONNANCE_DURING.PK_DEBUT <= :NEW.NO_EMPLOYE_DEBUT AND ORDONNANCE_DURING.PK_FIN >= :NEW.NO_EMPLOYE_FIN;
	
	-- On s'assure que la clé est présente dans SINCE et que la date de l'attribut Ai soit cohérent							  
	SELECT COUNT(*) INTO nbSince FROM ORDONNANCE_SINCE WHERE ORDONNANCE_SINCE.NO_ORDONNANCE = :NEW.NO_ORDONNANCE AND ORDONNANCE_SINCE.NO_ORDONNANCE_SINCE <= :NEW.NO_EMPLOYE_DEBUT AND ORDONNANCE_SINCE.NO_EMPLOYE_SINCE >= :NEW.NO_EMPLOYE_FIN;
	
	-- Si nous avons une clé courante pour @VS ou la date @s est plus petite ou egal a notre POST(@d) de la table @VF. Alors nb sera > 0
	if (nbSince = 0) AND (nb = 0) then 
		RAISE_APPLICATION_ERROR(-20418, 'La contrainte 3_6 est non respectée pour ORDONNANCE_DOSSIER_DURING');
	end if;
END;
/

-- Soumettre la création du schéma
commit;

/*
-- =========================================================================== Z
Contributeurs :
(MBB) Mamadou.Bobo.Bah@USherbrooke.ca    (matricule 15 130 742)
(SK)  Soumia.Kherbache@USherbrooke.ca    (matricule 14 181 440)
(JA)  Julien.Aspirot@USherbrooke.ca      (matricule 15 146 398)
(PMA) Pierre-Marie.Airiau@USherbrooke.ca (matricule 15 138 398)

-- -----------------------------------------------------------------------------
-- fin de ige487_cons.sql
-- =========================================================================== Z
*/