{ ... }: {
  jovian.steamos = {
    enableZram = true;                 # Сжатие памяти
    enableEarlyOOM = true;             # Защита от зависаний
    useSteamOSConfig = false;          # Чтобы Jovian не перетирал твои конфиги своими
    enableSysctlConfig = true;         # Твики ядра Valve
    enableBluetoothConfig = true;      # Стабильный геймпад по синезубу
    enableAutoMountUdevRules = true;   # Автомонтирование SD-карт
    enableDefaultCmdlineConfig = true; # Параметры загрузки Valve
  };
}
