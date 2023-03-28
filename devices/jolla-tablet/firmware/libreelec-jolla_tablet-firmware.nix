{ stdenvNoCC, fetchFromGitHub, lib}:

stdenvNoCC.mkDerivation rec
{
  pname = "libreelec-jolla_tablet-firmware";
  version = "20230210";

  src = fetchFromGitHub
  {
    repo = "brcmfmac_sdio-firmware";
    owner = "LibreELEC";
    rev = "c70355f9ec6d015b91a5c3199aa08b433e2f7caf";
    sha256 = "sha256-Xi7vnons7W6KZAY6mTjfjH8SU/j+A6G1xOu5zOH3mSc=";
  };

  installPhase =
  ''
    runHook preInstall

    mkdir -p "$out/lib/firmware/brcm"
    cp -rv brcmfmac4330-sdio.txt "$out/lib/firmware/brcm/brcmfmac4330-sdio.Intel Corporation-BayTrail Platform.txt"

    runHook postInstall
  '';

  meta = with lib;
  {
    description = "Broadcom WiFi firmware for Jolla Tablet from LibreELEC";
    homepage = "https://github.com/LibreELEC/brcmfmac_sdio-firmware";
    license = licenses.unfreeRedistributableFirmware;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}

