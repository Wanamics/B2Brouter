#if FALSE
namespace B2Brouter.B2Brouter;

using Microsoft.Purchases.Document;
using Microsoft.eServices.EDocument;
using Microsoft.Purchases.History;

pageextension 86504 "Posted Purchase Invoice" extends "Posted Purchase Invoice"
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
