using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configuration
{
    public class RoleConfiguration : IEntityTypeConfiguration<Role>
    {
        public void Configure(EntityTypeBuilder<Role> builder)
        {
            builder.Property(r => r.RoleName)
                .IsRequired()
                .HasMaxLength(20);

            builder.Property(r => r.CreatedAt).HasDefaultValueSql("GETDATE()");
            builder.Property(r => r.ModifiedAt).HasDefaultValueSql("GETDATE()");
            builder.Property(r => r.IsDeleted).HasDefaultValue(false);
        }
    }
}
