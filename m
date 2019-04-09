From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warning
 for rotation right
Date: Tue, 9 Apr 2019 10:08:18 +0200
Message-ID: <f38907e5-82a4-1e9f-a3a4-b4e366dbb90b@rasmusvillemoes.dk>
References: <20190407125325.24440-1-vadimp@mellanox.com>
 <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, idosch@mellanox.com, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-leds@vger.kernel.org

On 09/04/2019 00.52, Andrew Morton wrote:
> (resend, cc Andrey)
> 
> On Sun,  7 Apr 2019 12:53:25 +0000 Vadim Pasternak <vadimp@mellanox.com> wrote:
> 
>> The warning is caused by call to rorXX(), if the second parameters of
>> this function "shift" is zero. In such case UBSAN reports the warning
>> for the next expression: (word << (XX - shift), where XX is
>> 64, 32, 16, 8 for respectively ror64, ror32, ror16, ror8.
>> Fix adds validation of this parameter - in case it's equal zero, no
>> need to rotate, just original "word" is to be returned to caller.
>>
>> The UBSAN undefined behavior warning has been reported for call to
>> ror32():
>> [   11.426543] UBSAN: Undefined behaviour in ./include/linux/bitops.h:93:33
>> [   11.434045] shift exponent 32 is too large for 32-bit type 'unsigned int'
> 
> hm, do we care?
> 
>> ...
>>
> 
>> --- a/include/linux/bitops.h
>> +++ b/include/linux/bitops.h
>> @@ -70,6 +70,9 @@ static inline __u64 rol64(__u64 word, unsigned int shift)
>>   */
>>  static inline __u64 ror64(__u64 word, unsigned int shift)
>>  {
>> +	if (!shift)
>> +		return word;
>> +
>>  	return (word >> shift) | (word << (64 - shift));
>>  }
> 
> Is there any known architecture or compiler for which UL<<64 doesn't
> reliably produce zero?  Is there any prospect that this will become a
> problem in the future?

There's a somewhat obscure platform called x86 which ignores anything
but the low 5 bits in %ecx for a shift instruction for a 32 bit shift
(and in 64 bit mode, the low 6 bits), so there the instruction foo << 64
would yield foo. Which is also ok in this case, of course, except for
the formal UB.

Now, there are other architectures that behave similarly, so one could do

u32 ror32(u32 x, unsigned s)
{
	return (x >> (s&31)) | (x << ((32-s)&31));
}

to make the shifts always well-defined and also work as expected for s
>= 32... if only gcc recognized that the masking is redundant, so that
its "that's a ror" pattern detection could kick in. Unfortunately, it
seems that the above generates

   0:   89 f1                   mov    %esi,%ecx
   2:   89 f8                   mov    %edi,%eax
   4:   f7 d9                   neg    %ecx
   6:   d3 e0                   shl    %cl,%eax
   8:   89 f1                   mov    %esi,%ecx
   a:   d3 ef                   shr    %cl,%edi
   c:   09 f8                   or     %edi,%eax
   e:   c3                      retq

while without the masking one gets

  10:   89 f8                   mov    %edi,%eax
  12:   89 f1                   mov    %esi,%ecx
  14:   d3 c8                   ror    %cl,%eax
  16:   c3                      retq


Rasmus
