## Setting Up
Create a new directory and initialize foundry using the command below
```bash
mkdir foundry-nft-f24 && cd foundry-nft-f24 && forge init
```

Install openzeppelin using the command below
```bash
forge install OpenZeppelin/openzeppelin-contracts --no-commit
```

We go to our `foundry.toml` file and configure mappings as follows
```
remappings = ["@openzeppelin=lib/openzeppelin-contracts"]
```
