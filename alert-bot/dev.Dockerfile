FROM golang:1.13.1

COPY . /app/validator-tg-bot

WORKDIR /app/validator-tg-bot

RUN go mod download

CMD ["go", "run", "main.go"]