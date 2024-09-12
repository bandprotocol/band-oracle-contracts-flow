import FungibleToken from 0xf233dcee88fe0abe

transaction(amount: UFix64, recipients: [Address]) {
    let vault: @FungibleToken.Vault
    prepare(signer: AuthAccount) {
        self.vault <- signer
        .borrow<&{FungibleToken.Provider}>(from: /storage/flowTokenVault)!
        .withdraw(amount: 5.0 * amount)
    }
    execute {
        for to in recipients {
            getAccount(to)
            .getCapability(/public/flowTokenReceiver)!
            .borrow<&{FungibleToken.Receiver}>()!
            .deposit(from: <-self.vault)
        }
    }
}