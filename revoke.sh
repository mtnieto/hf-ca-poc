
export REGISTRAR_DIR=$PWD
export FABRIC_CA_CLIENT_HOME=$REGISTRAR_DIR
fabric-ca-client enroll -m admin -u http://adminCA:adminpw@ca.root:7054 
fabric-ca-client revoke -e ica.dummyOrg  -r "because of yes"

