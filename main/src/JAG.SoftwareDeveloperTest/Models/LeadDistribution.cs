//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JAG.DeveloperTest.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LeadDistribution
    {
        public long LeadDistributionId { get; set; }
        public long LeadId { get; set; }
        public System.Guid ClientId { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Lead Lead { get; set; }
    }
}