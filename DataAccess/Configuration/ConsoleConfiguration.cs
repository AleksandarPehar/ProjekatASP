using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configuration
{
    public class ConsoleConfiguration : IEntityTypeConfiguration<Domain.Console>
    {
        public void Configure(EntityTypeBuilder<Domain.Console> builder)
        {
            builder.Property(c => c.ConsoleName)
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
