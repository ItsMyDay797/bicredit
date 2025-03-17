import SwiftUI

struct ContentView: View {
    @State private var balance: String = "0"

    var body: some View {
        VStack {
            Text("Balance: \(balance) ETH")
                .padding()
            
            Button("Get Balance") {
                Task {
                    let blockchainManager = BlockchainManager()
                    balance = await blockchainManager.getBalance(address: "YOUR_WALLET_ADDRESS")
                }
            }
            .padding()
        }
    }
}
