import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Simple Interest Calculator App',
    home: SIForm(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var currencies = ['Rupees', 'Dollars', 'Pounds'];
  final double _minimumpadding = 5.0;

  var _currentSelectedItem = 'Rupees';
  var displayResult = '';
  TextEditingController principal = TextEditingController();
  TextEditingController roi = TextEditingController();
  TextEditingController term = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(_minimumpadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: principal,
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          labelStyle: textStyle,
                          hintText: 'Enter Principal Amount e.g. 12000',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: roi,
                      decoration: InputDecoration(
                          labelText: 'Rate Of Interest',
                          hintText: 'In Percent',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          style: textStyle,
                          controller: term,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in years',
                              labelStyle: textStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentSelectedItem,
                          onChanged: (String newValueSelected) {
                            _onDropDownItemSelected(newValueSelected);
                          },
                        )),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumpadding, bottom: _minimumpadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          child: Text(
                            'Calculate',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              this.displayResult = _calculateTotalReturns();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: _minimumpadding * 5,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Reset',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_minimumpadding * 2),
                  child: Text(this.displayResult, style: textStyle),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumpadding * 5),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentSelectedItem = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double p = double.parse(principal.text);
    double r = double.parse(roi.text);
    double t = double.parse(term.text);

    double total = p + (p + r + t) / 100;
    String result =
        'After $t years, your investment will be worth $total $_currentSelectedItem';
    return result;
  }

  void _reset() {
    principal.text = '';
    roi.text = '';
    term.text = '';
    displayResult = '';
    _currentSelectedItem = currencies[0];
  }
}
