From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: Re: [PATCH 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sun, 17 Sep 2017 21:17:04 +0900
Message-ID: <ace2a1ab-2582-bf40-9de9-715785d73562@mizrahi.com.ve>
References: <20170917033529.GA12375@olympus.mizrahi.com.ve>
 <20170917092628.GA6107@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:59647 "EHLO
        mail02.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750824AbdIQMT6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 17 Sep 2017 08:19:58 -0400
In-Reply-To: <20170917092628.GA6107@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

On 2017-09-17 18:26, Pavel Machek wrote:
> On Sun 2017-09-17 12:35:29, Alan Mizrahi wrote:
>> ---
> 
> Some kind of changeset comment would be nice here.

That's true, sorry about that.

> Did you solve the crashes? What was the problem?

The problem was gone after using led_classdev_unregister(), as suggested
by Jacek.  Thanks for the hint!

>> +static struct apu_led_profile apu1_led_profile[] = {
>> +	{ "apu:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
>> +	{ "apu:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
>> +	{ "apu:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
>> +};
>> +
>> +static struct apu_led_profile apu2_led_profile[] = {
>> +	{ "apu2:1", 1,       APU2_FCH_GPIO_BASE + 68 * APU2_IOSIZE },
>> +	{ "apu2:2", LED_OFF, APU2_FCH_GPIO_BASE + 69 * APU2_IOSIZE },
>> +	{ "apu2:3", LED_OFF, APU2_FCH_GPIO_BASE + 70 * APU2_IOSIZE },
>> +};
> 
> Do the leds have better names than 1/2/3? Are colors known?

There are some drivers out there and they all used these names. I think
using them would prevent confusions.  The enclosures for these devices
don't have any labels for the leds such as "on" or "error", it's very
generic.  They are all green.


Best regards,

Alan Mizrahi
