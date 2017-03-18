object FrmManterEstq: TFrmManterEstq
  Left = 350
  Top = 134
  BorderStyle = bsToolWindow
  Caption = 'Manter Estoque'
  ClientHeight = 462
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 8
    Top = 0
    Width = 148
    Height = 24
    Caption = 'Manter Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 368
    Width = 465
    Height = 90
    Caption = 'Opera'#231#245'es'
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 296
      Top = 48
      Width = 120
      Height = 32
      Cursor = crHandPoint
      Caption = '&Adicionar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
      Glyph.Data = {
        22050000424D2205000000000000360000002800000013000000150000000100
        180000000000EC04000000000000000000000000000000000000BDB6BDB5B2B5
        B5B2B5B5B2ADB5B2ADB5B2ADB5B2B5B5B2B5B5B2B5B5B2B5B5B2B5B5B2B5B5B2
        ADB5B2ADB5B2ADB5B2ADB5B2B5BDB6BDCED3D6000000F7F3F7F7FBFFF7FBFFF7
        FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFFF7FBFF
        F7FBFFF7FBFFF7FBFFF7F3F7CEC7C6000000F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F3F7000000F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7
        F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7EF
        F7F7EFF7F7F7F7000000F7EBEFF7EBEFF7EBEFF7EBEFF7EBEFF7EBEFF7EBEFF7
        EBEFF7EBEFFFF7F7FFFFFFFFFFFFFFF7F7F7EBEFF7EBEFF7EBEFF7EBEFF7EBEF
        F7F3F7000000F7EBE7F7EBE7F7EBE7F7EBE7F7EBE7F7EBE7F7EBE7F7EBE7F7EF
        EFC6DBC6187910187910FFFFFFF7EBEFF7EBE7F7EBE7F7EBE7F7EBE7F7F3F700
        0000F7E7E7F7E7E7F7E7E7F7E7E7F7E7E7F7E7E7F7E7E7F7E7E7F7E7E7FFF3F7
        FFFFFF1879188CBE8CFFF3F7F7E7E7F7E7E7F7E7E7F7E7E7F7EFF7000000F7E3
        E7F7E3E7F7E3E7F7E3E7F7E3E7F7E3E7F7E3E7F7E3E7F7E3E7F7E3E7FFF3F78C
        BE8C187D18C6DFC6F7EBEFF7E3E7F7E3E7F7E3E7F7EFEF000000F7E3DEF7E3DE
        F7E3DEF7E3DEFFF3F7FFFBFFFFF3F7F7E3DEF7E3DEF7E3DEF7EFEF9CC79C1882
        218CBE8CFFF3F7F7E3DEF7E3DEF7E3DEF7EFEF000000EFDFDEEFDFDEEFDFDEF7
        F3EFFFFBFF188221FFFBFFF7F3EFF7F3EFFFFBFFFFFBFF7BB684188221188221
        FFFBFFFFFBFFF7F3EFEFDFDEF7EFEF000000EFDFDEEFDFDEF7F3EFFFFBFF1886
        29188629188629FFFBFFFFFBFF18862918862918862918862918862918862918
        8629FFFBFFEFDFDEF7EFEF000000F7EBE7FFF7F7FFFFFF218E31218E31218E31
        218E31218E31FFFFFFFFFFFF218E31218E31218E31218E31218E31FFFFFFFFF7
        F7F7EBE7F7F3F7000000F7EBEFFFFFFF319A42319A42319A42319A42319A4231
        9A42319A42FFFFFFFFFFFF319A42319A42319A42FFFFFFFFF7F7F7EBEFF7EBEF
        F7F3F7000000F7EBEFFFF7F7FFFFFFFFFFFF42A65242A65294CB9CFFFFFFFFFF
        FFFFF7F7FFF7F7FFFFFF42A652FFFFFFFFF7F7F7EBEFF7EBEFF7EBEFF7F3F700
        0000F7EFEFF7EFEFF7EFEFFFF7F7A5D7AD4AAA5AADDBB5F7F7F7F7EFEFF7EFEF
        F7EFEFFFF7F7FFFFFFFFF7F7F7EFEFF7EFEFF7EFEFF7EFEFF7F3F7000000F7EF
        EFF7EFEFF7EFEFF7F3F7D6EBD652B263A5DBADFFF7FFF7EFEFF7EFEFF7EFEFF7
        EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7EFEFF7F7F7000000F7EFF7F7EFF7
        F7EFF7F7EFF7FFF7FFADDBB55AB663FFFFFFFFF7FFF7EFF7F7EFF7F7EFF7F7EF
        F7F7EFF7F7EFF7F7EFF7F7EFF7F7EFF7F7F7F7000000F7F3F7F7F3F7F7F3F7F7
        F3F7F7F3F7FFFFFF5ABA6B5ABA6BD6EFDEF7F7F7F7F3F7F7F3F7F7F3F7F7F3F7
        F7F3F7F7F3F7F7F3F7F7F3F7F7F7F7000000F7F3F7F7F3F7F7F3F7F7F3F7F7F3
        F7FFFBFFFFFFFFFFFFFFFFFBFFF7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7
        F3F7F7F3F7F7F3F7F7F7FF000000F7F7F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7
        F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7F7F3
        F7F7F7F7F7F3F7000000EFEBEFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7
        F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFF7F7FFEFEBEF
        CEC3C6000000}
    end
    object BitBtn3: TBitBtn
      Left = 173
      Top = 48
      Width = 120
      Height = 32
      Cursor = crHandPoint
      Caption = '&Selecionar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000DAEBEED0E0E3
        B7C6C9B5C4C7B5C4C7B5C4C7B5C4C7B5C4C7B5C4C7B5C4C7B5C4C7B5C4C7B5C4
        C7B5C4C7B5C4C7BFCFD1E2F4F77780821613124F4D4D535B5B535B5B535B5B53
        5B5B535B5B535B5B535B5B535B5B535B5B4F5353545252000000E2F4F7747E80
        9A9999FFFFFFAC4646B65959B65959B65959B65959B65959B65959B65959B251
        51D99F9FFFFFFF1D1D1DE2F4F7747E80919191FFFFFFF5EBEBF8F2F2F8F2F2F8
        F2F2F8F2F2F8F2F2F8F2F2F8F2F2F4EAEAF4E9E9FFFFFF1A1A1AE2F4F7768284
        857979FFFFFF6000006C00006C00006C00006C00006C00006C00006A00007E00
        00F7EFEFFFF3F3181818E2F4F77D9194380000730000BF7F7FB97272B97272B9
        7272B97272B97272B97272B97272B97272962D2D7C00000A0000E2F4F77D9194
        380000730000BF7F7FB97272B97272B97272B97272B97272B97272B97272B972
        72962D2D7C00000A0000E2F4F7768284847979FFFFFF6000006C00006C00006C
        00006C00006C00006C00006A00007E0000F7EFEFFFF3F3181818E2F4F7747E80
        919191FFFFFFF5EBEBF8F2F2F8F2F2F8F2F2F8F2F2F8F2F2F8F2F2F8F2F2F4EA
        EAF4E9E9FFFFFF1A1A1AE9FCFF7E898B9A9999FFFFFFAC4646B65959B65959B6
        5959B65959B65959B65959B65959B25151D99F9FFFFFFF1D1D1DA5B4B8080B0C
        1B1B1B4B4B4B4F59594F59594F59594F59594F59594F59594F5959646D6D535B
        5B4F53535452520404049CAAAEDFDEDDDADDDDD5D8D8D5D8D8D5D8D8D5D8D8D5
        D8D8D5D8D8D5D8D8E8E9E9000000BFD1D4BBCBCEC6D6D9111313A5B4B8FFFDFD
        EDD4D4EFD8D8EFD8D8EFD8D8EFD8D8EFD8D8EFD8D8EDD4D4FFFFFF050606FFFF
        FF627074CCDDE11B1D1DA8B9BDEDC8C7A44140AA4C4CAA4C4CAA4C4CAA4C4CAA
        4C4CAA4C4CA44140FDD8D8090C0CFFFFFF4B4848CCD8DA1E212196A4A8C0CDCF
        C2D5D7C2D5D7C2D5D7C2D5D7C2D5D7C2D5D7C2D5D7C2D5D7D0DEE00000005553
        535E5C5B515454000000D0E1E4CCDEE1CCDEE1CCDEE1CCDEE1CCDEE1CCDEE1CC
        DEE1CCDEE1CCDEE1CFE1E4C2D1D4B4C4C6B5C4C7B6C5C8C0CFD2}
    end
    object BitBtn5: TBitBtn
      Left = 336
      Top = 16
      Width = 100
      Height = 25
      Caption = '>>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 232
      Top = 16
      Width = 100
      Height = 25
      Caption = '>'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 128
      Top = 16
      Width = 100
      Height = 25
      Caption = '<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 24
      Top = 16
      Width = 100
      Height = 25
      Caption = '<<'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn8Click
    end
    object BitBtn1: TBitBtn
      Left = 48
      Top = 48
      Width = 120
      Height = 32
      Caption = '&Retirar'
      Enabled = False
      TabOrder = 6
      OnClick = BitBtn1Click
      Glyph.Data = {
        72010000424D7201000000000000760000002800000013000000150000000100
        040000000000FC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888800000FFFFFFFFFFFFFFFFFF800000FFFFFFFFFFFFFFFFFFF00000FFFF
        FFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFFFFFFF822FFFFFFF0
        0000FFFFFFFFFFF27FFFFFF00000FFFFFFFFFFF728FFFFF00000FFFFFFFFFFF8
        27FFFFF00000FFFFF2FFFFF722FFFFF00000FFFF222FF2222222FFF00000FFF2
        2222FF22222FFFF00000FF3333333FF333FFFFF00000FFFF778FFFFF7FFFFFF0
        0000FFFF878FFFFFFFFFFFF00000FFFF878FFFFFFFFFFFF00000FFFFF87FFFFF
        FFFFFFF00000FFFFFF778FFFFFFFFFF00000FFFFFFFFFFFFFFFFFFF00000FFFF
        FFFFFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFF800000}
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 24
    Width = 465
    Height = 225
    Caption = 'Dados sobre Produto em Estoque'
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 58
      Height = 13
      Caption = 'Qtd.M'#237'nima:'
    end
    object Label4: TLabel
      Left = 200
      Top = 104
      Width = 77
      Height = 13
      Caption = 'Tipo de Medida:'
    end
    object Label5: TLabel
      Left = 24
      Top = 144
      Width = 47
      Height = 13
      Caption = 'Qtd. Estq:'
    end
    object Label7: TLabel
      Left = 240
      Top = 144
      Width = 31
      Height = 13
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 24
      Top = 184
      Width = 168
      Height = 16
      Caption = 'Valor Total em Estoque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 88
      Top = 20
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object Edit2: TEdit
      Left = 88
      Top = 60
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
      OnEnter = Edit2Enter
    end
    object Edit3: TEdit
      Left = 88
      Top = 100
      Width = 100
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 2
      OnEnter = Edit3Enter
    end
    object Edit4: TEdit
      Left = 288
      Top = 100
      Width = 100
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 3
      OnEnter = Edit4Enter
    end
    object Edit5: TEdit
      Left = 88
      Top = 140
      Width = 100
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 4
      OnEnter = Edit5Enter
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 288
      Top = 136
      Width = 100
      Height = 21
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnEnter = CurrencyEdit1Enter
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 208
      Top = 180
      Width = 180
      Height = 24
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnEnter = CurrencyEdit2Enter
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 256
    Width = 465
    Height = 105
    Caption = 'Dados sobre Estoque'
    TabOrder = 2
    object Label6: TLabel
      Left = 24
      Top = 24
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label10: TLabel
      Left = 24
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Quantidade:'
    end
    object Edit6: TEdit
      Left = 88
      Top = 20
      Width = 150
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit6Enter
    end
    object Edit7: TEdit
      Left = 88
      Top = 60
      Width = 150
      Height = 21
      Enabled = False
      MaxLength = 5
      TabOrder = 1
      OnChange = Edit7Change
    end
  end
  object MainMenu1: TMainMenu
    Left = 168
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Limpar1: TMenuItem
        Caption = '&Limpar'
        OnClick = Limpar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ListarTodosProdSemEstqs: TMenuItem
        Caption = 'Listar Produtos sem Estoque'
        Enabled = False
        OnClick = ListarTodosProdSemEstqsClick
      end
      object ListarProdutosProdComEstqs: TMenuItem
        Caption = 'Listar Produtos com Estoque'
        Enabled = False
        OnClick = ListarProdutosProdComEstqsClick
      end
      object ZerarEstoquedoProduto1: TMenuItem
        Caption = 'Zerar  Estoque do Produto'
        OnClick = ZerarEstoquedoProduto1Click
      end
    end
  end
end
