# Docker Guide

This repository uses Docker for development and deployment.

---

## Starting the Stack

Run:

docker compose up -d

This starts:

API
MySQL
Redis

---

## Viewing Running Containers

docker ps

---

## Viewing Logs

docker logs container_name

---

## Stopping Containers

docker compose down

---

## Rebuilding Containers

docker compose build

---

## Cleaning Docker Environment

docker system prune
