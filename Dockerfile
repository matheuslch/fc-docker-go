FROM golang:alpine as builder

WORKDIR /go/src

COPY main.go .
RUN go build -ldflags '-s -w' -o /app main.go

FROM scratch
WORKDIR /go/app
COPY --from=builder /app /app
CMD ["/app"]