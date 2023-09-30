unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Menus;

type
  TForm3 = class(TForm)
    pnPrincipal: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    edValor: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edQtdLitrosAbastecidos: TEdit;
    edData: TMaskEdit;
    Label10: TLabel;
    bdCadastrar: TButton;
    edDisRestante: TEdit;
    Label11: TLabel;
    edGasRestante: TEdit;
    Label12: TLabel;
    Panel2: TPanel;
    cbBomba: TComboBox;
    Label3: TLabel;
    edCodAbastecimento: TEdit;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    mmRelatorio: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure bdCadastrarClick(Sender: TObject);
    procedure mmRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCadastra = class
    Private
      FBomba,
      FCodigo            ,
      FTanque            : Integer;
      FData              ,
      FTipoCombustivel   : String;
      FValor,
      FLitros ,
      FGasolinaRestante,
      FDieselRestante    : Currency;
      FmodoInsercao      : Boolean;

      function  fRetornaLitrosAbast(prValorAbastecido:Currency; prValorUnitario: Currency):Currency;
      function  fRetornaValorImposto(prValorAbastecido: Currency): Currency;
      procedure pAlteraQtdTanque(prLitroAbastecido: Currency; prCodTanque: Integer; prSoma: Boolean = False);
    public
      Constructor Create(prCodigo: Integer; prbomba: Integer; prData: String; prValorAbast: Currency);
      procedure   pCadastrar;
      property    ppToTalLitros: Currency read FLitros;
      property    ppGasolinaRestante: Currency read FGasolinaRestante;
      property    ppDieselRestante  : Currency read FDieselRestante;
      property    ppTipoCombustivel : String   read FTipoCombustivel;
  end;

const
  cValorGasolina = 5.76;
  cValorDiesel   = 4.94;
  cPerImposto    = 0.13;


var
  Form3: TForm3;

implementation

{$R *.dfm}

uses umoduloCon, uGeraRelAbastecimentos;

procedure TForm3.bdCadastrarClick(Sender: TObject);
var
  wCadastra: TCadastra;
begin
  if cbBomba.ItemIndex = 0 then
     begin
       MessageDlg('Bomba não Identificada. Selecione uma bomba.', mtInformation, [mbOK], 0);
       cbBomba.SetFocus;
       Exit;
     end
  else
  if Trim(edCodAbastecimento.Text) = '' then
     begin
       MessageDlg('Necessário informar um código!', mtInformation, [mbOK], 0);
       edCodAbastecimento.SetFocus;
       Exit;
     end;

  wCadastra := TCadastra.Create(StrToInt(edCodAbastecimento.Text),cbBomba.ItemIndex,edData.Text,StrToCurr(edValor.Text));
  Try
    wCadastra.pCadastrar;
    edQtdLitrosAbastecidos.Text  := CurrToStr(wCadastra.ppToTalLitros);

    if AnsiSameText(wCadastra.ppTipoCombustivel,'Gasolina') then
       edGasRestante.Text  := CurrToStr(wCadastra.ppGasolinaRestante)
    else
       edDisRestante.Text  := CurrToStr(wCadastra.ppDieselRestante);
  Finally
    wCadastra.DisposeOf;
  End;

end;

procedure TForm3.FormShow(Sender: TObject);
var
  wI: Integer;
begin
  for wI := 1 to 4 do
    begin
      dmControl.tbBombas.IndexFieldNames := 'bdCodBomba';
      if dmControl.tbBombas.FindKey([wI]) then
         dmControl.tbBombas.Edit
      else
         dmControl.tbBombas.Insert;

      dmControl.tbBombasbdCodBomba.AsInteger := wI;
      if (dmControl.tbBombasbdCodBomba.AsInteger = 1) or
         (dmControl.tbBombasbdCodBomba.AsInteger = 2)then
         dmControl.tbBombastTanques_bdCodTanque.AsInteger := 1
      else
         dmControl.tbBombastTanques_bdCodTanque.AsInteger := 2;

      dmControl.tbBombas.Post;

    end;

  dmControl.tbTanques.First;
  while (not dmControl.tbTanques.Eof) do
    begin
      if dmControl.tbTanquesbdCodTanque.AsInteger = 1 then
         edGasRestante.Text := dmControl.tbTanquesbdQtdLitros.AsString
      else
         edDisRestante.Text := dmControl.tbTanquesbdQtdLitros.AsString;

      dmControl.tbTanques.Next;
    end;

end;

procedure TForm3.mmRelatorioClick(Sender: TObject);
var
  wTelaRelatorio : TfrGeraRelAbastecimentos;
begin
  wTelaRelatorio := TfrGeraRelAbastecimentos.Create(Self);
  wTelaRelatorio.Show;
end;

{ TCadastra }

constructor TCadastra.Create(prCodigo: Integer; prbomba: Integer; prData: String; prValorAbast: Currency);
begin
  inherited Create;
  FCodigo := prCodigo;
  FBomba  := prbomba;
  FData   := prData;
  FValor  := prValorAbast;

  if (FBomba = 1) or (FBomba = 2) then
     begin
       FLitros := fRetornaLitrosAbast(FValor,cValorGasolina);
       FTanque := 1;
     end
  else
     begin
       FLitros := fRetornaLitrosAbast(FValor,cValorDiesel);
       FTanque := 2;
     end;

end;

function TCadastra.fRetornaLitrosAbast(prValorAbastecido,
  prValorUnitario: Currency): Currency;
begin
  Result := (prValorAbastecido / prValorUnitario);
end;
function TCadastra.fRetornaValorImposto(prValorAbastecido: Currency): Currency;
begin
  Result := prValorAbastecido * cPerImposto;
end;

procedure TCadastra.pAlteraQtdTanque(prLitroAbastecido: Currency;prCodTanque: Integer; prSoma: Boolean = False);
begin
  dmControl.tbTanques.IndexFieldNames := 'bdCodTanque';
  dmControl.tbTanques.FindKey([prCodTanque]);
  dmControl.tbTanques.Edit;

  if prSoma then
     dmControl.tbTanquesbdQtdLitros.AsCurrency := (dmControl.tbTanquesbdQtdLitros.AsCurrency + prLitroAbastecido)
  else
     dmControl.tbTanquesbdQtdLitros.AsCurrency := (dmControl.tbTanquesbdQtdLitros.AsCurrency - prLitroAbastecido);

  dmControl.tbTanques.Post;
end;

procedure TCadastra.pCadastrar;
var
  wLitroAnteriorAbastecido: Currency;
begin
  dmControl.tbAbastecimentos.IndexFieldNames := 'bdCodAbastecimento';
  if dmControl.tbAbastecimentos.FindKey([FCodigo]) then
     dmControl.tbAbastecimentos.Edit
  else
     dmControl.tbAbastecimentos.Insert;

  wLitroAnteriorAbastecido := dmControl.tbAbastecimentosbdQtdLitros.AsCurrency;

  dmControl.tbAbastecimentosbdCodAbastecimento.AsInteger := FCodigo;
  dmControl.tbAbastecimentostBombas_bdCodBomba.AsInteger := FBomba;
  dmControl.tbAbastecimentosbdData.AsString := FData;
  dmControl.tbAbastecimentosbdValorAbastecido.AsCurrency := FValor;
  dmControl.tbAbastecimentosbdQtdLitros.AsCurrency := FLitros;
  dmControl.tbAbastecimentosbdImposto.AsCurrency := fRetornaValorImposto(FValor);

  dmControl.tbAbastecimentos.Post;

  if wLitroAnteriorAbastecido <= FLitros then
     begin
       pAlteraQtdTanque((FLitros-wLitroAnteriorAbastecido),FTanque);
       FTipoCombustivel  := dmControl.tbTanquesbdTipoCombustivel.AsString;

       if AnsiSameText(FTipoCombustivel,'Gasolina') then
          FGasolinaRestante := dmControl.tbTanquesbdQtdLitros.AsCurrency
       else
          FDieselRestante   := dmControl.tbTanquesbdQtdLitros.AsCurrency;
     end
  else
     begin
       pAlteraQtdTanque((wLitroAnteriorAbastecido - FLitros),FTanque,True);
       FTipoCombustivel  := dmControl.tbTanquesbdTipoCombustivel.AsString;

       if AnsiSameText(FTipoCombustivel,'Gasolina') then
          FGasolinaRestante := dmControl.tbTanquesbdQtdLitros.AsCurrency
       else
          FDieselRestante   := dmControl.tbTanquesbdQtdLitros.AsCurrency;
     end;
end;

end.
