// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;
using Microsoft.EServices.EDocument.Integration;
using Microsoft.EServices.EDocument.Integration.Interfaces;

enumextension 86490 "B2Brouter Integration" extends "Service Integration"
{
    value(86490; "B2BrouterWanamics")
    {
        Caption = 'B2Brouter (Wanamics)';
        Implementation =
         IDocumentSender = "B2Brouter Integration",
         IDocumentReceiver = "B2Brouter Integration";
    }
}