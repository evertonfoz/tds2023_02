namespace Domain;

public class Product
{
    public long? ProductID { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
    public decimal? Price { get; set; }
    public ProductType? ProductType { get; set; }
}
