package co.istad.SRBank.MainApplication;

import co.istad.SRBank.util.LoginAuth;
import co.istad.SRBank.util.MainMenu;
import co.istad.SRBank.util.ScannerUtil;


public class SRBank {

    public static void main(String[] args) {

        LoginAuth loginAuth = LoginAuth.getInstance();

        while (true) {
            System.out.print("Enter Username:");
            String Username = ScannerUtil.scanText();
            System.out.print("Enter Password:");
            String password = ScannerUtil.scanPassword();

            if (loginAuth.loginAuthMainApplication(Username, password)) {
                System.out.printf("Login as %s successfully\nPress Enter to Continue", Username);
                ScannerUtil.PressEnter();
                MainMenu.menu();
                break;
            } else {
                System.out.println("Invalid User Input");
            }
        }

    }
}
