using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configuration
{
    public class CompanyConfinguration : IEntityTypeConfiguration<Company>
    {
        public void Configure(EntityTypeBuilder<Company> builder)
        {
            builder.Property(c => c.CompanyName)
                .HasMaxLength(50)
                .IsRequired();

            builder.Property(c => c.CreatedAt)
                .HasDefaultValueSql("GETDATA()");

            builder.Property(c => c.ModifiedAt)
                .HasDefaultValueSql("GETDATE()");

            builder.Property(c => c.IsDeleted)
                .HasDefaultValue(false);
        }
    }
}
