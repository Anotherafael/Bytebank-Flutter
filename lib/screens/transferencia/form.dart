import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando Transferência';

const _labelValue = 'Valor';
const _tipValue = '0.00';

const _labelAccountNumber = 'Número da conta';
const _tipAccountNumber = '0000';

const _buttonText = 'Confirmar';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberController,
                tip: _tipAccountNumber,
                label: _labelAccountNumber,
              ),
              Editor(
                tip: _tipValue,
                controller: _valueController,
                label: _labelValue,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_buttonText),
                onPressed: () => _addTransfer(context),
              ),
            ],
          ),
        ));
  }

  void _addTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final addTransfer = Transfer(value, accountNumber);
      Navigator.pop(context, addTransfer);
    }
  }
}
