import SwiftUI
import TrustWalletCore

struct ContentView: View {
    @State private var walletAddress: String = ""

    var body: some View {
        VStack {
            Text("Your Ethereum Wallet Address:")
                .font(.headline)
                .padding()

            Text(walletAddress)
                .font(.subheadline)
                .padding()

            Button(action: createWallet) {
                Text("Generate New Wallet")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            createWallet()
        }
    }

    func createWallet() {
        // Генерация новой seed-фразы и Ethereum-адреса
        let wallet = HDWallet(strength: 128, passphrase: "")
        let address = wallet.getAddressForCoin(coin: .ethereum)
        walletAddress = address
    }
}
