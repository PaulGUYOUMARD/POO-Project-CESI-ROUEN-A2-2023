USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Update_Personel]    Script Date: 11/12/2023 20:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC Update_Personel

@Id_indn int,
@nom_Ind char(40),
@prenom_Ind char(40),
@email_Ind char(40),
@Date_Naissance_Ind date,

@Ville_Adr char(40),
@Rue_Adr char(40),
@Code_Postal_Adr char(40), 
@Nom_Batiment_Adr char(40),  
@Etage_Adr int,

@Date_Embauche_Per date,
@Role_Per char(40),
@Id_Superieur_Per int

AS

UPDATE Adresse
SET  Ville_Adr = @Ville_Adr, Rue_Adr = @Rue_Adr, Code_Postal_Adr = @Code_Postal_Adr, Nom_Batiment_Adr = @Nom_Batiment_Adr, Etage_Adr = @Etage_Adr
Where Id_Adr =  (SELECT Id_Adr FROM Individu WHERE ID_Ind = @Id_indn)

UPDATE Individu
SET  Nom_Ind =  @nom_Ind, Prenom_Ind = @prenom_Ind, Date_Naissance_Ind = @Date_Naissance_Ind, Mail_Ind = @email_Ind
Where Id_Ind =  @Id_Indn

UPDATE Personel
SET  Date_Embauche_Per = @Date_Embauche_Per , Role_Per = @Role_Per , Id_Superieur_Per = @Id_Superieur_Per
Where Id_Ind = @Id_Indn