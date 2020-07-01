using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configuration
{
    public class GenreConfiguration : IEntityTypeConfiguration<Genre>
    {
        public void Configure(EntityTypeBuilder<Genre> builder)
        {
            builder.Property(g => g.GenereName)
                .HasMaxLength(50)
                .IsRequired();

            builder.Property(u => u.CreatedAt)
                .HasDefaultValueSql("GETDATA()");

            builder.Property(u => u.ModifiedAt)
                .HasDefaultValueSql("GETDATE()");

            builder.Property(u => u.IsDeleted)
                .HasDefaultValue(false);
        }
    }
}
