namespace Wanamics.B2Brouter.eServices;

using System.DataAdministration;
using Wanamics.EServices.EDocumentConnector.B2Brouter;
codeunit 86500 "B2Brouter Events Subscr."
{
    Access = Internal;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Environment Cleanup", OnClearCompanyConfig, '', false, false)]
    local procedure ClearCompanyConfigGeneral(CompanyName: Text; SourceEnv: Enum "Environment Type"; DestinationEnv: Enum "Environment Type")
    var
        B2BrouterSetup: Record "B2Brouter Setup";
    begin
        B2BrouterSetup.ModifyAll("Sandbox Mode", true);
    end;
}
