#if FALSE

namespace BBrouter.BBrouter;

using Microsoft.eServices.EDocument;
using Microsoft.eServices.EDocument.Integration.Interfaces;
using Microsoft.eServices.EDocument.Integration.Send;
using System.Threading;
using System.Utilities;

pageextension 86490 "E-Documents" extends "E-Documents"
{
    actions
    {
        addlast(Processing)
        {
            action("B2Brouter Outbound E-Documents")
            {
                ApplicationArea = All;
                Caption = 'Send';
                Image = SendElectronicDocument;
                trigger OnAction()
                var
                    JobQueueEntry: Record "Job Queue Entry";
                    EDocIntegrationManagement: Codeunit "E-Doc. Integration Management";

                    ConfirmQst: label 'Do you want to send %1 through %2 %3?', Comment = '%1: Document No., %2: Service Integration, %3: Service Integration Name';
                begin
                    Rec.TestField(Direction, Rec.Direction::Outgoing);
                    Rec.TestField("Document Sending Profile");
                    if not Confirm(ConfirmQst, false, Rec."Document Record ID", Rec."Document Sending Profile", Rec.FieldCaption("Document Sending Profile")) then
                        exit;
                    // JobQueueEntry."Object Type to Run" := JobQueueEntry."Object Type to Run"::Codeunit;
                    // JobQueueEntry."Object ID to Run":= Codeunit::"E-Doc. Recurrent Batch Send";
                    // JobQueueEntry."Record ID to Process" := Rec.RecordId;
                    // Codeunit.Run(6142 /*Codeunit::"E-Doc. Recurrent Batch Send"*/, JobQueueEntry);
                    // EDocIntegrationManagement.Send(Rec, JobQueueEntry, true);
                    // internal procedure Send(var EDocument: Record "E-Document"; EDocumentService: Record "E-Document Service"; SendContext: Codeunit SendContext; var IsAsync: Boolean) Success: Boolean

                end;
            }
        }
    }

    local procedure Send()
    var
        GlobalEDocument: Record "E-Document";
        GlobalEDocumentService: Record "E-Document Service";
        GlobalSendContext: Codeunit SendContext;
#if not CLEAN26
        TempBlob: Codeunit "Temp Blob";
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
#pragma warning disable AL0432
        IEDocIntegration: Interface "E-Document Integration";
#pragma warning restore AL0432
#endif
        IDocumentSender: Interface IDocumentSender;
        IsAsyncValue: Boolean;
    begin
        TempBlob := GlobalSendContext.GetTempBlob();
#pragma warning disable AL0432
        IEDocIntegration := /*this.*/GlobalEDocumentService."Service Integration";
        IEDocIntegration.Send(/*this.*/GlobalEDocument, /*this.*/TempBlob, /*this.*/IsAsyncValue, /*this.*/HttpRequestMessage, /*this.*/HttpResponseMessage);
#pragma warning restore AL0432
    end;

    /*
        local procedure RunSend(EDocumentService: Record "E-Document Service"; var EDocument: Record "E-Document"; SendContext: Codeunit SendContext; var IsAsync: Boolean)
        var
            SendRunner: Codeunit "Send Runner";
        begin
            // Commit needed for "if codeunit run" pattern when catching errors.
            Commit();
            SendRunner.SetDocumentAndService(EDocument, EDocumentService);
            SendRunner.SetContext(SendContext);
            if not SendRunner.Run() then
                EDocumentErrorHelper.LogSimpleErrorMessage(EDocument, GetLastErrorText());

            // After interface call, reread the EDocument and EDocumentService for the latest values.
            EDocument.Get(EDocument."Entry No");
            EDocumentService.Get(EDocumentService.Code);
            IsAsync := SendRunner.GetIsAsync();
#if not CLEAN26
            SendRunner.GetSendContext(SendContext);
#endif
            OnAfterSendDocument(EDocument, EDocumentService, SendContext.Http().GetHttpRequestMessage(), SendContext.Http().GetHttpResponseMessage());
            Telemetry.LogMessage('0000LBM', EDocTelemetrySendScopeEndLbl, Verbosity::Normal, DataClassification::OrganizationIdentifiableInformation, TelemetryScope::All);
        end;
        */
}
#endif
