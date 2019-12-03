

ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer0.myapp.com/tls/MyCertificate.crt
CORE_PEER_LOCALMSPID="netflixMSP"
# En este certificado me contecto al peer
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/netflix.com/peers/peer0.netflix.com/tls/tlsca.netflix.com.crt.pem
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/netflix.com/users/Admin@netflix.com/msp
CORE_PEER_ADDRESS=peer0.netflix.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=false
verifyResult () {
	if [ $1 -ne 0 ] ; then
		echo "!!!!!!!!!!!!!!! "$2" !!!!!!!!!!!!!!!!"
                echo "================== ERROR !!! FAILED to execute End-2-End Scenario =================="
		echo
   		exit 1
	fi
}
queryChaincode () {
	# while 'peer chaincode' command can get the orderer endpoint from the peer (if join was successful),
	# lets supply it directly as we know it using the "-o" option

	peer chaincode query -C $CHANNEL_NAME -n mycontract -c '{"Args":["query","a"]}' >&log.txt
	res=$?
	cat log.txt
	verifyResult $res "Chaincode instantiation on PEER on channel '$CHANNEL_NAME' failed"
	echo "===================== Chaincode Instantiation on PEER on channel '$CHANNEL_NAME' is successful ===================== "
	echo
}

queryChaincode
