import Sparkle
import SwiftUI

struct NavigationMenuItems: View {
    var body: some View {
        Button("About", action: {
            NSApp.sendAction(#selector(AppDelegate.openAboutWindow), to: nil, from: nil)
        })
        Button("Check for updates...", action: {
            SUUpdater.shared().feedURL = URL(string: PikaConstants.url)
            SUUpdater.shared()?.checkForUpdates(self)
        })
        Button("Preferences...", action: {
            NSApp.sendAction(#selector(AppDelegate.openPreferencesWindow), to: nil, from: nil)
        })
            .modify {
                if #available(OSX 11.0, *) {
                    $0.keyboardShortcut(",", modifiers: .command)
                } else {
                    $0
                }
            }

        Divider()

        Button("Quit", action: {
            NSApplication.shared.terminate(self)
        })
            .modify {
                if #available(OSX 11.0, *) {
                    $0.keyboardShortcut("q", modifiers: .command)
                } else {
                    $0
                }
            }
    }
}

struct NavigationItems_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuItems()
    }
}
