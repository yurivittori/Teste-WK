object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 814
  ClientWidth = 1177
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object gridProdutos: TDBGrid
    Left = 0
    Top = 337
    Width = 1177
    Height = 381
    Align = alClient
    DataSource = dsProdutos
    FixedColor = clActiveCaption
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = gridProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 535
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_venda'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor unit.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vl_total'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total'
        Width = 171
        Visible = True
      end>
  end
  object pnpCabecalho: TPanel
    Left = 0
    Top = 161
    Width = 1177
    Height = 176
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = 155
    object lblCodigo: TLabel
      Left = 8
      Top = 78
      Width = 61
      Height = 25
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 280
      Top = 78
      Width = 99
      Height = 25
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblValorUnitario: TLabel
      Left = 560
      Top = 78
      Width = 115
      Height = 25
      Caption = 'Valor unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtCODIGOPRODUTO: TEdit
      Left = 8
      Top = 109
      Width = 234
      Height = 55
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtCODIGOPRODUTOKeyPress
    end
    object btnAdicionar: TButton
      Left = 827
      Top = 130
      Width = 77
      Height = 34
      Caption = 'Adicionar'
      ImageAlignment = iaCenter
      TabOrder = 3
      OnClick = btnAdicionarClick
    end
    object edtQuantidade: TEdit
      Left = 280
      Top = 109
      Width = 234
      Height = 55
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtVALORUNITARIO: TEdit
      Left = 560
      Top = 109
      Width = 234
      Height = 55
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edtVALORUNITARIOKeyPress
    end
    object edtNOMEPRODUTO: TEdit
      Left = 8
      Top = 39
      Width = 1127
      Height = 33
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 15066597
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object pnlValorTotal: TPanel
    Left = 0
    Top = 718
    Width = 1177
    Height = 37
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 717
    ExplicitWidth = 1173
    object lblTotal: TLabel
      Left = 1078
      Top = 1
      Width = 71
      Height = 35
      Align = alRight
      Caption = 'TOTAL :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 994
      ExplicitHeight = 28
    end
    object lblValorTotal: TLabel
      Left = 1149
      Top = 1
      Width = 6
      Height = 35
      Align = alRight
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 28
    end
    object lblMarginRight1: TLabel
      Left = 1155
      Top = 1
      Width = 21
      Height = 35
      Align = alRight
      Caption = '       '
      ExplicitHeight = 15
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 755
    Width = 1177
    Height = 59
    Align = alBottom
    Color = clNavy
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 754
    ExplicitWidth = 1173
    DesignSize = (
      1177
      59)
    object btGravar: TBitBtn
      Left = 10
      Top = 6
      Width = 111
      Height = 43
      Cursor = crArrow
      Anchors = [akLeft, akBottom]
      Caption = '&Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFEBEBEBD6D6D6ECECECEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEBEBEBD7D7D7ECECECFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB0B0B01E1E1E242424D4D4D4D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9CECECE2424241E1E1EBBBBBBFFFFFF
        FFFFFFFFFFFFFFFF333333262626262626D5D5D5D8D8D8CBCBCBCBCBCBCBCBCB
        CBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDADADAD0D0D02626262626263636
        36FFFFFFFFFFFFFFFFFFFFFF1C1C1C282828282828D8D8D8DEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED3D3D328282828
        28281B1B1BFFFFFFFFFFFFFFFFFFFFFF1D1D1D292929292929DCDCDCE2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2D6D6D6
        2929292929291B1B1BFFFFFFFFFFFFFFFFFFFFFF1E1E1E2B2B2B2B2B2BDFDFDF
        E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
        E5D8D8D82B2B2B2B2B2B1C1C1CFFFFFFFFFFFFFFFFFFFFFF1E1E1E2D2D2D2D2D
        2DE1E1E1E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8DBDBDB2D2D2D2D2D2D1C1C1CFFFFFFFFFFFFFFFFFFFFFF1F1F1F30
        3030303030E4E4E4E7E7E7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7
        D7D7D7D7D7D7EAEAEADDDDDD3030303030301D1D1DFFFFFFFFFFFFFFFFFFFFFF
        212121333333333333D7D7D7EFEFEFEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEFEFEFD0D0D03333333333331E1E1EFFFFFFFFFFFFFF
        FFFFFFFF222222353535353535747474E7E7E7FBFBFBFBFBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFBE6E6E66F6F6F3535353535351F1F1FFFFFFF
        FFFFFFFFFFFFFFFF2323233737373737373737373D3D3D3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3C3C3C3737373737373737372020
        20FFFFFFFFFFFFFFFFFFFFFF2323233939393939393939393939393939393939
        3939393939393939393939393939393939393939393939393939393939393939
        3939202020FFFFFFFFFFFFFFFFFFFFFF2525253C3C3C3C3C3C3C3C3C3E3E3E53
        53535B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5353533D3D3D3C3C3C
        3C3C3C3C3C3C212121FFFFFFFFFFFFFFFFFFFFFF2525253E3E3E3E3E3E3E3E3E
        8F8F8FCECECEE2E2E2EEEEEEF8F8F8FEFEFEFDFDFDF9F9F9EBEBEBD2D2D28C8C
        8C3E3E3E3E3E3E3E3E3E222222FFFFFFFFFFFFFFFFFFFFFF2727274141414141
        41414141C8C8C8D6D6D6E2E2E2EEEEEEF8F8F8F6F6F65E5E5E777777E9E9E9DB
        DBDBCACACA414141414141414141232323FFFFFFFFFFFFFFFFFFFFFF27272742
        4242424242424242CECECED6D6D6E2E2E2EEEEEEF8F8F8F6F6F6424242666666
        E7E7E7DBDBDBD1D1D1424242424242424242232323FFFFFFFFFFFFFFFFFFFFFF
        282828444444444444444444CECECED6D6D6E2E2E2EEEEEEF8F8F8F6F6F64444
        44676767E7E7E7DBDBDBD1D1D1444444444444444444242424FFFFFFFFFFFFFF
        FFFFFFFF373737484848454545454545CECECED6D6D6E2E2E2EEEEEEF8F8F8F6
        F6F65A5A5A747474E7E7E7DBDBDBD1D1D1454545454545484848343434FFFFFF
        FFFFFFFFFFFFFFFF9F9F9F555555666666656565DCDCDCE7E7E7EEEEEEF5F5F5
        FBFBFBFEFEFEFDFDFDF8F8F8F1F1F1EAEAEADEDEDE656565666666535353A9A9
        A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFA0A0A09D9D9DD5D5D5D5D5D5D5D5
        D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D59D9D9DA1A1A1D3
        D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 0
      OnClick = btGravarClick
    end
    object btCancelar: TBitBtn
      Left = 1056
      Top = 6
      Width = 111
      Height = 43
      Cursor = crArrow
      Hint = 'Cancela e sai do faturamento'
      Anchors = [akRight, akBottom]
      Caption = 'C&ancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        101073000029FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004
        3110106BFF00FFFF00FFFF00FF00008C3134F70808CE000031FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000039080CCE3130EF00007BFF00FF0000630808E7
        4A49F74A4DF70000C6000039FF00FFFF00FFFF00FFFF00FF00004A0004CE5A59
        EF5A59F70808DE00004A0004842120FF3134FF5A59FF4A49EF0004C6000042FF
        00FFFF00FF0000520808CE5A59EF7371FF5255FF3134FF00046B000473181CFF
        2928FF3938FF5255FF4245EF0004C600004A00005A0808CE5255EF6B69FF5251
        FF4241FF3130FF080C52FF00FF08087B181CFF2928FF3134FF4A49FF3134EF00
        00BD0004C64245EF5A59FF4245FF393CFF292CFF080C63FF00FFFF00FFFF00FF
        08086B1818FF292CFF393CFF4A4DFF3130EF3134EF4A49FF3938FF3130FF2124
        F708084AFF00FFFF00FFFF00FFFF00FFFF00FF000452393CEF6361FF6361FF63
        61FF6361FF6361FF5A59FF2928DE000439FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00048C393CF76361FF6361FF6365FF6365FF3134EF000463FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00005A0000A53130F76B69FF6B
        69FF6B69FF6B69FF2120E700009C000042FF00FFFF00FFFF00FFFF00FFFF00FF
        0000520000A53134F77B79FF7B79FF7B79FF7B79FF7B79FF7375FF2124E70000
        94000039FF00FFFF00FFFF00FF00005200009C4241F78C8AFF8C8AFF8C8AFF31
        30C64A49DE8C8EFF8C8AFF8486FF2928E700008C000039FF00FF00001800009C
        4A49F79C9AFF9C9AFF9C9AFF3134BDFF00FF0000215255E79C9EFF9C9AFF9496
        FF292CE700007BFF00FF0000295255FFADAEFFADAAFFADAAFF393CBDFF00FFFF
        00FFFF00FF0000295A5DE7ADAEFFADAAFFADAAFF3130DEFF00FFFF00FF4245BD
        BDBAFFBDBAFF393CBDFF00FFFF00FFFF00FFFF00FFFF00FF0000296B69E7CECB
        FFA5A6FF21248CFF00FFFF00FFFF00FF393CBD4241C6FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0000295A59E7181C7BFF00FFFF00FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btCancelarClick
      ExplicitLeft = 1052
    end
  end
  object pnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 161
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 1173
    object lblCodigoCli: TLabel
      Left = 17
      Top = 48
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblNomeCli: TLabel
      Left = 17
      Top = 77
      Width = 39
      Height = 15
      Alignment = taRightJustify
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCidadeCli: TLabel
      Left = 17
      Top = 107
      Width = 39
      Height = 15
      Alignment = taRightJustify
      Caption = 'Cidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblESTADOCLIENTE: TLabel
      Left = 508
      Top = 108
      Width = 3
      Height = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCODIGOCLIENTE: TEdit
      Left = 62
      Top = 46
      Width = 121
      Height = 23
      TabOrder = 0
      OnKeyPress = edtCODIGOCLIENTEKeyPress
    end
    object edtNOMECLIENTE: TEdit
      Left = 62
      Top = 75
      Width = 440
      Height = 23
      Enabled = False
      TabOrder = 1
      OnKeyPress = edtCODIGOCLIENTEKeyPress
    end
    object edtCIDADECLIENTE: TEdit
      Left = 62
      Top = 104
      Width = 440
      Height = 23
      Enabled = False
      TabOrder = 2
      OnKeyPress = edtCODIGOCLIENTEKeyPress
    end
  end
  object qryProdutos: TFDQuery
    Connection = dm.Database
    Left = 168
    Top = 408
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'VL_VENDA'
        DataType = ftFloat
      end
      item
        Name = 'quantidade'
        DataType = ftInteger
      end
      item
        Name = 'VL_TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 344
    Top = 552
    object cdsProdutoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsProdutosdescricao: TStringField
      FieldName = 'descricao'
    end
    object cdsProdutosvl_venda: TFloatField
      FieldName = 'vl_venda'
    end
    object cdsProdutosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object cdsProdutosvl_total: TFloatField
      FieldName = 'vl_total'
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 432
    Top = 552
  end
  object qryCliente: TFDQuery
    Connection = dm.Database
    SQL.Strings = (
      'SELECT * FROM tb_clientes')
    Left = 656
    Top = 16
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qryClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 255
    end
    object qryClienteUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object dsClientes: TDataSource
    DataSet = qryCliente
    Left = 752
    Top = 48
  end
  object dsqProdutos: TDataSource
    DataSet = qryProdutos
    Left = 256
    Top = 408
  end
end
