
class BateriaBO{

  static double calcularTotalDeBateria(double bateriaEmS, double bateriaEmP){
    if(bateriaEmS==null || bateriaEmP==null){
      return 0.0;
    }
    if(bateriaEmS==0.0 || bateriaEmP==0.0){
      return 0.0;
    }
    double result = (bateriaEmS*bateriaEmP);
    return result;
  }

  static double calcularTensaoNominal(double tensaoNominalCelula, double bateriaEmS){
    if(tensaoNominalCelula==null || bateriaEmS==null){
      return 0.0;
    }
    if(tensaoNominalCelula==0.0 || bateriaEmS==0.0){
      return 0.0;
    }
    double result = (tensaoNominalCelula * bateriaEmS);
    return result;
  }
  static double calcularTensaoMaxima(double tensaoMaximaCelula, double bateriaEmS){
    if(tensaoMaximaCelula==null || bateriaEmS==null){
      return 0.0;
    }
    if(tensaoMaximaCelula==0.0 || bateriaEmS==0.0){
      return 0.0;
    }
    double result = (tensaoMaximaCelula * bateriaEmS);
    return result;
  }

  static double calcularTensaoMinima(double tensaoMinimaCelula, double bateriaEmS){
    if(tensaoMinimaCelula==null || bateriaEmS==null){
      return 0.0;
    }
    if(tensaoMinimaCelula==0.0 || bateriaEmS==0.0){
      return 0.0;
    }
    double result = (tensaoMinimaCelula * bateriaEmS);
    return result;
  }
  static double calcularCapacidade(double capacidadeCelula, double bateriaEmP){
    if(capacidadeCelula==null || bateriaEmP==null){
      return 0.0;
    }
    if(capacidadeCelula==0.0 || bateriaEmP==0.0){
      return 0.0;
    }
    double result = (capacidadeCelula*bateriaEmP/1000);
    return result;
  }

  static double calcularSaidaMaxima(double saidaMaximaCelula, double bateriaEmP){
    if(saidaMaximaCelula==null || bateriaEmP==null){
      return 0.0;
    }
    if(saidaMaximaCelula==0.0 || bateriaEmP==0.0){
      return 0.0;
    }
    double result = (saidaMaximaCelula*bateriaEmP)/1000;
    return result;
  }


  static double calcularPotencia(double potenciaCelula, double totaldeBaterias){
    if(potenciaCelula==null || totaldeBaterias==null){
      return 0.0;
    }
    if(potenciaCelula==0.0 || totaldeBaterias==0.0){
      return 0.0;
    }
    double result = (potenciaCelula*totaldeBaterias);
    return result;
  }

  static double calcularAutonomiaMedia(double potencia, double potenciaMediaEquipamento){
    if(potencia==null || potenciaMediaEquipamento==null){
      return 0.0;
    }
    if(potencia==0.0 || potenciaMediaEquipamento==0.0){
      return 0.0;
    }
    double result = (potencia/potenciaMediaEquipamento);
    return result;
  }
}