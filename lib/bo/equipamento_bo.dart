
class EquipamentoBO{

  static double calcularCorrenteMaxima(double potenciaMaxima, double tensaoNominal){
    if(potenciaMaxima==null || tensaoNominal==null){
      return 0.0;
    }
    if(potenciaMaxima==0.0 || tensaoNominal==0.0){
      return 0.0;
    }
    double result = (potenciaMaxima/tensaoNominal);
    return result;
  }

  static double calcularCorrenteMedia(double potenciaMedia, double tensaoNominal){
    if(potenciaMedia==null || tensaoNominal==null){
      return 0.0;
    }
    if(potenciaMedia==0.0 || tensaoNominal==0.0){
      return 0.0;
    }
    double result = (tensaoNominal/potenciaMedia);
    return result;
  }
}