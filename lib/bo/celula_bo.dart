
class CelulaBO{

  static double calcularPotencia(double capacidade, double tensaoNominal){
    if(capacidade==null || tensaoNominal==null){
      return 0.0;
    }
    if(capacidade==0.0 || tensaoNominal==0.0){
      return 0.0;
    }
    double result = (capacidade/1000*tensaoNominal);
    return result;
  }

  static double calcularBateriaEmS(double tensaoMaximaEquipamento, double tensaoMaxima){
    if(tensaoMaximaEquipamento==null || tensaoMaxima==null){
      return 0.0;
    }
    if(tensaoMaximaEquipamento==0.0 || tensaoMaxima==0.0){
      return 0.0;
    }
    double result = (tensaoMaximaEquipamento/tensaoMaxima);
    return result;
  }

  static double calcularBateriaEmP(double correnteMaximaEquipamento, double saidaMaxima){
    if(correnteMaximaEquipamento==null || saidaMaxima==null){
      return 0.0;
    }
    if(correnteMaximaEquipamento==0.0 || saidaMaxima==0.0){
      return 0.0;
    }
    double result = correnteMaximaEquipamento/saidaMaxima*1000;
    return result;
  }
}