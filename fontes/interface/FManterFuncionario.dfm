object FrmManterFuncionario: TFrmManterFuncionario
  Left = 280
  Top = 66
  BiDiMode = bdRightToLeftNoAlign
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsToolWindow
  Caption = 'Manter Funcion'#225'rio'
  ClientHeight = 545
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 8
    Top = 0
    Width = 183
    Height = 24
    Caption = 'Manter Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 448
    Width = 465
    Height = 90
    Caption = 'Opera'#231#245'es'
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 336
      Top = 48
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Hint = 'Incluir funcion'#225'rio.'
      Caption = '&Incluir'
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
    object BitBtn2: TBitBtn
      Left = 232
      Top = 48
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Hint = 'Editar dados de funcion'#225'rio.'
      Caption = 'E&ditar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 128
      Top = 48
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Hint = 'Buscar funcion'#225'rio.'
      Caption = '&Buscar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 24
      Top = 48
      Width = 100
      Height = 32
      Cursor = crHandPoint
      Hint = 'Excluir funcion'#225'rio.'
      Caption = '&Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFF7F7F7F7
        FFFFF7FFFFFFFFFFFFF7F7F7FFF7F7F7F7F7FFFFF7F7F7F7FFFFF7F7F7F7F7FF
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFFFFF9CA584DEDEDEFFFFF7F7F7FFF7
        F7F7F7F7F7F7F7F7F7F7FFF7F7F7FFFFFFFFFFF7F7F7FFF7F7F7FFF7F7FFFFFF
        846BDE0800E7211052FFFFFFF7FFF7F7F7F7FFF7F7F7F7F7F7FFF7FFFFFF634A
        BD0000B5FFFFFFF7F7F7F7F7FFFFFFF7DED6F70000D61800C6ADB594FFFFFFF7
        F7F7F7F7FFF7F7F7FFFFFF634ABD0000CEDEDEEFFFFFFFF7F7F7F7FFF7F7F7F7
        FFFFF7DED6F70000DE100084EFF7D6FFFFFFF7FFF7FFFFFF5231CE0000C6F7F7
        EFFFFFFFFFFFF7F7F7F7F7F7FFF7F7F7F7F7FFFFFFF7DED6F70000DE181063EF
        F7DEFFFFFF4A31CE0000CEEFEFE7FFFFFFF7F7F7F7F7FFF7F7F7FFF7F7F7F7F7
        F7FFF7F7F7F7FFFFF7DED6F70000DE29295A6342DE0000CEEFEFE7FFFFFFFFF7
        F7F7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFFFFFF7EFEFFF10
        00DE1000D6C6C6ADFFFFFFF7F7F7F7F7FFF7F7F7F7F7F7F7F7F7FFFFF7F7F7F7
        FFFFF7F7F7F7F7FFF7FFFFFF5231D61800CE2100DE180873EFEFCEFFFFFFF7FF
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7F7F7FFF7F7F7FFFFFF4A31CE0000CEEF
        EFE7F7F7FF4218E708009CADAD8CFFFFFFF7F7F7F7F7FFF7F7F7FFF7F7F7F7F7
        F7FFF7FFFFFF5231CE0000D6E7E7E7FFFFFFFFFFF7FFFFFF5A39E70000BD6B6B
        6BFFFFFFF7FFF7F7F7F7F7F7FFF7F7F7FFFFFF4A29CE0800DE634AC6FFFFFFF7
        F7F7F7F7FFF7F7F7FFFFFFDED6F70000DE9C94ADFFFFFFF7F7F7F7FFF7FFFFF7
        5231DE0800D6634AC6FFFFFFFFF7F7F7F7F7F7FFF7F7F7F7FFF7F7F7FFF7FFFF
        F7FFFFFFFFFFF7F7F7F7F7F7FFFFFFF70800DE5231D6FFFFFFF7F7F7F7F7FFF7
        F7F7F7F7FFF7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7FFF7F7F7F7F7
        FFFFF7FFFFFFFFF7F7F7F7F7F7FFF7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7FFF7
        F7F7F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7
        F7F7F7F7FFF7F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7F7F7}
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
      TabOrder = 4
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
      TabOrder = 5
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
      TabOrder = 6
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
      TabOrder = 7
      OnClick = BitBtn8Click
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 24
    Width = 465
    Height = 417
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 23
        Height = 13
        Caption = 'CPF:'
      end
      object Label2: TLabel
        Left = 24
        Top = 64
        Width = 19
        Height = 13
        Caption = 'RG:'
      end
      object Label3: TLabel
        Left = 24
        Top = 104
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label4: TLabel
        Left = 24
        Top = 144
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
      end
      object Label5: TLabel
        Left = 24
        Top = 184
        Width = 30
        Height = 13
        Caption = 'Bairro:'
      end
      object Label8: TLabel
        Left = 232
        Top = 184
        Width = 24
        Height = 13
        Caption = 'CEP:'
      end
      object Label6: TLabel
        Left = 24
        Top = 224
        Width = 36
        Height = 13
        Caption = 'Cidade:'
      end
      object Label9: TLabel
        Left = 24
        Top = 264
        Width = 31
        Height = 13
        Caption = 'E-mail:'
      end
      object Label16: TLabel
        Left = 24
        Top = 304
        Width = 58
        Height = 13
        Caption = 'Tit. Eleitoral:'
      end
      object Label10: TLabel
        Left = 24
        Top = 344
        Width = 54
        Height = 13
        Caption = 'Data Nasc:'
      end
      object Label7: TLabel
        Left = 312
        Top = 344
        Width = 27
        Height = 13
        Caption = 'Sexo:'
      end
      object Edit1: TEdit
        Left = 88
        Top = 100
        Width = 300
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 88
        Top = 140
        Width = 300
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 88
        Top = 220
        Width = 300
        Height = 21
        TabOrder = 5
      end
      object Edit5: TEdit
        Left = 88
        Top = 260
        Width = 300
        Height = 21
        TabOrder = 6
      end
      object Edit3: TEdit
        Left = 88
        Top = 180
        Width = 130
        Height = 21
        TabOrder = 3
      end
      object DateTimePicker1: TDateTimePicker
        Left = 88
        Top = 340
        Width = 150
        Height = 21
        Date = 39237.002944236110000000
        Time = 39237.002944236110000000
        TabOrder = 7
        OnExit = DateTimePicker1Exit
      end
      object ComboBox1: TComboBox
        Left = 344
        Top = 340
        Width = 41
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Text = 'F'
        Items.Strings = (
          'F'
          'M')
      end
      object MaskEdit2: TMaskEdit
        Left = 88
        Top = 60
        Width = 150
        Height = 21
        EditMask = '!AAAAAAAA\-A;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '        - '
      end
      object MaskEdit3: TMaskEdit
        Left = 264
        Top = 180
        Width = 120
        Height = 21
        EditMask = '!00000\-000;0;_'
        MaxLength = 9
        TabOrder = 4
        Text = '00000000'
      end
      object Edit6: TEdit
        Left = 88
        Top = 304
        Width = 150
        Height = 21
        MaxLength = 11
        TabOrder = 9
        Text = '0'
        OnChange = Edit6Change
      end
      object MaskEdit1: TMaskEdit
        Left = 88
        Top = 24
        Width = 150
        Height = 21
        EditMask = '!000\.000\.000\-00;0;_'
        MaxLength = 14
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Label11: TLabel
        Left = 24
        Top = 24
        Width = 44
        Height = 13
        Caption = 'Cart.Prof:'
      end
      object Label15: TLabel
        Left = 24
        Top = 64
        Width = 52
        Height = 13
        Caption = 'S'#233'rie Cart: '
      end
      object Label17: TLabel
        Left = 24
        Top = 144
        Width = 35
        Height = 13
        Caption = 'Sal'#225'rio:'
      end
      object Label18: TLabel
        Left = 24
        Top = 104
        Width = 31
        Height = 13
        Caption = 'Cargo:'
      end
      object Label13: TLabel
        Left = 25
        Top = 184
        Width = 48
        Height = 13
        Caption = 'Admiss'#227'o:'
      end
      object ComboBox2: TComboBox
        Left = 80
        Top = 100
        Width = 150
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Vendedor'
        Items.Strings = (
          'Vendedor'
          'Gerente')
      end
      object DateTimePicker2: TDateTimePicker
        Left = 80
        Top = 180
        Width = 150
        Height = 21
        Date = 39237.003403692130000000
        Time = 39237.003403692130000000
        Enabled = False
        TabOrder = 2
      end
      object MaskEdit6: TMaskEdit
        Left = 80
        Top = 60
        Width = 150
        Height = 21
        EditMask = '!000\-AA;1;_'
        MaxLength = 6
        TabOrder = 0
        Text = '   -  '
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 80
        Top = 140
        Width = 150
        Height = 21
        TabOrder = 3
      end
      object Edit7: TEdit
        Left = 80
        Top = 20
        Width = 150
        Height = 21
        MaxLength = 6
        TabOrder = 4
        Text = '0'
        OnChange = Edit7Change
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 440
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
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
      object ListarTodososFuncionrios1: TMenuItem
        Caption = 'Listar Todos os Funcion'#225'rios'
        OnClick = ListarTodososFuncionrios1Click
      end
    end
  end
end
