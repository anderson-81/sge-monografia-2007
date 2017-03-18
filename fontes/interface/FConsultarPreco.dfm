object FrmConsultarPreco: TFrmConsultarPreco
  Left = 368
  Top = 160
  BorderStyle = bsToolWindow
  Caption = 'Consultar Pre'#231'o'
  ClientHeight = 298
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 8
    Top = 8
    Width = 150
    Height = 24
    Caption = 'Consultar Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 32
    Width = 305
    Height = 193
    Caption = 'Produto'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Categoria:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object Label4: TLabel
      Left = 24
      Top = 104
      Width = 38
      Height = 13
      Caption = 'Medida:'
    end
    object Label3: TLabel
      Left = 24
      Top = 144
      Width = 46
      Height = 16
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 20
      Width = 200
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
    object Edit2: TEdit
      Left = 88
      Top = 100
      Width = 200
      Height = 24
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnEnter = Edit2Enter
    end
    object ComboBox2: TComboBox
      Left = 88
      Top = 60
      Width = 200
      Height = 19
      Style = csOwnerDrawFixed
      ItemHeight = 13
      TabOrder = 2
      OnChange = ComboBox2Change
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 88
      Top = 140
      Width = 200
      Height = 32
      Color = clInactiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnEnter = CurrencyEdit1Enter
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 232
    Width = 305
    Height = 60
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 88
      Top = 16
      Width = 130
      Height = 32
      Hint = 'Confirmar sele'#231#227'o.'
      Caption = '&Ok'
      ParentShowHint = False
      ShowHint = True
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
  end
end
