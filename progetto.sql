DROP database IF exists strumenti;
CREATE database strumenti;
use strumenti;

CREATE TABLE Utente(
	cf VARCHAR(16) NOT NULL,
    nome VARCHAR(15) NOT NULL,
    cognome VARCHAR(15) NOT NULL,
	cap INT NOT NULL,
    via VARCHAR(20) NOT NULL,
    numeroCivico INT NOT NULL,
    email VARCHAR(20) NOT NULL,
    pw VARCHAR(20) NOT NULL,
    PRIMARY KEY(cf)
);

CREATE TABLE Account(
	codAccount VARCHAR(10) NOT NULL,
    cfCodAccount VARCHAR(16) NOT NULL,
    PRIMARY KEY (codAccount),
    FOREIGN KEY (cfCodAccount) References Utente(cf)
);

CREATE TABLE Cliente (
    nomeUtente VARCHAR(20) NOT NULL,
    codUtenteCliente VARCHAR(10) NOT NULL,
    PRIMARY KEY (codUtenteCliente),
    FOREIGN KEY (codUtenteCliente) REFERENCES Account(codAccount)
);

CREATE TABLE Aziendale(
	nomeAzienda VARCHAR(10) NOT NULL,
    codAccountAzienda VARCHAR(10) NOT NULL,
    PRIMARY KEY (codAccountAzienda),
    FOREIGN KEY (codAccountAzienda) references Account (codAccount)
);

CREATE TABLE Telefono(
	numero INT NOT NULL,
    codCF VARCHAR(16) NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (codCF) references Utente(cf)
);

CREATE TABLE Prodotto (
  CodiceProdotto INT NOT NULL,
  Nome VARCHAR(50) NOT NULL,
  Descrizione VARCHAR(255) NOT NULL,
  Quantità INT NOT NULL,
  Disponibilità  VARCHAR(40) NOT NULL,
  Prezzo DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (CodiceProdotto)
);

CREATE TABLE Seleziona (
  UtenteCF VARCHAR(16) NOT NULL,
  CodiceProdotto INT NOT NULL,
  FOREIGN KEY (UtenteCF) REFERENCES Utente(CF),
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(CodiceProdotto),
  PRIMARY KEY (UtenteCF, CodiceProdotto)
);


CREATE TABLE Strumenti (
  Modello VARCHAR(50) NOT NULL,
  CodiceProdotto INT NOT NULL,
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(CodiceProdotto),
  PRIMARY KEY (CodiceProdotto)
);

CREATE TABLE Attrezzatura (
  Tipo VARCHAR(50) NOT NULL,
  CodiceProdotto INT NOT NULL,
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(CodiceProdotto),
  PRIMARY KEY (CodiceProdotto)
);

CREATE TABLE Software (
  Genere VARCHAR(50) NOT NULL,
  CodiceProdotto INT NOT NULL,
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(CodiceProdotto),
  PRIMARY KEY (CodiceProdotto)
);

CREATE TABLE Carrello (
  CodiceCarrello INT NOT NULL,
  PRIMARY KEY (CodiceCarrello)
);

CREATE TABLE Inserito (
  CodiceProdotto INT NOT NULL,
  CodiceCarrello INT NOT NULL,
  FOREIGN KEY (codiceCarrello) REFERENCES Carrello(CodiceCarrello),
  FOREIGN KEY (CodiceProdotto) REFERENCES Prodotto(CodiceProdotto),
  PRIMARY KEY (CodiceProdotto, CodiceCarrello)
);

CREATE TABLE Corriere (
  CodiceCorriere INT NOT NULL,
  PRIMARY KEY (CodiceCorriere)
);

CREATE TABLE Ordine (
  Carrello_CodiceCarrello INT NOT NULL,
  CodiceOrdine INT NOT NULL,
  Corriere_CodiceCorriere INT NOT NULL,
  FOREIGN KEY (Corriere_CodiceCorriere) REFERENCES Corriere(CodiceCorriere),
  FOREIGN KEY (Carrello_CodiceCarrello) REFERENCES Carrello(CodiceCarrello),
  PRIMARY KEY (CodiceOrdine, Corriere_CodiceCorriere)
);

CREATE TABLE Transazione (
  CodiceTransazione INT NOT NULL,
  Data DATETIME NOT NULL,
  CodiceOrdine INT NOT NULL,
  CodCorriere INT NOT NULL,
  Utente_CF VARCHAR(16),
  
  PRIMARY KEY (CodiceTransazione),
  FOREIGN KEY (CodiceOrdine, CodCorriere) REFERENCES Ordine(CodiceOrdine, Corriere_CodiceCorriere),
  FOREIGN KEY (Utente_CF) REFERENCES Utente(CF)
);
