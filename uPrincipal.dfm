object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Controle de abastecimento'
  ClientHeight = 442
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 373
      Height = 49
      Align = alTop
      Alignment = taCenter
      Caption = 'Posto ABC'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -40
      Font.Name = 'Calibri'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 166
    end
    object Label6: TLabel
      Left = 7
      Top = 384
      Width = 196
      Height = 19
      Caption = 'Pre'#231'o Gasolina (L): R$ 5,76'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 7
      Top = 408
      Width = 178
      Height = 19
      Caption = 'Pre'#231'o Diesel (L): R$ 4,94'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 114
      Width = 373
      Height = 213
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label8: TLabel
        Left = 153
        Top = 93
        Width = 79
        Height = 13
        Caption = 'Valor abastecido'
      end
      object Label9: TLabel
        Left = 72
        Top = 121
        Width = 160
        Height = 13
        Caption = 'Quantidade de Litros abastecidos'
        Enabled = False
      end
      object Label10: TLabel
        Left = 153
        Top = 66
        Width = 112
        Height = 13
        Caption = 'Data do Abastecimento'
      end
      object Label3: TLabel
        Left = 109
        Top = 37
        Width = 87
        Height = 13
        Caption = 'Bomba abastecida'
      end
      object Label4: TLabel
        Left = 169
        Top = 9
        Width = 97
        Height = 13
        Caption = 'C'#243'd. Abastecimento'
      end
      object edValor: TEdit
        Left = 238
        Top = 90
        Width = 109
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
      end
      object edQtdLitrosAbastecidos: TEdit
        Left = 238
        Top = 117
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object edData: TMaskEdit
        Left = 271
        Top = 63
        Width = 76
        Height = 21
        Alignment = taRightJustify
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object bdCadastrar: TButton
        Left = 144
        Top = 179
        Width = 75
        Height = 25
        Caption = 'Ok'
        TabOrder = 5
        OnClick = bdCadastrarClick
      end
      object cbBomba: TComboBox
        Left = 202
        Top = 33
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Nenhuma'
        Items.Strings = (
          'Nenhuma'
          'Bomba 1 (Gasolina)'
          'Bomba 2 (Gasolina)'
          'Bomba 3 (Diesel)'
          'Bomba 4 (Diesel)')
      end
      object edCodAbastecimento: TEdit
        Left = 271
        Top = 6
        Width = 76
        Height = 21
        MaxLength = 5
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 49
      Width = 373
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label11: TLabel
        Left = 15
        Top = 6
        Width = 165
        Height = 13
        Caption = 'Qtd de Litros Restantes (Gasolina)'
        Enabled = False
      end
      object Label12: TLabel
        Left = 27
        Top = 39
        Width = 153
        Height = 13
        Caption = 'Qtd de Litros Restantes (Diesel)'
        Enabled = False
      end
      object edDisRestante: TEdit
        Left = 186
        Top = 33
        Width = 161
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edGasRestante: TEdit
        Left = 186
        Top = 6
        Width = 161
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 320
    object mmRelatorio: TMenuItem
      Caption = 'Gerar relat'#243'rio'
      OnClick = mmRelatorioClick
    end
  end
end
