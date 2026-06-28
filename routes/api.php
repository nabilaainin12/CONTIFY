<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;

// ======================================================
// AUTH API
// ======================================================

Route::post('/login', [AuthController::class, 'apiLogin']);
Route::post('/register', [AuthController::class, 'apiRegister']);


// ======================================================
// USER API
// ======================================================

// Profile User
Route::get('/profile', [UserController::class, 'profile']);

// Package
Route::get('/packages', [UserController::class, 'packages']);

// Order
Route::post('/orders', [UserController::class, 'createOrder']);
Route::get('/orders', [UserController::class, 'myOrders']);
Route::get('/orders/{order}', [UserController::class, 'showOrder']);
Route::put('/orders/{order}', [UserController::class, 'updateOrder']);
Route::put('/orders/{order}/cancel', [UserController::class, 'cancelOrder']);


// ======================================================
// PAYMENT API
// ======================================================

// Menampilkan pembayaran berdasarkan order
Route::get('/orders/{order}/payment', [
    UserController::class,
    'showPayment'
]);

// Membuat pembayaran
Route::post('/orders/{order}/payment', [
    UserController::class,
    'createPayment'
]);

// Upload bukti pembayaran
Route::post('/payments/{payment}/upload-proof', [
    UserController::class,
    'uploadPaymentProof'
]);


// ======================================================
// ADMIN API
// ======================================================

// Dashboard
Route::get('/admin/dashboard', [
    AdminController::class,
    'apiDashboard'
]);

// Order
Route::get('/admin/orders', [
    AdminController::class,
    'apiOrders'
]);

Route::get('/admin/orders/{order}', [
    AdminController::class,
    'apiShowOrder'
]);

Route::put('/admin/orders/{order}/status', [
    AdminController::class,
    'apiUpdateOrderStatus'
]);

// Payment
Route::get('/admin/payments', [
    AdminController::class,
    'apiPayments'
]);

Route::put('/admin/payments/{payment}/verify', [
    AdminController::class,
    'verifyPayment'
]);

Route::put('/admin/payments/{payment}/reject', [
    AdminController::class,
    'rejectPayment'
]);

// Package
Route::get('/admin/packages', [
    AdminController::class,
    'apiPackages'
]);

// Customer
Route::get('/admin/customers', [
    AdminController::class,
    'apiCustomers'
]);

// Team Produksi
Route::get('/admin/teams', [
    AdminController::class,
    'apiTeams'
]);

// Voucher
Route::get('/admin/vouchers', [
    AdminController::class,
    'apiVouchers'
]);

// Quota
Route::get('/admin/quotas', [
    AdminController::class,
    'apiQuotas'
]);