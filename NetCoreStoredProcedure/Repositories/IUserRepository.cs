using NetCoreStoredProcedure.Models.DB;

namespace NetCoreStoredProcedure.Repositories
{
    public interface IUserRepository
    {
        Task<int> GetOrCreateUserAsync(UserProfile userProfile);
    }
}
