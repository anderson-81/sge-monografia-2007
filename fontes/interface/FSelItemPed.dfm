object FrmSelItemPed: TFrmSelItemPed
  Left = 295
  Top = 141
  Width = 413
  Height = 465
  BorderStyle = bsSizeToolWin
  Caption = 'Selecionar Item de Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 253
    Height = 24
    Caption = 'Selecionar It'#233'ns de Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 32
    Width = 390
    Height = 97
    Caption = 'Sele'#231#227'o de Produto'
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Categorias:'
    end
    object Label3: TLabel
      Left = 24
      Top = 60
      Width = 45
      Height = 13
      Caption = 'Produtos:'
    end
    object ComboBox1: TComboBox
      Left = 96
      Top = 20
      Width = 250
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object ComboBox2: TComboBox
      Left = 96
      Top = 60
      Width = 250
      Height = 19
      Style = csOwnerDrawFixed
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox2Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 390
    Height = 57
    Caption = 'Dados sobre Produto'
    TabOrder = 1
    object Label4: TLabel
      Left = 24
      Top = 24
      Width = 3
      Height = 13
    end
    object Label5: TLabel
      Left = 208
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Medida:'
    end
    object Label7: TLabel
      Left = 24
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Qtd.Estoque:'
    end
    object Edit1: TEdit
      Left = 96
      Top = 20
      Width = 100
      Height = 21
      Color = clInactiveBorder
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object Edit2: TEdit
      Left = 256
      Top = 20
      Width = 90
      Height = 21
      Color = clInactiveBorder
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      OnEnter = Edit2Enter
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 352
    Width = 390
    Height = 73
    Caption = 'Opera'#231#245'es'
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 200
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Incluir'
      Enabled = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFF7FFF7FF
        004A00182118FFFFFFFFFFFFFFFFF7F7F7F7FFFFF7F7F7F7FFFFF7F7F7F7F7FF
        F7F7F7F7FFF7F7F7F7F7F7F7F7FFF7FF004A00006B00293929081808FFFFFFFF
        FFF7F7F7FFF7F7F7F7F7FFF7F7F7F7F7FFF7F7F7F7F7FFF7F7F7FFFFF7FFEFFF
        005200089418007300085A08081800FFFFFFFFFFFFF7F7F7F7FFF7F7F7F7FFF7
        F7F7F7F7F7FFF7F7F7F7F7F7FFFFEFFF00520010A52110A52900840808630821
        3121081008FFFFFFF7F7FFF7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7FFF7FFEFFF
        005A0010A53118B53110AD29089410006B00186308001800FFFFFFF7F7F7FFFF
        F7F7F7F7FFFFF7F7F7F7F7F7FFFFEFFF00520021AD3921B54218B52910A53108
        9C10007308086300001008FFFFFFFFFFFFF7F7F7F7F7FFF7F7F7FFFFF7FFEFFF
        005A0018AD4229C65218B54218B53110AD2910A518008C08006B001831211010
        08FFFFFFFFFFF7F7F7F7F7F7FFFFEFFF00520029B54A29BD5A21BD4A18B54218
        B52910A52908A518009410007300105A08081808FFF7FFFFF7F7FFFFF7FFEFFF
        005A0021B54A31CE6329BD5A21C65218B54218B53110AD2908A518007B00004A
        00001008FFFFFFF7F7F7F7F7F7FFEFFF00520029BD5231C66331CE5A29BD5A21
        BD4A21B54210A521005200002900FFF7FFFFFFFFF7F7F7F7F7F7FFFFF7FFEFFF
        005A0029BD5239D66B29C66331CE6329BD52109429003100FFF7FFFFFFFFFFFF
        F7F7F7F7F7FFF7F7F7F7F7F7FFFFEFFF00520039C65A39D67B39CE6321B55210
        8410002900FFFFFFF7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7FFF7FFEFFF
        005A0039C66B42DE7321AD42005A00002100FFFFFFF7F7F7FFF7F7F7F7F7FFFF
        F7F7F7F7FFFFF7F7F7F7F7F7FFFFEFFF005A0039C65A188C29003100FFEFFFFF
        FFFFF7F7FFF7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7FFFFF7FFEFFF
        004A00087310002900FFFFFFF7FFF7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7FFF7
        F7F7F7F7F7FFF7F7F7F7F7F7FFFFEFFF004A00003900FFFFFFF7FFF7F7F7F7F7
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7}
    end
    object BitBtn2: TBitBtn
      Left = 48
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFF7F7F7F7
        FFFFF7F7F7F7FFFFF7FFFFFFE7E7D6B5B5A5BDBDADADADA5FFFFFFFFFFFFF7FF
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF7DEDEE7A5A5C618219410
        29B51021AD213194212973BDBDA5FFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7F7F7
        FFFFF7E7E7E70018B50010EF1029F70829F71029F70821F70821DE0010A53139
        5AE7E7E7FFFFFFF7F7F7F7F7FFFFFFF7E7E7E70008DE0821F70821EF0010EF00
        10EF0008F70018EF1029F71029F70008BD313963DEDEE7FFFFF7F7FFF7FFFFF7
        3952EF0021EF0021EF425AF7E7E7F7FFFFF7FFFFF79CADF70018EF1029EF1031
        FF0010AD848C84FFFFFFFFFFFF8494EF0010EF0821EF2942F7FFFFF7FFF7FFF7
        F7F7FFFFFF5A6BDE0818F71029EF1029F70821EF182973E7E7DEFFFFF70008EF
        1029EF0018DEFFFFF7F7F7F7F7FFF7FFFFFF394ADE0018F70821EF0829EF1029
        EF0829F71829B5B5B5B5D6D6F70010EF0018F78C9CDEFFFFFFF7F7F7FFFFFF31
        4ADE0018F70018EF394AF7FFFFF70018F71029F70008C6BDBDB58494EF0018EF
        0821EF8494D6FFFFF7FFFFFF394ADE0018F70021EF394AEFFFFFF7FFFFF71839
        EF0821F70008C6B5BDB5D6D6F70018EF1021F70008A5FFFFFF394AE70018F700
        18EF394AF7FFFFF7F7F7FFFFFFF70018EF0821EF1829CEE7E7D6FFFFF70000EF
        1029EF0818D61029D60021F70018EF394AEFFFFFF7F7F7F7FFFFF794A5F70018
        EF0821F75A6BBDFFFFFFFFFFFF949CEF0018EF1029EF1021F70821EF5263FFFF
        FFF7FFFFFFFFFFFFDEDEEF0010E70821F70018EFE7E7E7FFFFF7F7FFF7FFFFF7
        0000EF1029EF1029EF0829F700109C8494C68C94D60010BD0010E70821EF0010
        EF6B7BBDFFFFFFF7F7F7F7F7FFFFFFF7DEDEF70000EF0018EF1029EF1021F700
        21EF0018F71029EF0818F70008EFD6DEF7FFFFF7F7F7FFF7F7F7FFF7F7F7F7F7
        FFFFF7FFFFF7949CF70008EF0018EF0018EF0821EF0000EF4A63EFE7E7F7FFFF
        F7F7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7FFFFFFFFFFF7CED6F78C
        94EF848CF7FFFFF7FFFFF7FFFFF7F7F7FFF7F7F7F7F7F7F7F7F7}
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 200
    Width = 390
    Height = 145
    Caption = 'Produtos Para Compra'
    TabOrder = 3
    object Label8: TLabel
      Left = 24
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Qt.Compra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 104
      Width = 67
      Height = 13
      Caption = 'Valor Pago:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 96
      Top = 60
      Width = 150
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 256
      Top = 56
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
    object BitBtn4: TBitBtn
      Left = 250
      Top = 80
      Width = 100
      Height = 50
      Caption = 'Calc&ular'
      Enabled = False
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 96
      Top = 100
      Width = 153
      Height = 28
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnEnter = CurrencyEdit1Enter
    end
    object Edit6: TEdit
      Left = 96
      Top = 24
      Width = 153
      Height = 21
      MaxLength = 6
      TabOrder = 4
      OnChange = Edit6Change
    end
  end
  object Edit3: TEdit
    Left = 280
    Top = 8
    Width = 113
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object Edit5: TEdit
    Left = 16
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Visible = False
  end
end
