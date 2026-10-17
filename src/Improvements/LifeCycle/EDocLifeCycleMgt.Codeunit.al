#if FALSE
namespace Wanamics.eServices.LifeCycle;

using Microsoft.eServices.EDocument;
using Microsoft.eServices.EDocument.Processing.Interfaces;
using Microsoft.eServices.EDocument.Processing.Message;
// using Wanamics.EServices.EDocument.Processing.Message;

using System.Utilities;

codeunit 86505 "E-Doc. Life Cycle Management"
{
    // local procedure OnAfterProcessIncomingEDocument(EDocument: Record "E-Document"; EDocImportParameters: Record "E-Doc. Import Parameters"; StartState: Enum "Import E-Doc. Proc. Status"; DesiredEndState: Enum "Import E-Doc. Proc. Status")
    // begin
    //     // Message('OnAfterProcessIncomingEDocument');
    // end;
    procedure SendInvoiceRefused(EDocument: Record "E-Document")
    var
        //?? EDocMessageMgt: Codeunit "E-Doc. Message Mgt."; // "E-Doc. Message Mgt.";
        ResponseBlob: Codeunit "Temp Blob";
        IResponseProvider: Interface IEDocResponseProvider;
        IMessageBuilder: Interface IEDocMessageBuilder;
        MessageType: Enum "E-Document Message Type";
        EDocumentService: Record "E-Document Service";
    begin
        EDocument.TestField(Direction, EDocument.Direction::Incoming);
        // IResponseProvider := EDocument.GetEDocumentService()."Document Format";
        EDocumentService := EDocument.GetEDocumentService();
        IresponseProvider := EDocumentService."Document Format";
        MessageType := IResponseProvider.GetResponseMessageType(EDocument);
        if MessageType = "E-Document Message Type"::Unknown then
            exit;
        IMessageBuilder := MessageType;
        IMessageBuilder.BuildMessage(EDocument, "E-Doc. Response Type"::Refused/*::Rejected*/, ResponseBlob);

        ERROR('SendInvoiceRefused: not implemented yet');
        //?? EDocMessageMgt.CreateMessage(EDocument, MessageType, "E-Document Direction"::Outgoing, "E-Doc. Response Type"::Refused /*::Rejected*/, ResponseBlob);
    end;

    /*

        procedure CreateMessage(EDocument: Record "E-Document"; MessageType: Enum "E-Document Message Type"; var TempBlob: Codeunit "Temp Blob"): Integer
        begin
            exit(CreateMessage(EDocument, MessageType, "E-Document Direction"::Outgoing, "E-Doc. Response Type"::None, TempBlob));
        end;

        /// <summary>
        /// Creates an E-Document message record with an explicit direction and stores the XML payload blob.
        /// Returns the Entry No. of the new message row.
        /// </summary>
        procedure CreateMessage(EDocument: Record "E-Document"; MessageType: Enum "E-Document Message Type"; Direction: Enum "E-Document Direction"; var TempBlob: Codeunit "Temp Blob"): Integer
        begin
            exit(CreateMessage(EDocument, MessageType, Direction, "E-Doc. Response Type"::None, TempBlob));
        end;

        /// <summary>
        /// Creates an E-Document message record with an explicit direction and response type, and stores the XML payload blob.
        /// Returns the Entry No. of the new message row.
        /// </summary>
        procedure CreateMessage(EDocument: Record "E-Document"; MessageType: Enum "E-Document Message Type"; Direction: Enum "E-Document Direction"; ResponseType: Enum "E-Doc. Response Type"; var TempBlob: Codeunit "Temp Blob"): Integer
        var
            EDocMessage: Record "E-Document Message";
            DataStorageEntryNo: Integer;
        begin
            DataStorageEntryNo := InsertDataStorage(TempBlob);

            EDocMessage.Init();
            EDocMessage."E-Document Entry No." := EDocument."Entry No";
            EDocMessage."Message Type" := MessageType;
            EDocMessage.Direction := Direction;
            EDocMessage."Response Type" := ResponseType;
            EDocMessage.Status := EDocMessage.Status::Created;
            EDocMessage.Service := EDocument.Service;
            EDocMessage."Data Storage Entry No." := DataStorageEntryNo;
            EDocMessage."Created At" := CurrentDateTime();
            EDocMessage.Insert();
            exit(EDocMessage."Entry No.");
        end;
        */

}
#endif
