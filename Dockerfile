FROM golang:1.17rc2 as builder

WORKDIR /go/src/jq-api
COPY . .
RUN go get -u github.com/golang/dep/cmd/dep \
    && dep ensure \
    && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o app .

FROM stedolan/jq

COPY --from=builder /go/src/jq-api/app .
ENTRYPOINT ["./app"]

EXPOSE 8080