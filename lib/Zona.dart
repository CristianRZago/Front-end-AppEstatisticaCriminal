class Zona
{
  int _Id;

  double _LatitudeCentral;

  double _LongitudeCentral;

 double _Raio;

  double _Area;

  Zona(this._Id, this._LatitudeCentral, this._LongitudeCentral, this._Raio,
      this._Area);

  double get Area => _Area;

  set Area(double value) {
    _Area = value;
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