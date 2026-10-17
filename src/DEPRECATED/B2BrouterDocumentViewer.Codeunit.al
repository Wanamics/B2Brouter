#if FALSE
namespace B2Brouter.B2Brouter;

using Microsoft.eServices.EDocument.Processing.Import;
using Microsoft.eServices.EDocument.Processing.Interfaces;
using System.Utilities;

codeunit 86503 "B2Brouter Document Viewer" implements IEDocFileFormat
{
    
    procedure FileExtension(): Text
    begin
    end;
    
    procedure PreviewContent(FileName: Text; TempBlob: Codeunit "Temp Blob")
    begin
        Message('TODO PreviewContent for B2Brouter implementation')
    end;
    
    procedure PreferredStructureDataImplementation(): Enum "Structure Received E-Doc."
    begin
    end;
    
}
#endif
