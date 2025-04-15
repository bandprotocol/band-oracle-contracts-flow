flow transactions build transactions/Multisig/deploy_contract.cdc --args-json "$(cat transactions/Multisig/deploy_args.json)" --network testnet --proposer bun-test1 --payer bun-test1 --authorizer bun-test1 --filter payload --save tx1 -y

flow transactions sign tx1 --signer bun-test1 --filter payload --save tx2 -y
flow transactions sign tx2 --signer bun-test3 --filter payload --save tx3 -y
flow transactions sign tx3 --signer bun-test4 --filter payload --save tx4 -y

flow transactions send-signed tx4 --network testnet -y

flow transactions build transactions/OracleAdmin/issue_and_publish_data_updater_capability.cdc --args-json "$(cat transactions/OracleAdmin/publish_args_testnet.json)" --network testnet --proposer bun-test1 --payer bun-test1 --authorizer bun-test1 --filter payload --save tx1 -y

flow transactions sign tx1 --signer bun-test1 --filter payload --save tx2 -y
flow transactions sign tx2 --signer bun-test3 --filter payload --save tx3 -y
flow transactions sign tx3 --signer bun-test4 --filter payload --save tx4 -y

flow transactions send-signed tx4 --network testnet -y

flow transactions build transactions/OracleAdmin/link_and_publish_data_updater_capability.cdc --args-json "$(cat transactions/OracleAdmin/publish_args.json)" --network mainnet --proposer bun-mainnet --payer bun-mainnet --authorizer bun-mainnet --filter payload --save tx1 -y

flow transactions sign tx1 --signer bun-test1 --filter payload --save tx2 -y

flow transactions build transactions/Multisig/deploy_contract.cdc --args-json "$(cat transactions/Multisig/deploy_args.json)" --network mainnet --proposer bun-mainnet --payer bun-mainnet --authorizer bun-mainnet --filter payload --save tx1 --proposer-key-index 1
