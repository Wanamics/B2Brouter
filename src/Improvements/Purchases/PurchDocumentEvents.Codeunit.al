namespace Wanamics.B2Brouter.Purchases;

using Microsoft.Purchases.Document;

codeunit 86501 "Purch. Document Events"
{

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnValidateTypeOnCopyFromTempPurchLine, '', false, false)]

    local procedure OnValidateTypeOnCopyFromTempPurchLine(var PurchLine: Record "Purchase Line"; TempPurchaseLine: Record "Purchase Line" temporary; xPurchaseLine: Record "Purchase Line")
    begin
        CopyFromLine(PurchLine, TempPurchaseLine, xPurchaseLine);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterAssignFieldsForNo, '', false, false)]
    local procedure OnAfterAssignFieldsForNo(var PurchLine: Record "Purchase Line"; var xPurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header")
    begin
        CopyFromLine(PurchLine, PurchLine, xPurchLine);
    end;

    local procedure CopyFromLine(var Line: Record "Purchase Line"; TempLine: Record "Purchase Line" temporary; xLine: Record "Purchase Line")
    var
        Header: Record "Purchase Header";
        NullGuid: Guid;
    begin
        if not GuiAllowed or
            not (xLine."Document Type" in [xLine."Document Type"::Invoice, xLine."Document Type"::"Credit Memo"]) or
            (xLine."Line No." = 0) then
            exit;
        Header.SetLoadFields("E-Document Link");
        if not Header.Get(xLine."Document Type", xLine."Document No.") or (Header."E-Document Link" = NullGuid) then
            exit;
        Line.Type := TempLine.Type;
        Line."No." := TempLine."No.";
        Line.Description := xLine.Description;
        Line."Description 2" := xLine."Description 2";
        // if (xLine.Type = TempLine.Type::Item) and (xLine."No." <> '') then begin
        Line.Validate("Location Code", xLine."Location Code");
        Line.Validate("Unit of Measure Code", xLine."Unit of Measure Code");
        // end;
        Line.Validate("Quantity", xLine."Quantity");
        Line.Validate("Direct Unit Cost", xLine."Direct Unit Cost");
    end;
}
