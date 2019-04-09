From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warning
 for rotation right
Date: Tue, 9 Apr 2019 10:57:32 +0200
Message-ID: <b631316b-74bc-7d19-c6a4-70b5459b44cc@rasmusvillemoes.dk>
References: <20190407125325.24440-1-vadimp@mellanox.com>
 <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
 <f38907e5-82a4-1e9f-a3a4-b4e366dbb90b@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f38907e5-82a4-1e9f-a3a4-b4e366dbb90b@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, idosch@mellanox.com, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-leds@vger.kernel.org

On 09/04/2019 10.08, Rasmus Villemoes wrote:

> one could do
> 
> u32 ror32(u32 x, unsigned s)
> {
> 	return (x >> (s&31)) | (x << ((32-s)&31));
> }
> 
> to make the shifts always well-defined and also work as expected for s
> >= 32... if only gcc recognized that the masking is redundant, so that
> its "that's a ror" pattern detection could kick in. Unfortunately, it
> seems that the above generates
> 
>    0:   89 f1                   mov    %esi,%ecx
>    2:   89 f8                   mov    %edi,%eax
>    4:   f7 d9                   neg    %ecx
>    6:   d3 e0                   shl    %cl,%eax
>    8:   89 f1                   mov    %esi,%ecx
>    a:   d3 ef                   shr    %cl,%edi
>    c:   09 f8                   or     %edi,%eax
>    e:   c3                      retq
> 
> while without the masking one gets
> 
>   10:   89 f8                   mov    %edi,%eax
>   12:   89 f1                   mov    %esi,%ecx
>   14:   d3 c8                   ror    %cl,%eax
>   16:   c3                      retq

Ah, but that's with an ancient gcc 7. With gcc 8, the above pattern is
recognized and generates good code, while eliminating UB. I was about to
file a gcc bug, but found
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82498 .

Rasmus
