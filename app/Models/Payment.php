<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    public const STATUS_PENDING = 'pending';
    public const STATUS_VERIFIED = 'verified';
    public const STATUS_REJECTED = 'rejected';

    protected $fillable = [
        'order_id',
        'method',
        'amount',
        'proof_image',
        'status',
        'verified_at',
    ];

    protected function casts(): array
    {
        return [
            'verified_at' => 'datetime',
            'amount' => 'integer',
        ];
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(
            Order::class,
            'order_id'
        );
    }
}