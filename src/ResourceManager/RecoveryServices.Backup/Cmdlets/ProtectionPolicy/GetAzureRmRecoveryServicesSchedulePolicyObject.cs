﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Management.Automation;
using Microsoft.Azure.Commands.RecoveryServices.Backup.Cmdlets.Models;
using Microsoft.Azure.Commands.RecoveryServices.Backup.Cmdlets.ProviderModel;

namespace Microsoft.Azure.Commands.RecoveryServices.Backup.Cmdlets
{
    [Cmdlet(VerbsCommon.Get, "AzureRmRecoveryServicesSchedulePolicyObject"), OutputType(typeof(AzureRmRecoveryServicesSchedulePolicyBase))]
    class GetAzureRmRecoveryServicesSchedulePolicyObject : RecoveryServicesBackupCmdletBase
    {
        [Parameter(Mandatory = true, HelpMessage = "")]
        [ValidateNotNullOrEmpty]
        [ValidateSet(ContainerType.AzureVM.ToString())]
        public WorkloadType WorkloadType { get; set; }

        [Parameter(Mandatory = false, HelpMessage = "")]
        [ValidateNotNullOrEmpty]
        public BackupManagementType BackupManagementType { get; set; }

        public override void ExecuteCmdlet()
        {
            base.ExecuteCmdlet();

            PsBackupProviderManager providerManager = new PsBackupProviderManager(new Dictionary<System.Enum, object>()
            {  
                {CommonParams.BackupManagementType, BackupManagementType},             
            }, HydraAdapter);

            IPsBackupProvider psBackupProvider = providerManager.GetProviderInstance(WorkloadType);
            WriteObject(psBackupProvider.GetDefaultSchedulePolicyObject());
        }
    }
}
