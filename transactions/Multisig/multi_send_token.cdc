import FungibleToken from 0xf233dcee88fe0abe

transaction(amount: UFix64, recipients: [Address]) {
    // The Vault resource that holds the tokens that are being transferred
    let sentVault: @{FungibleToken.Vault}

    prepare(signer: auth(BorrowValue) &Account) {

        let vaultRef = signer.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
			?? panic("Could not borrow reference to the owner's Vault!")
        
        self.sentVault <- vaultRef.withdraw(amount: UFix64(recipients.length) * amount)
    }
    execute {
        for to in recipients {
            let receiverRef = getAccount(to)
                .capabilities.borrow<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
			    ?? panic("Could not borrow receiver reference to the recipient's Vault")

            // Deposit the withdrawn tokens in the recipient's receiver
            receiverRef.deposit(from: <-self.sentVault)
        }
    }
}
