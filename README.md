# yebocoin

A Stacks smart contract project for the `yebocoin` fungible token, built with [Clarinet](https://github.com/hirosystems/clarinet).

## Project structure

- `Clarinet.toml` – Clarinet project configuration
- `contracts/yebocoin.clar` – Clarity smart contract defining the `yebocoin` fungible token
- `tests/yebocoin.test.ts` – Example Vitest test file for the contract
- `settings/` – Network configuration (Devnet, Testnet, Mainnet)

## Requirements

- [Clarinet](https://docs.hiro.so/clarinet) (CLI)
- Node.js + npm (for running TypeScript tests)

Verify Clarinet is installed:

```bash path=null start=null
clarinet --version
```

## Using this project

### 1. Run static checks

From the project root (`yebocoin` directory):

```bash path=null start=null
clarinet check
```

This compiles and analyzes all contracts under `contracts/`.

### 2. Inspect the contract

The main contract lives in `contracts/yebocoin.clar` and exposes:

- `mint (recipient principal, amount uint)` – owner-only minting, increases total supply
- `burn (amount uint)` – burns tokens from the caller, decreasing total supply
- `transfer (recipient principal, amount uint)` – transfers tokens from the caller to another principal
- `get-total-supply ()` – read-only, returns the total supply
- `get-balance (who principal)` – read-only, returns the balance of `who`

### 3. Run tests (optional)

Install dependencies and run tests:

```bash path=null start=null
npm install
npm test
```

### 4. Development notes

- Use `clarinet console` to interactively call functions and inspect state in a simulated environment.
- Update `Clarinet.toml` if you add more contracts or change paths.
