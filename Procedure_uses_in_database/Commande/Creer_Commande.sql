USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Creer_Commande]    Script Date: 11/12/2023 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC Creer_Commande
@Date_Livraison_Com date,
@Total_HT_Com float,
@Total_TTC_Com float,
@Total_TVA_Com float,
@Moyen_Paiment_Com char(40),
@Id_Cli int,
@Adresse_Livraison int,
@Adresse_Factuartion int
--EXECUTE Creer_Commande '2000-11-11', NULL, NULL, NULL, 'carte', 6, 6, 5
AS
	
	DECLARE @Ref_Com VARCHAR(50);
	EXECUTE Ref_Commande @Id_Cli, @Ref_Com OUTPUT;
	


	SELECT @Ref_Com

	INSERT INTO Commande(Ref_Com, Date_Livraison_Com, Date_Emission_Com, Total_HT_Com, Total_TTC_Com,Total_TVA_Com, Moyen_Paiment_Com, Id_Cli)
	VALUES
	(@Ref_Com, @Date_Livraison_Com, GETDATE(), @Total_HT_Com, @Total_TTC_Com, @Total_TVA_Com, @Moyen_Paiment_Com, @Id_Cli)




	INSERT INTO Possede (Id_Com, Adresse_Facturation, Adresse_Livraison)
    VALUES
    ((SELECT TOP(1)Id_Com FROM Commande ORDER BY Id_Com DESC),@Adresse_Factuartion, @Adresse_Livraison)
    


