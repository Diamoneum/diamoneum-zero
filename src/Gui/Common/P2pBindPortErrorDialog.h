// Copyright (c) 2015-2017, The Bytecoin developers
// Copyright (c) 2017-2018, The Karbo developers
// Copyright (c) 2019, The Qwertycoin developers
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

#include <QDialog>

namespace Ui {
class P2pBindPortErrorDialog;
}

namespace WalletGui {

class P2pBindPortErrorDialog : public QDialog {
  Q_OBJECT
  Q_DISABLE_COPY(P2pBindPortErrorDialog)

public:
  P2pBindPortErrorDialog(quint16 _oldPort, quint16 _newPort, QWidget* _parent);
  ~P2pBindPortErrorDialog();

  quint16 getNewPort() const;
  void accept() override;

private:
  QScopedPointer<Ui::P2pBindPortErrorDialog> m_ui;
};

}
