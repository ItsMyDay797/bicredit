import WalletConnectSign
import WalletConnectRelay

class WalletManager: ObservableObject {
    private var client: WalletConnectClient

    init() {
        client = WalletConnectClient()
        client.connect()
    }

    func connectWallet() {
        client.connect()
    }
}
