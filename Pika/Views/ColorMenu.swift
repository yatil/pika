import SwiftUI

struct ColorMenu: View {
    var eyedropper: Eyedropper

    var body: some View {
        if #available(OSX 11.0, *) {
            Menu {
                ColorMenuItems(eyedropper: eyedropper)
            } label: {
                Image(systemName: "ellipsis.circle")
            }
            .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
        } else {
            MenuButton(label: IconImage(name: "ellipsis.circle"), content: {
                ColorMenuItems(eyedropper: eyedropper)
            })
                .menuButtonStyle(BorderlessButtonMenuButtonStyle())
        }
    }
}

struct ColorMenu_Previews: PreviewProvider {
    static var previews: some View {
        let eyedropper = Eyedropper(title: "Foreground", color: NSColor.random())
        ColorMenu(eyedropper: eyedropper)
    }
}
