// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;

permissionset 86491 "B2BrouterW Read"
{
    Caption = 'B2Brouter (Wanamics) Read';
    Assignable = true;
    IncludedPermissionSets = "B2BrouterW Objects";
    Permissions =
        tabledata "B2Brouter Setup" = r;
}