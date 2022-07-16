namespace NetCoreStoredProcedure.Models.DB
{
#nullable disable
    public class UserProfile
    {
        public int Id { get; set; }
        public string EmailAddress { get; set; }
        public string PasswordHash { get; set; }
        public string OIdProvider { get; set; }
        public string OId { get; set; }
    }
}
