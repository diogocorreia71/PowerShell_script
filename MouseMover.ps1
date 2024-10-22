Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseMover {
    [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);

    public const int MOUSEEVENTF_MOVE = 0x0001;

    public static void MoveMouse() {
        mouse_event(MOUSEEVENTF_MOVE, 1, 0, 0, 0);
        mouse_event(MOUSEEVENTF_MOVE, -1, 0, 0, 0); // Move back to original position
    }
}
"@

while ($true) {
    [MouseMover]::MoveMouse()
    Start-Sleep -Seconds 120  # Wait for 2 minutes
}
