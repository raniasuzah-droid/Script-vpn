# ULTRASONIC VPN - SELF HOSTED (hardened fork)

Fork mandiri. Tidak ada dependensi ke repo developer.

## INSTALL

```
apt update -y && apt install -y wget screen curl jq \
  && wget -q https://raw.githubusercontent.com/raniasuzah-droid/Script-vpn/main/setup.sh \
  && chmod +x setup.sh && screen -S install ./setup.sh
```

## UPDATE

```
wget -q https://raw.githubusercontent.com/raniasuzah-droid/Script-vpn/main/menu/update.sh \
  && chmod +x update.sh && ./update.sh
```

## LICENSE

- Lokal: `/usr/local/etc/sc-license` (dibuat otomatis saat install, lifetime)
- Helper: `/usr/local/bin/sc-license-get`
- Remote fallback: `raniasuzah-droid/license` -> `main/ip`

## PERUBAHAN DARI VERSI ASLI

| Item | Asli | Sekarang |
|---|---|---|
| Config | `eval` payload Google Drive | inline, tanpa token |
| Repo | `kapal-api-cup` | `raniasuzah-droid` |
| Lisensi | wajib online | lokal dulu, remote fallback |
| Reboot | cron harian 00:05 | dihapus |
| SSH key | inject dari pastebin | dihapus |
| Registrasi | push ke repo developer | dimatikan |
