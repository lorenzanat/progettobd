-- Inserimento di dati nella tabella Utente
INSERT INTO Utente (cf, nome, cognome, cap, via, numeroCivico, email, pw)
VALUES
('CF12345678901234', 'Mario', 'Rossi', 12345, 'Via Roma', 42, 'mario@email.com', 'password123'),
('CF56789012340123', 'Anna', 'Verdi', 54321, 'Via Venezia', 21, 'anna@email.com', 'securepass');

-- Inserimento di dati nella tabella Account
INSERT INTO Account (codAccount, cfCodAccount)
VALUES
('A001', 'CF12345678901234'),
('A002', 'CF56789012340123');

-- Inserimento di dati nella tabella Cliente
INSERT INTO Cliente (nomeUtente, codUtenteCliente)
VALUES
('mario_customer', 'A001'),
('anna_customer', 'A002');

-- Inserimento di dati nella tabella Aziendale
INSERT INTO Aziendale (nomeAzienda, codAccountAzienda)
VALUES
('Azienda1', 'A001'),
('Azienda2', 'A002');

-- Inserimento di dati nella tabella Telefono
INSERT INTO Telefono (numero, codCF)
VALUES
(123456789, 'CF12345678901234'),
(987654321, 'CF56789012340123');

-- Inserimento di dati nella tabella Prodotto
INSERT INTO Prodotto (CodiceProdotto, Nome, Descrizione, Quantità, Disponibilità, Prezzo)
VALUES
(1, 'Prodotto1', 'Descrizione Prodotto1', 50, 'Disponibile', 19.99),
(2, 'Prodotto2', 'Descrizione Prodotto2', 30, 'In esaurimento', 29.99);

-- Inserimento di dati nella tabella Seleziona
INSERT INTO Seleziona (UtenteCF, CodiceProdotto)
VALUES
('CF12345678901234', 1),
('CF56789012340123', 2);

-- Inserimento di dati nella tabella Strumenti
INSERT INTO Strumenti (Modello, CodiceProdotto)
VALUES
('Modello1', 1),
('Modello2', 2);

-- Inserimento di dati nella tabella Attrezzatura
INSERT INTO Attrezzatura (Tipo, CodiceProdotto)
VALUES
('Attrezzo1', 1),
('Attrezzo2', 2);

-- Inserimento di dati nella tabella Software
INSERT INTO Software (Genere, CodiceProdotto)
VALUES
('Genere1', 1),
('Genere2', 2);

-- Inserimento di dati nella tabella Carrello
INSERT INTO Carrello (CodiceCarrello)
VALUES
(1),
(2);

-- Inserimento di dati nella tabella Inserito
INSERT INTO Inserito (CodiceProdotto, CodiceCarrello)
VALUES
(1, 1),
(2, 2);

-- Inserimento di dati nella tabella Corriere
INSERT INTO Corriere (CodiceCorriere)
VALUES
(1),
(2);

-- Inserimento di dati nella tabella Ordine
INSERT INTO Ordine (Carrello_CodiceCarrello, CodiceOrdine, Corriere_CodiceCorriere)
VALUES
(1, 101, 1),
(2, 102, 2);

-- Inserimento di dati nella tabella Transazione
INSERT INTO Transazione (CodiceTransazione, Data, CodiceOrdine, CodCorriere, Utente_CF)
VALUES
(1001, '2024-02-22 12:00:00', 101, 1, 'CF12345678901234'),
(1002, '2024-02-22 14:30:00', 102, 2, 'CF56789012340123');
