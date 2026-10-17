#if FALSE
namespace B2Brouter.B2Brouter;

using Microsoft.Purchases.Document;
using Microsoft.eServices.EDocument;
using Microsoft.Purchases.History;

pageextension 86503 "Posted Purchase Invoices" extends "Posted Purchase Invoices"
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