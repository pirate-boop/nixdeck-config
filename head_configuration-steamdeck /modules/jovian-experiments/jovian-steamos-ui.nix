{ ... }: {
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = "kori";
    desktopSession = "niri";

    # Сетевые фиксы должны быть ВНУТРИ блока jovian.steam
    environment = {
      STEAM_CONNECTIVITY_CHECK_DISABLED = "1";
      DISABLE_STEAM_WIFI_CHECK = "1";
      STEAM_IS_ONLINE_IF_ANY_INTERFACE_UP = "1";
      CEF_REMOTE_DEBUGGING = "1";
    };
  };
}
