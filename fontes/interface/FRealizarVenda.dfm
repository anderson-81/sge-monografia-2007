object FrmRealizarVenda: TFrmRealizarVenda
  Left = 258
  Top = 222
  BorderStyle = bsToolWindow
  Caption = 'Realizar Venda'
  ClientHeight = 257
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 0
    Width = 143
    Height = 24
    Caption = 'Realizar Venda'
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
    Width = 441
    Height = 121
    Caption = 'Dados sobre Cliente'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Edit1: TEdit
      Left = 72
      Top = 32
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object Edit2: TEdit
      Left = 72
      Top = 72
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
      OnEnter = Edit2Enter
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 152
    Width = 441
    Height = 105
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 216
      Top = 56
      Width = 150
      Height = 30
      Caption = '&Confirmar'
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
      Left = 63
      Top = 56
      Width = 150
      Height = 30
      Caption = '&Buscar Cliente'
      TabOrder = 1
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
    object BitBtn8: TBitBtn
      Left = 12
      Top = 24
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
      TabOrder = 2
      OnClick = BitBtn8Click
    end
    object BitBtn7: TBitBtn
      Left = 114
      Top = 24
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
      TabOrder = 3
      OnClick = BitBtn7Click
    end
    object BitBtn6: TBitBtn
      Left = 216
      Top = 24
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
      TabOrder = 4
      OnClick = BitBtn6Click
    end
    object BitBtn5: TBitBtn
      Left = 318
      Top = 24
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
      TabOrder = 5
      OnClick = BitBtn5Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 160
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Editar1: TMenuItem
      Caption = 'Editar'
      object Limpar1: TMenuItem
        Caption = 'Limpar'
        OnClick = Limpar1Click
      end
    end
  end
end