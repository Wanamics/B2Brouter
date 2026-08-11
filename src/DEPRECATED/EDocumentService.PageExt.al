#if FALSE
namespace BBrouter.BBrouter;

using Microsoft.eServices.EDocument;

pageextension 86491 "E-Document Service" extends "E-Document Service"
{
    actions
    {
        addlast(Processing)
        {
            action(Send)
            {
                ApplicationArea = All;
                Caption = 'Send';
                Image = SendElectronicDocument;
                trigger OnAction()
                begin
                    SendDocs();
                end;
            }
        }
    }
    local procedure SendDocs()
    var
        // FailedEDocument: Record "E-Document";
        // EDocImport: Codeunit "E-Doc. Import";
        EdocExport: Codeunit "E-Doc. Export";
        // JobQueueEntry: Record "Job Queue Entry";
        Success: Boolean;
    begin
        Success := Edocexport.Run();
        // EDocImport.ReceiveAndProcessAutomatically(Rec);
        // if not Success then
        //     if FailedEDocument.Get(Rec.LastEDocumentLog("E-Document Service Status"::"Imported Document Processing Error")."E-Doc. Entry No") then
        //         if Confirm(DocNotCreatedQst, true, FailedEDocument."Document Type") then
        //             Page.Run(Page::"E-Document", FailedEDocument);
    end;
}
#endif

