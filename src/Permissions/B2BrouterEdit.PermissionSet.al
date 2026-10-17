// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;

permissionset 86490 "B2BrouterW Edit"
{
    Caption = 'B2Brouter (Wanamics) Edit';
    Assignable = true;
    IncludedPermissionSets = "B2BrouterW Read";
    Permissions =
        tabledata "B2Brouter Setup" = imd;
}