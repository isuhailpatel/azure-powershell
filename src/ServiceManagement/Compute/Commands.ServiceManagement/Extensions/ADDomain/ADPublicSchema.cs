﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by xsd, Version=4.0.30319.1.
// 
namespace Microsoft.WindowsAzure.Commands.ServiceManagement.Extensions.ADDomain
{


    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("xsd", "4.0.30319.1")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true)]
    [System.Xml.Serialization.XmlRootAttribute(Namespace="", IsNullable=false)]
    public partial class PublicConfig {
        
        private string nameField;
        
        private string userField;
        
        private uint optionsField;
        
        private string oUPathField;
        
        private string unjoinDomainUserField;
        
        private bool restartField;
        
        public PublicConfig() {
            this.optionsField = ((uint)(0));
            this.restartField = false;
        }
        
        /// <remarks/>
        public string Name {
            get {
                return this.nameField;
            }
            set {
                this.nameField = value;
            }
        }
        
        /// <remarks/>
        public string User {
            get {
                return this.userField;
            }
            set {
                this.userField = value;
            }
        }
        
        /// <remarks/>
        [System.ComponentModel.DefaultValueAttribute(typeof(uint), "0")]
        public uint Options {
            get {
                return this.optionsField;
            }
            set {
                this.optionsField = value;
            }
        }
        
        /// <remarks/>
        public string OUPath {
            get {
                return this.oUPathField;
            }
            set {
                this.oUPathField = value;
            }
        }
        
        /// <remarks/>
        public string UnjoinDomainUser {
            get {
                return this.unjoinDomainUserField;
            }
            set {
                this.unjoinDomainUserField = value;
            }
        }
        
        /// <remarks/>
        [System.ComponentModel.DefaultValueAttribute(false)]
        public bool Restart {
            get {
                return this.restartField;
            }
            set {
                this.restartField = value;
            }
        }
    }
}