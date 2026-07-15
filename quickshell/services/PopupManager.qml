pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    // Only one pop-up is allowed to be open at once
    property var current: null

    function open(owner) { root.current = owner; }
    function close(owner) { if (root.current === owner) root.current = null; }
    function toggle(owner) { root.current = (root.current === owner) ? null : owner; }
}