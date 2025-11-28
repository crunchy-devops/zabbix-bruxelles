# Utilisation d'une image de base légère (Debian ou Ubuntu)
FROM ubuntu:22.04

# Installation de Net-SNMP et outils
RUN apt-get update && \
    apt-get install -y net-snmp snmp-mibs-downloader net-tools vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier de configuration SNMP
COPY snmpd.conf /etc/snmp/snmpd.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Créer un utilisateur non-root pour la sécurité (bonne pratique)
RUN useradd -m -s /bin/bash snmpuser

# Définir l'entrypoint pour démarrer le service
RUN chmod +x /usr/local/bin/entrypoint.sh
EXPOSE 161/udp
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]