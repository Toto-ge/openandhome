@echo "Dieses Skript setzt die folgenden Einstellungen auf den Auslieferungszustand:" 
@echo "" 
@echo "Wifizugangsdaten" 
@echo "Adminpasswort" 
@echo "" 
@echo "Sie muessen den Sensor danach erneut in Ihr WLAN einbinden." 
@echo "Achten Sie drauf, dass sich die Datei SerialSend.exe im gleichen Verzeichnis befindet." 
@echo "" 
@echo "Druecken Sie eine beliebige Taste . . ." 
pause
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "WifiSSID ssid\r\n" 
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "WifiKey wpakey\r\n" 
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "WifiSSID2 ssid\r\n" 
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "WifiKey2 wpakey\r\n"
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "password\r\n"  
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "ResetFlashWriteCounter\r\n" 
SerialSend.exe /baudrate 115200 /closedelay 500 /hex "Save\r\n" 
pause
SerialSend.exe /baudrate 115200  /closedelay 500 /hex "reboot\r\n"
@echo "" 
@echo "Wenn das Skript keinen Fehler zeigt, dann koennen Sie den Sensor erneut wie im Handbuch beschrieben einrichten."
@echo "Druecken Sie eine beliebige Taste . . ." 
pause

