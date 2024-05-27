#!/bin/bash

# Fetch public IP address
PUBLIC_IP=$(curl -s ifconfig.me)

echo "$PUBLIC_IP"
