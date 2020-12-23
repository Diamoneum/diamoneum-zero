// Copyright (c) 2016-2017, The Qwertycoin developers
// Copyright (c) 2020-2021, The Diamoneum developers
//
// This file is part of Diamoneum.
//
// Diamoneum is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Diamoneum is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with Diamoneum.  If not, see <http://www.gnu.org/licenses/>.

#pragma once

#include "ICryptoNoteAdapter.h"
#include "IWalletAdapter.h"

namespace Logging {
  class ILogger;
}

namespace WalletGui {

class DeterministicWalletAdapter : public QObject
{
    Q_OBJECT

public:
  explicit DeterministicWalletAdapter(QObject *parent = 0);

  virtual ~DeterministicWalletAdapter();

  AccountKeys generateDeterministicKeys();
  bool isDeterministic(AccountKeys& _keys) const;
};

}
