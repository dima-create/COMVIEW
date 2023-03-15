unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,inifiles, Menus, Registry;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    ColorDialog1: TColorDialog;
    SetBackground1: TMenuItem;
    SetTimecolor1: TMenuItem;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Close1Click(Sender: TObject);
    procedure SetBackground1Click(Sender: TObject);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SetTimecolor1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  x,y,i,norm_len,pos_main,size :integer;
  len:double;
  colorBg,colorT:TColor;
  reg:TRegistry;
  valNames:TStringList;
Const
area_size= 120;
mul_coef= 1;
 FR_PRIVATE = $10;
  function AddFontResourceExA(FontFileName: PAnsiChar; Flags: DWORD;
    Reserved: Pointer): Integer; stdcall; external gdi32;
implementation

{$R *.dfm}


procedure GetComPorts();
var
i:integer;
begin
  Form1.ListBox1.Clear;
  reg.GetValueNames(valNames);
  if valNames.Count<>0 then begin
  for i := 0 to valNames.Count - 1 do begin
  Form1.ListBox1.Items.Add(reg.readstring(valNames.Strings[i]));
  end;
  Form1.ListBox1.Height:=valNames.Count*20;
  Form1.Height:=valNames.Count*20;
  end
  else begin
  Form1.ListBox1.Height:=20;
  Form1.Height:=20;
  Form1.ListBox1.Items.Add('---');
  end;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
data_load:tinifile;
begin
data_load := TIniFile.Create(pchar(ExtractFilePath(Application.ExeName) + 'settings.ini'));
data_load.WriteInteger('MAIN', 'POSX', Form1.Left);
data_load.WriteInteger('MAIN', 'POSY', Form1.Top);

data_load.WriteInteger('COLORS', 'BG', colorBg);
data_load.WriteInteger('COLORS', 'TEXT', colorT);
data_load.Free;
reg.Free;
valNames.Free;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
data_load:tinifile;
begin
ListBox1.Clear;
valNames:= TStringList.Create;
data_load := TIniFile.Create(pchar(ExtractFilePath(Application.ExeName) + 'settings.ini'));
Form1.Left:=data_load.ReadInteger('MAIN', 'POSX', 0);
Form1.Top:=data_load.ReadInteger('MAIN', 'POSY', 0);
colorBg:=data_load.ReadInteger('COLORS', 'BG', clBlack);
colorT:=data_load.ReadInteger('COLORS', 'TEXT', cllime);
ListBox1.Color:= colorBg;
ListBox1.Font.Color:= colorT;
data_load.Free;
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('hardware\devicemap\serialcomm', false);
  GetComPorts();
end;

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm1.SetBackground1Click(Sender: TObject);
begin
if ColorDialog1.Execute() then begin
colorBg:=ColorDialog1.Color;
Form1.Color:=colorBg;
ListBox1.Color:= colorBg;
end;
end;

procedure TForm1.SetTimecolor1Click(Sender: TObject);
begin
if ColorDialog1.Execute() then begin
colorT:=ColorDialog1.Color;
ListBox1.Font.Color:= colorT;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
GetComPorts();
end;

end.
