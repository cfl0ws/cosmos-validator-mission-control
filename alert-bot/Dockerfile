# Stage 1
FROM golang:1.13.1 AS builder

COPY . /app/validator-tg-bot

WORKDIR /app/validator-tg-bot

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .


# Stage 2
FROM alpine:latest

RUN apk --no-cache add ca-certificates

COPY --from=builder /main /app/

COPY --from=builder /app/validator-tg-bot/config.toml /app

WORKDIR /app

RUN chmod +x ./main

ENTRYPOINT ["./main"]


