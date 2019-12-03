
#Se levanta CA Root
export REGISTRAR_DIR=$PWD
export FABRIC_CA_CLIENT_HOME=$REGISTRAR_DIR

export ORG_DIR=$PWD/crypto-config/peerOrganizations/netflix.com
export PEER_TLS=$PWD/peertls
export PEER_DIR=$ORG_DIR/peers/peer0.netflix.com
export REGISTRAR_DIR=$ORG_DIR/users/admin
export ADMIN_DIR=$ORG_DIR/users/Admin@netflix.com
export TLS=$ORG_DIR/tlsca
echo "Generating Scaffolfing"
mkdir -p $ORG_DIR/ca $ORG_DIR/msp $PEER_DIR $REGISTRAR_DIR $ADMIN_DIR $TLS
mkdir certsICA
echo "Enrrolling user in Root CA"

fabric-ca-client enroll -m admin -u http://adminCA:adminpw@ca.root:7054 

echo "Register iCA"

fabric-ca-client register --id.name ica.netflix --id.type client --id.secret adminpw --csr.names C=ES,ST=Madrid,L=Madrid,O=netflix.com  --csr.cn ica.netflix -m ica.netflix --id.attrs  '"hf.IntermediateCA=true"' -u http://ca.root:7054 

echo "Running up the ICA"

docker-compose -f docker-compose-ca.yaml up -d ica.netflix

sleep 2
echo "Copy certificates"
cp -r $PWD/certsICA/* $ORG_DIR/ca
cp $PWD/certsICA/msp/keystore/* $ORG_DIR/ca/ca.key