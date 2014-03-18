unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  gpList:integer;
  specList:string[1];
  btnPressed:boolean;

implementation

uses
  Unit1, Unit4, Unit2;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
  if Length(Edit1.Text)=0 then
  begin
    MessageBox(0,pChar('��������� �� ����'),pChar('������������'),MB_OK+MB_ICONWARNING);
    exit;
  end;
  btnPressed:=true;
  Form5.Close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gpList:=StrToInt(Edit1.Text);
  case ComboBox1.ItemIndex of
  0: specList:='k';
  1: specList:='b';
  2: specList:='m';
  end;
  savePath:=ExtractFilePath(Application.ExeName)+'groups/'+IntToStr(gpList)+specList+'.txt';
  gpNum:=gpList;
  spec:=specList;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['1'..'4',#8]) then key:=#0;
   if ((Length(edit1.text)+1) = 3) and (not (key = #8)) then key:=#0;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  btnPressed:=false;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=btnPressed;
end;

end.
