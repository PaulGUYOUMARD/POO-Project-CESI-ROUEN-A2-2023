USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Calcul_montant_Tot_Client]    Script Date: 11/12/2023 20:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC Calcul_montant_Tot_Client
@id_client int

AS

SELECT SUM(Total_TTC_Com) as 'Montant total'
FROM Commande
JOIN Client ON Client.Id_Cli = Commande.Id_Cli
WHERE Client.id_cli = @id_client