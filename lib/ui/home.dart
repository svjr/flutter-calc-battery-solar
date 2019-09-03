import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculo_bateria/bo/bateria_bo.dart';
import 'package:flutter_calculo_bateria/bo/celula_bo.dart';
import 'package:flutter_calculo_bateria/bo/equipamento_bo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences sharedPreferences;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  static String share_field_eq_potencia_maxima = "eq_potencia_maxima";
  static String share_field_eq_potencia_media = "eq_potencia_media";
  static String share_field_eq_tensao_maxima = "eq_tensao_maxima";
  static String share_field_eq_tensao_nominal = "eq_tensao_nominal";
  static String share_field_eq_tensao_minima = "eq_tensao_minima";

  static String share_field_cel_saida_maxima = "cel_saida_maxima";
  static String share_field_cel_capacidade = "cel_capacidade";
  static String share_field_cel_tensao_maxima = "cel_tensao_maxima";
  static String share_field_cel_tensao_nominal = "cel_tensao_nominal";
  static String share_field_cel_tensao_minima = "cel_tensao_minima";

  static String share_field_bat_bateria_s = "bat_bateria_s";
  static String share_field_bat_bateria_p = "bat_bateria_p";

  final FocusNode  _eqPotenciaMaximaFocus = new FocusNode ();
  final FocusNode  _eqPotenciaMediaFocus = new FocusNode ();
  final FocusNode  _eqTensaoMaximaFocus = new FocusNode ();
  final FocusNode  _eqTensaoNominalFocus = new FocusNode ();
  final FocusNode  _eqTensaoMinimaFocus = new FocusNode ();
  final FocusNode _eqCorrenteMaximaFocus = new FocusNode();
  final FocusNode _eqCorrenteMediaFocus = new FocusNode();

  final FocusNode _celTensaoNominalFocus = new FocusNode();
  final FocusNode _celTensaoMaximaFocus = new FocusNode();
  final FocusNode _celTensaoMinimaFocus = new FocusNode();
  final FocusNode _celSaidaMaximaFocus = new FocusNode();
  final FocusNode _celCapacidadeFocus = new FocusNode();
  final FocusNode _celPotenciaFocus = new FocusNode();
  final FocusNode _celBateriaSFocus = new FocusNode();
  final FocusNode _celBateriaPFocus = new FocusNode();

  final FocusNode _batBateriaSFocus = new FocusNode();
  final FocusNode _batBateriaPFocus = new FocusNode();
  final FocusNode _batTotalBateriasFocus = new FocusNode();
  final FocusNode _batTensaoNominalFocus = new FocusNode();
  final FocusNode _batTensaoMaximaFocus = new FocusNode();
  final FocusNode _batTensaoMinimaFocus= new FocusNode();
  final FocusNode _batCapacidadeFocus = new FocusNode();
  final FocusNode _batSaidaMaximaFocus = new FocusNode();
  final FocusNode _batPotenciaFocus = new FocusNode();
  final FocusNode _batAutonomiaFocus = new FocusNode();

  final TextEditingController _eqPotenciaMaximaController = new TextEditingController();
  final TextEditingController _eqPotenciaMediaController = new TextEditingController();
  final TextEditingController _eqTensaoMaximaController = new TextEditingController();
  final TextEditingController _eqTensaoNominalController = new TextEditingController();
  final TextEditingController _eqTensaoMinimaController = new TextEditingController();
  final TextEditingController _eqCorrenteMaximaController = new TextEditingController();
  final TextEditingController _eqCorrenteMediaController = new TextEditingController();

  final TextEditingController _celTensaoNominalController = new TextEditingController();
  final TextEditingController _celTensaoMaximaController = new TextEditingController();
  final TextEditingController _celTensaoMinimaController = new TextEditingController();
  final TextEditingController _celSaidaMaximaController = new TextEditingController();
  final TextEditingController _celCapacidadeController = new TextEditingController();
  final TextEditingController _celPotenciaController = new TextEditingController();
  final TextEditingController _celBateriaSController = new TextEditingController();
  final TextEditingController _celBateriaPController = new TextEditingController();

  final TextEditingController _batBateriaSController = new TextEditingController();
  final TextEditingController _batBateriaPController = new TextEditingController();
  final TextEditingController _batTotalBateriasController = new TextEditingController();
  final TextEditingController _batTensaoNominalController = new TextEditingController();
  final TextEditingController _batTensaoMaximaController = new TextEditingController();
  final TextEditingController _batTensaoMinimaController = new TextEditingController();
  final TextEditingController _batCapacidadeController = new TextEditingController();
  final TextEditingController _batSaidaMaximaController = new TextEditingController();
  final TextEditingController _batPotenciaController = new TextEditingController();
  final TextEditingController _batAutonomiaController = new TextEditingController();



  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        appBar: AppBar(title: Text('Calculadora - Baterias')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _savePreferences();
          },
          child: Icon(
            Icons.save_alt,
            color: Colors.black54,
            size: 25,
          ),
          backgroundColor: purpleLigth,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(5.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Card(
                  color: Color(0xFF4f2671),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  elevation: 2.0,
                  child: Container(
                    height: 340.0,
                    decoration: BoxDecoration(color: Color(0xFF7D44AA).withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildHeaderCard(" ..:: EQUIPAMENTO"),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, top: 10.0),
                          child: Column(
                            children: <Widget>[
                              buildField("Potencia Máxima:", _eqPotenciaMaximaController, "(W)", true,_eqPotenciaMaximaFocus,_eqPotenciaMediaFocus),
                              buildField("Potência Média:", _eqPotenciaMediaController, "(W)", true,_eqPotenciaMediaFocus,_eqTensaoMaximaFocus),
                              buildField("Tensão Máxima:", _eqTensaoMaximaController, "(V)", true,_eqTensaoMaximaFocus,_eqTensaoNominalFocus),
                              buildField("Tensão Nominal:", _eqTensaoNominalController, "(V)", true,_eqTensaoNominalFocus,_eqTensaoMinimaFocus),
                              buildField("Tensão Mínima:", _eqTensaoMinimaController, "(V)", true,_eqTensaoMinimaFocus,_celTensaoNominalFocus),
                              buildField("Corrente Máxima:", _eqCorrenteMaximaController, "(A)", false,_eqCorrenteMaximaFocus,_celTensaoNominalFocus),
                              buildField("Corrente Média:", _eqCorrenteMediaController, "(A)", false,_eqCorrenteMediaFocus,_celTensaoNominalFocus),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFF4f2671),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  elevation: 2.0,
                  child: Container(
                    height: 380.0,
                    decoration: BoxDecoration(color: Color(0xFF7D44AA).withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildHeaderCard(" ..:: CÉLULA"),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, top: 10.0),
                          child: Column(
                            children: <Widget>[
                              buildField("Tensão Nominal:", _celTensaoNominalController, "(v)", true,_celTensaoNominalFocus,_celTensaoMaximaFocus),
                              buildField("Tensão Máxima:", _celTensaoMaximaController, "(v)", true,_celTensaoMaximaFocus,_celTensaoMinimaFocus),
                              buildField("Tensão Mínima:", _celTensaoMinimaController, "(v)", true,_celTensaoMinimaFocus,_celSaidaMaximaFocus),
                              buildField("Saída Máxima:", _celSaidaMaximaController, "(mA)", true,_celSaidaMaximaFocus,_celCapacidadeFocus),
                              buildField("Capacidade:", _celCapacidadeController, "(mAh)", true,_celCapacidadeFocus,_batBateriaSFocus),
                              buildField("Potência:", _celPotenciaController, "(Wh)", false,_celPotenciaFocus,_batBateriaSFocus),
                              buildField("Bateria em S:", _celBateriaSController, "", false,_celPotenciaFocus,_batBateriaSFocus),
                              buildField("Bateria em P:", _celBateriaPController, "", false,_celPotenciaFocus,_batBateriaSFocus),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFF4f2671),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  elevation: 2.0,
                  child: Container(
                    height: 460,
                    decoration: BoxDecoration(color: Color(0xFF7D44AA).withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildHeaderCard(" ..:: PACK BATERIA"),
                        Container(
                          padding: EdgeInsets.only(left: 15.0, top: 10.0),
                          child: Column(
                            children: <Widget>[
                              buildField("Bateria em S:", _batBateriaSController, " ", true,_batBateriaSFocus,_batBateriaPFocus),
                              buildField("Bateria em P:", _batBateriaPController, " ", true,_batBateriaPFocus,_batBateriaPFocus),
                              buildField("Total de Baterias:", _batTotalBateriasController, " ", false,_batTotalBateriasFocus,_batBateriaPFocus),
                              buildField("Tensão Nominal:", _batTensaoNominalController, "(V)", false,_batTensaoNominalFocus,_batBateriaPFocus),
                              buildField("Tensão Máxima:", _batTensaoMaximaController, "(V)", false,_batTensaoMaximaFocus,_batBateriaPFocus),
                              buildField("Tensão Mínima:", _batTensaoMinimaController, "(V)", false,_batTensaoMinimaFocus,_batBateriaPFocus),
                              buildField("Capacidade:", _batCapacidadeController, "(Ah)", false,_batCapacidadeFocus,_batBateriaPFocus),
                              buildField("Saída Máxima:", _batSaidaMaximaController, "(A)", false,_batSaidaMaximaFocus,_batBateriaPFocus),
                              buildField("Potência:", _batPotenciaController, "(Wh)", false,_batPotenciaFocus,_batBateriaPFocus),
                              buildField("Autonomia Média:", _batAutonomiaController, "(h)", false,_batAutonomiaFocus,_batBateriaPFocus),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                    color: Color(0xFF4f2671),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    elevation: 0.0,
                    child: Container(
                      height: 70,
                      child: Text(
                        "by sergiovallejr@gmail.com",
                        style: TextStyle(fontSize: 12, color: purpleLigth),
                      ),
                    )),
              ])),
        )));
  }

  Widget buildHeaderCard(String title) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(color: Color(0xFF4f2671), fontSize: 13, fontWeight: FontWeight.bold),
          )
        ]),
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xFFE5BDFF).withOpacity(0.5),
            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0))));
  }

  Widget buildField(String label, TextEditingController controllerField, String unit, bool isEnabled, FocusNode  focusField, FocusNode  focusNextField) {
    return Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 15.0),
              ),
            )),
            Container(
              width: 100,
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                textInputAction:TextInputAction.next,
                focusNode: focusField,
                onFieldSubmitted: (term){
                  focusField.unfocus();
                  FocusScope.of(context).requestFocus(focusNextField);
                },
                enabled: isEnabled,
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                validator: (String valor) {
                  var result = double.tryParse(valor);
                  if (result == null && isEnabled) {
                    return "";
                  } else {
                    return null;
                  }
                },
                controller: controllerField,
                decoration: InputDecoration(
                  filled: true,
                  errorStyle: TextStyle(fontSize: 0.01),
                  fillColor: isEnabled == true ? purpleLigth : purpleLigth.withOpacity(0.3),
                  focusedErrorBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 3.0), borderRadius: BorderRadius.circular(4.0)),
                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 3.0), borderRadius: BorderRadius.circular(4.0)),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Color(0xFF4f2671), fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 70,
              padding: EdgeInsets.all(5.0),
              child: Text(
                unit,
                style: TextStyle(fontSize: 12.0),
              ),
            )
          ],
        ));
  }

  Future _loadPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _eqPotenciaMaximaController.text = sharedPreferences.getDouble(share_field_eq_potencia_maxima) != null
        ? sharedPreferences.getDouble(share_field_eq_potencia_maxima).toString()
        : "0.0";
    _eqPotenciaMediaController.text = sharedPreferences.getDouble(share_field_eq_potencia_media) != null
        ? sharedPreferences.getDouble(share_field_eq_potencia_media).toString()
        : "0.0";
    _eqTensaoMaximaController.text = sharedPreferences.getDouble(share_field_eq_tensao_maxima) != null
        ? sharedPreferences.getDouble(share_field_eq_tensao_maxima).toString()
        : "0.0";
    _eqTensaoMinimaController.text = sharedPreferences.getDouble(share_field_eq_tensao_minima) != null
        ? sharedPreferences.getDouble(share_field_eq_tensao_minima).toString()
        : "0.0";
    _eqTensaoNominalController.text = sharedPreferences.getDouble(share_field_eq_tensao_nominal) != null
        ? sharedPreferences.getDouble(share_field_eq_tensao_nominal).toString()
        : "0.0";

    _celTensaoMinimaController.text = sharedPreferences.getDouble(share_field_cel_tensao_minima)!= null
        ? sharedPreferences.getDouble(share_field_cel_tensao_minima).toString()
        : "0.0";
    _celTensaoNominalController.text = sharedPreferences.getDouble(share_field_cel_tensao_nominal)!= null
        ? sharedPreferences.getDouble(share_field_cel_tensao_nominal).toString()
        : "0.0";
    _celTensaoMaximaController.text = sharedPreferences.getDouble(share_field_cel_tensao_maxima)!= null
        ? sharedPreferences.getDouble(share_field_cel_tensao_maxima).toString()
        : "0.0";
    _celSaidaMaximaController.text = sharedPreferences.getDouble(share_field_cel_saida_maxima)!= null
        ? sharedPreferences.getDouble(share_field_cel_saida_maxima).toString()
        : "0.0";
    _celCapacidadeController.text = sharedPreferences.getDouble(share_field_cel_capacidade)!= null
        ? sharedPreferences.getDouble(share_field_cel_capacidade).toString()
        : "0.0";

    _batBateriaPController.text = sharedPreferences.getDouble(share_field_bat_bateria_p)!= null
        ? sharedPreferences.getDouble(share_field_bat_bateria_p).toString()
        : "0.0";
    _batBateriaSController.text = sharedPreferences.getDouble(share_field_bat_bateria_s)!= null
        ? sharedPreferences.getDouble(share_field_bat_bateria_s).toString()
        : "0.0";
    calcular();
  }

  Future _savePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      if (_formKey.currentState.validate()) {
        sharedPreferences.setDouble(share_field_eq_potencia_maxima, double.parse(_eqPotenciaMaximaController.text));
        sharedPreferences.setDouble(share_field_eq_potencia_media, double.parse(_eqPotenciaMediaController.text));
        sharedPreferences.setDouble(share_field_eq_tensao_maxima, double.parse(_eqTensaoMaximaController.text));
        sharedPreferences.setDouble(share_field_eq_tensao_minima, double.parse(_eqTensaoMinimaController.text));
        sharedPreferences.setDouble(share_field_eq_tensao_nominal, double.parse(_eqTensaoNominalController.text));

        sharedPreferences.setDouble(share_field_cel_tensao_minima, double.parse(_celTensaoMinimaController.text));
        sharedPreferences.setDouble(share_field_cel_tensao_nominal, double.parse(_celTensaoNominalController.text));
        sharedPreferences.setDouble(share_field_cel_tensao_maxima, double.parse(_celTensaoMaximaController.text));
        sharedPreferences.setDouble(share_field_cel_saida_maxima, double.parse(_celSaidaMaximaController.text));
        sharedPreferences.setDouble(share_field_cel_capacidade, double.parse(_celCapacidadeController.text));

        sharedPreferences.setDouble(share_field_bat_bateria_p, double.parse(_batBateriaPController.text));
        sharedPreferences.setDouble(share_field_bat_bateria_s, double.parse(_batBateriaSController.text));
        calcular();
        final snack = SnackBar(
          content: Text(
            'Dados salvos com sucesso.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: purpleDark,
          duration: Duration(seconds: 2),
        );
        _scaffoldState.currentState.removeCurrentSnackBar();
        _scaffoldState.currentState.showSnackBar(snack);
      } else {
        final snack = SnackBar(
          content: Text(
            'Existem dados inválidos.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        );
        _scaffoldState.currentState.removeCurrentSnackBar();
        _scaffoldState.currentState.showSnackBar(snack);
      }
    });
  }

  void calcular() {
    double _eq_potencia_maxima = sharedPreferences.getDouble(share_field_eq_potencia_maxima);
    double _eq_potencia_media = sharedPreferences.getDouble(share_field_eq_potencia_media);
    double _eq_tensao_maxima = sharedPreferences.getDouble(share_field_eq_tensao_maxima);
    double _eq_tensao_minima = sharedPreferences.getDouble(share_field_eq_tensao_minima);
    double _eq_tensao_nominal = sharedPreferences.getDouble(share_field_eq_tensao_nominal);
    double eq_corrente_maxima = EquipamentoBO.calcularCorrenteMaxima(_eq_potencia_maxima, _eq_tensao_nominal);
    double eq_corrente_media = EquipamentoBO.calcularCorrenteMaxima(_eq_potencia_media, _eq_tensao_nominal);
    _eqCorrenteMaximaController.text = eq_corrente_maxima.toStringAsFixed(2);
    _eqCorrenteMediaController.text = eq_corrente_maxima.toStringAsFixed(2);

    double _cel_tensao_minima = sharedPreferences.getDouble(share_field_cel_tensao_minima);
    double _cel_tensao_nominal = sharedPreferences.getDouble(share_field_cel_tensao_nominal);
    double _cel_tensao_maxima = sharedPreferences.getDouble(share_field_cel_tensao_maxima);
    double _cel_saida_maxima = sharedPreferences.getDouble(share_field_cel_saida_maxima);
    double _cel_capacidade = sharedPreferences.getDouble(share_field_cel_capacidade);
    double _cel_potencia = CelulaBO.calcularPotencia(_cel_capacidade, _cel_tensao_nominal);
    double _cel_bateria_em_s = CelulaBO.calcularBateriaEmS(_eq_tensao_maxima, _cel_tensao_maxima);
    double _cel_bateria_em_p = CelulaBO.calcularBateriaEmP(eq_corrente_maxima, _cel_saida_maxima);
    _celPotenciaController.text = _cel_potencia.toStringAsFixed(2);
    _celBateriaSController.text = _cel_bateria_em_s.toStringAsFixed(2);
    _celBateriaPController.text = _cel_bateria_em_p.toStringAsFixed(2);

    double _bat_bateria_em_p = sharedPreferences.getDouble(share_field_bat_bateria_p);
    double _bat_bateria_em_s = sharedPreferences.getDouble(share_field_bat_bateria_s);
    double _bat_total_baterias = BateriaBO.calcularTotalDeBateria(_bat_bateria_em_s, _bat_bateria_em_p);
    double _bat_tensao_nominal = BateriaBO.calcularTensaoNominal(_cel_tensao_nominal, _bat_bateria_em_s);
    double _bat_tensao_maxima = BateriaBO.calcularTensaoMaxima(_cel_tensao_maxima, _bat_bateria_em_s);
    double _bat_tensao_minima = BateriaBO.calcularTensaoMinima(_cel_tensao_minima, _bat_bateria_em_s);
    double _bat_capacidade = BateriaBO.calcularCapacidade(_cel_capacidade, _bat_bateria_em_p);
    double _bat_saida_maxima = BateriaBO.calcularSaidaMaxima(_cel_saida_maxima, _bat_bateria_em_p);
    double _bat_potencia = BateriaBO.calcularPotencia(_cel_potencia, _bat_total_baterias);
    double _bat_autonomia_media = BateriaBO.calcularAutonomiaMedia(_bat_potencia, _eq_potencia_media);

    _batTotalBateriasController.text = _bat_total_baterias.toStringAsFixed(2);
    _batTensaoNominalController.text = _bat_tensao_nominal.toStringAsFixed(2);
    _batTensaoMaximaController.text = _bat_tensao_maxima.toStringAsFixed(2);
    _batTensaoMinimaController.text = _bat_tensao_minima.toStringAsFixed(2);
    _batCapacidadeController.text = _bat_capacidade.toStringAsFixed(2);
    _batSaidaMaximaController.text = _bat_saida_maxima.toStringAsFixed(2);
    _batPotenciaController.text = _bat_potencia.toStringAsFixed(2);
    _batAutonomiaController.text = _bat_autonomia_media.toStringAsFixed(2);
  }
}
