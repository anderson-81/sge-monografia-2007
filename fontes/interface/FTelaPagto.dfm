object FrmTelaPagto: TFrmTelaPagto
  Left = 325
  Top = 134
  Width = 425
  Height = 515
  BorderStyle = bsSizeToolWin
  Caption = 'Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Venda: TLabel
    Left = 8
    Top = 8
    Width = 106
    Height = 24
    Caption = 'Pagamento'
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
    Width = 401
    Height = 105
    Caption = 'Dados sobre Cliente'
    TabOrder = 0
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
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Edit1: TEdit
      Left = 84
      Top = 20
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object Edit2: TEdit
      Left = 84
      Top = 60
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
      OnEnter = Edit2Enter
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 405
    Width = 401
    Height = 73
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 264
      Top = 24
      Width = 120
      Height = 30
      Hint = 'Confirma a realiza'#231#227'o de uma venda.'
      Caption = 'C&onfirmar'
      TabOrder = 0
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 24
      Top = 24
      Width = 120
      Height = 30
      Hint = 'Cancela a Realiza'#231#227'o de uma Venda.'
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn4Click
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
    object BitBtn2: TBitBtn
      Left = 144
      Top = 24
      Width = 120
      Height = 30
      Caption = 'It'#233'ns de Venda'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFBDADAD
        DEDEDEFFFFFFF7FFF7F7F7F7FFF7F7F7F7F7FFFFF7F7F7F7FFFFF7F7F7F7F7FF
        F7F7F7F7FFF7F7F7F7F7948C8C73637BA55A6BD6DEDEFFFFFFF7F7F7F7F7FFF7
        F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7FFF7F7F7F7F7FFF7F7F7429CD63163BD
        94849C9C636BDEDEDEFFFFFFF7FFF7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7FFF7
        F7F7F7F7F7FFF7F7F7F784C6F731ADFF3163C694849CA55A6BD6DEDEFFFFFFF7
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7FFFFF773C6F7
        39ADFF3163C694849C9C636BD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F7F7F7F7FFFFF7F7F7F7F7F7FFFFFFF77BC6F731ADFF3163C6847B94E7BDCEDE
        DEDE9C9CADA5A5A59C9CAD9C9C9CFFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7F7F7
        FFFFF773C6EF31ADFF5A6B9C7B738C845A63CE9C84CEB594E7CEADBD8C8C6B31
        42D6DEE7FFFFFFF7F7F7F7F7FFF7F7F7F7F7F7FFFFF79CD6FFDEC6D69C7373FF
        DEADFFFFCEFFFFCEF7FFD6FFFFDEF7E7DE73394ADEDEE7FFFFF7FFFFF7F7F7F7
        FFFFF7F7F7F7FFFFFFD6C6C6FFD6A5F7F7C6F7F7BDF7F7D6FFFFE7F7F7F7FFFF
        FFEFE7CE522939FFFFFFF7F7F7F7F7F7F7F7FFF7F7F7FFFFFFD6948CFFF7CEF7
        DEA5F7F7C6F7F7D6F7F7EFF7F7F7F7F7F7FFFFDE9C6373A5ADADFFF7F7F7F7F7
        F7FFF7F7FFFFE7C6BDE7C6ADFFEFB5F7D6A5FFF7C6F7F7D6F7FFDEF7F7E7FFF7
        DEF7FFDEC6A584ADADB5F7F7FFF7F7F7F7F7F7FFFFF7DEC6C6E7CEADF7E7ADF7
        DEADF7E7BDF7FFC6F7F7D6F7F7CEF7F7D6FFFFCEBD9484A5A5A5F7FFF7F7F7F7
        FFF7F7F7F7F7FFFFFFD6AD8CFFFFE7F7DEBDF7D6A5F7EFBDFFF7BDF7F7C6FFF7
        B5FFFFCE94525AFFFFFFF7F7FFF7F7F7F7F7FFF7F7F7F7FFFFDEB5BDF7E7D6F7
        FFFFF7EFD6F7D6A5F7CEA5F7DEA5FFF7CEDEB584B594ADFFFFFFFFF7F7F7F7F7
        F7FFF7F7F7F7FFF7F7F7FFFFCE9C9CEFE7DEFFFFE7F7F7CEFFF7BDF7F7C6E7B5
        8CA58484FFFFFFF7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7FFFFFFD6
        B5BDC68C8CC69C84DEAD9CDEADADE7D6E7FFFFFFF7F7F7F7F7F7}
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 328
    Width = 401
    Height = 80
    Caption = 'Dados sobre Pagamento'
    TabOrder = 2
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 109
      Height = 16
      Caption = 'Valor do Pagto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 24
      Top = 35
      Width = 150
      Height = 32
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnEnter = CurrencyEdit2Enter
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 18
      Width = 120
      Height = 50
      Caption = 'TAXA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 144
    Width = 129
    Height = 185
    Caption = 'Formas de Pagamento'
    TabOrder = 3
    object RadioButton3: TRadioButton
      Left = 24
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Dinheiro'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 24
      Top = 54
      Width = 113
      Height = 17
      Caption = 'Cheque'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
    object RadioButton5: TRadioButton
      Left = 24
      Top = 84
      Width = 113
      Height = 17
      Caption = 'Cart'#227'o'
      TabOrder = 2
      OnClick = RadioButton5Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 144
    Top = 144
    Width = 265
    Height = 185
    Caption = 'Dados sobre Cheque'
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 40
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object Label6: TLabel
      Left = 24
      Top = 64
      Width = 31
      Height = 13
      Caption = 'Conta:'
    end
    object Label7: TLabel
      Left = 24
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Ag'#234'ncia:'
    end
    object Label8: TLabel
      Left = 24
      Top = 144
      Width = 34
      Height = 13
      Caption = 'Banco:'
    end
    object Edit5: TEdit
      Left = 88
      Top = 20
      Width = 121
      Height = 21
      MaxLength = 6
      TabOrder = 0
      Text = '0'
      OnChange = Edit5Change
    end
    object Edit6: TEdit
      Left = 88
      Top = 60
      Width = 121
      Height = 21
      MaxLength = 6
      TabOrder = 1
      Text = '0'
      OnChange = Edit6Change
    end
    object Edit7: TEdit
      Left = 88
      Top = 100
      Width = 121
      Height = 21
      MaxLength = 6
      TabOrder = 2
      Text = '0'
      OnChange = Edit7Change
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 140
      Width = 120
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      Sorted = True
      TabOrder = 3
      Items.Strings = (
        'Banco do Brasil'
        'Banco Real'
        'Bradesco'
        'Caixa Econ'#244'mica'
        'CitiBank'
        'HSBC'
        'Ita'#250
        'Santander')
    end
  end
  object Edit3: TEdit
    Left = 280
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit3'
    Visible = False
  end
  object Edit4: TEdit
    Left = 152
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit4'
    Visible = False
  end
  object GroupBox2: TGroupBox
    Left = 144
    Top = 144
    Width = 265
    Height = 185
    Caption = 'Dados sobre Cart'#227'o'
    TabOrder = 7
    Visible = False
    object Label5: TLabel
      Left = 24
      Top = 24
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label9: TLabel
      Left = 24
      Top = 64
      Width = 45
      Height = 13
      Caption = 'Bandeira:'
    end
    object Label10: TLabel
      Left = 24
      Top = 104
      Width = 44
      Height = 13
      Caption = 'Dt.Vcmto'
    end
    object Edit8: TEdit
      Left = 88
      Top = 20
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 88
      Top = 60
      Width = 120
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      Sorted = True
      TabOrder = 1
      Items.Strings = (
        'MasterCard'
        'Visa')
    end
    object DateTimePicker1: TDateTimePicker
      Left = 88
      Top = 100
      Width = 120
      Height = 21
      Date = 39418.052157835650000000
      Time = 39418.052157835650000000
      TabOrder = 2
      OnClick = DateTimePicker1Click
      OnChange = DateTimePicker1Change
    end
  end
  object GroupBox7: TGroupBox
    Left = 144
    Top = 144
    Width = 265
    Height = 185
    TabOrder = 8
    Visible = False
  end
end
