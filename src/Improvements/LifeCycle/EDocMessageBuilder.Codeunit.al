namespace Wanamics.eServices.LifeCycle;

using Microsoft.eServices.EDocument;
using Microsoft.eServices.EDocument.Processing.Interfaces;

codeunit 86506 "Wanamics Impl" implements IEDocResponseProvider, IEDocMessageBuilder
{

    procedure GetResponseMessageType(EDocument: Record "E-Document"): Enum Microsoft.eServices.EDocument.Processing.Message."E-Document Message Type"
    begin
        // ERROR('GetResponseMessageType');

    end;

    procedure BuildMessage(EDocument: Record "E-Document"; ResponseType: Enum Microsoft.eServices.EDocument.Processing.Message."E-Doc. Response Type"; var TempBlob: Codeunit System.Utilities."Temp Blob")
    begin
        // ERROR('BuildMessage');

    end;
}
