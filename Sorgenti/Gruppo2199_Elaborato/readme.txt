Il database è di tipo SQLServer, l'applicazione è stata sviluppata su VisualStudio 2022.

Per farla partire basta eseguire il file SkateSchool.exe
Se questo non funzionasse installare l'ultima versione di LocalDB da https://download.microsoft.com/download/7/c/1/7c14e92e-bdcb-4f89-b7cf-93543e7112d1/SqlLocalDB.msi

Se si desidera creare il database da zero (non necessario perchè gia presente) per prima cosa bisogna eseguire lo script per generare il database (1CreateDatabase.sql), poi quello per le tabelle (2CreateTables.ddl) ed infine quello per riempire le tabelle (3InsertData.sql).
Infine eseguire il file SkateSchool.exe