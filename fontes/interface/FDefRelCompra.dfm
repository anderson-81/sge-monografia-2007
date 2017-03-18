object FrmDefRelCompra: TFrmDefRelCompra
  Left = 341
  Top = 88
  Width = 443
  Height = 612
  BorderStyle = bsSizeToolWin
  Caption = 'Defini'#231#227'o de Relat'#243'rio sobre Compra'
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
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 222
    Height = 24
    Caption = 'Relat'#243'rio sobre Compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 24
    Width = 420
    Height = 200
    Caption = 'Defini'#231#227'o sobre Relat'#243'rio'
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 168
      Height = 13
      Caption = 'Op'#231#245'es de Relat'#243'rio sobre Compra:'
    end
    object RadioButton1: TRadioButton
      Left = 48
      Top = 78
      Width = 225
      Height = 17
      Caption = 'Relat'#243'rio de Compra por Fornecedor'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 48
      Top = 48
      Width = 185
      Height = 17
      Caption = 'Relat'#243'rio Completo sobre Compra'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 48
      Top = 168
      Width = 225
      Height = 17
      Caption = 'Relat'#243'rio sobre Valores Totais de Compra'
      TabOrder = 2
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 48
      Top = 108
      Width = 257
      Height = 17
      Caption = 'Relat'#243'rio de Produtos Compradas por Categoria'
      TabOrder = 3
      OnClick = RadioButton4Click
    end
    object RadioButton5: TRadioButton
      Left = 48
      Top = 138
      Width = 225
      Height = 17
      Caption = 'Relat'#243'rio de Compra Por Produto'
      TabOrder = 4
      OnClick = RadioButton5Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 512
    Width = 420
    Height = 57
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 56
      Top = 16
      Width = 150
      Height = 30
      Caption = '&Cancelar'
      TabOrder = 0
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
    object BitBtn1: TBitBtn
      Left = 208
      Top = 16
      Width = 150
      Height = 30
      Caption = '&Confirmar'
      TabOrder = 1
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
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 230
    Width = 420
    Height = 210
    Caption = 'Relat'#243'rio de Compra Por Fornecedor'
    Enabled = False
    TabOrder = 2
    Visible = False
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
    end
    object Label4: TLabel
      Left = 24
      Top = 64
      Width = 43
      Height = 13
      Caption = 'R.Social:'
    end
    object Label5: TLabel
      Left = 112
      Top = 144
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label6: TLabel
      Left = 112
      Top = 176
      Width = 19
      Height = 13
      Caption = 'At'#233':'
    end
    object Edit2: TEdit
      Left = 88
      Top = 60
      Width = 300
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object MaskEdit1: TMaskEdit
      Left = 88
      Top = 24
      Width = 300
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 88
      Top = 90
      Width = 121
      Height = 17
      Caption = 'Listagem dos It'#233'ns'
      TabOrder = 2
    end
    object CheckBox3: TCheckBox
      Left = 88
      Top = 112
      Width = 161
      Height = 17
      Caption = 'Com Defini'#231#227'o de Per'#237'odo:'
      TabOrder = 3
      OnClick = CheckBox3Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 144
      Top = 140
      Width = 186
      Height = 21
      Date = 39407.899764953700000000
      Time = 39407.899764953700000000
      Enabled = False
      TabOrder = 4
    end
    object DateTimePicker2: TDateTimePicker
      Left = 144
      Top = 172
      Width = 186
      Height = 21
      Date = 39407.899804120360000000
      Time = 39407.899804120360000000
      Enabled = False
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 264
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'Edit1'
    end
    object Edit3: TEdit
      Left = 264
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'Edit3'
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 230
    Width = 420
    Height = 157
    Caption = 'Relat'#243'rio Completo sobre Compra'
    TabOrder = 3
    object Label8: TLabel
      Left = 72
      Top = 112
      Width = 19
      Height = 13
      Caption = 'At'#233':'
    end
    object Label9: TLabel
      Left = 72
      Top = 80
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object CheckBox1: TCheckBox
      Left = 48
      Top = 24
      Width = 121
      Height = 17
      Caption = 'Listagem dos It'#233'ns'
      TabOrder = 0
    end
    object CheckBox4: TCheckBox
      Left = 48
      Top = 48
      Width = 161
      Height = 17
      Caption = 'Com Defini'#231#227'o de Per'#237'odo:'
      TabOrder = 1
      OnClick = CheckBox4Click
    end
    object DateTimePicker3: TDateTimePicker
      Left = 104
      Top = 76
      Width = 186
      Height = 21
      Date = 39407.899764953700000000
      Time = 39407.899764953700000000
      Enabled = False
      TabOrder = 2
    end
    object DateTimePicker4: TDateTimePicker
      Left = 104
      Top = 112
      Width = 186
      Height = 21
      Date = 39407.899804120360000000
      Time = 39407.899804120360000000
      Enabled = False
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 230
    Width = 420
    Height = 173
    Caption = 'Relat'#243'rio de Compra de Produtos Por Categoria'
    TabOrder = 4
    Visible = False
    object Label7: TLabel
      Left = 24
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Categorias:'
    end
    object Label10: TLabel
      Left = 72
      Top = 88
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label11: TLabel
      Left = 72
      Top = 120
      Width = 19
      Height = 13
      Caption = 'At'#233':'
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 20
      Width = 200
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object DateTimePicker5: TDateTimePicker
      Left = 104
      Top = 84
      Width = 186
      Height = 21
      Date = 39407.899764953700000000
      Time = 39407.899764953700000000
      Enabled = False
      TabOrder = 1
    end
    object DateTimePicker6: TDateTimePicker
      Left = 104
      Top = 120
      Width = 186
      Height = 21
      Date = 39407.899804120360000000
      Time = 39407.899804120360000000
      Enabled = False
      TabOrder = 2
    end
    object CheckBox5: TCheckBox
      Left = 48
      Top = 56
      Width = 161
      Height = 17
      Caption = 'Com Defini'#231#227'o de Per'#237'odo:'
      TabOrder = 3
      OnClick = CheckBox5Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 230
    Width = 420
    Height = 129
    Caption = 'Relat'#243'rio Sobre Valores Totais de Compra'
    TabOrder = 5
    Visible = False
    object Label14: TLabel
      Left = 48
      Top = 56
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label15: TLabel
      Left = 48
      Top = 88
      Width = 19
      Height = 13
      Caption = 'At'#233':'
    end
    object CheckBox7: TCheckBox
      Left = 24
      Top = 24
      Width = 161
      Height = 17
      Caption = 'Com Defini'#231#227'o de Per'#237'odo:'
      TabOrder = 0
      OnClick = CheckBox7Click
    end
    object DateTimePicker7: TDateTimePicker
      Left = 88
      Top = 52
      Width = 186
      Height = 21
      Date = 39407.899764953700000000
      Time = 39407.899764953700000000
      Enabled = False
      TabOrder = 1
    end
    object DateTimePicker8: TDateTimePicker
      Left = 88
      Top = 84
      Width = 186
      Height = 21
      Date = 39407.899804120360000000
      Time = 39407.899804120360000000
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 230
    Width = 420
    Height = 273
    Caption = 'Relat'#243'rio de Compra Por Produto'
    TabOrder = 6
    Visible = False
    object Label12: TLabel
      Left = 24
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Categorias:'
    end
    object Label13: TLabel
      Left = 64
      Top = 128
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label16: TLabel
      Left = 64
      Top = 160
      Width = 19
      Height = 13
      Caption = 'At'#233':'
    end
    object Label17: TLabel
      Left = 24
      Top = 64
      Width = 45
      Height = 13
      Caption = 'Produtos:'
    end
    object ComboBox2: TComboBox
      Left = 88
      Top = 20
      Width = 200
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = ComboBox2Change
    end
    object DateTimePicker9: TDateTimePicker
      Left = 96
      Top = 124
      Width = 186
      Height = 21
      Date = 39407.899764953700000000
      Time = 39407.899764953700000000
      Enabled = False
      TabOrder = 1
    end
    object DateTimePicker10: TDateTimePicker
      Left = 96
      Top = 160
      Width = 186
      Height = 21
      Date = 39407.899804120360000000
      Time = 39407.899804120360000000
      Enabled = False
      TabOrder = 2
    end
    object CheckBox6: TCheckBox
      Left = 48
      Top = 96
      Width = 161
      Height = 17
      Caption = 'Com Defini'#231#227'o de Per'#237'odo:'
      TabOrder = 3
      OnClick = CheckBox6Click
    end
    object ComboBox3: TComboBox
      Left = 88
      Top = 60
      Width = 200
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
    end
  end
end
