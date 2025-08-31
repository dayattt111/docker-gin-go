FROM golang:1.12-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
        
WORKDIR /app
        
COPY app/go.mod ./
COPY app/go.sum ./
COPY app/ ./
RUN go mod download
        
COPY . .
        
RUN go build -o main .
        
CMD ["./main"]