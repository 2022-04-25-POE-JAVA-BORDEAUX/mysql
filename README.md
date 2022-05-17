# Base de données du CRM

## Importer la base de données

1. Installer MySQL
2. Importer la base de données fournie dans le fichier `final-projet.sql`
   
## Organisation
- Cette base de données est constituée de 2 tables `clients` et `orders`
- La relation entre les 2 tables est de type `one to many` où `[clients] 1 <-- 1..* [orders#clientId]`
