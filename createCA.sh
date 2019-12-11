export REGISTRAR_DIR=$PWD
export FABRIC_CA_CLIENT_HOME=$REGISTRAR_DIR

export ORG_DIR=$PWD/crypto-config/peerOrganizations/dummyOrg.com
export PEER_TLS=$PWD/peertls
export PEER_DIR=$ORG_DIR/peers/peer0.dummyOrg.com
export REGISTRAR_DIR=$ORG_DIR/users/admin
export ADMIN_DIR=$ORG_DIR/users/Admin@dummyOrg.com
export TLS=$ORG_DIR/tlsca
mkdir -p $ORG_DIR/ca $ORG_DIR/msp $PEER_DIR $REGISTRAR_DIR $ADMIN_DIR $TLS
mkdir certsICA

fabric-ca-client enroll -m admin -u http://adminCA:adminpw@ca.root:7054 


fabric-ca-client register --id.name ica.dummyOrg --id.type client \
 --id.secret adminpw --csr.names C=ES,ST=Madrid,L=Madrid,O=dummyOrg.com \
 --csr.cn ica.dummyOrg -m ica.dummyOrg --id.attrs  '"hf.IntermediateCA=true"' -u http://ca.root:7054 

export ORG_DIR=$PWD/crypto-config/peerOrganizations/fakeOrg.com
export PEER_TLS=$PWD/peertls
export PEER_DIR=$ORG_DIR/peers/peer0.fakeOrg.com
export REGISTRAR_DIR=$ORG_DIR/users/admin
export ADMIN_DIR=$ORG_DIR/users/Admin@fakeOrg.com
export TLS=$ORG_DIR/tlsca
mkdir -p $ORG_DIR/ca $ORG_DIR/msp $PEER_DIR $REGISTRAR_DIR $ADMIN_DIR $TLS
mkdir certsICA2

fabric-ca-client register --id.name ica.fakeOrg --id.type client \
 --id.secret adminpw --csr.names C=ES,ST=Madrid,L=Madrid,O=fakeOrg.com \
 --csr.cn ica.fakeOrg -m ica.fakeOrg --id.attrs  '"hf.IntermediateCA=true"' -u http://ca.root:7054 

docker-compose -f docker-compose-ca.yaml up -d
sleep 5
cp -r $PWD/certsICA2/* $ORG_DIR/ca



