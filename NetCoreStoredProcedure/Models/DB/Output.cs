using System.ComponentModel.DataAnnotations;

namespace NetCoreStoredProcedure.Models.DB
{
    public partial class Output
    {
        [Key]
        public int AppointmentId { get; set; }
        public int ReturnCode { get; set; }
        public DateTime SubmittedTime { get; set; }
    }
}
