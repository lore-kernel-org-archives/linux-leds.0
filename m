From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: Re: [PATCH v2 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Tue, 26 Sep 2017 18:20:15 +0900
Message-ID: <61292845-4d3a-1638-c19d-744943cab22f@mizrahi.com.ve>
References: <20170924003701.GA6966@olympus.mizrahi.com.ve>
 <43fb75c0-4d2e-5008-9cac-f6d7d8355330@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:33673 "EHLO
        mail03.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966927AbdIZJXK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Sep 2017 05:23:10 -0400
In-Reply-To: <43fb75c0-4d2e-5008-9cac-f6d7d8355330@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

Hi Jacek,

I'm wondering if you read my previous email, which explains some of
these points:
https://www.spinics.net/lists/linux-leds/msg08584.html

On 2017-09-26 04:18, Jacek Anaszewski wrote:
> Hi Alan,
> 
> Thanks for the update.
> 
> There is still some room for improvement:
> 
> - commit message is mandatory, now you have only a commit title.

OK, I will include a commit message in my next submission.

> - checkpatch.pl still has much to say about this patch,
>   please stick to the 80 character line limit

I agree that I should split some lines, but I find the 80 column limit
too excessive, and there have been a few discussions about this, ie:
https://groups.google.com/forum/#!topic/fa.linux.kernel/3pZ8Kn8Zi8w

Based on that discussion, would a 105 column limit be acceptable?

>> +static struct apu_led_pdata *apu_led;
>> +
>> +static struct apu_led_profile apu1_led_profile[] = {
>> +	{ "apu:green:1", 1,       APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
> 
> I missed this "1" brightness initializer. We now have LED_ON enum
> for that purpose.

I see, I'll use LED_ON then.

>> +		apu_led->pled[i].cdev.brightness = apu_led->profile[i].brightness;
>> +		apu_led->pled[i].cdev.max_brightness = 1;
>> +		if (apu_led->platform == APU1_LED_PLATFORM) {
>> +			apu_led->pled[i].cdev.brightness_set = apu1_led_brightness_set;
>> +		} else if (apu_led->platform == APU2_LED_PLATFORM) {
>> +			apu_led->pled[i].cdev.brightness_set = apu2_led_brightness_set;
>> +		}
> 
> {} braces are redundant in this condition.

Yes, I will remove them.

>> +	if (!(dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "APU2"))) {
>> +		printk(KERN_ERR "Unknown PC Engines board: %s\n", dmi_get_system_info(DMI_PRODUCT_NAME));
> 
> s/printk/pr_err/

I will change this too.

Best regards,
Alan Mizrahi
