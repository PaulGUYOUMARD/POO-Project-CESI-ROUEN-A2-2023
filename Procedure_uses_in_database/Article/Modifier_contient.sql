USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Modifier_Contient]    Script Date: 11/12/2023 20:19:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC Modifier_Contient


@Id_Art int,
@Ref_Com varchar(50),
@Quantite int


AS
	DECLARE @Ancienne_qte int

	SELECT @Ancienne_qte = Quantite_Article   
	FROM Contient
	WHERE Id_Art = @Id_Art AND Id_Com = (SELECT Id_Com FROM Commande WHERE Ref_Com = @Ref_Com)

	UPDATE Contient
		SET Quantite_Article = @Quantite
		WHERE Id_Art = @Id_Art AND Id_Com = (SELECT Id_Com FROM Commande WHERE Ref_Com = @Ref_Com)

	IF @Quantite > @Ancienne_qte
	BEGIN
		UPDATE Article
		SET Stock_Art = (SELECT Stock_Art FROM Article WHERE Id_Art = @Id_Art) + (@Ancienne_qte - @Quantite)
		WHERE Id_Art = @Id_Art
	END
	ELSE
	BEGIN
		UPDATE Article
		SET Stock_Art = (SELECT Stock_Art FROM Article WHERE Id_Art = @Id_Art) - (@Quantite - @Ancienne_qte)
		WHERE Id_Art = @Id_Art
	END