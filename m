From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/6] leds: netdev trigger: use memcpy in
 device_name_store
Date: Wed, 27 Mar 2019 22:20:11 +0100
Message-ID: <21193aab-7880-d116-64e8-dd08afe5a47f@gmail.com>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-2-linux@rasmusvillemoes.dk>
 <987c3e60-edb3-44f0-be28-434c70bb8659@gmail.com>
 <d1fccd75-c48b-d585-1170-1c1b76e1e098@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1fccd75-c48b-d585-1170-1c1b76e1e098@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 3/27/19 4:26 PM, Rasmus Villemoes wrote:
> On 26/03/2019 20.53, Jacek Anaszewski wrote:
>> Hi Rasmus,
>>
>> Thank you for the patch.
>>
>> On 3/14/19 3:06 PM, Rasmus Villemoes wrote:
>>> If userspace doesn't end the input with a newline (which can easily
>>> happen if the write happens from a C program that does write(fd,
>>> iface, strlen(iface))), we may end up including garbage from a
>>> previous, longer value in the device_name. For example
>>>
>>> # cat device_name
>>>
>>> # printf 'eth12' > device_name
>>> # cat device_name
>>> eth12
>>> # printf 'eth3' > device_name
>>> # cat device_name
>>> eth32
>>>
>>
>> Added tag:
>>
>> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
>>
>> and applied to the fixes-for-5.1-rc3 branch.
>>
> 
> You're stripping lines beginning with #. This is the commit in -next:
> 
> 
> commit 09466021a80c926aa7de68e5162bdfea2a117483
> Author: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Date:   Thu Mar 14 15:06:14 2019 +0100
> 
>      leds: netdev trigger: use memcpy in device_name_store
> 
>      If userspace doesn't end the input with a newline (which can easily
>      happen if the write happens from a C program that does write(fd,
>      iface, strlen(iface))), we may end up including garbage from a
>      previous, longer value in the device_name. For example
> 
>      eth12
>      eth32
> 
> which is entirely useless and confusing. Please fix this before it
> actually hits mainline. And you may want to look into "git commit
> --cleanup" and/or "git config commit.cleanup" (scissors is much better
> than the default strip).

Thanks for the heads-up. I must admit I'm hitting into that for the
first time. After "git am" it was all OK, but it got screwed up after
"git rebase -i". And having "commit.cleanup = scissors" set globally all
the time is annoying if one extensively uses interactive rebase for
rewording commit messages. It entails the need for manual removal of
the whole stuff that appears then after actual commit message prepended
with "#" comment characters.

This is probably the reason why people use often other characters
for command prompt (see the other fix for ledtrig-netdev). Note that, 
while it is of no so great importance for mainline, when people cherry
pick such patch to their out-of-tree repositories and then rebase, they
hit into the same issue.

-- 
Best regards,
Jacek Anaszewski
