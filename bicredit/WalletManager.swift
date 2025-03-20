import ReownAppKit

class WalletManager {
    private let client: WalletConnectClient

    init() {
        client = WalletConnectClient()
    }

    func connectWallet() {
        client.pair { uri, error in
            if let uri = uri {
                print("Подключите кошелек, используя этот URI: \(uri)")
            } else if let error = error {
                print("Ошибка подключения: \(error.localizedDescription)")
            }
        }
    }
}
