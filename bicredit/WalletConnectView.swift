import SwiftUI

struct WalletConnectView: View {
    var body: some View {
        VStack {
            Text("Connect to Wallet")
                .font(.largeTitle)
                .padding()

            Button(action: {
                connectToWallet()
            }) {
                Text("Connect Wallet")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func connectToWallet() {
        Task {
            do {
                let uri = try await pairingClient.createPairing()
                print("Scan this QR Code: \(uri)")
            } catch {
                print("Failed to create pairing: \(error)")
            }
        }
    }
}
