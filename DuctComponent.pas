unit DuctComponent;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Math;
type
   TDuctComponent = Class
       private
        thisImage : TImage;
        P1: TPoint;
        Move: Boolean;
       published

       constructor Create();
        procedure SetImageRef(var theImage: TImage);
         procedure MoveTo(X,Y : Integer);
         procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
         procedure MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
         procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   End;
implementation

constructor TDuctComponent.Create();
 begin
     Move := false;

 end;

 procedure TDuctComponent.SetImageRef(var theImage: TImage);
 begin
    thisImage := theImage;
    thisImage.OnMouseDown := self.MouseDown;
    thisImage.OnMouseMove := self.MouseMove;
    thisImage.OnMouseUp := self.MouseUp;
 end;

 procedure TDuctComponent.MoveTo(X,Y : Integer);

 begin
   thisImage.Top := Y;
   thisImage.Left := X;
 end;




 procedure TDuctComponent.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Move := true;
  P1.X := X;
  P1.Y := Y;
end;

procedure TDuctComponent.MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
  if(Move=true) then
    begin

      if (X > P1.X) then
        thisImage.Left := thisImage.Left + (X - P1.X);
      if (X < P1.X) then
        thisImage.Left := thisImage.Left - (P1.X - X);
      if (Y > P1.Y) then
        thisImage.Top := thisImage.Top + (Y - P1.Y);
      if (Y < P1.Y) then
        thisImage.Top := thisImage.Top - (P1.Y - Y);
    end;
end;

procedure TDuctComponent.MouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
      Move := false;
end;


end.
