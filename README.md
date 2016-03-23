# Wifish

Wifish (from wifi.sh) is meant to do very little. Design Goals are

1. List Available Wifi APs
2. Connect to an AP

That is all.

## Requirements

1. `wpa_supplicant` - Tested with 2.4.
2. `gawk` - Sorry other awks, Multidimensional arrays make this much cleaner.
3. `dialog` - *Optional* For ncurses menu and password prompt

## Usage

### Get it
clone this repo
```
% git clone git://github.com/Ardunux/Ardunux_WifiSh
```

### Configure it

*Optional*

A few environment variables can modify the behavior of wifish

* `SCAN_SECONDS` - How long an AP scan waits for scanned AP results.  Default
  is 0 seconds, as a running `wpa_supplicant` will generally have a viable
  scan\_result already. If you have a problem not finding APs, try 

```
SCAN_SECONDS=5 wifish
```

* `WIFISH_DEFAULT` - Sets what Command runs when wifish is called with no arguments. Defaults to `menu` or `list`, depending on if `dialog` is available. 

### Use it

run wifish, after clone.

```
% cd wifish
% ./wifish
```
run wifish, after install.

```
% wifish
```

This should list all available APs.

Without arguments, wifish will automatically present a menu of APs if you have `dialog` installed, otherwise it will show a list of APs. This default
can be configured (see Configuration).


* No `dialog` installed, `wifish` with no args calls

    ```
    % wifish list
    ```

* `dialog` installed, `wifish` with no args calls

    ```
    % wifish menu
    ```

## Commands

All commands can be shortened to uniqueness

`wifish m` and `wifish menu` both run the menu command

#### Currently implemented

* `list` - Lists all available APs (from iw scan)
* `menu` - Menu of APs to connect to (requires `dialog`)
* `connect <ssid>` - Connects to an AP
  `wifish c MySSID`

Currently works when connecting to Open, WPA-PSK, and WPA2-PSK (and mixed-mode WPA) with or without TKIP

#### In Testing

* `connect` - Without args, tries to find something to connect to.

  Are you feeling lucky? Maybe use `wifish menu` instead

## Installation

#### Void Linux

`% xbps-install -S wifish`

#### Other Linux

```
% sudo ./install.sh
```

Now you can use 'wifish' from anywhere without the fully qualified path

## Uninstall

#### Arch Linux

```
% uninstall.sh
```

#### Void LInux

`% xbps-remove wifish`

#### Other Linux

```
% rm -rf /var/lib/wifish /usr/local/bin/wifish /etc/sv/wpa_supplicant
```

## Support

* <a href="FAQ.md">F.A.Q.</a>
* file a gh issue or catch me on #voidlinux on the Freenode IRC Network
