#if FALSE
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;

using Microsoft.eServices.EDocument;

pageextension 86500 "B2Brouter E-Documents" extends "E-Documents"
{
    layout
    {
        addlast(DocumentList)
        {
            field("Service Integration"; Rec."Service Integration")
            {
                ApplicationArea = All;
            }

            field("B2Brouter File Id"; Rec."B2Brouter File Id")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action("View in B2Brouter")
            {
                ApplicationArea = All;
                Caption = 'View in B2Brouter';
                ToolTip = 'View in B2Brouter';
                Image = View;
                trigger OnAction()
                begin
                    Rec.B2BrouterViewer();
                end;
            }
        }
    }
}
#endif
