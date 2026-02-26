<!doctype html>
<html lang="en" class="h-full">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WORX.INK Accounting System</title>
  <script src="https://cdn.tailwindcss.com/3.4.17"></script>
  <script src="/_sdk/element_sdk.js"></script>
  <script src="/_sdk/data_sdk.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;family=Space+Grotesk:wght@400;500;600;700&amp;display=swap" rel="stylesheet">
  <script>
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            'display': ['Space Grotesk', 'sans-serif'],
            'body': ['Inter', 'sans-serif']
          }
        }
      }
    }
  </script>
  <style>
    * { font-family: 'Inter', sans-serif; }
    .font-display { font-family: 'Space Grotesk', sans-serif; }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    @keyframes slideIn {
      from { opacity: 0; transform: translateX(-20px); }
      to { opacity: 1; transform: translateX(0); }
    }
    
    @keyframes pulse {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.02); }
    }
    
    .animate-fadeIn { animation: fadeIn 0.3s ease-out; }
    .animate-slideIn { animation: slideIn 0.4s ease-out; }
    
    .gradient-primary {
      background: linear-gradient(135deg, #1e3a5f 0%, #0f2439 100%);
    }
    
    .gradient-accent {
      background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
    }
    
    .card-shadow {
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    }
    
    .nav-item:hover { background: rgba(255, 255, 255, 0.1); }
    .nav-item.active { background: rgba(245, 158, 11, 0.2); border-left: 3px solid #f59e0b; }
    
    input:focus, select:focus, textarea:focus {
      outline: none;
      border-color: #f59e0b;
      box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.1);
    }
    
    .btn-primary {
      background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
      transition: all 0.2s ease;
    }
    .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(245, 158, 11, 0.4); }
    
    .btn-secondary {
      background: linear-gradient(135deg, #374151 0%, #1f2937 100%);
      transition: all 0.2s ease;
    }
    .btn-secondary:hover { transform: translateY(-1px); }
    
    .btn-danger {
      background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
      transition: all 0.2s ease;
    }
    .btn-danger:hover { transform: translateY(-1px); }
    
    .table-row:hover { background: rgba(245, 158, 11, 0.05); }
    
    .modal-backdrop {
      background: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(4px);
    }
    
    .stat-card {
      transition: all 0.3s ease;
    }
    .stat-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    
    ::-webkit-scrollbar { width: 8px; height: 8px; }
    ::-webkit-scrollbar-track { background: #1e3a5f; }
    ::-webkit-scrollbar-thumb { background: #f59e0b; border-radius: 4px; }
    
    .toast {
      animation: slideIn 0.3s ease-out;
    }
  </style>
  <style>body { box-sizing: border-box; }</style>
 </head>
 <body class="h-full bg-slate-100 overflow-auto">
  <div id="app" class="h-full w-full">
   <!-- Login Screen -->
   <div id="loginScreen" class="h-full w-full flex items-center justify-center gradient-primary">
    <div class="w-full max-w-md p-8 animate-fadeIn">
     <div class="bg-white rounded-2xl shadow-2xl p-8">
      <div class="text-center mb-8">
       <div class="w-20 h-20 mx-auto mb-4 rounded-2xl gradient-accent flex items-center justify-center">
        <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" viewbox="0 0 24 24">
         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
        </svg>
       </div>
       <h1 class="font-display text-2xl font-bold text-slate-800" id="loginBusinessName">WORX.INK PRINTING SERVICES</h1>
       <p class="text-slate-500 mt-2">Accounting Management System</p>
      </div>
      <div class="space-y-4">
       <div>
        <label class="block text-sm font-medium text-slate-700 mb-1">Username</label> <input type="text" id="loginUsername" class="w-full px-4 py-3 border border-slate-300 rounded-lg text-slate-800" placeholder="Enter username">
       </div>
       <div>
        <label class="block text-sm font-medium text-slate-700 mb-1">Password</label> <input type="password" id="loginPassword" class="w-full px-4 py-3 border border-slate-300 rounded-lg text-slate-800" placeholder="Enter password">
       </div>
       <div id="loginError" class="hidden text-red-500 text-sm text-center py-2 bg-red-50 rounded-lg"></div><button onclick="handleLogin()" class="w-full py-3 btn-primary text-white font-semibold rounded-lg"> Login </button>
      </div>
     </div>
    </div>
   </div><!-- Main Application -->
   <div id="mainApp" class="hidden h-full w-full flex">
    <!-- Sidebar Navigation -->
    <div class="w-64 gradient-primary flex flex-col flex-shrink-0">
     <div class="p-6 border-b border-white/10">
      <div class="flex items-center gap-3">
       <div class="w-10 h-10 rounded-lg gradient-accent flex items-center justify-center">
        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewbox="0 0 24 24">
         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
        </svg>
       </div>
       <div>
        <h2 class="font-display font-bold text-white text-sm" id="sidebarBusinessName">WORX.INK</h2>
        <p class="text-xs text-slate-300">Accounting</p>
       </div>
      </div>
     </div>
     <nav class="flex-1 py-4 overflow-y-auto">
      <div class="px-3 space-y-1">
       <button onclick="showPage('dashboard')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="dashboard">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
        </svg><span class="text-sm font-medium">Dashboard</span> </button> <button onclick="showPage('sales')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="sales">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
        </svg><span class="text-sm font-medium">Sales Log</span> </button> <button onclick="showPage('expenses')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="expenses">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg><span class="text-sm font-medium">Expenses Log</span> </button> <button onclick="showPage('capital')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="capital">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg><span class="text-sm font-medium">Capital &amp; Withdrawals</span> </button> <button onclick="showPage('inventory')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="inventory">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
        </svg><span class="text-sm font-medium">Inventory</span> </button> <button onclick="showPage('monthly')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="monthly">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
        </svg><span class="text-sm font-medium">Monthly Summary</span> </button> <button onclick="showPage('charts')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="charts">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 12l3-3 3 3 4-4M8 21l4-4 4 4M3 4h18M4 4h16v12a1 1 0 01-1 1H5a1 1 0 01-1-1V4z" />
        </svg><span class="text-sm font-medium">Charts &amp; Graphs</span> </button> <button onclick="showPage('equity')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="equity">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
        </svg><span class="text-sm font-medium">Owner Equity</span> </button> <button id="settingsNavBtn" onclick="showPage('settings')" class="nav-item w-full flex items-center gap-3 px-4 py-3 text-white rounded-lg transition-all" data-page="settings">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg><span class="text-sm font-medium">Settings</span> <span class="ml-auto text-xs bg-amber-500 text-white px-2 py-0.5 rounded">Admin</span> </button>
      </div>
     </nav>
     <div class="p-4 border-t border-white/10">
      <div class="flex items-center gap-3 mb-3">
       <div class="w-10 h-10 rounded-full bg-amber-500 flex items-center justify-center text-white font-bold" id="userAvatar">
        K
       </div>
       <div>
        <p class="text-white text-sm font-medium" id="currentUserName">Krisha</p>
        <p class="text-slate-300 text-xs" id="currentUserRole">Admin</p>
       </div>
      </div><button onclick="handleLogout()" class="w-full py-2 bg-white/10 hover:bg-white/20 text-white text-sm rounded-lg transition-all flex items-center justify-center gap-2">
       <svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
       </svg> Logout </button>
     </div>
    </div><!-- Main Content Area -->
    <div class="flex-1 overflow-auto bg-slate-100">
     <!-- Dashboard Page -->
     <div id="page-dashboard" class="page hidden p-6">
      <div class="mb-6">
       <h1 class="font-display text-3xl font-bold text-slate-800" id="dashboardTitle">WORX.INK PRINTING SERVICES</h1>
       <p class="text-slate-500">Business Dashboard Overview</p>
      </div><!-- Stats Grid -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
       <div class="stat-card bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center justify-between mb-3">
         <span class="text-slate-500 text-sm">Total Sales</span>
         <div class="w-10 h-10 rounded-lg bg-green-100 flex items-center justify-center">
          <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
         </div>
        </div>
        <p class="text-2xl font-bold text-slate-800" id="totalSalesDisplay">₱0.00</p>
       </div>
       <div class="stat-card bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center justify-between mb-3">
         <span class="text-slate-500 text-sm">Total Expenses</span>
         <div class="w-10 h-10 rounded-lg bg-red-100 flex items-center justify-center">
          <svg class="w-5 h-5 text-red-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
         </div>
        </div>
        <p class="text-2xl font-bold text-slate-800" id="totalExpensesDisplay">₱0.00</p>
       </div>
       <div class="stat-card bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center justify-between mb-3">
         <span class="text-slate-500 text-sm">Net Profit</span>
         <div class="w-10 h-10 rounded-lg bg-blue-100 flex items-center justify-center">
          <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
          </svg>
         </div>
        </div>
        <p class="text-2xl font-bold text-slate-800" id="netProfitDisplay">₱0.00</p>
       </div>
       <div class="stat-card bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center justify-between mb-3">
         <span class="text-slate-500 text-sm">Net After Withdrawals</span>
         <div class="w-10 h-10 rounded-lg bg-purple-100 flex items-center justify-center">
          <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2z" />
          </svg>
         </div>
        </div>
        <p class="text-2xl font-bold text-slate-800" id="netAfterWithdrawalsDisplay">₱0.00</p>
       </div>
      </div><!-- Second Row Stats -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Payment Methods Breakdown</h3>
        <div class="space-y-3">
         <div class="flex justify-between items-center">
          <span class="text-slate-600 flex items-center gap-2">
           <div class="w-3 h-3 rounded-full bg-green-500"></div>Cash </span> <span class="font-semibold" id="cashSales">₱0.00</span>
         </div>
         <div class="flex justify-between items-center">
          <span class="text-slate-600 flex items-center gap-2">
           <div class="w-3 h-3 rounded-full bg-blue-500"></div>GCash </span> <span class="font-semibold" id="gcashSales">₱0.00</span>
         </div>
         <div class="flex justify-between items-center">
          <span class="text-slate-600 flex items-center gap-2">
           <div class="w-3 h-3 rounded-full bg-purple-500"></div>Bank Transfer </span> <span class="font-semibold" id="bankSales">₱0.00</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Capital Balance</h3>
        <div class="space-y-3">
         <div class="flex justify-between items-center">
          <span class="text-slate-600">Krisha</span> <span class="font-semibold text-green-600" id="krishaCapital">₱0.00</span>
         </div>
         <div class="flex justify-between items-center">
          <span class="text-slate-600">Vanessa</span> <span class="font-semibold text-green-600" id="vanessaCapital">₱0.00</span>
         </div>
         <div class="border-t pt-2 flex justify-between items-center">
          <span class="text-slate-700 font-medium">Total Capital</span> <span class="font-bold text-slate-800" id="totalCapital">₱0.00</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Owner Equity</h3>
        <div class="space-y-3">
         <div class="flex justify-between items-center">
          <span class="text-slate-600">Krisha</span> <span class="font-semibold text-blue-600" id="krishaEquity">₱0.00</span>
         </div>
         <div class="flex justify-between items-center">
          <span class="text-slate-600">Vanessa</span> <span class="font-semibold text-blue-600" id="vanessaEquity">₱0.00</span>
         </div>
         <div class="border-t pt-2 flex justify-between items-center">
          <span class="text-slate-700 font-medium">Total Equity</span> <span class="font-bold text-slate-800" id="totalEquity">₱0.00</span>
         </div>
        </div>
       </div>
      </div><!-- Profit Split Section -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Profit Split (50/50)</h3>
        <div class="space-y-3">
         <div class="flex justify-between items-center p-3 bg-amber-50 rounded-lg">
          <span class="text-slate-700 font-medium">Krisha's Share</span> <span class="font-bold text-amber-600" id="krishaShare5050">₱0.00</span>
         </div>
         <div class="flex justify-between items-center p-3 bg-amber-50 rounded-lg">
          <span class="text-slate-700 font-medium">Vanessa's Share</span> <span class="font-bold text-amber-600" id="vanessaShare5050">₱0.00</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Profit Split (Custom %)</h3>
        <div class="flex gap-2 mb-3">
         <div class="flex-1">
          <label class="text-xs text-slate-500">Krisha %</label>
          <p class="font-bold text-slate-800" id="krishaPercentDisplay">50%</p>
         </div>
         <div class="flex-1">
          <label class="text-xs text-slate-500">Vanessa %</label>
          <p class="font-bold text-slate-800" id="vanessaPercentDisplay">50%</p>
         </div>
        </div>
        <div class="space-y-3">
         <div class="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
          <span class="text-slate-700 font-medium">Krisha's Share</span> <span class="font-bold text-blue-600" id="krishaShareCustom">₱0.00</span>
         </div>
         <div class="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
          <span class="text-slate-700 font-medium">Vanessa's Share</span> <span class="font-bold text-blue-600" id="vanessaShareCustom">₱0.00</span>
         </div>
        </div>
       </div>
      </div>
     </div><!-- Sales Log Page -->
     <div id="page-sales" class="page hidden p-6">
      <div class="flex justify-between items-center mb-6">
       <div>
        <h1 class="font-display text-2xl font-bold text-slate-800">Sales Log</h1>
        <p class="text-slate-500">Track all printing sales transactions</p>
       </div><button onclick="openSaleModal()" class="btn-primary px-4 py-2 text-white rounded-lg flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg> Add Sale </button>
      </div>
      <div class="bg-white rounded-xl card-shadow overflow-hidden">
       <div class="overflow-x-auto">
        <table class="w-full">
         <thead class="bg-slate-50 border-b">
          <tr>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Date</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Invoice</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Customer</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Print Type</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Paper</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Qty</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Price/Page</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Total</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Payment</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Handled By</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Actions</th>
          </tr>
         </thead>
         <tbody id="salesTableBody" class="divide-y divide-slate-100">
          <tr>
           <td colspan="11" class="px-4 py-8 text-center text-slate-400">No sales recorded yet</td>
          </tr>
         </tbody>
        </table>
       </div>
      </div>
     </div><!-- Expenses Log Page -->
     <div id="page-expenses" class="page hidden p-6">
      <div class="flex justify-between items-center mb-6">
       <div>
        <h1 class="font-display text-2xl font-bold text-slate-800">Expenses Log</h1>
        <p class="text-slate-500">Track all business expenses</p>
       </div><button onclick="openExpenseModal()" class="btn-primary px-4 py-2 text-white rounded-lg flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg> Add Expense </button>
      </div>
      <div class="bg-white rounded-xl card-shadow overflow-hidden">
       <div class="overflow-x-auto">
        <table class="w-full">
         <thead class="bg-slate-50 border-b">
          <tr>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Date</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Month</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Supplier</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Item</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Qty</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Unit Cost</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Total</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Paid By</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Payment</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Actions</th>
          </tr>
         </thead>
         <tbody id="expensesTableBody" class="divide-y divide-slate-100">
          <tr>
           <td colspan="10" class="px-4 py-8 text-center text-slate-400">No expenses recorded yet</td>
          </tr>
         </tbody>
        </table>
       </div>
      </div>
     </div><!-- Capital & Withdrawals Page -->
     <div id="page-capital" class="page hidden p-6">
      <div class="flex justify-between items-center mb-6">
       <div>
        <h1 class="font-display text-2xl font-bold text-slate-800">Capital &amp; Withdrawals</h1>
        <p class="text-slate-500">Track owner investments and withdrawals</p>
       </div><button onclick="openCapitalModal()" class="btn-primary px-4 py-2 text-white rounded-lg flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg> Add Transaction </button>
      </div><!-- Summary Cards -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Krisha's Summary</h3>
        <div class="space-y-2">
         <div class="flex justify-between"><span class="text-slate-600">Total Capital In</span><span class="font-semibold text-green-600" id="krishaTotalCapitalIn">₱0.00</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-600">Total Withdrawals</span><span class="font-semibold text-red-600" id="krishaTotalWithdrawals">₱0.00</span>
         </div>
         <div class="border-t pt-2 flex justify-between"><span class="font-medium">Net Balance</span><span class="font-bold" id="krishaNetBalance">₱0.00</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Vanessa's Summary</h3>
        <div class="space-y-2">
         <div class="flex justify-between"><span class="text-slate-600">Total Capital In</span><span class="font-semibold text-green-600" id="vanessaTotalCapitalIn">₱0.00</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-600">Total Withdrawals</span><span class="font-semibold text-red-600" id="vanessaTotalWithdrawals">₱0.00</span>
         </div>
         <div class="border-t pt-2 flex justify-between"><span class="font-medium">Net Balance</span><span class="font-bold" id="vanessaNetBalance">₱0.00</span>
         </div>
        </div>
       </div>
      </div>
      <div class="bg-white rounded-xl card-shadow overflow-hidden">
       <div class="overflow-x-auto">
        <table class="w-full">
         <thead class="bg-slate-50 border-b">
          <tr>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Date</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Owner</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Capital In</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Withdrawal</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Net Movement</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Remarks</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Actions</th>
          </tr>
         </thead>
         <tbody id="capitalTableBody" class="divide-y divide-slate-100">
          <tr>
           <td colspan="7" class="px-4 py-8 text-center text-slate-400">No capital transactions recorded yet</td>
          </tr>
         </tbody>
        </table>
       </div>
      </div>
     </div><!-- Inventory Page -->
     <div id="page-inventory" class="page hidden p-6">
      <div class="flex justify-between items-center mb-6">
       <div>
        <h1 class="font-display text-2xl font-bold text-slate-800">Inventory Tracker</h1>
        <p class="text-slate-500">Monitor paper stock levels (1 ream = 500 pages)</p>
       </div><button onclick="openInventoryModal()" class="btn-primary px-4 py-2 text-white rounded-lg flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
        </svg> Update Stock </button>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
       <div class="bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center gap-3 mb-4">
         <div class="w-12 h-12 rounded-xl bg-blue-100 flex items-center justify-center">
          <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
         </div>
         <h3 class="font-semibold text-slate-700">Long Bond Paper</h3>
        </div>
        <div class="space-y-2 text-sm">
         <div class="flex justify-between"><span class="text-slate-500">Beginning Reams</span><span class="font-medium" id="longBeginning">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Purchased Reams</span><span class="font-medium text-green-600" id="longPurchased">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Total Available</span><span class="font-medium" id="longTotal">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Pages Used</span><span class="font-medium text-red-600" id="longUsed">0</span>
         </div>
         <div class="border-t pt-2 flex justify-between"><span class="font-medium">Remaining Reams</span><span class="font-bold text-blue-600" id="longRemaining">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Remaining Pages</span><span class="font-medium" id="longRemainingPages">0</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center gap-3 mb-4">
         <div class="w-12 h-12 rounded-xl bg-green-100 flex items-center justify-center">
          <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
         </div>
         <h3 class="font-semibold text-slate-700">Short Bond Paper</h3>
        </div>
        <div class="space-y-2 text-sm">
         <div class="flex justify-between"><span class="text-slate-500">Beginning Reams</span><span class="font-medium" id="shortBeginning">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Purchased Reams</span><span class="font-medium text-green-600" id="shortPurchased">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Total Available</span><span class="font-medium" id="shortTotal">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Pages Used</span><span class="font-medium text-red-600" id="shortUsed">0</span>
         </div>
         <div class="border-t pt-2 flex justify-between"><span class="font-medium">Remaining Reams</span><span class="font-bold text-green-600" id="shortRemaining">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Remaining Pages</span><span class="font-medium" id="shortRemainingPages">0</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-5 card-shadow">
        <div class="flex items-center gap-3 mb-4">
         <div class="w-12 h-12 rounded-xl bg-purple-100 flex items-center justify-center">
          <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
         </div>
         <h3 class="font-semibold text-slate-700">A4 Paper</h3>
        </div>
        <div class="space-y-2 text-sm">
         <div class="flex justify-between"><span class="text-slate-500">Beginning Reams</span><span class="font-medium" id="a4Beginning">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Purchased Reams</span><span class="font-medium text-green-600" id="a4Purchased">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Total Available</span><span class="font-medium" id="a4Total">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Pages Used</span><span class="font-medium text-red-600" id="a4Used">0</span>
         </div>
         <div class="border-t pt-2 flex justify-between"><span class="font-medium">Remaining Reams</span><span class="font-bold text-purple-600" id="a4Remaining">0</span>
         </div>
         <div class="flex justify-between"><span class="text-slate-500">Remaining Pages</span><span class="font-medium" id="a4RemainingPages">0</span>
         </div>
        </div>
       </div>
      </div>
     </div><!-- Monthly Summary Page -->
     <div id="page-monthly" class="page hidden p-6">
      <div class="mb-6">
       <h1 class="font-display text-2xl font-bold text-slate-800">Monthly Sales Summary</h1>
       <p class="text-slate-500">View sales and expenses by month</p>
      </div>
      <div class="bg-white rounded-xl card-shadow overflow-hidden">
       <div class="overflow-x-auto">
        <table class="w-full">
         <thead class="bg-slate-50 border-b">
          <tr>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Month</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Total Sales</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Total Expenses</th>
           <th class="px-4 py-3 text-left text-xs font-semibold text-slate-600 uppercase">Net Profit</th>
          </tr>
         </thead>
         <tbody id="monthlySummaryBody" class="divide-y divide-slate-100">
         </tbody>
        </table>
       </div>
      </div>
     </div><!-- Charts Page -->
     <div id="page-charts" class="page hidden p-6">
      <div class="mb-6">
       <h1 class="font-display text-2xl font-bold text-slate-800">Sales &amp; Profit Charts</h1>
       <p class="text-slate-500">Visual representation of business performance</p>
      </div>
      <div class="grid grid-cols-1 gap-6">
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Monthly Sales Trend</h3>
        <div class="h-64 relative" id="salesChartContainer">
         <canvas id="salesChart"></canvas>
        </div>
       </div>
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Monthly Net Profit Trend</h3>
        <div class="h-64 relative" id="profitChartContainer">
         <canvas id="profitChart"></canvas>
        </div>
       </div>
      </div>
     </div><!-- Equity Page -->
     <div id="page-equity" class="page hidden p-6">
      <div class="mb-6">
       <h1 class="font-display text-2xl font-bold text-slate-800">Owner Equity Computation</h1>
       <p class="text-slate-500">Detailed breakdown of owner equity</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
       <div class="bg-white rounded-xl p-6 card-shadow">
        <div class="flex items-center gap-3 mb-6">
         <div class="w-14 h-14 rounded-full bg-amber-500 flex items-center justify-center text-white text-xl font-bold">
          K
         </div>
         <div>
          <h3 class="font-semibold text-slate-800 text-lg">Krisha's Equity</h3>
          <p class="text-slate-500 text-sm">Owner / Admin</p>
         </div>
        </div>
        <div class="space-y-3">
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Total Capital Contributed</span> <span class="font-semibold text-green-600" id="krishaCapitalContributed">₱0.00</span>
         </div>
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Share of Net Profit</span> <span class="font-semibold text-blue-600" id="krishaProfitShare">₱0.00</span>
         </div>
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Total Withdrawals</span> <span class="font-semibold text-red-600" id="krishaTotalWithdrawalsEquity">₱0.00</span>
         </div>
         <div class="flex justify-between p-4 bg-amber-100 rounded-lg">
          <span class="font-bold text-slate-800">Total Equity</span> <span class="font-bold text-amber-600 text-xl" id="krishaTotalEquity">₱0.00</span>
         </div>
        </div>
       </div>
       <div class="bg-white rounded-xl p-6 card-shadow">
        <div class="flex items-center gap-3 mb-6">
         <div class="w-14 h-14 rounded-full bg-blue-500 flex items-center justify-center text-white text-xl font-bold">
          V
         </div>
         <div>
          <h3 class="font-semibold text-slate-800 text-lg">Vanessa's Equity</h3>
          <p class="text-slate-500 text-sm">Co-Owner</p>
         </div>
        </div>
        <div class="space-y-3">
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Total Capital Contributed</span> <span class="font-semibold text-green-600" id="vanessaCapitalContributed">₱0.00</span>
         </div>
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Share of Net Profit</span> <span class="font-semibold text-blue-600" id="vanessaProfitShare">₱0.00</span>
         </div>
         <div class="flex justify-between p-3 bg-slate-50 rounded-lg">
          <span class="text-slate-600">Total Withdrawals</span> <span class="font-semibold text-red-600" id="vanessaTotalWithdrawalsEquity">₱0.00</span>
         </div>
         <div class="flex justify-between p-4 bg-blue-100 rounded-lg">
          <span class="font-bold text-slate-800">Total Equity</span> <span class="font-bold text-blue-600 text-xl" id="vanessaTotalEquity">₱0.00</span>
         </div>
        </div>
       </div>
      </div>
      <div class="mt-6 bg-white rounded-xl p-6 card-shadow">
       <h3 class="font-semibold text-slate-700 mb-4">Total Business Equity</h3>
       <div class="text-center py-6">
        <p class="text-slate-500 mb-2">Combined Owner Equity</p>
        <p class="text-4xl font-bold text-slate-800" id="totalBusinessEquity">₱0.00</p>
       </div>
      </div>
     </div><!-- Settings Page (Admin Only) -->
     <div id="page-settings" class="page hidden p-6">
      <div class="mb-6">
       <h1 class="font-display text-2xl font-bold text-slate-800">System Settings</h1>
       <p class="text-slate-500">Configure system preferences (Admin Only)</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Business Information</h3>
        <div class="space-y-4">
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">Business Name</label> <input type="text" id="settingsBusinessName" class="w-full px-4 py-2 border border-slate-300 rounded-lg" value="WORX.INK PRINTING SERVICES">
         </div>
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">Default Price Per Page (₱)</label> <input type="number" id="settingsDefaultPrice" class="w-full px-4 py-2 border border-slate-300 rounded-lg" value="2" step="0.5">
         </div><button onclick="saveBusinessSettings()" class="btn-primary px-4 py-2 text-white rounded-lg">Save Changes</button>
        </div>
       </div>
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Profit Split Settings</h3>
        <div class="space-y-4">
         <div class="flex items-center gap-3">
          <input type="checkbox" id="customSplitToggle" class="w-5 h-5 text-amber-500 rounded" onchange="toggleCustomSplit()"> <label class="text-slate-600">Use Custom Percentage (instead of 50/50)</label>
         </div>
         <div id="customSplitInputs" class="hidden space-y-3">
          <div>
           <label class="block text-sm font-medium text-slate-600 mb-1">Krisha's Percentage (%)</label> <input type="number" id="krishaPercentage" class="w-full px-4 py-2 border border-slate-300 rounded-lg" value="50" min="0" max="100">
          </div>
          <div>
           <label class="block text-sm font-medium text-slate-600 mb-1">Vanessa's Percentage (%)</label> <input type="number" id="vanessaPercentage" class="w-full px-4 py-2 border border-slate-300 rounded-lg" value="50" min="0" max="100" readonly>
          </div>
         </div><button onclick="saveSplitSettings()" class="btn-primary px-4 py-2 text-white rounded-lg">Save Split Settings</button>
        </div>
       </div>
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Change Admin Password</h3>
        <div class="space-y-4">
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">Current Password</label> <input type="password" id="currentPassword" class="w-full px-4 py-2 border border-slate-300 rounded-lg">
         </div>
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">New Password</label> <input type="password" id="newPassword" class="w-full px-4 py-2 border border-slate-300 rounded-lg">
         </div>
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">Confirm New Password</label> <input type="password" id="confirmPassword" class="w-full px-4 py-2 border border-slate-300 rounded-lg">
         </div><button onclick="changePassword()" class="btn-primary px-4 py-2 text-white rounded-lg">Change Password</button>
        </div>
       </div>
       <div class="bg-white rounded-xl p-6 card-shadow">
        <h3 class="font-semibold text-slate-700 mb-4">Change Co-Owner Password</h3>
        <div class="space-y-4">
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">New Password for Vanessa</label> <input type="password" id="vanessaNewPassword" class="w-full px-4 py-2 border border-slate-300 rounded-lg">
         </div>
         <div>
          <label class="block text-sm font-medium text-slate-600 mb-1">Confirm Password</label> <input type="password" id="vanessaConfirmPassword" class="w-full px-4 py-2 border border-slate-300 rounded-lg">
         </div><button onclick="changeVanessaPassword()" class="btn-primary px-4 py-2 text-white rounded-lg">Update Password</button>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div><!-- Modal Container -->
   <div id="modalContainer" class="hidden fixed inset-0 z-50 modal-backdrop flex items-center justify-center p-4">
    <div id="modalContent" class="bg-white rounded-2xl shadow-2xl w-full max-w-lg max-h-[90%] overflow-y-auto animate-fadeIn">
    </div>
   </div><!-- Toast Container -->
   <div id="toastContainer" class="fixed bottom-4 right-4 z-50 space-y-2"></div><!-- Delete Confirmation Modal -->
   <div id="deleteModal" class="hidden fixed inset-0 z-50 modal-backdrop flex items-center justify-center p-4">
    <div class="bg-white rounded-2xl shadow-2xl w-full max-w-sm p-6 animate-fadeIn">
     <div class="text-center">
      <div class="w-16 h-16 mx-auto mb-4 rounded-full bg-red-100 flex items-center justify-center">
       <svg class="w-8 h-8 text-red-600" fill="none" stroke="currentColor" viewbox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
       </svg>
      </div>
      <h3 class="text-lg font-semibold text-slate-800 mb-2">Confirm Delete</h3>
      <p class="text-slate-500 mb-6">Are you sure you want to delete this record? This action cannot be undone.</p>
      <div class="flex gap-3">
       <button onclick="closeDeleteModal()" class="flex-1 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300">Cancel</button> <button id="confirmDeleteBtn" class="flex-1 py-2 btn-danger text-white rounded-lg font-medium">Delete</button>
      </div>
     </div>
    </div>
   </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
  <script>
    // Application State
    let appData = {
      sales: [],
      expenses: [],
      capital: [],
      inventory: [],
      settings: []
    };
    
    let currentUser = null;
    let editingRecord = null;
    let deleteCallback = null;
    let invoiceCounter = 1000;
    let salesChart = null;
    let profitChart = null;
    
    // Default credentials (stored in settings)
    let credentials = {
      krisha: { password: 'admin123', role: 'Admin' },
      vanessa: { password: 'owner123', role: 'Co-Owner' }
    };
    
    // Default settings
    let settings = {
      businessName: 'WORX.INK PRINTING SERVICES',
      defaultPricePerPage: 2,
      krishaPercentage: 50,
      vanessaPercentage: 50,
      useCustomSplit: false
    };
    
    const defaultConfig = {
      business_name: 'WORX.INK PRINTING SERVICES'
    };
    
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    
    // Initialize SDKs
    async function initApp() {
      // Initialize Element SDK
      if (window.elementSdk) {
        window.elementSdk.init({
          defaultConfig,
          onConfigChange: async (config) => {
            const businessName = config.business_name || defaultConfig.business_name;
            settings.businessName = businessName;
            updateBusinessNameDisplays();
          },
          mapToCapabilities: (config) => ({
            recolorables: [],
            borderables: [],
            fontEditable: undefined,
            fontSizeable: undefined
          }),
          mapToEditPanelValues: (config) => new Map([
            ['business_name', config.business_name || defaultConfig.business_name]
          ])
        });
      }
      
      // Initialize Data SDK
      if (window.dataSdk) {
        const result = await window.dataSdk.init({
          onDataChanged: (data) => {
            processData(data);
            updateAllDisplays();
          }
        });
        
        if (!result.isOk) {
          console.error('Failed to initialize Data SDK');
        }
      }
      
      // Load saved settings from localStorage
      loadLocalSettings();
    }
    
    function loadLocalSettings() {
      const savedSettings = localStorage.getItem('worxink_settings');
      if (savedSettings) {
        settings = { ...settings, ...JSON.parse(savedSettings) };
      }
      
      const savedCredentials = localStorage.getItem('worxink_credentials');
      if (savedCredentials) {
        credentials = { ...credentials, ...JSON.parse(savedCredentials) };
      }
      
      updateBusinessNameDisplays();
    }
    
    function saveLocalSettings() {
      localStorage.setItem('worxink_settings', JSON.stringify(settings));
      localStorage.setItem('worxink_credentials', JSON.stringify(credentials));
    }
    
    function updateBusinessNameDisplays() {
      const elements = ['loginBusinessName', 'sidebarBusinessName', 'dashboardTitle'];
      elements.forEach(id => {
        const el = document.getElementById(id);
        if (el) {
          if (id === 'sidebarBusinessName') {
            el.textContent = settings.businessName.split(' ')[0];
          } else {
            el.textContent = settings.businessName;
          }
        }
      });
    }
    
    function processData(data) {
      appData.sales = data.filter(d => d.record_type === 'sale');
      appData.expenses = data.filter(d => d.record_type === 'expense');
      appData.capital = data.filter(d => d.record_type === 'capital');
      appData.inventory = data.filter(d => d.record_type === 'inventory');
      appData.settings = data.filter(d => d.record_type === 'setting');
      
      // Load settings from data
      appData.settings.forEach(s => {
        if (s.setting_key === 'invoiceCounter') {
          invoiceCounter = parseInt(s.setting_value) || 1000;
        }
      });
    }
    
    // Authentication Functions
    function handleLogin() {
      const username = document.getElementById('loginUsername').value.toLowerCase().trim();
      const password = document.getElementById('loginPassword').value;
      const errorDiv = document.getElementById('loginError');
      
      if (!username || !password) {
        errorDiv.textContent = 'Please enter both username and password';
        errorDiv.classList.remove('hidden');
        return;
      }
      
      if (credentials[username] && credentials[username].password === password) {
        currentUser = {
          username: username,
          name: username.charAt(0).toUpperCase() + username.slice(1),
          role: credentials[username].role
        };
        
        errorDiv.classList.add('hidden');
        document.getElementById('loginScreen').classList.add('hidden');
        document.getElementById('mainApp').classList.remove('hidden');
        
        // Update user display
        document.getElementById('currentUserName').textContent = currentUser.name;
        document.getElementById('currentUserRole').textContent = currentUser.role;
        document.getElementById('userAvatar').textContent = currentUser.name.charAt(0);
        
        // Show/hide settings based on role
        const settingsBtn = document.getElementById('settingsNavBtn');
        if (currentUser.role !== 'Admin') {
          settingsBtn.classList.add('hidden');
        } else {
          settingsBtn.classList.remove('hidden');
        }
        
        showPage('dashboard');
        showToast('Welcome back, ' + currentUser.name + '!', 'success');
      } else {
        errorDiv.textContent = 'Invalid username or password';
        errorDiv.classList.remove('hidden');
      }
    }
    
    function handleLogout() {
      currentUser = null;
      document.getElementById('mainApp').classList.add('hidden');
      document.getElementById('loginScreen').classList.remove('hidden');
      document.getElementById('loginUsername').value = '';
      document.getElementById('loginPassword').value = '';
      showToast('Logged out successfully', 'info');
    }
    
    // Navigation
    function showPage(pageName) {
      // Restrict settings to admin
      if (pageName === 'settings' && currentUser?.role !== 'Admin') {
        showToast('Access denied. Admin only.', 'error');
        return;
      }
      
      // Hide all pages
      document.querySelectorAll('.page').forEach(p => p.classList.add('hidden'));
      
      // Show selected page
      const page = document.getElementById('page-' + pageName);
      if (page) {
        page.classList.remove('hidden');
        page.classList.add('animate-fadeIn');
      }
      
      // Update nav
      document.querySelectorAll('.nav-item').forEach(item => {
        item.classList.remove('active');
        if (item.dataset.page === pageName) {
          item.classList.add('active');
        }
      });
      
      // Update charts if showing charts page
      if (pageName === 'charts') {
        setTimeout(updateCharts, 100);
      }
      
      // Update displays
      updateAllDisplays();
    }
    
    // Currency Formatter
    function formatCurrency(amount) {
      return '₱' + (amount || 0).toLocaleString('en-PH', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
    }
    
    // Toast Notifications
    function showToast(message, type = 'info') {
      const container = document.getElementById('toastContainer');
      const toast = document.createElement('div');
      
      const colors = {
        success: 'bg-green-500',
        error: 'bg-red-500',
        info: 'bg-blue-500',
        warning: 'bg-amber-500'
      };
      
      toast.className = `toast ${colors[type]} text-white px-4 py-3 rounded-lg shadow-lg flex items-center gap-2`;
      toast.innerHTML = `
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          ${type === 'success' ? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>' : 
            type === 'error' ? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>' :
            '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>'}
        </svg>
        <span>${message}</span>
      `;
      
      container.appendChild(toast);
      setTimeout(() => toast.remove(), 3000);
    }
    
    // Modal Functions
    function openModal(content) {
      document.getElementById('modalContent').innerHTML = content;
      document.getElementById('modalContainer').classList.remove('hidden');
    }
    
    function closeModal() {
      document.getElementById('modalContainer').classList.add('hidden');
      editingRecord = null;
    }
    
    function openDeleteModal(callback) {
      deleteCallback = callback;
      document.getElementById('deleteModal').classList.remove('hidden');
      document.getElementById('confirmDeleteBtn').onclick = async () => {
        document.getElementById('confirmDeleteBtn').disabled = true;
        document.getElementById('confirmDeleteBtn').textContent = 'Deleting...';
        await callback();
        closeDeleteModal();
      };
    }
    
    function closeDeleteModal() {
      document.getElementById('deleteModal').classList.add('hidden');
      document.getElementById('confirmDeleteBtn').disabled = false;
      document.getElementById('confirmDeleteBtn').textContent = 'Delete';
      deleteCallback = null;
    }
    
    // SALES FUNCTIONS
    function openSaleModal(record = null) {
      editingRecord = record;
      const isEdit = record !== null;
      
      openModal(`
        <div class="p-6">
          <h2 class="text-xl font-bold text-slate-800 mb-4">${isEdit ? 'Edit' : 'Add New'} Sale</h2>
          <form id="saleForm" class="space-y-4">
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Date</label>
                <input type="date" id="saleDate" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.date : new Date().toISOString().split('T')[0]}" required>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Month</label>
                <select id="saleMonth" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  ${months.map(m => `<option value="${m}" ${isEdit && record.month === m ? 'selected' : ''}>${m}</option>`).join('')}
                </select>
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Customer Name</label>
              <input type="text" id="saleCustomer" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.customer_name : ''}" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Print Type</label>
                <input type="text" id="salePrintType" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.print_type : ''}" placeholder="e.g., B&W, Color">
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Paper Type</label>
                <select id="salePaperType" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  <option value="Long" ${isEdit && record.paper_type === 'Long' ? 'selected' : ''}>Long</option>
                  <option value="Short" ${isEdit && record.paper_type === 'Short' ? 'selected' : ''}>Short</option>
                  <option value="A4" ${isEdit && record.paper_type === 'A4' ? 'selected' : ''}>A4</option>
                </select>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Quantity (Pages)</label>
                <input type="number" id="saleQuantity" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.quantity : ''}" min="1" required>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Price per Page (₱)</label>
                <input type="number" id="salePrice" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.price_per_page : settings.defaultPricePerPage}" step="0.5" min="0" required>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Payment Method</label>
                <select id="salePayment" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  <option value="Cash" ${isEdit && record.payment_method === 'Cash' ? 'selected' : ''}>Cash</option>
                  <option value="GCash" ${isEdit && record.payment_method === 'GCash' ? 'selected' : ''}>GCash</option>
                  <option value="Bank Transfer" ${isEdit && record.payment_method === 'Bank Transfer' ? 'selected' : ''}>Bank Transfer</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Handled By</label>
                <select id="saleHandledBy" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  <option value="Krisha" ${isEdit && record.handled_by === 'Krisha' ? 'selected' : ''}>Krisha</option>
                  <option value="Vanessa" ${isEdit && record.handled_by === 'Vanessa' ? 'selected' : ''}>Vanessa</option>
                </select>
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Remarks</label>
              <textarea id="saleRemarks" class="w-full px-3 py-2 border border-slate-300 rounded-lg" rows="2">${isEdit ? (record.remarks || '') : ''}</textarea>
            </div>
            <div class="flex gap-3 pt-4">
              <button type="button" onclick="closeModal()" class="flex-1 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300">Cancel</button>
              <button type="submit" id="saveSaleBtn" class="flex-1 py-2 btn-primary text-white rounded-lg font-medium">${isEdit ? 'Update' : 'Save'} Sale</button>
            </div>
          </form>
        </div>
      `);
      
      document.getElementById('saleForm').onsubmit = (e) => {
        e.preventDefault();
        saveSale();
      };
      
      // Auto-select month based on date
      document.getElementById('saleDate').onchange = (e) => {
        const date = new Date(e.target.value);
        document.getElementById('saleMonth').value = months[date.getMonth()];
      };
    }
    
    async function saveSale() {
      const btn = document.getElementById('saveSaleBtn');
      btn.disabled = true;
      btn.textContent = 'Saving...';
      
      const quantity = parseFloat(document.getElementById('saleQuantity').value);
      const pricePerPage = parseFloat(document.getElementById('salePrice').value);
      
      const saleData = {
        record_type: 'sale',
        date: document.getElementById('saleDate').value,
        month: document.getElementById('saleMonth').value,
        invoice_number: editingRecord ? editingRecord.invoice_number : 'INV-' + (++invoiceCounter),
        customer_name: document.getElementById('saleCustomer').value,
        print_type: document.getElementById('salePrintType').value,
        paper_type: document.getElementById('salePaperType').value,
        quantity: quantity,
        price_per_page: pricePerPage,
        total_amount: quantity * pricePerPage,
        payment_method: document.getElementById('salePayment').value,
        handled_by: document.getElementById('saleHandledBy').value,
        remarks: document.getElementById('saleRemarks').value
      };
      
      try {
        if (editingRecord) {
          const result = await window.dataSdk.update({ ...editingRecord, ...saleData });
          if (result.isOk) {
            showToast('Sale updated successfully', 'success');
          } else {
            showToast('Failed to update sale', 'error');
          }
        } else {
          if (getTotalRecordCount() >= 999) {
            showToast('Maximum record limit reached (999)', 'error');
            btn.disabled = false;
            btn.textContent = 'Save Sale';
            return;
          }
          const result = await window.dataSdk.create(saleData);
          if (result.isOk) {
            showToast('Sale added successfully', 'success');
          } else {
            showToast('Failed to add sale', 'error');
          }
        }
        closeModal();
      } catch (err) {
        showToast('Error saving sale', 'error');
        btn.disabled = false;
        btn.textContent = editingRecord ? 'Update' : 'Save';
      }
    }
    
    async function deleteSale(record) {
      openDeleteModal(async () => {
        const result = await window.dataSdk.delete(record);
        if (result.isOk) {
          showToast('Sale deleted successfully', 'success');
        } else {
          showToast('Failed to delete sale', 'error');
        }
      });
    }
    
    // EXPENSES FUNCTIONS
    function openExpenseModal(record = null) {
      editingRecord = record;
      const isEdit = record !== null;
      
      openModal(`
        <div class="p-6">
          <h2 class="text-xl font-bold text-slate-800 mb-4">${isEdit ? 'Edit' : 'Add New'} Expense</h2>
          <form id="expenseForm" class="space-y-4">
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Date</label>
                <input type="date" id="expenseDate" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.date : new Date().toISOString().split('T')[0]}" required>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Month</label>
                <select id="expenseMonth" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  ${months.map(m => `<option value="${m}" ${isEdit && record.month === m ? 'selected' : ''}>${m}</option>`).join('')}
                </select>
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Supplier</label>
              <input type="text" id="expenseSupplier" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.supplier : ''}" required>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Item</label>
              <input type="text" id="expenseItem" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.item : ''}" required>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Quantity</label>
                <input type="number" id="expenseQuantity" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.quantity : ''}" min="1" required>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Unit Cost (₱)</label>
                <input type="number" id="expenseUnitCost" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.unit_cost : ''}" step="0.01" min="0" required>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Paid By</label>
                <select id="expensePaidBy" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  <option value="Krisha" ${isEdit && record.paid_by === 'Krisha' ? 'selected' : ''}>Krisha</option>
                  <option value="Vanessa" ${isEdit && record.paid_by === 'Vanessa' ? 'selected' : ''}>Vanessa</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Payment Method</label>
                <select id="expensePayment" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                  <option value="Cash" ${isEdit && record.payment_method === 'Cash' ? 'selected' : ''}>Cash</option>
                  <option value="GCash" ${isEdit && record.payment_method === 'GCash' ? 'selected' : ''}>GCash</option>
                  <option value="Bank Transfer" ${isEdit && record.payment_method === 'Bank Transfer' ? 'selected' : ''}>Bank Transfer</option>
                </select>
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Remarks</label>
              <textarea id="expenseRemarks" class="w-full px-3 py-2 border border-slate-300 rounded-lg" rows="2">${isEdit ? (record.remarks || '') : ''}</textarea>
            </div>
            <div class="flex gap-3 pt-4">
              <button type="button" onclick="closeModal()" class="flex-1 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300">Cancel</button>
              <button type="submit" id="saveExpenseBtn" class="flex-1 py-2 btn-primary text-white rounded-lg font-medium">${isEdit ? 'Update' : 'Save'} Expense</button>
            </div>
          </form>
        </div>
      `);
      
      document.getElementById('expenseForm').onsubmit = (e) => {
        e.preventDefault();
        saveExpense();
      };
      
      document.getElementById('expenseDate').onchange = (e) => {
        const date = new Date(e.target.value);
        document.getElementById('expenseMonth').value = months[date.getMonth()];
      };
    }
    
    async function saveExpense() {
      const btn = document.getElementById('saveExpenseBtn');
      btn.disabled = true;
      btn.textContent = 'Saving...';
      
      const quantity = parseFloat(document.getElementById('expenseQuantity').value);
      const unitCost = parseFloat(document.getElementById('expenseUnitCost').value);
      
      const expenseData = {
        record_type: 'expense',
        date: document.getElementById('expenseDate').value,
        month: document.getElementById('expenseMonth').value,
        supplier: document.getElementById('expenseSupplier').value,
        item: document.getElementById('expenseItem').value,
        quantity: quantity,
        unit_cost: unitCost,
        total_amount: quantity * unitCost,
        paid_by: document.getElementById('expensePaidBy').value,
        payment_method: document.getElementById('expensePayment').value,
        remarks: document.getElementById('expenseRemarks').value
      };
      
      try {
        if (editingRecord) {
          const result = await window.dataSdk.update({ ...editingRecord, ...expenseData });
          if (result.isOk) {
            showToast('Expense updated successfully', 'success');
          } else {
            showToast('Failed to update expense', 'error');
          }
        } else {
          if (getTotalRecordCount() >= 999) {
            showToast('Maximum record limit reached (999)', 'error');
            btn.disabled = false;
            btn.textContent = 'Save Expense';
            return;
          }
          const result = await window.dataSdk.create(expenseData);
          if (result.isOk) {
            showToast('Expense added successfully', 'success');
          } else {
            showToast('Failed to add expense', 'error');
          }
        }
        closeModal();
      } catch (err) {
        showToast('Error saving expense', 'error');
        btn.disabled = false;
        btn.textContent = editingRecord ? 'Update' : 'Save';
      }
    }
    
    async function deleteExpense(record) {
      openDeleteModal(async () => {
        const result = await window.dataSdk.delete(record);
        if (result.isOk) {
          showToast('Expense deleted successfully', 'success');
        } else {
          showToast('Failed to delete expense', 'error');
        }
      });
    }
    
    // CAPITAL FUNCTIONS
    function openCapitalModal(record = null) {
      editingRecord = record;
      const isEdit = record !== null;
      
      openModal(`
        <div class="p-6">
          <h2 class="text-xl font-bold text-slate-800 mb-4">${isEdit ? 'Edit' : 'Add'} Capital Transaction</h2>
          <form id="capitalForm" class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Date</label>
              <input type="date" id="capitalDate" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? record.date : new Date().toISOString().split('T')[0]}" required>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Owner</label>
              <select id="capitalOwner" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                <option value="Krisha" ${isEdit && record.owner === 'Krisha' ? 'selected' : ''}>Krisha</option>
                <option value="Vanessa" ${isEdit && record.owner === 'Vanessa' ? 'selected' : ''}>Vanessa</option>
              </select>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Capital In (₱)</label>
                <input type="number" id="capitalIn" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? (record.capital_in || 0) : 0}" step="0.01" min="0">
              </div>
              <div>
                <label class="block text-sm font-medium text-slate-600 mb-1">Withdrawal (₱)</label>
                <input type="number" id="capitalWithdrawal" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="${isEdit ? (record.withdrawal || 0) : 0}" step="0.01" min="0">
              </div>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Remarks</label>
              <textarea id="capitalRemarks" class="w-full px-3 py-2 border border-slate-300 rounded-lg" rows="2">${isEdit ? (record.remarks || '') : ''}</textarea>
            </div>
            <div class="flex gap-3 pt-4">
              <button type="button" onclick="closeModal()" class="flex-1 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300">Cancel</button>
              <button type="submit" id="saveCapitalBtn" class="flex-1 py-2 btn-primary text-white rounded-lg font-medium">${isEdit ? 'Update' : 'Save'}</button>
            </div>
          </form>
        </div>
      `);
      
      document.getElementById('capitalForm').onsubmit = (e) => {
        e.preventDefault();
        saveCapital();
      };
    }
    
    async function saveCapital() {
      const btn = document.getElementById('saveCapitalBtn');
      btn.disabled = true;
      btn.textContent = 'Saving...';
      
      const capitalIn = parseFloat(document.getElementById('capitalIn').value) || 0;
      const withdrawal = parseFloat(document.getElementById('capitalWithdrawal').value) || 0;
      
      const capitalData = {
        record_type: 'capital',
        date: document.getElementById('capitalDate').value,
        owner: document.getElementById('capitalOwner').value,
        capital_in: capitalIn,
        withdrawal: withdrawal,
        remarks: document.getElementById('capitalRemarks').value
      };
      
      try {
        if (editingRecord) {
          const result = await window.dataSdk.update({ ...editingRecord, ...capitalData });
          if (result.isOk) {
            showToast('Transaction updated successfully', 'success');
          } else {
            showToast('Failed to update transaction', 'error');
          }
        } else {
          if (getTotalRecordCount() >= 999) {
            showToast('Maximum record limit reached (999)', 'error');
            btn.disabled = false;
            btn.textContent = 'Save';
            return;
          }
          const result = await window.dataSdk.create(capitalData);
          if (result.isOk) {
            showToast('Transaction added successfully', 'success');
          } else {
            showToast('Failed to add transaction', 'error');
          }
        }
        closeModal();
      } catch (err) {
        showToast('Error saving transaction', 'error');
        btn.disabled = false;
        btn.textContent = editingRecord ? 'Update' : 'Save';
      }
    }
    
    async function deleteCapital(record) {
      openDeleteModal(async () => {
        const result = await window.dataSdk.delete(record);
        if (result.isOk) {
          showToast('Transaction deleted successfully', 'success');
        } else {
          showToast('Failed to delete transaction', 'error');
        }
      });
    }
    
    // INVENTORY FUNCTIONS
    function openInventoryModal() {
      const longInv = appData.inventory.find(i => i.paper_type === 'Long') || { paper_long_reams: 0 };
      const shortInv = appData.inventory.find(i => i.paper_type === 'Short') || { paper_short_reams: 0 };
      const a4Inv = appData.inventory.find(i => i.paper_type === 'A4') || { paper_a4_reams: 0 };
      
      openModal(`
        <div class="p-6">
          <h2 class="text-xl font-bold text-slate-800 mb-4">Update Inventory Stock</h2>
          <form id="inventoryForm" class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Paper Type</label>
              <select id="invPaperType" class="w-full px-3 py-2 border border-slate-300 rounded-lg" required>
                <option value="Long">Long Bond Paper</option>
                <option value="Short">Short Bond Paper</option>
                <option value="A4">A4 Paper</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-slate-600 mb-1">Add Reams Purchased</label>
              <input type="number" id="invReams" class="w-full px-3 py-2 border border-slate-300 rounded-lg" value="0" min="0" required>
            </div>
            <p class="text-sm text-slate-500">Note: 1 ream = 500 pages. This will add to your current stock.</p>
            <div class="flex gap-3 pt-4">
              <button type="button" onclick="closeModal()" class="flex-1 py-2 bg-slate-200 text-slate-700 rounded-lg font-medium hover:bg-slate-300">Cancel</button>
              <button type="submit" id="saveInventoryBtn" class="flex-1 py-2 btn-primary text-white rounded-lg font-medium">Update Stock</button>
            </div>
          </form>
        </div>
      `);
      
      document.getElementById('inventoryForm').onsubmit = (e) => {
        e.preventDefault();
        saveInventory();
      };
    }
    
    async function saveInventory() {
      const btn = document.getElementById('saveInventoryBtn');
      btn.disabled = true;
      btn.textContent = 'Saving...';
      
      const paperType = document.getElementById('invPaperType').value;
      const reamsToAdd = parseFloat(document.getElementById('invReams').value) || 0;
      
      const existingInv = appData.inventory.find(i => i.paper_type === paperType);
      
      const inventoryData = {
        record_type: 'inventory',
        paper_type: paperType,
        date: new Date().toISOString().split('T')[0]
      };
      
      if (paperType === 'Long') {
        inventoryData.paper_long_reams = (existingInv?.paper_long_reams || 0) + reamsToAdd;
      } else if (paperType === 'Short') {
        inventoryData.paper_short_reams = (existingInv?.paper_short_reams || 0) + reamsToAdd;
      } else {
        inventoryData.paper_a4_reams = (existingInv?.paper_a4_reams || 0) + reamsToAdd;
      }
      
      try {
        if (existingInv) {
          const result = await window.dataSdk.update({ ...existingInv, ...inventoryData });
          if (result.isOk) {
            showToast('Inventory updated successfully', 'success');
          } else {
            showToast('Failed to update inventory', 'error');
          }
        } else {
          if (getTotalRecordCount() >= 999) {
            showToast('Maximum record limit reached (999)', 'error');
            btn.disabled = false;
            btn.textContent = 'Update Stock';
            return;
          }
          const result = await window.dataSdk.create(inventoryData);
          if (result.isOk) {
            showToast('Inventory added successfully', 'success');
          } else {
            showToast('Failed to add inventory', 'error');
          }
        }
        closeModal();
      } catch (err) {
        showToast('Error saving inventory', 'error');
        btn.disabled = false;
        btn.textContent = 'Update Stock';
      }
    }
    
    // SETTINGS FUNCTIONS
    function toggleCustomSplit() {
      const toggle = document.getElementById('customSplitToggle');
      const inputs = document.getElementById('customSplitInputs');
      
      if (toggle.checked) {
        inputs.classList.remove('hidden');
      } else {
        inputs.classList.add('hidden');
      }
      
      document.getElementById('krishaPercentage').oninput = (e) => {
        const krishaPct = parseFloat(e.target.value) || 0;
        document.getElementById('vanessaPercentage').value = 100 - krishaPct;
      };
    }
    
    function saveBusinessSettings() {
      settings.businessName = document.getElementById('settingsBusinessName').value;
      settings.defaultPricePerPage = parseFloat(document.getElementById('settingsDefaultPrice').value) || 2;
      saveLocalSettings();
      updateBusinessNameDisplays();
      
      if (window.elementSdk) {
        window.elementSdk.setConfig({ business_name: settings.businessName });
      }
      
      showToast('Business settings saved', 'success');
    }
    
    function saveSplitSettings() {
      settings.useCustomSplit = document.getElementById('customSplitToggle').checked;
      settings.krishaPercentage = parseFloat(document.getElementById('krishaPercentage').value) || 50;
      settings.vanessaPercentage = 100 - settings.krishaPercentage;
      saveLocalSettings();
      updateAllDisplays();
      showToast('Profit split settings saved', 'success');
    }
    
    function changePassword() {
      const current = document.getElementById('currentPassword').value;
      const newPass = document.getElementById('newPassword').value;
      const confirm = document.getElementById('confirmPassword').value;
      
      if (current !== credentials.krisha.password) {
        showToast('Current password is incorrect', 'error');
        return;
      }
      
      if (newPass !== confirm) {
        showToast('New passwords do not match', 'error');
        return;
      }
      
      if (newPass.length < 6) {
        showToast('Password must be at least 6 characters', 'error');
        return;
      }
      
      credentials.krisha.password = newPass;
      saveLocalSettings();
      
      document.getElementById('currentPassword').value = '';
      document.getElementById('newPassword').value = '';
      document.getElementById('confirmPassword').value = '';
      
      showToast('Admin password changed successfully', 'success');
    }
    
    function changeVanessaPassword() {
      const newPass = document.getElementById('vanessaNewPassword').value;
      const confirm = document.getElementById('vanessaConfirmPassword').value;
      
      if (newPass !== confirm) {
        showToast('Passwords do not match', 'error');
        return;
      }
      
      if (newPass.length < 6) {
        showToast('Password must be at least 6 characters', 'error');
        return;
      }
      
      credentials.vanessa.password = newPass;
      saveLocalSettings();
      
      document.getElementById('vanessaNewPassword').value = '';
      document.getElementById('vanessaConfirmPassword').value = '';
      
      showToast('Co-owner password changed successfully', 'success');
    }
    
    // UTILITY FUNCTIONS
    function getTotalRecordCount() {
      return appData.sales.length + appData.expenses.length + appData.capital.length + appData.inventory.length + appData.settings.length;
    }
    
    // UPDATE DISPLAY FUNCTIONS
    function updateAllDisplays() {
      updateSalesTable();
      updateExpensesTable();
      updateCapitalTable();
      updateInventoryDisplay();
      updateMonthlySummary();
      updateDashboard();
      updateEquityDisplay();
      updateSettingsDisplay();
    }
    
    function updateSalesTable() {
      const tbody = document.getElementById('salesTableBody');
      if (!tbody) return;
      
      if (appData.sales.length === 0) {
        tbody.innerHTML = '<tr><td colspan="11" class="px-4 py-8 text-center text-slate-400">No sales recorded yet</td></tr>';
        return;
      }
      
      tbody.innerHTML = appData.sales.sort((a, b) => new Date(b.date) - new Date(a.date)).map(sale => `
        <tr class="table-row">
          <td class="px-4 py-3 text-sm">${sale.date}</td>
          <td class="px-4 py-3 text-sm font-mono text-amber-600">${sale.invoice_number}</td>
          <td class="px-4 py-3 text-sm font-medium">${sale.customer_name}</td>
          <td class="px-4 py-3 text-sm">${sale.print_type || '-'}</td>
          <td class="px-4 py-3 text-sm">${sale.paper_type}</td>
          <td class="px-4 py-3 text-sm">${sale.quantity}</td>
          <td class="px-4 py-3 text-sm">${formatCurrency(sale.price_per_page)}</td>
          <td class="px-4 py-3 text-sm font-semibold text-green-600">${formatCurrency(sale.total_amount)}</td>
          <td class="px-4 py-3 text-sm"><span class="px-2 py-1 rounded-full text-xs ${sale.payment_method === 'Cash' ? 'bg-green-100 text-green-700' : sale.payment_method === 'GCash' ? 'bg-blue-100 text-blue-700' : 'bg-purple-100 text-purple-700'}">${sale.payment_method}</span></td>
          <td class="px-4 py-3 text-sm">${sale.handled_by}</td>
          <td class="px-4 py-3">
            <div class="flex gap-1">
              <button onclick='openSaleModal(${JSON.stringify(sale).replace(/'/g, "&#39;")})' class="p-1.5 text-blue-600 hover:bg-blue-50 rounded" title="Edit">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
              </button>
              <button onclick='deleteSale(${JSON.stringify(sale).replace(/'/g, "&#39;")})' class="p-1.5 text-red-600 hover:bg-red-50 rounded" title="Delete">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
              </button>
            </div>
          </td>
        </tr>
      `).join('');
    }
    
    function updateExpensesTable() {
      const tbody = document.getElementById('expensesTableBody');
      if (!tbody) return;
      
      if (appData.expenses.length === 0) {
        tbody.innerHTML = '<tr><td colspan="10" class="px-4 py-8 text-center text-slate-400">No expenses recorded yet</td></tr>';
        return;
      }
      
      tbody.innerHTML = appData.expenses.sort((a, b) => new Date(b.date) - new Date(a.date)).map(expense => `
        <tr class="table-row">
          <td class="px-4 py-3 text-sm">${expense.date}</td>
          <td class="px-4 py-3 text-sm">${expense.month}</td>
          <td class="px-4 py-3 text-sm font-medium">${expense.supplier}</td>
          <td class="px-4 py-3 text-sm">${expense.item}</td>
          <td class="px-4 py-3 text-sm">${expense.quantity}</td>
          <td class="px-4 py-3 text-sm">${formatCurrency(expense.unit_cost)}</td>
          <td class="px-4 py-3 text-sm font-semibold text-red-600">${formatCurrency(expense.total_amount)}</td>
          <td class="px-4 py-3 text-sm">${expense.paid_by}</td>
          <td class="px-4 py-3 text-sm"><span class="px-2 py-1 rounded-full text-xs ${expense.payment_method === 'Cash' ? 'bg-green-100 text-green-700' : expense.payment_method === 'GCash' ? 'bg-blue-100 text-blue-700' : 'bg-purple-100 text-purple-700'}">${expense.payment_method}</span></td>
          <td class="px-4 py-3">
            <div class="flex gap-1">
              <button onclick='openExpenseModal(${JSON.stringify(expense).replace(/'/g, "&#39;")})' class="p-1.5 text-blue-600 hover:bg-blue-50 rounded" title="Edit">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
              </button>
              <button onclick='deleteExpense(${JSON.stringify(expense).replace(/'/g, "&#39;")})' class="p-1.5 text-red-600 hover:bg-red-50 rounded" title="Delete">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
              </button>
            </div>
          </td>
        </tr>
      `).join('');
    }
    
    function updateCapitalTable() {
      const tbody = document.getElementById('capitalTableBody');
      if (!tbody) return;
      
      // Calculate summaries
      const krishaData = appData.capital.filter(c => c.owner === 'Krisha');
      const vanessaData = appData.capital.filter(c => c.owner === 'Vanessa');
      
      const krishaCapitalIn = krishaData.reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const krishaWithdrawals = krishaData.reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      const vanessaCapitalIn = vanessaData.reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const vanessaWithdrawals = vanessaData.reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      
      document.getElementById('krishaTotalCapitalIn').textContent = formatCurrency(krishaCapitalIn);
      document.getElementById('krishaTotalWithdrawals').textContent = formatCurrency(krishaWithdrawals);
      document.getElementById('krishaNetBalance').textContent = formatCurrency(krishaCapitalIn - krishaWithdrawals);
      
      document.getElementById('vanessaTotalCapitalIn').textContent = formatCurrency(vanessaCapitalIn);
      document.getElementById('vanessaTotalWithdrawals').textContent = formatCurrency(vanessaWithdrawals);
      document.getElementById('vanessaNetBalance').textContent = formatCurrency(vanessaCapitalIn - vanessaWithdrawals);
      
      if (appData.capital.length === 0) {
        tbody.innerHTML = '<tr><td colspan="7" class="px-4 py-8 text-center text-slate-400">No capital transactions recorded yet</td></tr>';
        return;
      }
      
      tbody.innerHTML = appData.capital.sort((a, b) => new Date(b.date) - new Date(a.date)).map(cap => `
        <tr class="table-row">
          <td class="px-4 py-3 text-sm">${cap.date}</td>
          <td class="px-4 py-3 text-sm font-medium">${cap.owner}</td>
          <td class="px-4 py-3 text-sm text-green-600">${cap.capital_in ? formatCurrency(cap.capital_in) : '-'}</td>
          <td class="px-4 py-3 text-sm text-red-600">${cap.withdrawal ? formatCurrency(cap.withdrawal) : '-'}</td>
          <td class="px-4 py-3 text-sm font-semibold">${formatCurrency((cap.capital_in || 0) - (cap.withdrawal || 0))}</td>
          <td class="px-4 py-3 text-sm text-slate-500">${cap.remarks || '-'}</td>
          <td class="px-4 py-3">
            <div class="flex gap-1">
              <button onclick='openCapitalModal(${JSON.stringify(cap).replace(/'/g, "&#39;")})' class="p-1.5 text-blue-600 hover:bg-blue-50 rounded" title="Edit">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
              </button>
              <button onclick='deleteCapital(${JSON.stringify(cap).replace(/'/g, "&#39;")})' class="p-1.5 text-red-600 hover:bg-red-50 rounded" title="Delete">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
              </button>
            </div>
          </td>
        </tr>
      `).join('');
    }
    
    function updateInventoryDisplay() {
      // Calculate pages used from sales
      const longUsed = appData.sales.filter(s => s.paper_type === 'Long').reduce((sum, s) => sum + (s.quantity || 0), 0);
      const shortUsed = appData.sales.filter(s => s.paper_type === 'Short').reduce((sum, s) => sum + (s.quantity || 0), 0);
      const a4Used = appData.sales.filter(s => s.paper_type === 'A4').reduce((sum, s) => sum + (s.quantity || 0), 0);
      
      // Get inventory records
      const longInv = appData.inventory.find(i => i.paper_type === 'Long');
      const shortInv = appData.inventory.find(i => i.paper_type === 'Short');
      const a4Inv = appData.inventory.find(i => i.paper_type === 'A4');
      
      const longReams = longInv?.paper_long_reams || 0;
      const shortReams = shortInv?.paper_short_reams || 0;
      const a4Reams = a4Inv?.paper_a4_reams || 0;
      
      // Calculate remaining
      const longTotalPages = longReams * 500;
      const shortTotalPages = shortReams * 500;
      const a4TotalPages = a4Reams * 500;
      
      const longRemainingPages = longTotalPages - longUsed;
      const shortRemainingPages = shortTotalPages - shortUsed;
      const a4RemainingPages = a4TotalPages - a4Used;
      
      // Update display
      document.getElementById('longBeginning').textContent = '0';
      document.getElementById('longPurchased').textContent = longReams;
      document.getElementById('longTotal').textContent = longReams;
      document.getElementById('longUsed').textContent = longUsed;
      document.getElementById('longRemaining').textContent = (longRemainingPages / 500).toFixed(1);
      document.getElementById('longRemainingPages').textContent = longRemainingPages;
      
      document.getElementById('shortBeginning').textContent = '0';
      document.getElementById('shortPurchased').textContent = shortReams;
      document.getElementById('shortTotal').textContent = shortReams;
      document.getElementById('shortUsed').textContent = shortUsed;
      document.getElementById('shortRemaining').textContent = (shortRemainingPages / 500).toFixed(1);
      document.getElementById('shortRemainingPages').textContent = shortRemainingPages;
      
      document.getElementById('a4Beginning').textContent = '0';
      document.getElementById('a4Purchased').textContent = a4Reams;
      document.getElementById('a4Total').textContent = a4Reams;
      document.getElementById('a4Used').textContent = a4Used;
      document.getElementById('a4Remaining').textContent = (a4RemainingPages / 500).toFixed(1);
      document.getElementById('a4RemainingPages').textContent = a4RemainingPages;
    }
    
    function updateMonthlySummary() {
      const tbody = document.getElementById('monthlySummaryBody');
      if (!tbody) return;
      
      const monthlySummary = months.map(month => {
        const monthSales = appData.sales.filter(s => s.month === month).reduce((sum, s) => sum + (s.total_amount || 0), 0);
        const monthExpenses = appData.expenses.filter(e => e.month === month).reduce((sum, e) => sum + (e.total_amount || 0), 0);
        return {
          month,
          sales: monthSales,
          expenses: monthExpenses,
          profit: monthSales - monthExpenses
        };
      });
      
      tbody.innerHTML = monthlySummary.map(m => `
        <tr class="table-row">
          <td class="px-4 py-3 text-sm font-medium">${m.month}</td>
          <td class="px-4 py-3 text-sm text-green-600">${formatCurrency(m.sales)}</td>
          <td class="px-4 py-3 text-sm text-red-600">${formatCurrency(m.expenses)}</td>
          <td class="px-4 py-3 text-sm font-semibold ${m.profit >= 0 ? 'text-blue-600' : 'text-red-600'}">${formatCurrency(m.profit)}</td>
        </tr>
      `).join('');
    }
    
    function updateDashboard() {
      // Calculate totals
      const totalSales = appData.sales.reduce((sum, s) => sum + (s.total_amount || 0), 0);
      const totalExpenses = appData.expenses.reduce((sum, e) => sum + (e.total_amount || 0), 0);
      const netProfit = totalSales - totalExpenses;
      
      const totalWithdrawals = appData.capital.reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      const netAfterWithdrawals = netProfit - totalWithdrawals;
      
      // Payment method breakdown
      const cashSales = appData.sales.filter(s => s.payment_method === 'Cash').reduce((sum, s) => sum + (s.total_amount || 0), 0);
      const gcashSales = appData.sales.filter(s => s.payment_method === 'GCash').reduce((sum, s) => sum + (s.total_amount || 0), 0);
      const bankSales = appData.sales.filter(s => s.payment_method === 'Bank Transfer').reduce((sum, s) => sum + (s.total_amount || 0), 0);
      
      // Capital by owner
      const krishaCapital = appData.capital.filter(c => c.owner === 'Krisha').reduce((sum, c) => sum + (c.capital_in || 0) - (c.withdrawal || 0), 0);
      const vanessaCapital = appData.capital.filter(c => c.owner === 'Vanessa').reduce((sum, c) => sum + (c.capital_in || 0) - (c.withdrawal || 0), 0);
      
      // Profit splits
      const krishaShare5050 = netProfit * 0.5;
      const vanessaShare5050 = netProfit * 0.5;
      const krishaShareCustom = netProfit * (settings.krishaPercentage / 100);
      const vanessaShareCustom = netProfit * (settings.vanessaPercentage / 100);
      
      // Equity calculations
      const krishaCapitalContributed = appData.capital.filter(c => c.owner === 'Krisha').reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const vanessaCapitalContributed = appData.capital.filter(c => c.owner === 'Vanessa').reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const krishaTotalWithdrawals = appData.capital.filter(c => c.owner === 'Krisha').reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      const vanessaTotalWithdrawals = appData.capital.filter(c => c.owner === 'Vanessa').reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      
      const krishaEquity = krishaCapitalContributed + (settings.useCustomSplit ? krishaShareCustom : krishaShare5050) - krishaTotalWithdrawals;
      const vanessaEquity = vanessaCapitalContributed + (settings.useCustomSplit ? vanessaShareCustom : vanessaShare5050) - vanessaTotalWithdrawals;
      
      // Update displays
      document.getElementById('totalSalesDisplay').textContent = formatCurrency(totalSales);
      document.getElementById('totalExpensesDisplay').textContent = formatCurrency(totalExpenses);
      document.getElementById('netProfitDisplay').textContent = formatCurrency(netProfit);
      document.getElementById('netAfterWithdrawalsDisplay').textContent = formatCurrency(netAfterWithdrawals);
      
      document.getElementById('cashSales').textContent = formatCurrency(cashSales);
      document.getElementById('gcashSales').textContent = formatCurrency(gcashSales);
      document.getElementById('bankSales').textContent = formatCurrency(bankSales);
      
      document.getElementById('krishaCapital').textContent = formatCurrency(krishaCapital);
      document.getElementById('vanessaCapital').textContent = formatCurrency(vanessaCapital);
      document.getElementById('totalCapital').textContent = formatCurrency(krishaCapital + vanessaCapital);
      
      document.getElementById('krishaEquity').textContent = formatCurrency(krishaEquity);
      document.getElementById('vanessaEquity').textContent = formatCurrency(vanessaEquity);
      document.getElementById('totalEquity').textContent = formatCurrency(krishaEquity + vanessaEquity);
      
      document.getElementById('krishaShare5050').textContent = formatCurrency(krishaShare5050);
      document.getElementById('vanessaShare5050').textContent = formatCurrency(vanessaShare5050);
      
      document.getElementById('krishaPercentDisplay').textContent = settings.krishaPercentage + '%';
      document.getElementById('vanessaPercentDisplay').textContent = settings.vanessaPercentage + '%';
      document.getElementById('krishaShareCustom').textContent = formatCurrency(krishaShareCustom);
      document.getElementById('vanessaShareCustom').textContent = formatCurrency(vanessaShareCustom);
    }
    
    function updateEquityDisplay() {
      const netProfit = appData.sales.reduce((sum, s) => sum + (s.total_amount || 0), 0) - 
                        appData.expenses.reduce((sum, e) => sum + (e.total_amount || 0), 0);
      
      const krishaCapitalContributed = appData.capital.filter(c => c.owner === 'Krisha').reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const vanessaCapitalContributed = appData.capital.filter(c => c.owner === 'Vanessa').reduce((sum, c) => sum + (c.capital_in || 0), 0);
      const krishaTotalWithdrawals = appData.capital.filter(c => c.owner === 'Krisha').reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      const vanessaTotalWithdrawals = appData.capital.filter(c => c.owner === 'Vanessa').reduce((sum, c) => sum + (c.withdrawal || 0), 0);
      
      const krishaProfitShare = settings.useCustomSplit ? netProfit * (settings.krishaPercentage / 100) : netProfit * 0.5;
      const vanessaProfitShare = settings.useCustomSplit ? netProfit * (settings.vanessaPercentage / 100) : netProfit * 0.5;
      
      const krishaTotalEquity = krishaCapitalContributed + krishaProfitShare - krishaTotalWithdrawals;
      const vanessaTotalEquity = vanessaCapitalContributed + vanessaProfitShare - vanessaTotalWithdrawals;
      
      document.getElementById('krishaCapitalContributed').textContent = formatCurrency(krishaCapitalContributed);
      document.getElementById('krishaProfitShare').textContent = formatCurrency(krishaProfitShare);
      document.getElementById('krishaTotalWithdrawalsEquity').textContent = formatCurrency(krishaTotalWithdrawals);
      document.getElementById('krishaTotalEquity').textContent = formatCurrency(krishaTotalEquity);
      
      document.getElementById('vanessaCapitalContributed').textContent = formatCurrency(vanessaCapitalContributed);
      document.getElementById('vanessaProfitShare').textContent = formatCurrency(vanessaProfitShare);
      document.getElementById('vanessaTotalWithdrawalsEquity').textContent = formatCurrency(vanessaTotalWithdrawals);
      document.getElementById('vanessaTotalEquity').textContent = formatCurrency(vanessaTotalEquity);
      
      document.getElementById('totalBusinessEquity').textContent = formatCurrency(krishaTotalEquity + vanessaTotalEquity);
    }
    
    function updateSettingsDisplay() {
      if (!document.getElementById('settingsBusinessName')) return;
      
      document.getElementById('settingsBusinessName').value = settings.businessName;
      document.getElementById('settingsDefaultPrice').value = settings.defaultPricePerPage;
      document.getElementById('customSplitToggle').checked = settings.useCustomSplit;
      document.getElementById('krishaPercentage').value = settings.krishaPercentage;
      document.getElementById('vanessaPercentage').value = settings.vanessaPercentage;
      
      if (settings.useCustomSplit) {
        document.getElementById('customSplitInputs').classList.remove('hidden');
      }
    }
    
    function updateCharts() {
      const ctx1 = document.getElementById('salesChart');
      const ctx2 = document.getElementById('profitChart');
      
      if (!ctx1 || !ctx2) return;
      
      const monthlyData = months.map(month => {
        const sales = appData.sales.filter(s => s.month === month).reduce((sum, s) => sum + (s.total_amount || 0), 0);
        const expenses = appData.expenses.filter(e => e.month === month).reduce((sum, e) => sum + (e.total_amount || 0), 0);
        return { month, sales, profit: sales - expenses };
      });
      
      // Destroy existing charts
      if (salesChart) salesChart.destroy();
      if (profitChart) profitChart.destroy();
      
      // Sales Chart
      salesChart = new Chart(ctx1, {
        type: 'line',
        data: {
          labels: monthlyData.map(d => d.month.substring(0, 3)),
          datasets: [{
            label: 'Monthly Sales',
            data: monthlyData.map(d => d.sales),
            borderColor: '#f59e0b',
            backgroundColor: 'rgba(245, 158, 11, 0.1)',
            fill: true,
            tension: 0.4
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: { display: false }
          },
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                callback: value => '₱' + value.toLocaleString()
              }
            }
          }
        }
      });
      
      // Profit Chart
      profitChart = new Chart(ctx2, {
        type: 'line',
        data: {
          labels: monthlyData.map(d => d.month.substring(0, 3)),
          datasets: [{
            label: 'Net Profit',
            data: monthlyData.map(d => d.profit),
            borderColor: '#3b82f6',
            backgroundColor: 'rgba(59, 130, 246, 0.1)',
            fill: true,
            tension: 0.4
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: { display: false }
          },
          scales: {
            y: {
              ticks: {
                callback: value => '₱' + value.toLocaleString()
              }
            }
          }
        }
      });
    }
    
    // Handle Enter key for login
    document.getElementById('loginPassword').addEventListener('keypress', (e) => {
      if (e.key === 'Enter') handleLogin();
    });
    document.getElementById('loginUsername').addEventListener('keypress', (e) => {
      if (e.key === 'Enter') document.getElementById('loginPassword').focus();
    });
    
    // Close modal on backdrop click
    document.getElementById('modalContainer').addEventListener('click', (e) => {
      if (e.target === document.getElementById('modalContainer')) closeModal();
    });
    
    // Initialize app
    initApp();
  </script>
 <script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'9d3f3caf30e3fe10',t:'MTc3MjEwNjc1NC4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
