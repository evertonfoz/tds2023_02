using Domain;
using Microsoft.EntityFrameworkCore;
using Server;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();
builder.Services.AddDbContext<AppDbContext>(
    options => options.UseSqlite(
        builder.Configuration.GetConnectionString("DefaultConnection")
        )
    );
builder.Services.AddCors(options =>
    {
        options.AddPolicy("AllowFlutterWebApp",
            builder=> {
                builder.WithOrigins("*")
                .AllowAnyHeader()
                .AllowAnyMethod();
            }
        );
    }
);

var app = builder.Build();

app.UseRouting();
app.MapControllers();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowFlutterWebApp");


// app.MapGet("/products", () =>
// {
    
//     return new List<Product>();
// })
// .WithName("GetAllProducts")
// .WithOpenApi();

app.Run();

