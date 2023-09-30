unit uGeraRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.ExtCtrls,umoduloCon, Vcl.StdCtrls, Vcl.Mask;

type
  TfrGeraRelAbastecimentos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lbDataIni: TLabel;
    lbDataFin: TLabel;
    lbNumNotaIni: TLabel;
    lbNumNotaFin: TLabel;
    edDataInicial: TMaskEdit;
    edDataFinal: TMaskEdit;
    edCodAbastFinal: TEdit;
    edCodAbastInicial: TEdit;
    rgOrdenacao: TRadioGroup;
    btVisualizar: TButton;
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    function fPegaAndOuWhere(prTexto: String): String;
    function fDataCompleta(prTextoData: string): boolean;
  public
    { Public declarations }
  end;

var
  frGeraRelAbastecimentos: TfrGeraRelAbastecimentos;

implementation

{$R *.dfm}

uses uExibeRelAbastecimentos;

procedure TfrGeraRelAbastecimentos.btVisualizarClick(Sender: TObject);
var
  wWhereData,
  wWhereCod  : String;
begin
  frExibeRelAbastecimentos.SQLRel.Close;
  frExibeRelAbastecimentos.SQLRel.SQL.Clear;
  frExibeRelAbastecimentos.SQLRel.SQL.Add('SELECT abastecimentos.bdCodAbastecimento bdCodAbastecimento, abastecimentos.bdData bdData, abastecimentos.tBombas_bdCodBomba bdCodBomba, abastecimentos.bdValorAbastecido bdValorAbastecido,');
  frExibeRelAbastecimentos.SQLRel.SQL.Add('tanques.bdTipoCombustivel bdTipoCombustivel,');
  frExibeRelAbastecimentos.SQLRel.SQL.Add('bombas.tTanques_bdCodTanque bdCodTanque,');

  {Inicio SubQuery para pegar a soma}
  frExibeRelAbastecimentos.SQLRel.SQL.Add('(SELECT SUM(bdValorAbastecido)');
  frExibeRelAbastecimentos.SQLRel.SQL.Add('FROM tAbastecimentos');
  wWhereData := '';
  if (fDataCompleta(edDataInicial.Text)) and (fDataCompleta(edDataFinal.Text)) then
     begin
       wWhereData := 'WHERE bdData >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD',StrToDate(edDataInicial.Text))) +
                     'AND   bdData <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD',StrToDate(edDataFinal.Text)));
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereData);
     end
  else
  if (fDataCompleta(edDataInicial.Text)) and (not fDataCompleta(edDataFinal.Text)) then
     begin
       wWhereData := 'WHERE bdData >=' + QuotedStr(FormatDateTime('YYYY-MM-DD',StrToDate(edDataInicial.Text)));
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereData);
     end
  else
  if (not fDataCompleta(edDataInicial.Text)) and (fDataCompleta(edDataFinal.Text)) then
     begin
       wWhereData := 'WHERE bdData <=' + QuotedStr(FormatDateTime('YYYY-MM-DD',StrToDate(edDataFinal.Text)));
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereData);
     end;

  wWhereCod := '';
  if (edCodAbastInicial.Text <> '')  and (edCodAbastFinal.Text <> '') then
     begin
       wWhereCod := fPegaAndOuWhere(frExibeRelAbastecimentos.SQLRel.SQL.Text) + ' bdCodAbastecimento >=' + QuotedStr(edCodAbastInicial.Text) +
                                                                    ' and bdCodAbastecimento <=' + QuotedStr(edCodAbastFinal.Text);
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereCod);
     end
  else
  if (edCodAbastInicial.Text <> '')  and (edCodAbastFinal.Text = '') then
     begin
       wWhereCod := fPegaAndOuWhere(frExibeRelAbastecimentos.SQLRel.SQL.Text) + ' bdCodAbastecimento >=' + QuotedStr(edCodAbastInicial.Text);
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereCod);
     end
  else
  if (edCodAbastInicial.Text = '')   and (edCodAbastFinal.Text <> '') then
     begin
       wWhereCod := fPegaAndOuWhere(frExibeRelAbastecimentos.SQLRel.SQL.Text) + ' bdCodAbastecimento <=' + QuotedStr(edCodAbastFinal.Text);
       frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereCod);
     end;

  frExibeRelAbastecimentos.SQLRel.SQL.Add(') bdSomaTot');
  {Fim SubQuery}

  frExibeRelAbastecimentos.SQLRel.SQL.Add('FROM tAbastecimentos abastecimentos');
  frExibeRelAbastecimentos.SQLRel.SQL.Add('JOIN tBombas bombas   ON (bombas.bdCodBomba = abastecimentos.tBombas_bdCodBomba)');
  frExibeRelAbastecimentos.SQLRel.SQL.Add('JOIN tTanques tanques ON (tanques.bdCodTanque = bombas.tTanques_bdCodTanque)');
  {INICIO Filtro Data}
  if wWhereData <> '' then
     frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereData);
  {Fim Filtro Data}

  {Inicio Filtro Cód. Abastecimento}
  if wWhereCod <> '' then
     frExibeRelAbastecimentos.SQLRel.SQL.Add(wWhereCod);
  {Fim Filtro Cód. Abastecimento}

  {Inicio ordenação}
  if rgOrdenacao.ItemIndex = 0 then
     frExibeRelAbastecimentos.SQLRel.SQL.Add('ORDER BY abastecimentos.bdCodAbastecimento')
  else if rgOrdenacao.ItemIndex = 1 then
     frExibeRelAbastecimentos.SQLRel.SQL.Add('ORDER BY abastecimentos.bdData');
  {Fim Ordenação}

  frExibeRelAbastecimentos.SQLRel.Open;
  frExibeRelAbastecimentos.rlValorTotal.Text := frExibeRelAbastecimentos.SQLRel.fieldbyname('bdSomaTot').asString;

  frExibeRelAbastecimentos.relAbast.Preview();
end;

function TfrGeraRelAbastecimentos.fDataCompleta(prTextoData: string): boolean;
var
  wNovaData: String;
begin
  Result := False;
  wNovaData := StringReplace(prTextoData, '/', '', [rfReplaceAll, rfIgnoreCase]);
  wNovaData := StringReplace(wNovaData, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  if Length(wNovaData) = 8 then
     Result := True;
end;

function TfrGeraRelAbastecimentos.fPegaAndOuWhere(prTexto: String): String;
begin
  if pos('WHERE', UpperCase(prTexto)) > 0 then
     Result := 'And '
  else
     Result := 'Where ';
end;

end.
