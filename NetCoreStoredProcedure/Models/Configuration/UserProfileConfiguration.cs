using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using NetCoreStoredProcedure.Models.DB;

namespace NetCoreStoredProcedure.Models.Configuration
{
    public class UserProfileConfiguration : IEntityTypeConfiguration<UserProfile>
    {
        public void Configure(EntityTypeBuilder<UserProfile> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(x => x.EmailAddress).IsRequired().HasMaxLength(200);
        }
    }
}
