FROM golang:1.11.0 as builder

WORKDIR /go/src/jq-api
COPY . .
RUN go get -u github.com/golang/dep/cmd/dep \
    && dep ensure \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o app .

FROM scratch

COPY --from=builder /go/src/jq-api/app .
CMD ["./app"]

EXPOSE 8080