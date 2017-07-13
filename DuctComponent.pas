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
        thisLabel : TLabel;
       published

       constructor Create(X,Y : Integer);
        procedure SetLabel(var theLabel: TLabel);
         procedure MoveTo(X,Y : Integer);
   End;
implementation

constructor TDuctComponent.Create(X,Y : Integer);
 begin


 end;

 procedure TDuctComponent.SetLabel(var theLabel: TLabel);
 begin
   thisLabel := theLabel;
 end;

 procedure TDuctComponent.MoveTo(X,Y : Integer);

 begin
   thisLabel.Top := Y;
   thisLabel.Left := X;
 end;


end.
