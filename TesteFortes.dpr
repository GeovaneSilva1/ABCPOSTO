program TesteFortes;

uses
  Vcl.Forms,
  uExibeRelAbastecimentos in 'uExibeRelAbastecimentos.pas' {frExibeRelAbastecimentos},
  uGeraRelAbastecimentos in 'uGeraRelAbastecimentos.pas' {frGeraRelAbastecimentos},
  umoduloCon in 'umoduloCon.pas' {dmControl: TDataModule},
  uPrincipal in 'uPrincipal.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TfrGeraRelAbastecimentos, frGeraRelAbastecimentos);
  Application.CreateForm(TfrExibeRelAbastecimentos, frExibeRelAbastecimentos);
  Application.CreateForm(TfrExibeRelAbastecimentos, frExibeRelAbastecimentos);
  Application.CreateForm(TfrGeraRelAbastecimentos, frGeraRelAbastecimentos);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
