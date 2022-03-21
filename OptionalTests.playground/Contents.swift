import UIKit

var cancelActions: Bool?

cancelActions = true

if cancelActions ?? false {
    print("cancelActions is \(String(describing: cancelActions))")
}
print("cancelActions is \(String(describing: cancelActions))")
