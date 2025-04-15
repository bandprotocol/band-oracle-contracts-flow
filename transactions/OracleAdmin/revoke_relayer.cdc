import "BandOracle"

transaction(relayers: [Address]) {
    prepare(acct: auth(BorrowValue, GetStorageCapabilityController)&Account){
        let oracleAdminRef = acct.storage.borrow<&{BandOracle.OracleAdmin}>(from: BandOracle.OracleAdminStoragePath)
            ?? panic("Can't borrow a reference to the Oracle Admin")

        for relayer in relayers {
            if let capabilityID = oracleAdminRef.getUpdaterCapabilityIDFromAddress(relayer: relayers[0]){
                let controller = acct.capabilities.storage.getController(byCapabilityID: capabilityID) ??
                    panic("Can't get relayer's data updater capability controller")
                controller.delete()
                // Get the capability ID for the relayer address
                oracleAdminRef.removeRelayerCapabilityID(relayer: relayer)
            } else {
            panic("Address is not a relayer")
            }
        }
    }
}