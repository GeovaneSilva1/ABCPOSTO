unit umoduloCon;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Data.DBXFirebird, Vcl.Dialogs,Vcl.Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DbxSqlite;

type
  TdmControl = class(TDataModule)
    postoabc: TFDConnection;
    tbTanques: TFDTable;
    dsTanques: TDataSource;
    tbTanquesbdCodTanque: TIntegerField;
    tbTanquesbdTipoCombustivel: TStringField;
    tbTanquesbdQtdLitros: TBCDField;
    tbBombas: TFDTable;
    dsBombas: TDataSource;
    tbBombasbdCodBomba: TIntegerField;
    tbBombastTanques_bdCodTanque: TIntegerField;
    tbAbastecimentos: TFDTable;
    dsAbastecimentos: TDataSource;
    tbAbastecimentosbdCodAbastecimento: TIntegerField;
    tbAbastecimentosbdData: TDateField;
    tbAbastecimentostBombas_bdCodBomba: TIntegerField;
    tbAbastecimentosbdQtdLitros: TBCDField;
    tbAbastecimentosbdValorAbastecido: TBCDField;
    tbAbastecimentosbdImposto: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControl: TdmControl;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
