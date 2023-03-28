{ config, lib, pkgs, ... }:

{
  mobile.device.name = "Jolla Tablet";
  mobile.device.identity =
  {
   name = "Jolla Tablet";
   manufacturer = "Jolla";
  };
  mobile.device.supportLevel = "unsupported";

  mobile.hardware =
  {
    soc = "generic-x86_64";
    screen =
    {
      width = 1536;
      height = 2048;
    };
    ram = 1024 * 2;
  };

  mobile.system.type = "uefi";

  mobile.boot.stage-1 =
  {
    kernel =
    {
      useNixOSKernel = lib.mkDefault true;
      additionalModules =
      [
        "uhci_hcd"
        "ehci_hcd"
        "ehci_pci"
        "ohci_hcd"
        "ohci_pci"
        "xhci_hcd"
        "xhci_pci"

        "dwc3_pci"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "sdhci_acpi"

        "brcmfmac4330"
      ];
    };
  };

  hardware.firmware =
  [
    (pkgs.callPackage ./firmware/libreelec-jolla_tablet-firmware.nix {})
  ];

  mobile.quirks.supportsStage-0 = lib.mkDefault true;

  hardware.enableRedistributableFirmware = true;
  hardware.wirelessRegulatoryDatabase = true;
}
