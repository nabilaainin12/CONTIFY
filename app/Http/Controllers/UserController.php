<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Payment;
use App\Models\ServicePackage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    // ================= PROFILE =================

    public function profile()
    {
        return response()->json([
            'success' => true,
            'data' => Auth::user()
        ]);
    }

    // ================= PACKAGES =================

    public function packages()
    {
        $packages = ServicePackage::where(
            'is_active',
            true
        )->orderBy('price', 'asc')->get();

        return response()->json([
            'success' => true,
            'data' => $packages
        ]);
    }

    // ================= CREATE ORDER =================

    public function createOrder(Request $request)
    {
        $data = $request->validate([
            'package_id'   => 'required|exists:packages,id',
            'title'        => 'required|string|max:255',
            'notes'        => 'nullable|string',
            'booking_date' => 'required|date'
        ]);

        $package = ServicePackage::findOrFail(
            $data['package_id']
        );

        $order = Order::create([
            'user_id' => 1, // sementara hardcode

            'package_id' => $package->id,
            'title' => $data['title'],
            'notes' => $data['notes'] ?? null,

            'booking_date' => $data['booking_date'],

            'platform' => '-',
            'content_size' => '-',
            'deadline_type' => 'normal',

            'order_code' => 'ORD-' . time(),

            'base_price' => $package->price,
            'additional_price' => 0,
            'discount' => 0,
            'total_price' => $package->price,

            'status' => Order::STATUS_PENDING,
            'priority' => 1,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pesanan berhasil dibuat',
            'data' => $order
        ], 201);
    }

    // ================= LIST ORDER =================

    public function myOrders()
    {
        $orders = Order::with([
            'package',
            'payment'
        ])
            ->where('user_id', 1)
            ->latest()
            ->get();

        return response()->json([
            'success' => true,
            'data' => $orders
        ]);
    }

    // ================= DETAIL ORDER =================

    public function showOrder(Order $order)
    {
        if ($order->user_id != 1) {
            return response()->json([
                'success' => false,
                'message' => 'Pesanan tidak ditemukan'
            ], 404);
        }

        $order->load([
            'package',
            'payment',
            'voucher',
            'productionTeam'
        ]);

        return response()->json([
            'success' => true,
            'data' => $order
        ]);
    }

    // ================= UPDATE ORDER =================

    public function updateOrder(
        Request $request,
        Order $order
    ) {

        if ($order->user_id != 1) {
            return response()->json([
                'success' => false,
                'message' => 'Pesanan tidak ditemukan'
            ], 404);
        }

        if ($order->status != Order::STATUS_PENDING) {
            return response()->json([
                'success' => false,
                'message' =>
                    'Pesanan tidak dapat diubah karena sudah diproses'
            ], 400);
        }

        $data = $request->validate([
            'title' => 'required|string|max:255',
            'notes' => 'nullable|string',
            'booking_date' => 'required|date'
        ]);

        $order->update([
            'title' => $data['title'],
            'notes' => $data['notes'] ?? null,
            'booking_date' => $data['booking_date']
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pesanan berhasil diupdate',
            'data' => $order->fresh()
        ]);
    }

    // ================= CANCEL ORDER =================

    public function cancelOrder(Order $order)
    {
        if ($order->user_id != 1) {
            return response()->json([
                'success' => false,
                'message' => 'Pesanan tidak ditemukan'
            ], 404);
        }

        if ($order->status == Order::STATUS_DONE) {
            return response()->json([
                'success' => false,
                'message' =>
                    'Pesanan yang sudah selesai tidak dapat dibatalkan'
            ], 400);
        }

        if ($order->status == Order::STATUS_CANCELLED) {
            return response()->json([
                'success' => false,
                'message' =>
                    'Pesanan sudah dibatalkan sebelumnya'
            ], 400);
        }

        $order->update([
            'status' => Order::STATUS_CANCELLED
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pesanan berhasil dibatalkan',
            'data' => $order->fresh()
        ]);
    }

    // ================= SHOW PAYMENT =================

    public function showPayment(Order $order)
    {
        $payment = Payment::where(
            'order_id',
            $order->id
        )->first();

        return response()->json([
            'success' => true,
            'data' => $payment
        ]);
    }

    // ================= CREATE PAYMENT =================

    public function createPayment(
        Request $request,
        Order $order
    ) {

        $request->validate([
            'method' => 'required|string'
        ]);

        $oldPayment = Payment::where(
            'order_id',
            $order->id
        )->first();

        if ($oldPayment) {
            return response()->json([
                'success' => false,
                'message' => 'Pembayaran sudah dibuat'
            ], 400);
        }

        $payment = Payment::create([
            'order_id' => $order->id,
            'method' => $request->method,
            'amount' => $order->total_price,
            'status' => 'pending'
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pembayaran berhasil dibuat',
            'data' => $payment
        ]);
    }

        public function uploadPaymentProof(
        Request $request,
        Payment $payment
    ) {
        dd('masuk controller');

        $request->validate([
            'proof_image' =>
                'required|image|mimes:jpg,jpeg,png|max:2048'
        ]);

        $path = $request->file('proof_image')
            ->store('payment_proofs', 'public');

        $payment->update([
            'proof_image' => $path
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Bukti pembayaran berhasil diupload',
            'data' => $payment
        ]);
    }
}