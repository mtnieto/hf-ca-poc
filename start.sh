 docker-compose -f docker-compose-ca.yaml up -d ca.root
 sleep 10
 ./createCA.sh
 sleep 10
 ./createCerts.sh
 sleep 10
 ./createCert2.sh
 sleep 10
 ./generate-artifacts.sh
 sleep 10
 docker-compose up -d