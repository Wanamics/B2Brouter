namespace Wanamics.eServices.LifeCycle;

using Microsoft.eServices.EDocument.Processing.Message;
using Microsoft.eServices.EDocument.Processing.Interfaces;
using Microsoft.eServices.EDocument;

using Microsoft.eServices.EDocument.Format;
using Microsoft.eServices.EDocument.IO.Peppol;
using Microsoft.eServices.EDocument.Processing.Import;

enumextension 86491 "E-Document Message Type" extends "E-Document Message Type"
{
    value(86490; "Wanamics")
    {
        Caption = 'Wanamics';
        // Implementation = IEDocMessageBuilder = "E-Doc. PEPPOL Msg. Builder";
        Implementation = IEDocMessageBuilder = "Wanamics Impl";
        // IEDocResponseProvider = "E-Document PEPPOL Handler";
        // "E-Document" = 
        //  "EDoc PEPPOL BIS 3.0",
        //  IEDocResponseProvider = "E-Document PEPPOL Handler";
        // Implementation = "E-Document" = "EDoc PEPPOL BIS 3.0",
        //                   IEDocResponseProvider = "E-Document PEPPOL Handler";
    }
}
