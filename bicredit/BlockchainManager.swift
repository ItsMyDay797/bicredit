import Foundation
import web3swift
import Web3Core
import BigInt

class BlockchainManager {
    let rpcURL = "https://goerli.infura.io/v3/YOUR_INFURA_API_KEY"
    var web3: Web3

    init() async {
        web3 = await Web3(provider: Web3HttpProvider(URL(string: rpcURL)!, network: <#Networks?#>)!)
    }

    func getBalance(address: String) async -> String {
        guard let ethAddress = try? EthereumAddress(address) else { return "Invalid address" }
        do {
            let balanceBigUInt = try await web3.eth.getBalance(for: ethAddress)
            let balanceEth = Double(balanceBigUInt) / pow(10, 18)
            return String(format: "%.6f", balanceEth)
        } catch {
            return "Error fetching balance"
        }
    }
}
