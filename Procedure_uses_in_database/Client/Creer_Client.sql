USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Creer_Client]    Script Date: 11/12/2023 20:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC Creer_Client

@nom_Ind char(40),
@prenom_Ind char(40),
@email_Ind char(40),
@Date_Naissance_Ind date,

@Ville_Adr char(40),
@Rue_Adr char(40),
@Code_Postal_Adr char(40), 
@Nom_Batiment_Adr char(40),  
@Etage_Adr int

AS
	INSERT INTO Adresse (Ville_Adr, Rue_Adr, Code_Postal_Adr, Nom_Batiment_Adr, Etage_Adr)
	VALUES
	(@Ville_Adr, @Rue_Adr, @Code_Postal_Adr, @Nom_Batiment_Adr, @Etage_Adr)

	INSERT INTO Individu (Nom_Ind, Prenom_Ind, Date_Naissance_Ind, Mail_Ind, Id_Adr)
	VALUES
	(@nom_Ind, @prenom_Ind, @Date_Naissance_Ind, @email_Ind,(SELECT TOP(1)Id_Adr FROM Adresse ORDER BY Id_Adr DESC))

	INSERT INTO Client(Id_Ind)
	VALUES
	((SELECT TOP(1)Id_Ind FROM Individu ORDER BY Id_Ind DESC))

