program TesteFortes;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form3},
  umoduloCon in 'umoduloCon.pas' {dmControl: TDataModule},
  uGeraRelAbastecimentos in 'uGeraRelAbastecimentos.pas' {frGeraRelAbastecimentos},
  uExibeRelAbastecimentos in 'uExibeRelAbastecimentos.pas' {frExibeRelAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TfrGeraRelAbastecimentos, frGeraRelAbastecimentos);
  Application.CreateForm(TfrExibeRelAbastecimentos, frExibeRelAbastecimentos);
  Application.Run;
end.
