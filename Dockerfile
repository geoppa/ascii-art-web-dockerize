FROM golang:1.25.7 AS builder

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o ascii-art-web-dockerize ./cmd

FROM alpine:latest

WORKDIR /app

