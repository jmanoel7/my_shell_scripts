#!/bin/bash
sudo update-alternatives \
    --install "/usr/bin/x-www-browser" "x-www-browser" /home/joaomanoel/.local/firefox-dev/firefox 900
sudo update-alternatives \
    --set "x-www-browser" /home/joaomanoel/.local/firefox-dev/firefox
sudo update-alternatives \
    --install "/usr/bin/gnome-www-browser" "gnome-www-browser" /home/joaomanoel/.local/firefox-dev/firefox 900
sudo update-alternatives \
    --set "gnome-www-browser" /home/joaomanoel/.local/firefox-dev/firefox
