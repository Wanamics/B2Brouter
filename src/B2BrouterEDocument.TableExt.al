// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;
using Microsoft.EServices.EDocument;

tableextension 86490 "B2Brouter E-Document" extends "E-Document"
{
    fields
    {
        field(86490; "B2Brouter File Id"; Integer)
        {
            Caption = 'B2Brouter File Id';
            ToolTip = 'B2Brouter File Id';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
