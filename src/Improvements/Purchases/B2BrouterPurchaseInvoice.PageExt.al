namespace Wanamics.B2Brouter.Purchases;

using Microsoft.Purchases.Document;

pageextension 86491 "Purchase Invoice" extends "Purchase Invoice"
{
    layout
    {
        addafter(DocAmountVAT)
        {
            field(DocAmountExclVAT; Rec."Doc. Amount Incl. VAT" - Rec."Doc. Amount VAT")
            {
                ApplicationArea = All;
                Caption = 'Doc. Amount Excl. VAT';
                ToolTip = 'Doc. Amount Excl. VAT';
                BlankZero = true;
            }
        }
    }
}
