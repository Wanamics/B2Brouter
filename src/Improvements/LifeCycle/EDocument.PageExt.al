namespace Wanamics.eServices.LifeCycle;

using Microsoft.eServices.EDocument;

pageextension 86505 "E-Document" extends "E-Document"
{
    actions
    {
        addlast(Processing)
        {
            action(SetExcluded)
            {
                ApplicationArea = All;
                Caption = '(Set Excluded)';
                Image = Cancel;
                trigger OnAction()
                begin
                    if Rec.Status = "E-Document Status"::Processed then
                        Rec.FieldError(Status);
                    Rec.Status := "E-Document Status"::Excluded;
                    Rec.Modify(true);
                end;
            }
            action(SetInProgress)
            {
                ApplicationArea = All;
                Caption = '(Set In Progress)';
                Image = ReOpen;
                trigger OnAction()
                begin
                    if Rec.Status = "E-Document Status"::Excluded then
                        Rec.FieldError(Status);
                    Rec.Status := "E-Document Status"::"In Progress";
                    Rec.Modify(true);
                end;
            }
            // action(SendInvoiceRefused)
            // {
            //     ApplicationArea = All;
            //     Caption = '(Send Invoice Refused)';
            //     Image = SendElectronicDocument;
            //     trigger OnAction()
            //     var
            //         EDocLifeCycleMgt: Codeunit "E-Doc. Life Cycle Management";
            //     begin
            //         EDocLifeCycleMgt.SendInvoiceRefused(Rec);
            //     end;
            // }
        }
    }
}
