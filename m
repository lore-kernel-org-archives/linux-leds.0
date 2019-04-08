From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warning
 for rotation right
Date: Mon, 8 Apr 2019 15:52:17 -0700
Message-ID: <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
References: <20190407125325.24440-1-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190407125325.24440-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, idosch@mellanox.com, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-leds@vger.kernel.org

(resend, cc Andrey)

On Sun,  7 Apr 2019 12:53:25 +0000 Vadim Pasternak <vadimp@mellanox.com> wrote:

> The warning is caused by call to rorXX(), if the second parameters of
> this function "shift" is zero. In such case UBSAN reports the warning
> for the next expression: (word << (XX - shift), where XX is
> 64, 32, 16, 8 for respectively ror64, ror32, ror16, ror8.
> Fix adds validation of this parameter - in case it's equal zero, no
> need to rotate, just original "word" is to be returned to caller.
> 
> The UBSAN undefined behavior warning has been reported for call to
> ror32():
> [   11.426543] UBSAN: Undefined behaviour in ./include/linux/bitops.h:93:33
> [   11.434045] shift exponent 32 is too large for 32-bit type 'unsigned int'

hm, do we care?

> ...
>

> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -70,6 +70,9 @@ static inline __u64 rol64(__u64 word, unsigned int shift)
>   */
>  static inline __u64 ror64(__u64 word, unsigned int shift)
>  {
> +	if (!shift)
> +		return word;
> +
>  	return (word >> shift) | (word << (64 - shift));
>  }

Is there any known architecture or compiler for which UL<<64 doesn't
reliably produce zero?  Is there any prospect that this will become a
problem in the future?
