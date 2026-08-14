package main

import (
	"crypto/sha1"
	"crypto/tls"
	"fmt"
	"log"
)

func main() {
	host := "token.actions.githubusercontent.com:443"

	conn, err := tls.Dial("tcp", host, &tls.Config{})
	if err != nil {
		log.Fatalf("failed to connect: %v", err)
	}
	defer conn.Close()

	certs := conn.ConnectionState().PeerCertificates
	if len(certs) == 0 {
		log.Fatal("no certificates found")
	}

	// Last certificate = the top-most intermediate CA in the chain the server sent
	topIntermediateCA := certs[len(certs)-1]

	sha1sum := sha1.Sum(topIntermediateCA.Raw)
	fmt.Printf("SHA1 Thumbprint:   %X\n", sha1sum)
}
