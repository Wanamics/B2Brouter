namespace Wanamics.B2Brouter.eServices;

using Microsoft.eServices.EDocument;

pageextension 86509 "E-Document Service" extends "E-Document Service"
{
    layout
    {
        modify("Import Process")
        {
            Visible = true;
        }
        // modify("Embed PDF in export")
        // {
        //     Visible =
        //         (Rec."Document Format" = Rec."Document Format"::"Peppol BIS 3.0") or
        //         (Rec."Document Format" = Rec."Document Format"::"Peppol BIS 3.0 FR") or
        //         (Rec."Document Format" = Rec."Document Format"::"Factur-X FR");
        // }
        addlast(Import)
        {
            group(Wanamics)
            {
                Caption = 'Wanamics';
                field("Embed PDF in import"; Rec."Embed PDF in export")
                {
                    Caption = '(Embed PDF in import)';
                    ToolTip = '!! reuses "Embed PDF in export" but should be a distinct field ?';
                    ApplicationArea = All;
                }
                field("Processing Customizations"; Rec."Processing Customizations")
                {
                    ApplicationArea = All;
                }

                // field("Read into Draft Impl."; Rec."Read into Draft Impl.")
                // {
                //     ApplicationArea = All;
                // }
            }
        }
    }
}
