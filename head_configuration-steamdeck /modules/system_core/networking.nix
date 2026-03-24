#****************************************************************#
# |============================================================| #
# |NETWORKING                                                  | #
# |============================================================| #
#****************************************************************#
{ ... }: {
  networking.hostName = "NIXDECK";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;
  networking.hosts = { "198.18.4.40" = [ "steamdeckrepo.com" ]; };
  networking.networkmanager.settings = {
    connectivity.enabled = false;
    connection."ipv6.method" = "ignore";
  };
  services.resolved.enable = true;
  networking.firewall.enable = false;
}
