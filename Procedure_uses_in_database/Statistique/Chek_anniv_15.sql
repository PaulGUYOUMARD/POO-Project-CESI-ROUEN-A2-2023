USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Chek_anniv_15]    Script Date: 11/12/2023 20:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC Chek_anniv_15
AS
DECLARE @DateActuelle DATE = GETDATE();

-- Utilisez la clause SET pour attribuer une valeur à une variable
DECLARE @id_cli INT;
SET @id_cli = (
    SELECT Client.Id_Cli
    FROM Individu
    JOIN Client ON Individu.Id_Ind = Client.Id_Ind
    JOIN Commande ON Client.Id_Cli = Commande.Id_Cli
    WHERE MONTH(CONVERT(DATE, Individu.Date_Naissance_Ind)) = MONTH(DATEADD(DAY, 15, @DateActuelle)) 
      AND DAY(CONVERT(DATE, Individu.Date_Naissance_Ind)) = DAY(DATEADD(DAY, 15, @DateActuelle))
);

DECLARE @id_commande INT;
SET @id_commande = (SELECT Id_Com
                    FROM Commande
                    WHERE Id_Cli = @id_cli);

-- Sélectionnez les clients dont l'anniversaire est dans 15 jours
SELECT Nom_Ind, Prenom_Ind, Mail_Ind, Date_Naissance_Ind
FROM Individu
WHERE MONTH(CONVERT(DATE, Individu.Date_Naissance_Ind)) = MONTH(DATEADD(DAY, 15, @DateActuelle)) 
  AND DAY(CONVERT(DATE, Individu.Date_Naissance_Ind)) = DAY(DATEADD(DAY, 15, @DateActuelle));
