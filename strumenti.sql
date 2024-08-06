DROP database IF exists strumenti;
CREATE database strumenti;
use strumenti;

CREATE TABLE UTENTE (
    cf VARCHAR(16),
    cap INT NOT NULL,
    via VARCHAR(50),
    numCivico INT NOT NULL,
    nome VARCHAR(15),
    cognome VARCHAR(10),
    email VARCHAR(50),
    pw VARCHAR(10),
    PRIMARY KEY (cf)
);

CREATE TABLE TELEFONO (
    numero INT NOT NULL,
    cfUtente VARCHAR(16),
    PRIMARY KEY (numero),
    FOREIGN KEY (cfUtente)
        REFERENCES Utente (cf)
);

CREATE TABLE ACCOUNT (
    codiceAccount VARCHAR(10),
    cfUtenteacc VARCHAR(14),
    PRIMARY KEY (codiceAccount),
    FOREIGN KEY (cfUtenteacc)
        REFERENCES Utente (cf)
);

CREATE TABLE CLIENTE (
    codiceAccountCliente VARCHAR(10),
    codiceacc VARCHAR(10),
    PRIMARY KEY (codiceAccountCliente),
    FOREIGN KEY (codiceacc)
        REFERENCES Account (codiceAccount)
);

CREATE TABLE AZIENDALE (
    codiceAccountAziendale VARCHAR(10),
    codiceAcc2 VARCHAR(10),
    PRIMARY KEY (codiceAccountAziendale),
    FOREIGN KEY (codiceAcc2)
        REFERENCES Account (codiceAccount)
);



CREATE TABLE PRODOTTO (
    codiceProdotto INT NOT NULL,
    descrizione CHAR(100),
    quantita INT NOT NULL,
    nome CHAR(20),
    disponibilita CHAR(50),
    prezzo DOUBLE(5 , 2 ),
    PRIMARY KEY (codiceProdotto)
);


CREATE TABLE SELEZIONA (
    cfseleziona VARCHAR(16),
    codiceprods INT NOT NULL,
    FOREIGN KEY (cfseleziona)
        REFERENCES Utente (cf),
    FOREIGN KEY (codiceprods)
        REFERENCES Prodotto (codiceProdotto)
);


CREATE TABLE STRUMENTI (
    codiceStrumento INT NOT NULL,
    codiceProdottoSt INT NOT NULL,
    PRIMARY KEY (codiceStrumento),
    FOREIGN KEY (codiceProdottoSt)
        REFERENCES Prodotto (codiceProdotto)
);

CREATE TABLE SOFTWARE (
    codiceSoftware INT NOT NULL,
    codiceProdottoS INT NOT NULL,
    PRIMARY KEY (codiceSoftware),
    FOREIGN KEY (codiceProdottos)
        REFERENCES Prodotto (codiceProdotto)
);

CREATE TABLE ACCESSORI (
    codiceAccessori INT NOT NULL,
    codiceProdottoA INT NOT NULL,
    PRIMARY KEY (codiceAccessori),
    FOREIGN KEY (codiceProdottoA)
        REFERENCES Prodotto (codiceProdotto)
);

CREATE TABLE CORRIERE (
    codiceCorriere INT NOT NULL,
    nomeAzienda CHAR(20),
    PRIMARY KEY (codiceCorriere)
);

CREATE TABLE ORDINE (
    codiceOrdine INT NOT NULL,
    codiceCorriereO INT NOT NULL,
    PRIMARY KEY (codiceOrdine),
    FOREIGN KEY (codiceCorriereO)
        REFERENCES Corriere (codiceCorriere)
);


CREATE TABLE CARRELLO (
    codiceCarrello VARCHAR(10),
    codiceOrdinec INT NOT NULL,
    PRIMARY KEY (codiceCarrello),
    FOREIGN KEY (codiceOrdinec)
        REFERENCES Ordine (codiceOrdine)
);

CREATE TABLE INSERITO (
    codiceProdotto INT NOT NULL,
    codiceCarrelloi VARCHAR(10),
    codiceProdottoi INT NOT NULL,
    FOREIGN KEY (codiceProdottoi)
        REFERENCES Prodotto (codiceProdotto),
    FOREIGN KEY (codiceCarrelloi)
        REFERENCES Carrello (codiceCarrello)
);







CREATE TABLE TRANSAZIONE (
    codiceTransazione INT NOT NULL,
    codiceOrdinetrans INT NOT NULL,
    Codicecftrans VARCHAR(16),
    datatrans DATE,
    PRIMARY KEY (codiceTransazione),
    FOREIGN KEY (codiceOrdinetrans)
        REFERENCES Ordine (codiceOrdine),
    FOREIGN KEY (codicecftrans)
        REFERENCES Utente(cf)
);


 


