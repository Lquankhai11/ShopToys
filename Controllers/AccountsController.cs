using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShopToys.Models;
using ShopToys.ModelViews;

namespace ShopToys.Controllers
{
    public class AccountsController : Controller
    {
        private readonly ManagerShopPRN211Context _context;
        public INotyfService _notyfService { get; }

        public AccountsController(ManagerShopPRN211Context context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        // GET: Admin/AdminAccounts/Profile

        public async Task<IActionResult> EditProfile(int? id, HttpContextAccessor httpContextAccessor)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }
            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            var RoleID = HttpContext.Session.GetString("Role");
            if (RoleID != null && (RoleID == "1" || RoleID == "2" || RoleID == "3")){
                var profile = await _context.Employees.FindAsync(id);
                return View(profile);
            }
            if (RoleID == "4")
            {
                var profileC = _context.Customers.FindAsync(id);
                return View(profileC);
            }
            return RedirectToAction("Index", "Home");

        }

        // POST: Admin/AdminAccounts/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Check if the username already exists
                var existingAccount = await _context.Accounts.FirstOrDefaultAsync(a => a.Username == model.Username);
                if (existingAccount != null)
                {
                    ModelState.AddModelError("Username", "Username already exists.");
                    return View(model);
                }

                // Create a new account
                var account = new Account
                {
                    Username = model.Username,
                    Password = model.Password,
                    RoleId = 1,
                    Active = true
                };

                _context.Accounts.Add(account);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Login));
            }
            return View(model);
        }
        // GET: /Account/Login
        public IActionResult Login()
        {
            return View();
        }

        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Find the account by username and password
                var account = await _context.Accounts.FirstOrDefaultAsync(a => a.Username == model.Username && a.Password == model.Password);

                if (account != null)
                {
                    HttpContext.Session.SetString("AccountID", account.AccountId.ToString());
                    HttpContext.Session.SetString("Role", account.RoleId.ToString());
                    HttpContext.Session.SetString("Username", account.Username.ToString());
					return RedirectToAction("Index", "Home");
                }
                else
                {
                    // If the account does not exist, add a model error
                    ModelState.AddModelError(string.Empty, "Invalid username or password.");
                }
            }
            // If model state is not valid, return the login view with errors
            return View(model);
        }


        // GET: /Account/Logout
        public IActionResult Logout()
        {
            // Clear the authentication cookie or session variable
            // You need to implement your own logout mechanism here
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        // GET: Accounts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", account.RoleId);
            return View(account);
        }

        // POST: Accounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AccountId,Username,Password,RoleId,Active")] Account account)
        {
            if (id != account.AccountId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(account);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountExists(account.AccountId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", account.RoleId);
            return View(account);
        }

        // GET: Accounts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // POST: Accounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Accounts == null)
            {
                return Problem("Entity set 'ManagerShopPRN211Context.Accounts'  is null.");
            }
            var account = await _context.Accounts.FindAsync(id);
            if (account != null)
            {
                _context.Accounts.Remove(account);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AccountExists(int id)
        {
            return (_context.Accounts?.Any(e => e.AccountId == id)).GetValueOrDefault();
        }
    }
}
