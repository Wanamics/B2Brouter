// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Wanamics.EServices.EDocumentConnector.B2Brouter;

permissionset 86492 "B2BrouterW Objects"
{
    Caption = 'B2Brouter (Wanamics) Objects';
    Access = Public;
    Assignable = false;

    Permissions = table "B2Brouter Setup" = X,
                  page "B2Brouter Setup" = X,
                  codeunit "B2Brouter Integration" = X,
                  codeunit "B2Brouter Api Management" = X;
}