#if INPROGRESS
namespace B2Brouter.B2Brouter;

using Microsoft.eServices.EDocument;

page 86491 B2BrouterViewerFactBox
{
    ApplicationArea = All;
    Caption = 'B2BrouterViewerFactBox';
    PageType = CardPart;
    SourceTable = "E-Document";
    Editable = false;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                Visible = PadAsText <> '';
                usercontrol(B2BrouterViewer; "PDF Viewer")
                {
                }
            }
        }
    }

    var
        PadAsText: Text;

    trigger OnAfterGetCurrRecord()
    begin
        PadAsText := Rec.WanaPdfGetMainAttachmentAsText();
        CurrPage.PdfV2PdfViewer.LoadPDF(PadAsText, true);
    end;
}
#endif
