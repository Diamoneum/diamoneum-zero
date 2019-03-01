![image](https://cdn.qwertycoin.org/images/press/other/qwc-github-2.png)

[![Build Status](https://travis-ci.org/qwertycoin-org/qwertycoin-zero.svg?branch=stage_1)](https://travis-ci.org/qwertycoin-org/qwertycoin-zero)
[![Build status](https://ci.appveyor.com/api/projects/status/yhiqfap4nfdommsb?svg=true)](https://ci.appveyor.com/project/qwertycoin-org/qwertycoin-zero)

This is the lite version of Qwertycoin GUI. It works via remote daemon and doesn't store blockchain on your PC. The remote nodes are rewarded for their service. Qwertycoin wallets, connected to masternode, are paying small additional fee (0.25% from the amount of transaction) to that node when are sending transactions through it. These fees are supposed to help to cover the costs of operating Qwertycoin nodes.

You can select remote node in Settings or add custom one. Go to menu Settings -> Preferences -> Connection tab to select Remote daemon.

Portable on Windows - stores wallet files, logs, config file in the same folder with executable, stores data in the default folder on Linux and Mac (`~/.Qwertycoin` and `~/Library/Application Support/Qwertycoin` respectively).

Comes with config containing the list of remote nodes.

It can import wallet files from [classic Qwertycoin wallet](https://github.com/qwertycoin-org/qwertycoin-gui) but it will take several minutes to refresh, and new wallet file will be incompatible with classic wallet.

### How To Compile


**1. Clone wallet sources**

```
git clone https://github.com/qwertycoin-org/qwertycoin-zero.git
```

**2. Set symbolic link to coin sources at the same level as `src`. For example:**

```
ln -s ../qwertycoin cryptonote
```

Alternative way is to create git submodule:

```
git submodule add https://github.com/qwertycoin-org/qwertycoin.git cryptonote
```

**3. Build**

```
mkdir build && cd build && cmake .. && make
```

## Donate

```
QWC: QWC1K6XEhCC1WsZzT9RRVpc1MLXXdHVKt2BUGSrsmkkXAvqh52sVnNc1pYmoF2TEXsAvZnyPaZu8MW3S8EWHNfAh7X2xa63P7Y
```
```
BTC: 1DkocMNiqFkbjhCmG4sg9zYQbi4YuguFWw
```
```
ETH: 0xA660Fb28C06542258bd740973c17F2632dff2517
```
```
BCH: qz975ndvcechzywtz59xpkt2hhdzkzt3vvt8762yk9
```
```
XMR: 47gmN4GMQ17Veur5YEpru7eCQc5A65DaWUThZa9z9bP6jNMYXPKAyjDcAW4RzNYbRChEwnKu1H3qt9FPW9CnpwZgNscKawX
```
```
ETN: etnkJXJFqiH9FCt6Gq2HWHPeY92YFsmvKX7qaysvnV11M796Xmovo2nSu6EUCMnniqRqAhKX9AQp31GbG3M2DiVM3qRDSQ5Vwq
```

#### Thanks

Cryptonote Developers, Bytecoin Developers, Monero Developers, Karbo Developers, Qwertycoin Community
