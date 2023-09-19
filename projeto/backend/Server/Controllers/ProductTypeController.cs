using System.Net;
using Domain;
using Microsoft.AspNetCore.Mvc;

namespace Server;

[ApiController]
[Route("api/productTypes")]
public class ProductTypeController : ControllerBase
{
    private readonly AppDbContext _appDbContext;

    public ProductTypeController(AppDbContext appDbContext)
    {
        _appDbContext = appDbContext;
    }
    [HttpGet]
    public ActionResult<IEnumerable<ProductType>> GetProductTypes() {
        return _appDbContext.ProductTypes;
    }

    [HttpPost]
    public async Task<ActionResult<ProductType>> CreateProductTypeAsync(
        [FromBody] ProductType productType) {
            if (productType == null) {
                return BadRequest("Invali product type data");
            }

            _appDbContext.ProductTypes.Add(productType);
            await _appDbContext.SaveChangesAsync();

            return new ObjectResult(productType) { 
                StatusCode = (int) HttpStatusCode.Created
            };
    }
}
