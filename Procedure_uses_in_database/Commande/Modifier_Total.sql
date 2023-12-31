USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Modifier_Total]    Script Date: 11/12/2023 20:20:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC Modifier_Total
@Ref_Com varchar(50)

AS

DECLARE @Total_HT float,@Total_TVA float


Select @Total_HT = ROUND(SUM(Article.Prix_Art * Contient.Quantite_Article), 2)
FROM Article JOIN Contient ON Article.Id_Art = Contient.Id_Art 
WHERE Id_Com = (SELECT Id_Com FROM Commande WHERE Ref_Com = @Ref_Com)

Select @Total_TVA = ROUND(SUM((Article.Prix_Art * Contient.Quantite_Article)*(Article.Taux_TVA_Art/100)), 2)
FROM Article JOIN Contient ON Article.Id_Art = Contient.Id_Art 
WHERE Id_Com = (SELECT Id_Com FROM Commande WHERE Ref_Com = @Ref_Com)

UPDATE Commande
SET Total_HT_Com = @Total_HT,
Total_TVA_Com = @Total_TVA,
Total_TTC_Com = @Total_TVA + @Total_HT
WHERE Ref_Com = @Ref_Com
