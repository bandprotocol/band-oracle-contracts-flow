transaction() {
    prepare(signer: auth(BorrowValue)&Account) {
    //     // Testnet
    //     let key1 = PublicKey(
    //         publicKey: "1ccd70f3d647fef8a6ad1200dde66d4bd8c38d49e68dbf9918939d80a69349b7fddec1f3cf54c6a1f47302c09a8c825f4a7b65ab9e41c69b20a59d49808d3c28".decodeHex(),
    //         signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
    //     )

    //     let key2 = PublicKey(
    //         publicKey: "557fa692abf7774138f5231e1f7fa0d6b678496114689f52326b294a58e605c8ec94e673c1b0b928bbcdc2fb7075ccf4696cf42e8fe407d741243c71d9eb6063".decodeHex(),
    //         signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
    //     )

    //     let key3 = PublicKey(
    //         publicKey: "1eb7d4a297224b0f5235e102b48dd99855d12237e1d50debfe864a4be5feb69cd8aacb29e638b367a339d7d0c5a0de01aadaff8899ac09e0060f8bc2469530d6".decodeHex(),
    //         signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
    //     )

    //     let key4 = PublicKey(
    //         publicKey: "51fbf2078a5322ae332e70346b0a3ddb13649285c3a66890149b6ac5f8bf4c55741b67a1ddc2e7689aa0cfa5b57aecb5c8e4a4bcd4b463a5f6d06f58d7ac0e69".decodeHex(),
    //         signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
    //     )

        // Mainnet
        let key1 = PublicKey(
            publicKey: "966890f4538bab96b4f8bf2b32653b5b9102a73edbc4882d6a99612081684d0e8b5c63e73c76bd8476cab03b553867a4c89e0a34757d73c0d141c8535a847e48".decodeHex(),
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )

        let key2 = PublicKey(
            publicKey: "a1ffa4547b0b7c94532350c5e737494bed30aae42952084803ba5338ebfc535079dbd726e950d15a36b55d22e00f5dbcf0e92432d2de2a90796db0afe6d67960".decodeHex(),
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )

        let key3 = PublicKey(
            publicKey: "8fd50c66022ef08a9232139d4ba020f27b2f1bb9b188c0214cad4b13e7fd8194179bf8d13a56f15653347937a4c7c5c20912ae8702f6d402246b3484fb896ad3".decodeHex(),
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )

        let key4 = PublicKey(
            publicKey: "6d17cd9ecf61104f1d74365fef4c5b0489b5ff85544abc5c977cf379f7445980071c1298e60aad2dccc93ff5c606a94a990688ca708c130672d62e34c320c3df".decodeHex(),
            signatureAlgorithm: SignatureAlgorithm.ECDSA_P256
        )

        

        let account = Account(payer: signer)

        account.keys.add(
            publicKey: key1,
            hashAlgorithm: HashAlgorithm.SHA3_256,
            weight: 600.0
        )

        account.keys.add(
            publicKey: key2,
            hashAlgorithm: HashAlgorithm.SHA3_256,
            weight: 600.0
        )

        account.keys.add(
            publicKey: key3,
            hashAlgorithm: HashAlgorithm.SHA3_256,
            weight: 300.0
        )

        account.keys.add(
            publicKey: key4,
            hashAlgorithm: HashAlgorithm.SHA3_256,
            weight: 300.0
        )
    }
}
