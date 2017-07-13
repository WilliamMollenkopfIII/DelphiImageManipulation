unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Math,System.Generics.Collections,
  DuctComponent;

type
  TForm1 = class(TForm)
  // Source: https://www.youtube.com/watch?v=jG2AHvXo4R0
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    imageGeneratedCounter : Integer;
  end;

var
  Form1: TForm1;
  Move: Boolean;
  P1: TPoint;
  P2: TPoint;
  dCompList: TObjectList<TDuctComponent>;
implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);

var
//   aLabel: TLabel;
  aDuctComponent : TDuctComponent;
  aImage: TImage;
 begin
    aImage := TImage.Create(self);
    aImage.Parent := self;
    aImage.Visible := True;
    aImage.Picture.LoadFromFile('Images\dummyImage1.png');
    aDuctComponent :=        TDuctComponent.Create(0,0);
    aDuctComponent.SetImageRef(aImage);
    dCompList.Add(aDuctComponent);
    imageGeneratedCounter := imageGeneratedCounter + 1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  dCompList[imageGeneratedCounter].MoveTo(RandomRange(1, 150),RandomRange(1, 150));

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  imageGeneratedCounter := -1;
  dCompList := TObjectList<TDuctComponent>.Create;
end;


procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Move := true;
  P1.X := X;
  P1.Y := Y;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if(Move=true) then
    begin

      if (X > P1.X) then
        Image1.Left := Image1.Left + (X - P1.X);
      if (X < P1.X) then
        Image1.Left := Image1.Left - (P1.X - X);
      if (Y > P1.Y) then
        Image1.Top := Image1.Top + (Y - P1.Y);
      if (Y < P1.Y) then
        Image1.Top := Image1.Top - (P1.Y - Y);
    end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      Move := false;
end;

end.
