# Containerized Firefox with WireGuard VPN

Run a privacy-focused Firefox in a container with WireGuard VPN support.

## VPN Configuration

Add your WireGuard configuration to the `vpn` directory. The configuration file should be named `wg0.conf`.

## Usage

Clone this repository and run `bash vpnbrowser.sh`. Alternatively, you can symlink `vpnbrowser.sh` to a directory in your PATH and run it from anywhere.

## Use your Firefox profile

To use your Firefox profile, create a tarball of an existing `.mozilla` directory and place it in the `shared` directory. The tarball should be named `firefox-profile.tar`. The script will extract the tarball on each startup.

## Persistent Firefox profile

To persist your Firefox profile, create a `firefox-profile` directory in this repository and copy the `docker-compose.override.yml.persistent` file to `docker-compose.override.yml`.
