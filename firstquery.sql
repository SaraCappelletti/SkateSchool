BEGIN TRANSACTION
SET IDENTITY_INSERT [dbo].[CentroEstivo] ON
INSERT INTO [dbo].[CentroEstivo] ([CodiceCentroEstivo], [DataInizio], [DataFine], [Descrizione]) VALUES (1, N'2022-06-30', N'2022-07-05', N'Camp Estivo al Jurassic')
INSERT INTO [dbo].[CentroEstivo] ([CodiceCentroEstivo], [DataInizio], [DataFine], [Descrizione]) VALUES (2, N'2022-06-15', N'2022-06-30', N'Camp Estivo lungo al Jurassic')
SET IDENTITY_INSERT [dbo].[CentroEstivo] OFF
SET IDENTITY_INSERT [dbo].[Sede] ON
INSERT INTO [dbo].[Sede] ([CodiceSede], [Citta], [SkatePark]) VALUES (1, N'Cesena', N'Jurassic')
INSERT INTO [dbo].[Sede] ([CodiceSede], [Citta], [SkatePark]) VALUES (2, N'Cesena', N'101')
INSERT INTO [dbo].[Sede] ([CodiceSede], [Citta], [SkatePark]) VALUES (3, N'Ravenna', N'Ponte Nuovo')
INSERT INTO [dbo].[Sede] ([CodiceSede], [Citta], [SkatePark]) VALUES (4, N'Cesenatico', N'Hotel Lux')
SET IDENTITY_INSERT [dbo].[Sede] OFF
SET IDENTITY_INSERT [dbo].[Corso] ON
INSERT INTO [dbo].[Corso] ([CodiceCorso], [Descrizione], [Livello], [CodiceSede]) VALUES (1, N'Bambini', N'Base', 1)
INSERT INTO [dbo].[Corso] ([CodiceCorso], [Descrizione], [Livello], [CodiceSede]) VALUES (2, N'Adulti', N'Base', 1)
INSERT INTO [dbo].[Corso] ([CodiceCorso], [Descrizione], [Livello], [CodiceSede]) VALUES (3, N'Bambini', N'Avanzato', 2)
INSERT INTO [dbo].[Corso] ([CodiceCorso], [Descrizione], [Livello], [CodiceSede]) VALUES (4, N'Bambini', N'Base', 3)
INSERT INTO [dbo].[Corso] ([CodiceCorso], [Descrizione], [Livello], [CodiceSede]) VALUES (5, N'Bambini', N'Avanzato', 4)
SET IDENTITY_INSERT [dbo].[Corso] OFF
SET IDENTITY_INSERT [dbo].[Gara] ON
INSERT INTO [dbo].[Gara] ([CodiceGara], [Data], [Citta], [Categoria], [Descrizione]) VALUES (1, N'2022-07-17', N'San Mauro Pascoli', N'Baby', N'Fino agli 8 anni')
INSERT INTO [dbo].[Gara] ([CodiceGara], [Data], [Citta], [Categoria], [Descrizione]) VALUES (2, N'2022-07-17', N'San Mauro Pascoli', N'Senior', N'Dopo i 18 anni')
INSERT INTO [dbo].[Gara] ([CodiceGara], [Data], [Citta], [Categoria], [Descrizione]) VALUES (3, N'2022-07-17', N'San Mauro Pascoli', N'Teenage', N'Da 8 a 18')
INSERT INTO [dbo].[Gara] ([CodiceGara], [Data], [Citta], [Categoria], [Descrizione]) VALUES (4, N'2022-07-01', N'Forlì', N'Senior', N'Dopo i 18 anni')
INSERT INTO [dbo].[Gara] ([CodiceGara], [Data], [Citta], [Categoria], [Descrizione]) VALUES (5, N'2022-07-01', N'Forlì', N'Teenage', N'Da 8 a 18')
SET IDENTITY_INSERT [dbo].[Gara] OFF
SET IDENTITY_INSERT [dbo].[Iscritto] ON
INSERT INTO [dbo].[Iscritto] ([CodiceIscritto], [Nome], [Cognome], [Eta], [Telefono], [Livello]) VALUES (1, N'Sara', N'Cappelletti', 20, N'3356894488', N'base')
INSERT INTO [dbo].[Iscritto] ([CodiceIscritto], [Nome], [Cognome], [Eta], [Telefono], [Livello]) VALUES (2, N'Gabriele', N'Neri', 12, N'3379757733', N'avanzato')
INSERT INTO [dbo].[Iscritto] ([CodiceIscritto], [Nome], [Cognome], [Eta], [Telefono], [Livello]) VALUES (3, N'Claudia', N'Castellucci', 30, N'3378649528', N'adulti avanzato')
INSERT INTO [dbo].[Iscritto] ([CodiceIscritto], [Nome], [Cognome], [Eta], [Telefono], [Livello]) VALUES (4, N'Giulio ', N'Giorgetti', 10, N'3367953920', N'avanzato')
INSERT INTO [dbo].[Iscritto] ([CodiceIscritto], [Nome], [Cognome], [Eta], [Telefono], [Livello]) VALUES (5, N'Alfredo', N'Furini', 13, N'3375893377', N'avanzato')
SET IDENTITY_INSERT [dbo].[Iscritto] OFF
SET IDENTITY_INSERT [dbo].[Istruttore] ON
INSERT INTO [dbo].[Istruttore] ([CodiceIstruttore], [Nome], [Cognome], [Eta], [Telefono]) VALUES (1, N'Rachele', N'Margutti', 20, N'3358941218')
INSERT INTO [dbo].[Istruttore] ([CodiceIstruttore], [Nome], [Cognome], [Eta], [Telefono]) VALUES (2, N'Enrico', N'Daltri', 28, N'3386037759')
INSERT INTO [dbo].[Istruttore] ([CodiceIstruttore], [Nome], [Cognome], [Eta], [Telefono]) VALUES (3, N'Alessandro', N'Pistocchi', 29, N'3369375509')
INSERT INTO [dbo].[Istruttore] ([CodiceIstruttore], [Nome], [Cognome], [Eta], [Telefono]) VALUES (4, N'Giorgia', N'Visani', 26, N'3386759265')
SET IDENTITY_INSERT [dbo].[Istruttore] OFF
SET IDENTITY_INSERT [dbo].[Lezione] ON
INSERT INTO [dbo].[Lezione] ([CodiceLezione], [CodiceIstruttore], [CodiceCorso], [MassimoPartecipanti], [Data]) VALUES (1, 1, 1, 6, N'2022-06-13')
INSERT INTO [dbo].[Lezione] ([CodiceLezione], [CodiceIstruttore], [CodiceCorso], [MassimoPartecipanti], [Data]) VALUES (2, 1, 2, 6, N'2022-06-13')
INSERT INTO [dbo].[Lezione] ([CodiceLezione], [CodiceIstruttore], [CodiceCorso], [MassimoPartecipanti], [Data]) VALUES (3, 2, 3, 6, N'2022-06-14')
INSERT INTO [dbo].[Lezione] ([CodiceLezione], [CodiceIstruttore], [CodiceCorso], [MassimoPartecipanti], [Data]) VALUES (4, 4, 4, 6, N'2022-06-15')
INSERT INTO [dbo].[Lezione] ([CodiceLezione], [CodiceIstruttore], [CodiceCorso], [MassimoPartecipanti], [Data]) VALUES (5, 2, 5, 6, N'2022-06-13')
SET IDENTITY_INSERT [dbo].[Lezione] OFF
INSERT INTO [dbo].[LezionePrivata] ([CodiceIstruttore], [Data], [CodiceSede], [CodiceIscritto]) VALUES (1, N'2022-06-14', 1, 1)
INSERT INTO [dbo].[LezionePrivata] ([CodiceIstruttore], [Data], [CodiceSede], [CodiceIscritto]) VALUES (1, N'2022-06-15', 2, 5)
INSERT INTO [dbo].[LezionePrivata] ([CodiceIstruttore], [Data], [CodiceSede], [CodiceIscritto]) VALUES (4, N'2022-06-13', 3, 4)
INSERT INTO [dbo].[LezionePrivata] ([CodiceIstruttore], [Data], [CodiceSede], [CodiceIscritto]) VALUES (3, N'2022-06-15', 1, 1)
INSERT INTO [dbo].[LezionePrivata] ([CodiceIstruttore], [Data], [CodiceSede], [CodiceIscritto]) VALUES (2, N'2022-06-14', 2, 4)
SET IDENTITY_INSERT [dbo].[TipologiaOggetto] ON
INSERT INTO [dbo].[TipologiaOggetto] ([CodiceTipo], [Nome]) VALUES (1, N'Maglia')
INSERT INTO [dbo].[TipologiaOggetto] ([CodiceTipo], [Nome]) VALUES (2, N'Skate')
INSERT INTO [dbo].[TipologiaOggetto] ([CodiceTipo], [Nome]) VALUES (3, N'Pantaloni')
SET IDENTITY_INSERT [dbo].[TipologiaOggetto] OFF
SET IDENTITY_INSERT [dbo].[Oggetto] ON
INSERT INTO [dbo].[Oggetto] ([CodiceOggetto], [Quantita], [Prezzo], [Descrizione], [CodiceSede], [CodiceTipo]) VALUES (1, 3, 15, N'Maglia SkateSchool', 2, 1)
INSERT INTO [dbo].[Oggetto] ([CodiceOggetto], [Quantita], [Prezzo], [Descrizione], [CodiceSede], [CodiceTipo]) VALUES (2, 5, 50, N'Skate why not', 2, 2)
INSERT INTO [dbo].[Oggetto] ([CodiceOggetto], [Quantita], [Prezzo], [Descrizione], [CodiceSede], [CodiceTipo]) VALUES (3, 2, 30, N'Pantaloni Vans', 3, 3)
SET IDENTITY_INSERT [dbo].[Oggetto] OFF
SET IDENTITY_INSERT [dbo].[Vendita] ON
INSERT INTO [dbo].[Vendita] ([CodiceVendita], [CodiceOggetto], [Quantita], [Data]) VALUES (1, 1, 1, N'2022-06-13')
INSERT INTO [dbo].[Vendita] ([CodiceVendita], [CodiceOggetto], [Quantita], [Data]) VALUES (2, 2, 2, N'2022-06-03')
INSERT INTO [dbo].[Vendita] ([CodiceVendita], [CodiceOggetto], [Quantita], [Data]) VALUES (3, 3, 1, N'2022-06-12')
SET IDENTITY_INSERT [dbo].[Vendita] OFF
SET IDENTITY_INSERT [dbo].[Tariffario] ON
INSERT INTO [dbo].[Tariffario] ([CodiceTariffario], [NumeroLezioni], [Prezzo], [Privata]) VALUES (1, 1, 20, 1)
INSERT INTO [dbo].[Tariffario] ([CodiceTariffario], [NumeroLezioni], [Prezzo], [Privata]) VALUES (2, 1, 10, 0)
INSERT INTO [dbo].[Tariffario] ([CodiceTariffario], [NumeroLezioni], [Prezzo], [Privata]) VALUES (3, 5, 35, 0)
INSERT INTO [dbo].[Tariffario] ([CodiceTariffario], [NumeroLezioni], [Prezzo], [Privata]) VALUES (4, 10, 80, 0)
SET IDENTITY_INSERT [dbo].[Tariffario] OFF
SET IDENTITY_INSERT [dbo].[Pagamento] ON
INSERT INTO [dbo].[Pagamento] ([CodicePagamento], [NumeroLezioniRimaste], [Data], [CodiceIscritto], [CodiceTariffario]) VALUES (1, 10, N'2022-06-13', 5, 4)
INSERT INTO [dbo].[Pagamento] ([CodicePagamento], [NumeroLezioniRimaste], [Data], [CodiceIscritto], [CodiceTariffario]) VALUES (2, 1, N'2022-06-12', 1, 1)
INSERT INTO [dbo].[Pagamento] ([CodicePagamento], [NumeroLezioniRimaste], [Data], [CodiceIscritto], [CodiceTariffario]) VALUES (3, 5, N'2022-06-10', 4, 3)
SET IDENTITY_INSERT [dbo].[Pagamento] OFF
SET IDENTITY_INSERT [dbo].[Attrezzatura] ON
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (1, 1, N'Skateboard giallo')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (2, 1, N'Casco nero')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (3, 1, N'Skateboard nero')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (4, 2, N'Casco rosso')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (5, 2, N'Skateboard nero')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (6, 4, N'Casco giallo')
INSERT INTO [dbo].[Attrezzatura] ([CodiceAttrezzatura], [CodiceSede], [Descrizione]) VALUES (7, 3, N'Casco blu')
SET IDENTITY_INSERT [dbo].[Attrezzatura] OFF

INSERT INTO [dbo].[Prestito] ([CodiceIscritto], [CodiceAttrezzatura], [Data], [Restituito]) VALUES (1, 1, N'2022-06-14', 1)
INSERT INTO [dbo].[Prestito] ([CodiceIscritto], [CodiceAttrezzatura], [Data], [Restituito]) VALUES (4, 7, N'2022-06-13', 1)

INSERT INTO [dbo].[TutoraggioCentroEstivo] ([CodiceIstruttore], [CodiceCentroEstivo]) VALUES (2, 1)
INSERT INTO [dbo].[TutoraggioCentroEstivo] ([CodiceIstruttore], [CodiceCentroEstivo]) VALUES (3, 1)

INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (1, 1)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (1, 2)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (1, 4)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (2, 1)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (2, 2)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (2, 4)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (3, 1)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (3, 2)
INSERT INTO [dbo].[Insegnamento] ([CodiceIstruttore], [CodiceSede]) VALUES (4, 3)

INSERT INTO [dbo].[Iscrizione] ([CodiceIscritto], [CodiceLezione]) VALUES (1, 2)
INSERT INTO [dbo].[Iscrizione] ([CodiceIscritto], [CodiceLezione]) VALUES (2, 3)
INSERT INTO [dbo].[Iscrizione] ([CodiceIscritto], [CodiceLezione]) VALUES (4, 5)

INSERT INTO [dbo].[IscrizioneCentroEstivo] ([CodiceCentroEstivo], [CodiceIscritto]) VALUES (1, 5)
INSERT INTO [dbo].[IscrizioneCentroEstivo] ([CodiceCentroEstivo], [CodiceIscritto]) VALUES (1, 2)
INSERT INTO [dbo].[IscrizioneCentroEstivo] ([CodiceCentroEstivo], [CodiceIscritto]) VALUES (2, 4)
INSERT INTO [dbo].[IscrizioneCentroEstivo] ([CodiceCentroEstivo], [CodiceIscritto]) VALUES (2, 2)
INSERT INTO [dbo].[IscrizioneCentroEstivo] ([CodiceCentroEstivo], [CodiceIscritto]) VALUES (2, 5)

INSERT INTO [dbo].[IscrizioneGara] ([CodiceGara], [CodiceIscritto]) VALUES (3, 4)

COMMIT