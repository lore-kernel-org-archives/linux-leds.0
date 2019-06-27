From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 05/26] leds: core: Add support for composing LED class
 device names
Date: Thu, 27 Jun 2019 20:28:06 +0200
Message-ID: <7b038be0-274d-54f7-46f4-3dbe346169b8@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-6-jacek.anaszewski@gmail.com>
 <66811b33-c643-679e-344c-e293f03cc2fb@gmail.com>
 <b65ba5ea-4b79-8245-bddb-3ecf1424892f@kaa.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b65ba5ea-4b79-8245-bddb-3ecf1424892f@kaa.org.ua>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Hi Oleh,

On 6/26/19 10:07 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> so after this patch will be merged.
> 
> There will be a way to define custom function name by DeviceTree?

Yes. We standardize LED functions just to avoid spreading many similarly
looking function names with the same semantics.

We don't enforce using new function definitions in any way.
It is possible to assign whatever you want to the DT label property
(however now deprecated) or to the new DT function property.

It will be however preferable to use standard LED_FUNCTION definitions
for new mainline bindings and dts files. Of course, as documentation
states, it will be possible to propose new ones if none of existing
fit for given application. This is only an initial set.

> 26.06.19 22:05, Jacek Anaszewski пише:
>> Gentle reminder.
>>
>> Pavel, Dan - any conclusions?
>>
>> This patch is the main part of the proposed changes,
>> so it would be good to spot any remaining issues.
>>
>> What needs a consensus is also a new
>> Documentation/leds/led-functions.txt file I introduce
>> in the patch 26/26.
>>
>> Best regards,
>> Jacek Anaszewski
> 

-- 
Best regards,
Jacek Anaszewski
