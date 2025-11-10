#!/bin/bash
# BloodHound CE total cleanup (no reinstall)
# Run as: sudo ./bloodhound-cleanup.sh

echo "[*] Stopping and removing BloodHound containers..."
docker ps -a --filter "name=bloodhound" --format "{{.ID}}" | xargs -r docker rm -f

echo "[*] Removing BloodHound volumes..."
docker volume ls --filter "name=bloodhound" --format "{{.Name}}" | xargs -r docker volume rm

echo "[*] Removing BloodHound networks..."
docker network ls --filter "name=bloodhound" --format "{{.Name}}" | xargs -r docker network rm

echo "[*] Pruning Docker system (cached layers, unused data)..."
docker system prune -af --volumes

echo "[*] Deleting local BloodHound CLI configuration..."
rm -rf ~/.config/bloodhound ~/.local/share/bloodhound

echo
echo "All BloodHound containers, volumes, networks, and configs have been removed."
echo "No reinstall was performed."
