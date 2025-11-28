#!/bin/bash
# Script d'entrée pour démarrer l'agent SNMP

echo "Démarrage de l'agent SNMP..."

# Pour l'utilisateur v3, l'agent doit être démarré pour enregistrer les paramètres.
# On supprime le fichier de configuration persistent pour garantir que l'utilisateur v3 soit recréé à chaque démarrage du conteneur (utile pour la formation).
rm -f /var/lib/snmp/snmpd.conf

# Démarrer l'agent SNMP en arrière-plan
exec /usr/sbin/snmpd -f -Lo