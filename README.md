# hf-ca-poc  

 Tu run the network, please execute the following commands

 ````
 docker-compose -f docker-compose-ca.yaml up -d ca.root
 ./createCA.sh
 ./createCerts.sh
 ./generate-artifacts.sh
 docker-compose up -d
````

Next it's necessary to configure the network creating the channel and joining the peers. Finally, it is desirable to install a chaincode and instantiate it

```
docker exec -ti cli bash
./scripts/01-createchannel.sh
./scripts/02-joinOrg1.sh
./scripts/04-installCCorg1.sh
./scripts/05-instantiateCCorg1.sh
```
