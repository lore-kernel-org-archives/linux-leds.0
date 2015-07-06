From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v3 1/7] leds: Add led_set_brightness_sync to the public
 LED subsystem API
Date: Mon, 06 Jul 2015 08:31:13 +0200
Message-ID: <559A20B1.8090703@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
 <1435929052-8736-2-git-send-email-j.anaszewski@samsung.com>
 <20150705123448.GB29782@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55118 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215AbbGFGbT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 6 Jul 2015 02:31:19 -0400
In-reply-to: <20150705123448.GB29782@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, philippe.retornaz@

On 07/05/2015 02:34 PM, Pavel Machek wrote:
> Hi!
>
>>   extern void led_set_brightness(struct led_classdev *led_cdev,
>>   			       enum led_brightness brightness);
>> +
>> +/**
>> + * led_set_brightness_sync - set LED brightness synchronously
>> + * @led_cdev: the LED to set
>> + * @brightness: the brightness to set it to
>> + *
>> + * Set an LED's brightness immediately. This function will block
>> + * the caller for the time required for accessing device register,
>> + * and it can sleep.
>> + */
>> +static inline int led_set_brightness_sync(struct led_classdev *led_cdev,
>> +					  enum led_brightness value)
>> +{
>> +	int ret = 0;
>> +
>> +	led_cdev->brightness = min(value, led_cdev->max_brightness);
>> +
>> +	if (led_cdev->flags & LED_SUSPENDED)
>> +		return 0;
>> +
>> +	if (led_cdev->brightness_set_sync)
>> +		ret = led_cdev->brightness_set_sync(led_cdev,
>> +						    led_cdev->brightness);
>> +	else
>> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);
>> +
>> +	return 0;
>> +}
>
> return ret, AFAICT?

Right, thanks.

-- 
Best Regards,
Jacek Anaszewski
