object FrmRealizarCompra: TFrmRealizarCompra
  Left = 415
  Top = 180
  Width = 426
  Height = 270
  BorderStyle = bsSizeToolWin
  Caption = 'Realizar Compra'
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
    Width = 155
    Height = 24
    Caption = 'Realizar Compra'
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
    Width = 401
    Height = 105
    Caption = 'Dados sobre Fornecedor'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 30
      Height = 13
      Caption = 'CNPJ:'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 66
      Height = 13
      Caption = 'Raz'#227'o Social:'
    end
    object Edit1: TEdit
      Left = 88
      Top = 60
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
      OnEnter = Edit1Enter
    end
    object MaskEdit1: TMaskEdit
      Left = 88
      Top = 20
      Width = 300
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
      OnEnter = MaskEdit1Enter
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 401
    Height = 73
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 208
      Top = 24
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
      Left = 56
      Top = 24
      Width = 150
      Height = 30
      Caption = '&Sel. Fornecedor'
      TabOrder = 1
      OnClick = BitBtn2Click
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
  end
  object Edit2: TEdit
    Left = 240
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Edit3: TEdit
    Left = 112
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 368
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
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