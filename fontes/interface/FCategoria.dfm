object FrmCategoria: TFrmCategoria
  Left = 233
  Top = 239
  Width = 387
  Height = 279
  BorderStyle = bsSizeToolWin
  Caption = 'Categoria dos Produtos'
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
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 259
    Height = 24
    Caption = 'Criar Categoria de Produtos'
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
    Width = 361
    Height = 113
    Caption = 'Listagem das Categorias de Produtos'
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 24
      Top = 32
      Width = 313
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 24
      Top = 72
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 216
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit2'
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 144
    Width = 361
    Height = 73
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 232
      Top = 24
      Width = 100
      Height = 30
      Caption = '&Criar'
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
      Left = 128
      Top = 24
      Width = 100
      Height = 30
      Caption = '&Editar'
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
      Left = 24
      Top = 24
      Width = 100
      Height = 30
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = BitBtn3Click
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
  end
  object MainMenu1: TMainMenu
    Left = 352
    Top = 8
    object Editar1: TMenuItem
      Caption = 'Arquivo'
      object Limpar1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Editar2: TMenuItem
      Caption = 'Editar'
      object Limpar2: TMenuItem
        Caption = 'Limpar'
      end
    end
  end
end
