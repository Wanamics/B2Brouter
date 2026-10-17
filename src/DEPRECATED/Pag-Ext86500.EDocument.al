#if FALSE
namespace B2Brouter.B2Brouter;

using Microsoft.Foundation.Attachment;
using Microsoft.eServices.EDocument;

pageextension 86508 "E-Document" extends "E-Document"
{
    layout
    {
        addlast(FactBoxes)
        {
            part("wan Attached Documents List"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents (Wanamics)';
                UpdatePropagation = Both;
                SubPageLink =
                    "Table ID" = const(Database::"E-Document"),
                    "E-Document Entry No." = field("Entry No"),
                    "E-Document Attachment" = const(true);
            }
        }
    }
}
#endif
