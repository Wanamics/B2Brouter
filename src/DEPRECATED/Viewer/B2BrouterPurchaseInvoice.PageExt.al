#if FALSE
namespace B2Brouter.B2Brouter;

using Microsoft.Purchases.Document;
using Microsoft.eServices.EDocument;

pageextension 86501 "Purchase Invoice" extends "Purchase Invoice"
{
    actions
    {
        addlast("&Invoice")
        {
            action(B2BrouterView)
            {
                Caption = 'View E-Document';
                ToolTip = 'View E-Document';
                ApplicationArea = All;
                trigger OnAction()
                var
                    EDocument: Record "E-Document";
                begin
                    EDocument.SetRange("Document Record ID", Rec.RecordId);
                    EDocument.FindFirst();
                    EDocument.B2BrouterViewer();
                end;
            }
        }
    }
}
#endif