
# Timed-based one time password manager "totptool"

This utility enables simple "google authenticator" style timed OTP generation from linux command line.

Keys are stored GPG encryped in $HOME/.2fa/

![example](https://github.com/eringr/totptool/blob/main/.example.gif)

## Requirements

oathtool, gpg

## Installation

Export following variables in your shell startup script:

  - `TOTP_UID` - GPG User ID for key encrypt/decrypt
  - `TOTP_KID` - GPG Key ID for key encrypt/decrypt
  - `TOTP_BASE` - (Optional) Set to override default key storage location with absolute path

Place totptool on PATH, probably?

On the off-chance that you use fish shell, install totptool.fish to $HOME/.config/fish/completions to enable tab completions

## Usage

  - `totptool add` - Add service (interactive)
  - `totptool gen <service>` - Generate timed OTP for service
  - `totptool gen <service> --scriptable` - Generate timed otp for service with script-friendly output
  - `totptool list` - List services

