// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;

page 86490 "B2Brouter Setup"
{
    Caption = 'B2Brouter Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "B2Brouter Setup";
    InsertAllowed = false;
    ModifyAllowed = true;


    layout
    {
        area(Content)
        {

            field("Sandbox Mode"; Rec."Sandbox Mode")
            {
            }
            field("GET Request Only"; Rec."GET Request Only")
            {
            }

            group(Production)
            {
                Caption = 'Production Environment';
                Visible = not Rec."Sandbox Mode";

                field("Production API-Key"; ProductionApiKey)
                {
                    Caption = 'Production API Key';
                    ToolTip = 'Specifies the key that is used for the production environment.';
                    ApplicationArea = All;
                    MaskType = Concealed;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if ProductionApiKey <> '' then
                            StoreKey(false, ProductionApiKey)
                        else
                            Rec.DeleteApiKey(false);
                    end;
                }

                field("Production Account ID"; Rec."Production Account ID")
                {
                }
            }

            group(Sandbox)
            {
                Caption = 'Sandbox Environment';
                Visible = Rec."Sandbox Mode";

                field("Sandbox API-Key"; SandboxApiKey)
                {
                    Caption = 'SandboxAPI Key';
                    ToolTip = 'Specifies the key that is used for the sandbox environment.';
                    ApplicationArea = All;
                    MaskType = Concealed;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if SandboxApiKey <> '' then
                            StoreKey(true, SandboxApiKey)
                        else
                            Rec.DeleteApiKey(true);
                    end;

                }

                field("Sandbox Account ID"; Rec."Sandbox Account ID")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CheckAuthentication)
            {
                Caption = 'Check Authentication';
                ToolTip = 'Check Authentication';
                trigger OnAction()
                var
                    ApiManagement: Codeunit "B2Brouter Api Management";
                begin
                    ApiManagement.CheckAuthentication();
                end;
            }
        }
        area(Promoted)
        {
            actionref(CheckAuthentication_Promoted; CheckAuthentication) { }
        }
    }

    local procedure StoreKey(Sandbox: Boolean; var ApiKey: Text)
    begin
        Rec.StoreApiKey(Sandbox, ApiKey);
        ApiKey := '****';
    end;

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();

        Rec.SetKeysIfAvailable(ProductionApiKey, SandboxApiKey);
    end;

    var
        [NonDebuggable]
        ProductionApiKey: Text;
        SandboxApiKey: Text;
}