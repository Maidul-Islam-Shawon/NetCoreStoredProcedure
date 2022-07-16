using Microsoft.EntityFrameworkCore;
using NetCoreStoredProcedure.Models.Configuration;

namespace NetCoreStoredProcedure.Models.DB
{
    public class NetCoreSpDbContext : DbContext
    {
        public NetCoreSpDbContext(DbContextOptions<NetCoreSpDbContext> options) : base(options)
        {
        }
        public DbSet<Output>? Output { get; set; }
        public DbSet<UserProfile>? UserProfiles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new UserProfileConfiguration());
        }
    }
}
