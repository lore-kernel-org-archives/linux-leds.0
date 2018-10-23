From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Tue, 23 Oct 2018 22:31:19 +0200
Message-ID: <1570e79b-3ea4-b389-72c8-1d595a46f380@gmail.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
 <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On 10/23/2018 09:23 PM, Joe Perches wrote:
> On Tue, 2018-10-23 at 20:50 +0200, Jacek Anaszewski wrote:
>>> diff --git a/drivers/leds/leds-upboard.c b/drivers/leds/leds-upboard.c
>>> new file mode 100644
>>> index 0000000..34a6973
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-upboard.c
>>> @@ -0,0 +1,104 @@
> []
>>> +#include <linux/kernel.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/mfd/upboard.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/acpi.h>
>>
>> The last include should go first to keep alphabetical order.
> 
> There is no accepted single kernel style for #include
> file ordering.

Well, I myself have been asked several times for sorting
includes, that's why I keep requiring it for the LED subsystem too.

When it's by the occasion of a new driver submission, it costs
virtually nothing. And it allows for avoiding any prospective
noise on the list due to the submissions like "Order includes".

As a first shot the following returns 77:

git log | grep -i "include.*alphabetical" | wc -l

Aside of that, in case of this particular patch the intention seemingly
was to have includes ordered lexicographically, since only the last
item didn't fit for this pattern.

> drivers/leds does not use a single style nor is this
> particular variant documented anywhere to my knowledge.

Unspecified kind of includes sorting is mentioned in the
Documentation/process/coding-style.rst, line 637.

> Until such a time when either a local preferred style
> document or a treewide preferred style exists, please
> stop asking people to modify #include ordering for
> various styles like reverse christmas tree by length,
> alphabetic ordering, or other individual style
> My preferred style would always have kernel.h first
> as that may help with precompiled headers and overall
> kernel compilation time one day.

If that will happen we'll see massive rearrangement of includes
anyway.

But OK, I've skimmed through other subsystems and core kernel
files and realized that this is indeed often not preserved.

So, provided there are no other strong arguments in favor
of sorting, I will give up this nitpicking from now on.

-- 
Best regards,
Jacek Anaszewski
