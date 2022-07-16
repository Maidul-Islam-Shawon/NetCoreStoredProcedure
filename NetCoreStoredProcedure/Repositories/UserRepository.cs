using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NetCoreStoredProcedure.Models.DB;
using System.Data;

namespace NetCoreStoredProcedure.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly NetCoreSpDbContext _context;

        public UserRepository(NetCoreSpDbContext context)
        {
            this._context = context ?? throw new NullReferenceException(nameof(context));
        }

        public async Task<int> GetOrCreateUserAsync(UserProfile userProfile)
        {
            if(userProfile == null)
                throw new ArgumentNullException(nameof(userProfile));

            // create parameters to pass to the exec Stored Procedure statement
            // and bind the parameters with the values passed
            var emailAddressParam = new SqlParameter("@emailAddress", userProfile.EmailAddress);
            var passwordParam = new SqlParameter("@passwordHash", userProfile.PasswordHash);

            // run the statement to exec Stored Procedure inside the database
            // and capture the return values

            string sp_query = $"EXEC sp_GetUsers @emailAddress, @passwordHash";

            var users = await _context.UserProfiles.FromSqlRaw(sp_query, emailAddressParam, passwordParam)
                .ToListAsync();

            /* 
            // The above Stored Procedure does the same job 
            // as what the below code does
                    
            var users = context
                .UserProfiles
                .Where(x => x.EmailAddress == id.EmailAddress 
                    && x.PasswordHash == id.PasswordHash).ToList(); 
                */

            if(users.Count > 0)
            {
                return users.First().Id;
            }
            else
            {
                /*
                        // The above Stored Procedure does the same job 
                        // as what the below code does
                        var user = id;
                        await context.UserProfiles.AddAsync(user);
                        await context.SaveChangesAsync();
                        return user.Id;
                    */

                // the emailAddress and passwordHash params are reused 
                // from their previous declaration in the method

                // define SqlParameters for the other two params to be passed
                var oidProviderParam = new SqlParameter("@oidProvider", userProfile.OIdProvider);
                var oidParam = new SqlParameter("@oid", string.IsNullOrEmpty(userProfile.OId) ? "" : userProfile.OId);

                // define the output parameter that needs to be retained
                // for the Id created when the Stored Procedure executes 
                // the INSERT command
                var userIdParam = new SqlParameter("@Id", SqlDbType.Int);

                // the direction defines what kind of parameter we're passing
                // it can be one of:
                // Input
                // Output
                // InputOutput -- which does pass a value to Stored Procedure and retains a new state
                userIdParam.Direction = ParameterDirection.Output;

                // we can also use context.Database.ExecuteSqlCommand() or awaitable ExecuteSqlCommandAsync()
                // which also produces the same result - but the method is now marked obselete
                // so we use ExecuteSqlRawAsync() instead

                // we're using the awaitable version since GetOrCreateUserAsync() method is marked async
                await _context.Database.ExecuteSqlRawAsync(
                        "exec sp_CreateUser @emailAddress, @passwordHash, @oidProvider, @oid, @Id out",
                        emailAddressParam,
                        passwordParam,
                        oidProviderParam,
                        oidParam,
                        userIdParam);

                // the userIdParam which represents the Output param
                // now holds the Id of the new user and is an Object type
                // so we convert it to an Integer and send
                return Convert.ToInt32(userIdParam.Value);
            }

            //return -1;

        }
    }
}
