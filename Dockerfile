
FROM golang:1.21-alpine

WORKDIR /usr/src/my-go-hello

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/my-go-hello ./...

CMD ["my-go-hello"]