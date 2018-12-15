FROM golang:1.11.2

COPY . /go/src/DartSharingClientCode/backend

WORKDIR /go/src/DartSharingClientCode/backend

RUN go get -u github.com/golang/dep/cmd/dep \
  && dep ensure -vendor-only

EXPOSE 80

CMD ["go", "run", "main.go"]

