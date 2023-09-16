using Domain;
using Microsoft.AspNetCore.Mvc;

namespace Server;

[ApiController]
[Route("api/products")]
public class ProductController : ControllerBase
{
    private readonly AppDbContext _appDbContext;

    public ProductController(AppDbContext appDbContext)
    {
        _appDbContext = appDbContext;
    }
    [HttpGet]
    public ActionResult<IEnumerable<Product>> GetProducts() {
        return _appDbContext.Products;
    }

}
