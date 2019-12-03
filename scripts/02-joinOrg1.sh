
ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer0.myapp.com/msp/tlscacerts/tlsca.myapp.com.crt.pem
CORE_PEER_LOCALMSPID="netflixMSP"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/netflix.com/users/Admin@netflix.com/msp
CORE_PEER_ADDRESS=peer0.netflix.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=false
ORDERER_SYSCHAN_ID=syschain

peer channel join -b $CHANNEL_NAME.block  >&log.txt

cat log.txt
