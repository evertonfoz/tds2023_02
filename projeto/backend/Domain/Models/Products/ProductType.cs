namespace Domain;

public class ProductType
{
    public long? ProductTypeID { get; set; }
    public string?  Name { get; set; }
    public List<Product>? Products { get; set; }
}
