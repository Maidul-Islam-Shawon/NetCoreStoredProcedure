using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NetCoreStoredProcedure.Models.DB;

namespace NetCoreStoredProcedure.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OutputsController : ControllerBase
    {
        private readonly NetCoreSpDbContext _context;

        public OutputsController(NetCoreSpDbContext context)
        {
            _context = context;
        }

        // GET: api/Outputs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Output>>> GetOutput()
        {
            if (_context.Output == null)
            {
                return NotFound();
            }
            return await _context.Output.ToListAsync();
        }

        [HttpPost]
        public async Task<IActionResult> GetOutput(Input input)
        {
            if (_context.Output == null)
            {
                return NotFound();
            }

            var clinicId = new SqlParameter("@ClinicId", input.ClinicId);
            var appointmentDate = new SqlParameter("@AppointmentDate", input.AppointmentDate);
            var firstName = new SqlParameter("@FirstName", input.FirstName);
            var lastName = new SqlParameter("@LastName", input.LastName);
            var patientID = new SqlParameter("@PatientID", input.PatientId);
            var appointmentStartTime = new SqlParameter("@AppointmentStartTime", input.AppointmentStartTime);
            var appointmentEndTime = new SqlParameter("@AppointmentEndTime", input.AppointmentEndTime);

            //string storedProcedure = $"EXEC dbo.CreateAppointmentSp " +
            //    $"@ClinicId={clinicId}, @AppointmentDate={appointmentDate}, @FirstName={firstName}, " +
            //    $"@LastName={lastName}, @PatientID={patientID}, " +
            //    $"@AppointmentStartTime={appointmentStartTime}, @AppointmentEndTime={appointmentEndTime}";
            string storedProcedure = "EXEC dbo.CreateAppointmentSp " +
                                    "@ClinicId, @AppointmentDate, @FirstName, " +
                                    "@LastName, @PatientID, " +
                                    "@AppointmentStartTime, @AppointmentEndTime";

            var result = await _context.Output.FromSqlRaw(storedProcedure,clinicId, appointmentDate, firstName, 
                lastName, patientID, appointmentStartTime, appointmentEndTime).ToListAsync();
            return Ok(result);
        }

        //// GET: api/Outputs/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Output>> GetOutput(int id)
        //{
        //  if (_context.Output == null)
        //  {
        //      return NotFound();
        //  }
        //    var output = await _context.Output.FindAsync(id);

        //    if (output == null)
        //    {
        //        return NotFound();
        //    }

        //    return output;
        //}

        //// PUT: api/Outputs/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutOutput(int id, Output output)
        //{
        //    if (id != output.AppointmentId)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(output).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!OutputExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/Outputs
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Output>> PostOutput(Output output)
        //{
        //  if (_context.Output == null)
        //  {
        //      return Problem("Entity set 'NetCoreSpDbContext.Output'  is null.");
        //  }
        //    _context.Output.Add(output);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetOutput", new { id = output.AppointmentId }, output);
        //}

        //// DELETE: api/Outputs/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteOutput(int id)
        //{
        //    if (_context.Output == null)
        //    {
        //        return NotFound();
        //    }
        //    var output = await _context.Output.FindAsync(id);
        //    if (output == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Output.Remove(output);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}

        //private bool OutputExists(int id)
        //{
        //    return (_context.Output?.Any(e => e.AppointmentId == id)).GetValueOrDefault();
        //}
    }
}
