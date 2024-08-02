class Zona
{
  int _Id;

  double _LatitudeCentral;

  double _LongitudeCentral;

 double _Raio;

 double _IndiceFurto;




  Zona(this._Id, this._LatitudeCentral, this._LongitudeCentral, this._Raio, this._IndiceFurto);

  double get IndiceFurto => _IndiceFurto;

  set IndiceFurto(double value) {
    _IndiceFurto = value;
  }

  double get Raio => _Raio;

  set Raio(double value) {
    _Raio = value;
  }

  double get LongitudeCentral => _LongitudeCentral;

  set LongitudeCentral(double value) {
    _LongitudeCentral = value;
  }

  double get LatitudeCentral => _LatitudeCentral;

  set LatitudeCentral(double value) {
    _LatitudeCentral = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }
}