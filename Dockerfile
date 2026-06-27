FROM golang:1.25.7 AS builder

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o ascii-art-web-dockerize ./cmd

FROM alpine:latest

LABEL project="ascii-art-web-dockerize"
LABEL authors="elgeorgiou,gpapadaki"
LABEL description="Dockerized Go web application for ASCII Art Web"

WORKDIR /app

COPY --from=builder /app/ascii-art-web-dockerize .

COPY --from=builder /app/banners ./banners
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static

EXPOSE 8080

CMD ["./ascii-art-web-dockerize"]
