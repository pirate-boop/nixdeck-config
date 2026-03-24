{ ... }: {
  jovian.steam = {
    enable = true;
    autoLoginUser = "kori";
    user = "kori";
    desktopSession = "niri"; # Твой основной десктоп
  };

  # Сетевые фиксы (чтобы Steam не висел на проверке соединения)
  environment.variables = {
    STEAM_CONNECTIVITY_CHECK_DISABLED = "1";
    DISABLE_STEAM_WIFI_CHECK = "1";
    STEAM_IS_ONLINE_IF_ANY_INTERFACE_UP = "1";
    CEF_REMOTE_DEBUGGING = "1";
  };
}
