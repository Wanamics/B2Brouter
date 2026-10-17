namespace Wanamics.B2Brouter.Purchases;

using Microsoft.eServices.EDocument;

pageextension 86492 "B2Brouter E-Documents" extends "E-Documents"
{
    layout
    {
        modify("Document Type")
        {
            Visible = false;
        }
        modify("Document No.")
        {
            Visible = false;
        }
        addafter("Document No.")
        {
            field("Amount Excl. VAT"; Rec."Amount Excl. VAT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the total amount of the electronic document excluding VAT.';
            }
            field("Amount Incl. VAT"; Rec."Amount Incl. VAT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the total amount of the electronic document including VAT.';
            }
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the electronic document currency code.';
            }
            field("Document Record ID"; Rec."Document Record ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Document Record ID field.', Comment = '%';
            }
            field("Incoming E-Document No."; Rec."Incoming E-Document No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the electronic document number.';
            }
            field("Import Processing Status"; Rec."Import Processing Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the stage in which the processing of this document is in.';
            }

        }
    }
}
