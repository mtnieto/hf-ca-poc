

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer0.myapp.com/msp/tlscacerts/tlsca.myapp.com.crt.pem
CORE_PEER_LOCALMSPID="fakeOrgMSP"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/fakeOrg.com/users/Admin@fakeOrg.com/msp
CORE_PEER_ADDRESS=peer0.fakeOrg.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=false
ORDERER_SYSCHAN_ID=syschain

peer chaincode invoke -o orderer0.myapp.com:7050   -C $CHANNEL_NAME -n mycontract2 -c '{"Args":["invoke","b","a","10"]}' >&log.txt
cat log.txt
