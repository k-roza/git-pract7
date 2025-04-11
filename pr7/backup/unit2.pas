unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
    uses unit1,unit3,unit4,unit5;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  form1.Show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  form3.Show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  form4.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  form5.Show;
end;

end.

