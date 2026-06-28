<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\View\View;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | WEB AUTHENTICATION (BLADE)
    |--------------------------------------------------------------------------
    */

    public function loginPage(): View|RedirectResponse
    {
        if (Auth::check()) {
            return $this->redirectByRole();
        }

        return view('auth.login');
    }

    public function registerPage(): View|RedirectResponse
    {
        if (Auth::check()) {
            return $this->redirectByRole();
        }

        return view('auth.register');
    }

    public function register(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'name' => [
                'required',
                'string',
                'max:100',
            ],

            'email' => [
                'required',
                'email',
                'max:150',
                'unique:users,email',
            ],

            'phone' => [
                'nullable',
                'string',
                'max:20',
            ],

            'password' => [
                'required',
                'confirmed',
                Password::min(8),
            ],
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => strtolower($data['email']),
            'phone' => $data['phone'] ?? null,
            'password' => Hash::make($data['password']),
            'role' => 'user',
            'is_active' => true,
        ]);

        Auth::login($user);

        $request->session()->regenerate();

        return redirect()
            ->route('user.home')
            ->with(
                'success',
                'Akun berhasil dibuat. Selamat datang di Contify.'
            );
    }

    public function login(Request $request): RedirectResponse
    {
        $credentials = $request->validate([
            'email' => [
                'required',
                'email',
            ],

            'password' => [
                'required',
                'string',
            ],
        ]);

        $remember = $request->boolean('remember');

        if (!Auth::attempt($credentials, $remember)) {
            return back()
                ->withInput($request->only('email'))
                ->with(
                    'error',
                    'Email atau password salah.'
                );
        }

        $request->session()->regenerate();

        $user = Auth::user();

        if (!$user->is_active) {
            Auth::logout();

            $request->session()->invalidate();
            $request->session()->regenerateToken();

            return redirect()
                ->route('login')
                ->withInput($request->only('email'))
                ->with(
                    'error',
                    'Akun kamu sedang dinonaktifkan. Hubungi admin Contify.'
                );
        }

        return $this->redirectByRole();
    }

    public function logout(Request $request): RedirectResponse
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()
            ->route('login')
            ->with(
                'success',
                'Kamu berhasil logout.'
            );
    }

    /*
    |--------------------------------------------------------------------------
    | API AUTHENTICATION
    |--------------------------------------------------------------------------
    */

    public function apiRegister(Request $request): JsonResponse
    {
        $data = $request->validate([
            'name' => 'required|string|max:100',

            'email' => 'required|email|max:150|unique:users,email',

            'phone' => 'nullable|string|max:20',

            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => strtolower($data['email']),
            'phone' => $data['phone'] ?? null,
            'password' => Hash::make($data['password']),
            'role' => 'user',
            'is_active' => true,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Registrasi berhasil',
            'data' => $user
        ], 201);
    }

    public function apiLogin(Request $request): JsonResponse
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'success' => false,
                'message' => 'Email atau password salah'
            ], 401);
        }

        $user = Auth::user();

        if (!$user->is_active) {
            Auth::logout();

            return response()->json([
                'success' => false,
                'message' => 'Akun dinonaktifkan'
            ], 403);
        }

        return response()->json([
            'success' => true,
            'message' => 'Login berhasil',
            'data' => $user
        ]);
    }

    /*
    |--------------------------------------------------------------------------
    | HELPER
    |--------------------------------------------------------------------------
    */

    private function redirectByRole(): RedirectResponse
    {
        $user = Auth::user();

        if ($user->role === 'admin') {
            return redirect()->route('admin.dashboard');
        }

        if ($user->role === 'user') {
            return redirect()->route('user.home');
        }

        Auth::logout();

        return redirect()
            ->route('login')
            ->with(
                'error',
                'Role akun tidak dikenali.'
            );
    }
}