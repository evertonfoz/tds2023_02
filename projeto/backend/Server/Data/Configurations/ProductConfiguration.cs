using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Server;

public class ProductConfiguration : IEntityTypeConfiguration<Product>
{
    public void Configure(EntityTypeBuilder<Product> builder)
    {
        builder.HasKey(p=>p.ProductID);
        builder.Property(p=>p.Name).IsRequired();
        builder.Property(p=>p.Price).HasColumnType("decimal(18,2)").IsRequired();
    }
}
