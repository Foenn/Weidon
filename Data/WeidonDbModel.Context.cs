﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WeidonDbEntities : DbContext
    {
        public WeidonDbEntities()
            : base("name=WeidonDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Characters> Characters { get; set; }
        public virtual DbSet<Deity> Deity { get; set; }
        public virtual DbSet<DeityImages> DeityImages { get; set; }
        public virtual DbSet<EquivalentDeities> EquivalentDeities { get; set; }
        public virtual DbSet<EquivalentMyths> EquivalentMyths { get; set; }
        public virtual DbSet<Myth> Myth { get; set; }
        public virtual DbSet<MythImages> MythImages { get; set; }
        public virtual DbSet<Mythology> Mythology { get; set; }
        public virtual DbSet<MythologyImages> MythologyImages { get; set; }
    }
}
