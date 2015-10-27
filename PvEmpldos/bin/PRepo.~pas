unit PRepo;

interface

uses
  Sharemem, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Modulo, Main, jpeg, QRPrntr, ImgList,
  Menus, ComCtrls, ToolWin, QRExport, qrExtra ;

type
  TPFRepo = class(TForm)
    Status: TStatusBar;
    PageControl1: TPageControl;
    TabRepo: TTabSheet;
    TabPreview: TTabSheet;
    QRepo: TQuickRep;
    PHead: TQRBand;
    LTitu: TQRLabel;
    PFoot: TQRBand;
    QRPreview1: TQRPreview;
    MMenu: TMainMenu;
    Accion1: TMenuItem;
    Aumenta1: TMenuItem;
    ToolBar1: TToolBar;
    Disminuye1: TMenuItem;
    PaginaCompleta1: TMenuItem;
    N1: TMenuItem;
    Imprimir1: TMenuItem;
    Inicio1: TMenuItem;
    Anterior1: TMenuItem;
    Siguiente1: TMenuItem;
    Final1: TMenuItem;
    N2: TMenuItem;
    BImprime: TToolButton;
    ToolButton3: TToolButton;
    BInicio: TToolButton;
    BAnterior: TToolButton;
    BSiguiente: TToolButton;
    BFinal: TToolButton;
    ToolButton8: TToolButton;
    BAumenta: TToolButton;
    BDisminuye: TToolButton;
    BPagCom: TToolButton;
    ToolButton1: TToolButton;
    BCancela: TToolButton;
    Cerrar1: TMenuItem;
    Guarda1: TMenuItem;
    SaveDialog1: TSaveDialog;
    BGuarda: TToolButton;
    PrintDialog1: TPrintDialog;
    RLogo: TQRImage;
    procedure QRepoPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Imprimir1Click(Sender: TObject);
    procedure Inicio1Click(Sender: TObject);
    procedure Anterior1Click(Sender: TObject);
    procedure Siguiente1Click(Sender: TObject);
    procedure Final1Click(Sender: TObject);
    procedure Aumenta1Click(Sender: TObject);
    procedure Disminuye1Click(Sender: TObject);
    procedure HojaCompleta1Click(Sender: TObject);
    procedure QRPreview1ProgressUpdate(Sender: TObject; Progress: Integer);
    procedure Hojas ;
    procedure Cerrar1Click(Sender: TObject);
    procedure Guarda1Click(Sender: TObject);
    procedure Guarda ;
    procedure FormCreate(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  PFRepo: TPFRepo;
implementation

{$R *.DFM}


procedure TPFRepo.QRepoPreview(Sender: TObject);
begin
 PageControl1.ActivePage := TabPreview ;
 QRPreview1.QRPrinter := QRepo.QRPrinter ;
 Show ;
end;


procedure TPFRepo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 cadena := TOBject(Owner).ClassName ;
 if cadena= 'TFModulo' then
  begin
   TFmodulo(Owner).Enabled := True ;
   TFmodulo(Owner).WindowState := wsNormal ;
   TFmodulo(Owner).top := Top ;
   TFmodulo(Owner).left := Left ;
   TFModulo(Owner).Actform := nil ;
   TFModulo(Owner).Show ;
  end ;
 Action := caFree ;
end;


procedure TPFRepo.Imprimir1Click(Sender: TObject);
begin
// PrintDialog1.FromPage := 1;
// PrintDialog1.MinPage := 1;
// PrintDialog1.ToPage := PageControl1.PageCount;
// PrintDialog1.MaxPage := PageControl1.PageCount;
// if not PrintDialog1.Execute
// then exit ;

// QRPreview1.QRPrinter.Copies := PrintDialog1.Copies ;
// QRPreview1.QRPrinter.FirstPage := PrintDialog1.FromPage ;
// QRPreview1.QRPrinter.LastPage := PrintDialog1.ToPage ;
 QRPreview1.QRPrinter.Print ;
end;

procedure TPFRepo.Inicio1Click(Sender: TObject);
begin
 QRPreview1.PageNumber := 1 ;
 Hojas ;
end;

procedure TPFRepo.Anterior1Click(Sender: TObject);
begin
 QRPreview1.PageNumber :=  QRPreview1.PageNumber - 1 ;
 Hojas ;
end;

procedure TPFRepo.Siguiente1Click(Sender: TObject);
begin
 QRPreview1.PageNumber :=  QRPreview1.PageNumber + 1 ;
 Hojas ;
end;

procedure TPFRepo.Final1Click(Sender: TObject);
begin
 QRPreview1.PageNumber := QRPreview1.QRPrinter.PageCount ;
 Hojas ;
end;

procedure TPFRepo.Aumenta1Click(Sender: TObject);
begin
 QRPreview1.Zoom :=  QRPreview1.Zoom + 10 ;
end;

procedure TPFRepo.Disminuye1Click(Sender: TObject);
begin
  QRPreview1.Zoom :=  QRPreview1.Zoom - 10 ;
end;

procedure TPFRepo.HojaCompleta1Click(Sender: TObject);
begin
 QRPreview1.ZoomToFit ;
end;

procedure TPFRepo.QRPreview1ProgressUpdate(Sender: TObject;
  Progress: Integer);
begin
 Hojas ;
end ;

procedure TPFRepo.Hojas ;
begin
 Status.SimpleText := 'Pagina '+ IntToStr(QRPreview1.PageNumber)+ '/'+
   IntToStr(QRPreview1.QRPrinter.PageCount) ;
end ;


procedure TPFRepo.Cerrar1Click(Sender: TObject);
begin
 close ;
end;


procedure TPFRepo.Guarda1Click(Sender: TObject);
begin
 Guarda ;
end;

procedure TPFRepo.Guarda ;
var
  TxtExportFilter : TQRAsciiExportFilter;
  HtmExportFilter : TQRHTMLDocumentFilter;
  CSVExportFilter : TQRCommaSeparatedFilter;
begin
 if not SaveDialog1.Execute
 then exit ;

 cadena := SaveDialog1.FileName ;
 case SaveDialog1.FilterIndex of
  1 :
   begin
    cadena := cadena+ '.qrp' ;
    QRepo.QRPrinter.Save(cadena) ;
   end ;
  2:
   begin
    cadena := cadena+ '.txt' ;
    TXTExportFilter := TQRAsciiExportFilter.Create(cadena);
    qRepo.ExportToFilter(TXTExportFilter) ;
    TXTExportFilter.Free ;
   end ;

  3:
   begin
    cadena := cadena+ '.htm' ;
    HtmExportFilter := TQRHTMLDocumentFilter.Create(cadena);
    qRepo.ExportToFilter(HtmExportFilter) ;
    HtmExportFilter.Free ;
   end ;

  4 :
   begin
    cadena := cadena+ '.csv' ;
    CSVExportFilter := TQRCommaSeparatedFilter.Create(cadena) ;

    qRepo.ExportToFilter(CSVExportFilter) ;
    CSVExportFilter.Free ;
   end ;
 end ;
end ;


procedure TPFRepo.FormCreate(Sender: TObject);
begin

 cadena := TOBject(Owner).ClassName ;
 if cadena= 'TFModulo' then
  begin
   MMenu.Images := TFModulo(Owner).Iconos ;
   ToolBar1.Images := TFModulo(Owner).Iconos ;
   top := TFModulo(Owner).Top ;
   left := TFModulo(Owner).Left ;
{   LUniv.Caption := TFModulo(Owner).Titu ;}
   //Hora.Text := TFModulo(Owner).Usuario + ' ' ;
  end
 else if cadena= 'TFMain' then
  begin
   MMenu.Images := TFMain(Owner).Iconos ;
   ToolBar1.Images := TFMain(Owner).Iconos ;
{   LUniv.Caption := TFMain(Owner).Titulo ;}
   //Hora.Text := TFMain(Owner).usuario + ' ' ;
  end ;

 if FileExists('rlogo.jpg')
 then RLogo.Picture.LoadFromFile('rlogo.jpg') ;
end;

end.
