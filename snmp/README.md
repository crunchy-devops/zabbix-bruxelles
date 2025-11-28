docker build -t zabbix-snmp-router:latest .

### Étape 2 : Lancement du Conteneur

Lancez le simulateur en exposant le port 161 (UDP).

```bash
# Lancement du conteneur en mode détaché
docker run -d --name cisco-sim -p 161:161/udp zabbix-snmp-router:latest

### Étape 3 : Vérification (Depuis la machine hôte)

Avant de configurer Zabbix, les participants peuvent vérifier la connexion :

1.  **Vérification SNMP v2c :**
    ```bash
    # Attributs génériques simulant le routeur Cisco
    snmpget -v 2c -c public 127.0.0.1:161 1.3.6.1.2.1.1.1.0
    # Résultat attendu: SNMPv2-MIB::sysDescr.0 = STRING: Cisco IOS Software, C880 Software...
    
2.  **Vérification SNMP v3 (plus complexe, idéal pour le TP) :**
    ```bash
    # Notez les paramètres de sécurité (authProtocol, privProtocol, noms d'utilisateurs)
    snmpget -v 3 -l authPriv -u zabbixadmin -a SHA -A authsecret123 -x AES -X privsecret321 127.0.0.1:161 1.3.6.1.2.1.1.5.0
    # Résultat attendu: SNMPv2-MIB::sysName.0 = STRING: (Nom d'hôte du conteneur)
    
### Étape 4 : Intégration dans Zabbix (TP 1.3 & 1.4)

Les participants peuvent alors passer aux TP :
:
1.  Ajouter un hôte dans Zabbix pointant vers l'IP du conteneur (ex: `127.0.0.1` ou son IP interne si le Zabbix Server est dans Docker Compose).
2.  Utiliser les credentials `v2c` (`public`) et `v3` (`zabbixadmin`, SHA, AES) définis ci-dessus.
3.  Appliquer un template SNMP générique pour vérifier le monitoring du CPU et des interfaces via LLD (TP 1.4).

Cette méthode garantit que chaque participant peut avoir son propre "routeur Cisco" simulé dans un environnement isolé.