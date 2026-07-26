{ pkgs, ... }:
let
  serverIP = "192.168.0.10";
  micPort = 12345;
  micSource = "alsa_input.pci-0000_00_1b.0.analog-stereo";
  micSh = pkgs.writeShellScript "mic-sender" ''
    FIFO=/tmp/mic-sender-fifo
    trap 'rm -f $FIFO; exit 0' INT TERM EXIT
    while true; do
      rm -f $FIFO
      mkfifo $FIFO
      ${pkgs.pipewire}/bin/pw-record --target=${micSource} -a --format s16 --rate 48000 --channels 1 $FIFO &
      REC=$!
      ${pkgs.netcat}/bin/nc ${serverIP} ${builtins.toString micPort} < $FIFO
      kill $REC 2>/dev/null
      wait $REC 2>/dev/null
      sleep 1
    done
  '';
in
{
  systemd.user.services.mic-sender = {
    description = "Send mic audio to Moonlight server";
    wantedBy = [ "default.target" ];
    after = [ "pipewire.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${micSh}";
      Restart = "always";
      RestartSec = 3;
    };
  };
}
