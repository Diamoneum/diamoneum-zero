![image](http://diamoneum.xyz/wp-content/uploads/2020/10/Diamoneum-Logo-Example-1-1.png)
#### Master Build Status
[![Build Status](https://travis-ci.org/qwertycoin-org/qwertycoin-zero.svg?branch=master)](https://travis-ci.org/Diamoneum/diamoneum-zero)
[![Build status](https://ci.appveyor.com/api/projects/status/udpsj8mf5x7s1rt6/branch/master?svg=true)](https://ci.appveyor.com/project/Diamoneum/diamoneum-zero/branch/master)


#### Development Build Status
[![Build Status](https://travis-ci.org/Diamoneum/diamoneum-zero.svg?branch=dev)](https://travis-ci.org/Diamoneum/diamoneum-zero) [![Build status](https://ci.appveyor.com/api/projects/status/udpsj8mf5x7s1rt6/branch/dev?svg=true)](https://ci.appveyor.com/project/Diamoneum/diamoneum-zero/branch/dev)

This is the lite version of Diamoneum GUI. It works via remote daemon and doesn't store blockchain on your PC. The remote nodes are rewarded for their service. Diamoneum wallets, connected to masternode, are paying small additional fee (0.25% from the amount of transaction) to that node when are sending transactions through it. These fees are supposed to help to cover the costs of operating Diamoneum nodes.

You can select remote node in Settings or add custom one. Go to menu Settings -> Preferences -> Connection tab to select Remote daemon.

Portable on Windows - stores wallet files, logs, config file in the same folder with executable, stores data in the default folder on Linux and Mac (`~/.Diamoneum` and `~/Library/Application Support/Diamoneum` respectively).

Comes with config containing the list of remote nodes.

It can import wallet files from [classic Diamoneum wallet](https://github.com/Diamoneum/Diamoneum-Gui) but it will take several minutes to refresh, and new wallet file will be incompatible with classic wallet.

# Table of contents
1. [Project Specs](#coinspecs)
2. [How to Compile Diamoneum](#howtocompile)
    1. [Qwertycoin for Linux](#build-linux)
    2. [Qwertycoin for Windows](#build-windows)
    3. [Qwertycoin for macOS](#build-apple)
3. [Downloads](#downloads)
4. [Useful Links](#usefullinks)
5. [Donate & Thanks](#donate)
6. [Copyright / License](#copypasta)

## Installing <a name="installing"></a>
We offer binary images of the latest releases here: https://releases.diamoneum.xyz

If you would like to compile yourself, read on.

### Coin Specs <a name="coinspecs"></a>
<table>
<tr><td>Ticker Symbol</td><td>DIAM</td></tr>
<tr><td>Algorithm</td><td>Cryptonight</td></tr>
<tr><td>Type</td><td>Proof of Work (PoW)</td></tr>
<tr><td>Block Time</td><td>120 Seconds</td></tr>
<tr><td>Premine</td><td>0.0 %</td></tr>
<tr><td>Decimals</td><td>8 Digits</td></tr>
<tr><td>Block Reward</td><td>Decrease by each block</td></tr>
,tr><td>Max Coin Supply </td><td>750,000,000 DIAM</td></tr>
<tr><td>P2P | RPC Port</td><td>57575 | 57576</td></tr>
</table>

More information at [diamoneum.xyz](https://diamoneum.xyz/)

# How To Compile <a name="howtocompile"></a>

#### Linux  <a name="build-linux"></a>

##### Prerequisites

- You will need the following packages: build-essential, [cmake (3.10 or higher)](https://github.com/Diamoneum/Diamoneum/wiki/E01.-Install-Cmake-3.10) and git;
- Most of these should already be installed on your system. For example on Ubuntu by running:
```
sudo apt-get install build-essential python-dev gcc g++ git cmake libboost-all-dev qtbase5-dev
```

##### Building

- After installing dependencies run simple script:
```
git clone --recurse-submodules https://github.com/Diamoneum/diamoneum-zero
cd ./diamoneum-zero
mkdir ./build
cd ./build
cmake -DBUILD_ALL:BOOL=TRUE ..
cmake --build . --config Release
```
- If all went well, it will complete successfully, and you will find all your binaries in the `./build/src/Release` directory.

#### Windows 10 <a name="build-windows"></a>

##### Prerequisites

- Install [Visual Studio 2017 Community Edition](https://www.visualstudio.com/thank-you-downloading-visual-studio/?sku=Community&rel=15&page=inlineinstall);
- When installing Visual Studio, it is **required** that you install **Desktop development with C++** and the **VC++ v140 toolchain** when selecting features. The option to install the v140 toolchain can be found by expanding the "Desktop development with C++" node on the right. You will need this for the project to build correctly;
- Make sure that bundled cmake version is 3.10 or higher.

##### Building

- From the start menu, open "x64 Native Tools Command Prompt for vs2017";
- And the run the following commands:
```
git clone --recurse-submodules https://github.com/Diamoneum/diamoneum-zero
cd diamoneum-zero
md build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DBUILD_ALL:BOOL=TRUE ..
cmake --build . --config Release
```
- If all went well, it will complete successfully, and you will find all your binaries in the `.\build\src\Release` directory;
- Additionally, a `.sln` file will have been created in the `build` directory. If you wish to open the project in Visual Studio with this, you can.

#### Apple macOS <a name="build-apple"></a>

##### Prerequisites

- Install Xcode and Developer Tools;
- Install [cmake](https://cmake.org/). See [here](https://stackoverflow.com/questions/23849962/cmake-installer-for-mac-fails-to-create-usr-bin-symlinks) if you are unable to call `cmake` from the terminal after installing;
- Install git.

##### Building

- After installing dependencies run simple script:
```
git clone --recurse-submodules https://github.com/Diamoneum/diamoneum-zero
cd ./diamoneum-zero
mkdir ./build
cd ./build
cmake -DBUILD_ALL:BOOL=TRUE ..
cmake --build . --config Release
```
- If all went well, it will complete successfully, and you will find all your binaries in the `./build/src/Release` directory.

## Donate <a name="donate"></a>

```
DIAM: diamowieNXVVxGW2GbJERHgawnfvWokZ6bHnzYC2w67KMyV1BiT9Aux6JzY1wg4HmJHMoYJQdyj5LHKKEsFP2FBsA5aimMoQ46
```
```
BTC: 16GLbf566NGF3893gZmB9hY4HiaNbh3GVe
```
```
ETH: 0xA6792e1704d2A77A15d504c98e006bc7d939Ee0b
```
```
XMR: 83LixYjeNejZFiGzDWRoLS6qjbtHUxLJUHh9KwsmWsiqPi3tu8qcP7w2veX3xm3c7t6AVgy3m7EKXSugmt3VxhLRGdAjpE4
```
```
ETN: etnjzZn6KVHHgZf7MDrcYcCg7tVuKN1vYSqjQoYD4sF1hGnGMK5FKtc4TH5ytggf4q2L19kEfxQtKMx21fxhqEyiA97Nzurpkk
```

### Downloads <a name="downloads"></a>
| Operating System | Download                                 |
| ---------------- | ---------------------------------------- |
| Windows 32       | https://releases.diamoneum.xyz/get/zero/latest/win32 |
| Windows 64       | https://releases.diamoneum.xyz/get/zero/latest/win64 |
| macOS 10.8 & Later | https://releases.diamoneum.xyz/get/zero/latest/macos |
| Linux DEB         | https://releases.diamoneum.xyz/get/zero/latest/linux/deb |
| Linux RPM         | https://releases.diamoneum.xyz/get/zero/latest/linux/rpm4 |
| Other platforms      | https://releases.diamoneum.xyz |

### Useful Links <a name="usefullinks"></a>
<table>
<tr><td>Website</td><td>https://diamoneum.xyz</td></tr>
<tr><td>Bitcointalk ANN</td><td>Coming Soon</td></tr>
<tr><td>Explorer</td><td>https://explorer.diamoneum.xyz</td></tr>
<tr><td>Pool Explorer</td><td>https://explorer.diamoneum.xyz/#network</td></tr>
<tr><td>Node Map</td><td>https://nodes.diamoneum.xyz</td></tr>
<tr><td>Wallets</td><td>https://releases.diamoneum.xyz</td></tr>
<tr><td>Web Wallet</td><td>https://wallet.diamoneum.xyz</td></tr>
<tr><td>Masternode Setup</td><td>https://github.com/Diamoneum/Diamoneum/wiki</td></tr>
<tr><td>Blockfolio</td><td>https://blockfolio.com/#get-app</td></tr>
<tr><td>CoinGecko</td><td>https://www.coingecko.com/en/coins/diamoneum</td></tr>
<tr><td>Delta</td><td>https://delta.app</td></tr>
<tr><td>Discord</td><td>https://discord.gg/YVwYZ6Z</td></tr>
<tr><td>Facebook</td><td>https://www.facebook.com/Diamoneum.Diam</td></tr>
</table>

#### Thanks <a name="thanks"></a>

Cryptonote Developers, Bytecoin Developers, Monero Developers, Karbo Developers, The Qwertycoin Community, The Diamoneum Community

### Copypasta for license when editing files  <a name="copypasta"></a>

Hi Diamoneum contributor, thanks for forking and sending back Pull Requests. Extensive docs about contributing are in the works or elsewhere. For now this is the bit we need to get into all the files we touch. Please add it to the top of the files, see [src/config/CryptoNoteConfig.h](https://github.com/Diamoneum/Diamoneum/blob/master/src/config/CryptoNoteConfig.h) for an example.

```
// Copyright (c) 2020-2021 The Diamoneum Developers
//
// Please see the included LICENSE file for more information.
```
