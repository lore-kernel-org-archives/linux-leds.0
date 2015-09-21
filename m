From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 0/3] Add DT support for netxbig LEDs
Date: Mon, 21 Sep 2015 11:25:15 +0200
Message-ID: <55FFCCFB.5030400@samsung.com>
References: <1442505571-9744-1-git-send-email-simon.guinot@sequanux.org>
 <55FBD641.7030902@samsung.com> <20150918132356.GO7306@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20290 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756361AbbIUJZT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2015 05:25:19 -0400
In-reply-to: <20150918132356.GO7306@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

On 09/18/2015 03:23 PM, Simon Guinot wrote:
> On Fri, Sep 18, 2015 at 11:15:45AM +0200, Jacek Anaszewski wrote:
>> Hi Simon,
>>
>> Thanks for the update.
>>
>> On 09/17/2015 05:59 PM, Simon Guinot wrote:
>>> Hello,
>>>
>>> This patch series adds DT support for the LEDs found on the Kirkwood-based
>>> LaCie boards 2Big and 5Big Network v2.
>>>
>>> Changes for v2:
>>> - Check timer mode value retrieved from DT.
>>> - In netxbig_leds_get_of_pdata, don't use unsigned long variables to get
>>>    timer delay values from DT with function of_property_read_u32_index.
>>>    Instead, use a temporary u32 variable. This allows to silence a static
>>>    checker warning.
>>> - Make timer property optional in the binding documentation. It is now
>>>    aligned with the driver code.
>>>
>>> Changes for v3:
>>> - Fix pointer usage with the temporary u32 variable while calling
>>>    of_property_read_u32_index.
>>>
>>> Changes for v4:
>>> - In DT binding document netxbig-gpio-ext.txt, detail byte order for
>>>    registers and latch mechanism for "enable-gpio".
>>> - In leds-netxbig.c, add some error messages.
>>> - In leds-netxbig.c, fix some "sizeof" style issues.
>>> - In leds-netxbig.c, in netxbig_leds_get_of_pdata(), move the
>>>    of_property_read_string() calls after the error-prone checks.
>>> - Add some Acked-by.
>>>
>>> Jacek,
>>>
>>> I did not convert the bright-max DT property into led-max-microamp.
>>> The reason is that I can't translate the bright-max values into
>>> microamperes.
>>
>> Doesn't specification of your device say what current value given
>> brightness level reflects?
>
> I double-checked and I can confirm that I don't have the current values
> for the LEDs. Although this feature is nice to have, it has not been
> used by the LaCie stock firmware. LEDs are only enabled at their maximum
> level. I believe it is the reason why it has not been specified...

OK, so we have to use levels. Could you rename bright-max to
max-brightness? We have already this in leds-pwm bindings and
probably we should make it a common optional DT property for all LEDs.
I'll add this to my TODO list.

-- 
Best Regards,
Jacek Anaszewski
