From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 1/6] leds: netdev trigger: use memcpy in
 device_name_store
Date: Wed, 27 Mar 2019 16:26:27 +0100
Message-ID: <d1fccd75-c48b-d585-1170-1c1b76e1e098@rasmusvillemoes.dk>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-2-linux@rasmusvillemoes.dk>
 <987c3e60-edb3-44f0-be28-434c70bb8659@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <987c3e60-edb3-44f0-be28-434c70bb8659@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 26/03/2019 20.53, Jacek Anaszewski wrote:
> Hi Rasmus,
> 
> Thank you for the patch.
> 
> On 3/14/19 3:06 PM, Rasmus Villemoes wrote:
>> If userspace doesn't end the input with a newline (which can easily
>> happen if the write happens from a C program that does write(fd,
>> iface, strlen(iface))), we may end up including garbage from a
>> previous, longer value in the device_name. For example
>>
>> # cat device_name
>>
>> # printf 'eth12' > device_name
>> # cat device_name
>> eth12
>> # printf 'eth3' > device_name
>> # cat device_name
>> eth32
>>
> 
> Added tag:
> 
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> 
> and applied to the fixes-for-5.1-rc3 branch.
> 

You're stripping lines beginning with #. This is the commit in -next:


commit 09466021a80c926aa7de68e5162bdfea2a117483
Author: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date:   Thu Mar 14 15:06:14 2019 +0100

    leds: netdev trigger: use memcpy in device_name_store

    If userspace doesn't end the input with a newline (which can easily
    happen if the write happens from a C program that does write(fd,
    iface, strlen(iface))), we may end up including garbage from a
    previous, longer value in the device_name. For example

    eth12
    eth32

which is entirely useless and confusing. Please fix this before it
actually hits mainline. And you may want to look into "git commit
--cleanup" and/or "git config commit.cleanup" (scissors is much better
than the default strip).

Rasmus
