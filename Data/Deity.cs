//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Deity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Deity()
        {
            this.Characters = new HashSet<Characters>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string AlternativeNames { get; set; }
        public string Mythology { get; set; }
        public int IdMythology { get; set; }
        public string Roles { get; set; }
        public string Etymology { get; set; }
        public string Origin { get; set; }
        public string Symbolism { get; set; }
        public string EquivalentDeities { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Characters> Characters { get; set; }
    }
}
