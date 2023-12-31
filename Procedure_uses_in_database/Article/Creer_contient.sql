USE [Projet_POO]
GO
/****** Object:  StoredProcedure [dbo].[Creer_Contient]    Script Date: 11/12/2023 19:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC Creer_Contient
    @Id_Art INT,
    @Ref_Com VARCHAR(50),
    @Quantite INT
AS
    DECLARE @Id_Com INT;

    SELECT @Id_Com = Id_Com
    FROM Commande
    WHERE Ref_Com = @Ref_Com;

    IF @Id_Com IS NOT NULL
        INSERT INTO Contient(Id_Art, Id_Com, Quantite_Article)
        VALUES (@Id_Art, @Id_Com, @Quantite);
        UPDATE Article 
        SET Stock_Art = Stock_Art - @Quantite 
        WHERE Id_Art = @Id_Art;
        