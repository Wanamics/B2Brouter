#if FALSE
// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;
using Microsoft.EServices.EDocument;
using System.RestClient;

tableextension 86500 "B2Brouter E-Document Viewer" extends "E-Document"
{
    fields
    {
    }

    procedure B2BrouterViewer()
    var
        B2BrouterApiManagement: Codeunit "B2Brouter API Management";
        RestClient: Codeunit "Rest Client";
        HttpResponse: Codeunit "Http Response Message";
        FileNameLbl: Label '%1-%2-%3.pdf';
    // FileNameLbl: Label '%1-%2-%3.txt';
    begin
        TestField("B2Brouter File Id");
        TestField("Service Integration", "Service Integration"::"B2BrouterWanamics");
        RestClient.SetDefaultRequestHeader('X-B2B-API-Key', B2BrouterApiManagement.GetApiKey());
        RestClient.SetDefaultRequestHeader('X-B2B-API-Version', B2BrouterApiManagement.GetApiVersion());
        RestClient.SetBaseAddress(B2BrouterApiManagement.GetBaseUrl());
        HttpResponse := RestClient.Get(StrSubstNo('invoices/%1/as/legal', "B2Brouter File Id"));
        // HttpResponse := RestClient.Get(StrSubstNo('invoices/%1', "B2Brouter File Id"));
        if not HttpResponse.GetIsSuccessStatusCode() then
            Error('Error %1: %2', HttpResponse.GetHttpStatusCode(), HttpResponse.GetErrorMessage());
        File.ViewFromStream(HttpResponse.GetContent().AsInStream(), StrSubstNo(FileNameLbl, "Document Type", "Bill-to/Pay-to Name", "Document No."), true);
        // File.ViewFromStream(HttpResponse.GetContent().AsInStream(), StrSubstNo(FileNameLbl, "Document Type", "Bill-to/Pay-to Name", "Document No."), true);
    end;

    /*
    local procedure B2BrouterDocumentType(EDocumentType: Enum "E-Document Type"): Text
    begin
        case EDocumentType of
            // value(0; "None")
            // value(1; "Sales Quote")
            // value(2; "Sales Order")
            "E-Document Type"::"Sales Invoice":
                exit('IssuedInvoice');
            // value(4; "Sales Return Order")
            // value(5; "Sales Credit Memo")
            // value(6; "Purchase Quote")
            // value(7; "Purchase Order")
            "E-Document Type"::"Purchase Invoice":
                exit('ReceivedInvoice');
            // value(9; "Purchase Return Order")
            "E-Document Type"::"Purchase Credit Memo":
                exit('ReceivedInvoice');
        // value(11; "Service Order")
        // value(12; "Service Invoice")
        // value(13; "Service Credit Memo")
        // value(14; "Finance Charge Memo")
        // value(15; "Issued Finance Charge Memo")
        // value(16; "Reminder")
        // value(17; "Issued Reminder")
        // value(18; "General Journal")
        // value(19; "G/L Entry")
        // value(20; "Sales Shipment")
        // value(21; "Transfer Shipment")
        end;


    end;
    */
}
#endif
