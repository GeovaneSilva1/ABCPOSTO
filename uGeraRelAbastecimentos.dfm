object frGeraRelAbastecimentos: TfrGeraRelAbastecimentos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 258
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 258
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 429
    ExplicitHeight = 248
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 433
      Height = 94
      Align = alTop
      Caption = 'Filtrar Por'
      TabOrder = 0
      ExplicitWidth = 423
      object lbDataIni: TLabel
        Left = 24
        Top = 24
        Width = 90
        Height = 13
        Caption = 'Abastecimento de:'
      end
      object lbDataFin: TLabel
        Left = 226
        Top = 24
        Width = 94
        Height = 13
        Caption = 'Abastecimento at'#233':'
      end
      object lbNumNotaIni: TLabel
        Left = 10
        Top = 63
        Width = 104
        Height = 13
        Caption = 'N'#186' abastecimento de:'
      end
      object lbNumNotaFin: TLabel
        Left = 213
        Top = 63
        Width = 108
        Height = 13
        Caption = 'N'#186' abastecimento at'#233':'
      end
      object edDataInicial: TMaskEdit
        Left = 117
        Top = 21
        Width = 70
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object edDataFinal: TMaskEdit
        Left = 323
        Top = 21
        Width = 70
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object edCodAbastFinal: TEdit
        Left = 323
        Top = 60
        Width = 70
        Height = 21
        TabOrder = 3
      end
      object edCodAbastInicial: TEdit
        Left = 117
        Top = 60
        Width = 70
        Height = 21
        TabOrder = 2
      end
    end
    object rgOrdenacao: TRadioGroup
      AlignWithMargins = True
      Left = 3
      Top = 103
      Width = 433
      Height = 82
      Align = alTop
      Caption = 'Ordernar Por'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'N'#186' Abastecimento'
        'Data')
      TabOrder = 1
      ExplicitWidth = 423
    end
    object btVisualizar: TButton
      Left = 168
      Top = 200
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 2
      OnClick = btVisualizarClick
    end
  end
end
