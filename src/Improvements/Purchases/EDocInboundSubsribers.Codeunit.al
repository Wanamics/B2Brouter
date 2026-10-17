namespace Wanamics.B2Brouter.Purchases;

using Microsoft.Foundation.Attachment;
using Microsoft.Purchases.Document;
using Microsoft.eServices.EDocument;
using Microsoft.eServices.EDocument.IO.Peppol;
using Microsoft.eServices.EDocument.Processing.Import;
using System.IO;
using System.Utilities;

codeunit 86502 "E-Doc. Inbound Subsribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EDoc Import PEPPOL BIS 3.0", OnAfterParseInvoice, '', false, false)]

    local procedure OnAfterParseInvoice(EDocument: Record "E-Document"; var PurchaseHeader: Record "Purchase Header" temporary; var PurchaseLine: Record "Purchase Line" temporary; DocumentAttachment: Record "Document Attachment"; DocumentAttachmentData: Codeunit "Temp Blob"; TempXMLBuffer: Record "XML Buffer" temporary; Path: Text; Value: Text)
    begin
        // Message('OnAfterParseInvoice');
        case Path of
        // Ajouter correspondance, exemple 
        // '/Invoice/cac:InvoiceLine/cbc:InvoicedQuantity':
        //     if Value <> '' then
        //         Evaluate(PurchaseLine.Quantity, Value, 9);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnAfterPrepareReceivedDoc, '', false, false)]
    local procedure OnAfterPrepareReceivedDoc(var EDocument: Record "E-Document"; var TempBlob: Codeunit "Temp Blob"; SourceDocumentHeader: RecordRef; SourceDocumentLine: RecordRef; TempEDocMapping: Record "E-Doc. Mapping" temporary);
    begin
        // Message('OnAfterPrepareReceivedDoc');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnAfterProcessImportedDocument, '', false, false)]
    local procedure OnAfterProcessImportedDocument(var EDocument: Record "E-Document"; var DocumentHeader: RecordRef)
    begin
        // Message('OnAfterProcessImportedDocument');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnAfterProcessIncomingEDocument, '', false, false)]
    local procedure OnAfterProcessIncomingEDocument(EDocument: Record "E-Document"; EDocImportParameters: Record "E-Doc. Import Parameters"; StartState: Enum "Import E-Doc. Proc. Status"; DesiredEndState: Enum "Import E-Doc. Proc. Status")
    begin
        // Message('OnAfterProcessIncomingEDocument');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnBeforePrepareReceivedDoc, '', false, false)]
    local procedure OnBeforePrepareReceivedDoc(var EDocument: Record "E-Document"; var TempBlob: Codeunit "Temp Blob"; SourceDocumentHeader: RecordRef; SourceDocumentLine: RecordRef; TempEDocMapping: Record "E-Doc. Mapping" temporary);
    begin
        // Message('OnBeforePrepareReceivedDoc');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnBeforeCreateDocument, '', false, false)]
    local procedure OnBeforeCreateDocument(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var TempDocumentLine: RecordRef; var DocumentHeader: RecordRef)
    begin
        // Message('OnBeforeCreateDocument');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Doc. Import", OnAfterCreateDocument, '', false, false)]
    local procedure OnAfterCreateDocument(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var TempDocumentLine: RecordRef; var DocumentHeader: RecordRef)
    begin
        // Message('OnAfterCreateDocument');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Document Create Purch. Doc.", OnCreateNewPurchHdrOnBeforeRecRefInsert, '', false, false)]
    local procedure OnCreateNewPurchHdrOnBeforeRecRefInsert(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var DocumentHeader: RecordRef);
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Document Create Purch. Doc.", OnCreateNewPurchHdrOnBeforeRecRefModify, '', false, false)]
    local procedure OnCreateNewPurchHdrOnBeforeRecRefModify(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var DocumentHeader: RecordRef);
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Document Create Purch. Doc.", OnCreateNewPurchLineOnBeforeRecRefInsert, '', false, false)]
    local procedure OnCreateNewPurchLineOnBeforeRecRefInsert(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var DocumentHeader: RecordRef; var TempDocumentLine: RecordRef; var DocumentLine: RecordRef);
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"E-Document Create Purch. Doc.", OnCreateNewPurchLineOnBeforeRecRefModify, '', false, false)]
    local procedure OnCreateNewPurchLineOnBeforeRecRefModify(var EDocument: Record "E-Document"; var TempDocumentHeader: RecordRef; var DocumentHeader: RecordRef; var TempDocumentLine: RecordRef; var DocumentLine: RecordRef);
    var
        PurchaseLine: Record "Purchase Line";
    begin
        if DocumentLine.Number <> Database::"Purchase Line" then
            exit;
        DocumentLine.SetTable(PurchaseLine);
        if not (PurchaseLine."Document Type" in [PurchaseLine."Document Type"::Invoice, PurchaseLine."Document Type"::"Credit Memo"]) then
            exit;
        if (PurchaseLine.Type = PurchaseLine.Type::" ") and (PurchaseLine."No." = '') and (PurchaseLine.Quantity <> 0) then
            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
        DocumentLine.GetTable(PurchaseLine);
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Doc. Attachment List Factbox", OnAfterGetRecRefFail, '', false, false)]
    // local procedure OnAfterGetRecRefFail(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    // var
    //     EDocument: Record "E-Document";
    // begin
    //     case DocumentAttachment."Table ID" of
    //         // 0:
    //         //     ;
    //         0, Database::"E-Document":
    //             begin
    //                 RecRef.Open(DocumentAttachment."Table ID");
    //                 if EDocument.Get(DocumentAttachment."No.") then
    //                     RecRef.GetTable(EDocument);
    //             end;
    //     end;
    // end;



}
