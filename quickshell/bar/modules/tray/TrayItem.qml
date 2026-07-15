import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import QtQuick
import qs.config
import qs.components
import qs.services

Item {
    id: root

    required property SystemTrayItem item
    readonly property bool menuOpen: PopupManager.current === root

    implicitWidth: 18
    implicitHeight: 18

    function findWindow() {
        const needles = [root.item.id, root.item.title]
            .filter(s => !!s).map(s => s.toLowerCase());

        return Hyprland.toplevels.values.find(t => {
            const o = t.lastIpcObject;
            if (!o) return false;
            const hay = [o.class, o.initialClass, o.title]
                .filter(s => !!s).map(s => s.toLowerCase());
            return hay.some(h => needles.some(n => h.includes(n) || n.includes(h)));
        }) ?? null;
    }

    function triggerShowEntry() {
        const entries = menu.entries?.values ?? [];
        const match = entries.find(e =>
            !e.isSeparator && e.enabled && /show|open|restore/i.test(e.text ?? ""));
        if (!match) return false;
        match.triggered();
        return true;
    }

    function bringHere() {
        const win = findWindow();

        if (win) {
            const addr = win.lastIpcObject?.address;
            const ws = Hyprland.focusedWorkspace?.id;
            if (addr && ws) {
                if (Hyprland.isLuaMode) {
                    Hyprland.dispatch(`hl.dsp.movetoworkspace({ workspace = ${ws}, window = "address:${addr}" })`);
                    Hyprland.dispatch(`hl.dsp.focus({ window = "address:${addr}" })`);
                } else {
                    Hyprland.dispatch(`movetoworkspace ${ws},address:${addr}`);
                    Hyprland.dispatch(`focuswindow address:${addr}`);
                }
                return;
            }
        }

        if (triggerShowEntry()) return;
        root.item.activate();
    }

    Image {
        anchors.fill: parent
        source: root.item.icon
        sourceSize.width: width
        sourceSize.height: height
        asynchronous: true
        smooth: true

        opacity: root.item.status === Status.Passive ? 0.55 : 1
        Behavior on opacity { NumberAnimation { duration: Appearance.anim.normal } }

        scale: (mouse.containsMouse || root.menuOpen) ? 1.2 : 1
        Behavior on scale { NumberAnimation { duration: Appearance.anim.fast } }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        cursorShape: Qt.PointingHandCursor

        onContainsMouseChanged: if (containsMouse) Hyprland.refreshToplevels()

        onClicked: e => {
            if (e.button === Qt.LeftButton) root.bringHere();
            else PopupManager.toggle(root);
        }
    }

    MenuPopup {
        anchorItem: root
        open: root.menuOpen

        implicitWidth: 200
        implicitHeight: menu.implicitHeight + 16

        TrayMenu {
            id: menu
            anchors { left: parent.left; right: parent.right; top: parent.top; margins: 8 }
            handle: root.item.menu
            onCloseRequested: PopupManager.close(root)
        }
    }
}