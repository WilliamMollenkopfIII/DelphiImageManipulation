unit DuctComponent;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Math;
type
   TDuctComponent = Class
       private
        XPos : Integer;
        YPos : Integer;
        thisImage : TImage;
       published

       constructor Create(X,Y : Integer);
        procedure SetImageRef(var theImage: TImage);
         procedure MoveTo(X,Y : Integer);
   End;
implementation

constructor TDuctComponent.Create(X,Y : Integer);
 begin
   thisImage.Picture.LoadFromFile('Images\dummyImage1.png');

 end;

 procedure TDuctComponent.SetImageRef(var theImage: TImage);
 begin
   thisImage := theImage;
 end;

 procedure TDuctComponent.MoveTo(X,Y : Integer);

 begin
   thisImage.Top := Y;
   thisImage.Left := X;
 end;


end.
