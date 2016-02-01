From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/3] leds: add SN3218 LED driver
Date: Mon, 1 Feb 2016 14:20:17 +0100
Message-ID: <56AF5B91.1000209@i2se.com>
References: <1454245156-15747-1-git-send-email-stefan.wahren@i2se.com>
 <1454245156-15747-4-git-send-email-stefan.wahren@i2se.com>
 <56AF2C63.6000404@samsung.com> <56AF5567.4090102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:49711 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932269AbcBANUg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Feb 2016 08:20:36 -0500
In-Reply-To: <56AF5567.4090102@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Am 01.02.2016 um 13:53 schrieb Jacek Anaszewski:
> On 02/01/2016 10:58 AM, Jacek Anaszewski wrote:
>> Hi Stefan,
>>
>> Thanks for the update. A few more comments below.
>>
>> On 01/31/2016 01:59 PM, Stefan Wahren wrote:
>>> +
>>> +/**
>>> + * struct sn3218 -
>>> + * @client - Pointer to the I2C client
>>> + * @leds - Pointer to the individual LEDs
>>> + * @num_leds - Actual number of LEDs
>>> +**/
>>> +struct sn3218 {
>>> +    struct i2c_client *client;
>>> +    struct regmap *regmap;
>>> +    struct sn3218_led *leds;
>>> +    int num_leds;
>>> +};
>>> +
>>> +/**
>>> + * struct sn3218_led -
>>> + * @chip - Pointer to the container
>>> + * @led_cdev - led class device pointer
>>> + * @led_num - LED index ( 0 .. 17 )
>>> +**/
>>> +struct sn3218_led {
>>> +    struct sn3218 *chip;
>>
>> You don't need this if you have led id here. Please refer to
>> drivers/leds/leds-max77693.c, sub_led_to_led() to check how to get
>> a pointer to the parent structure in similar case.
>
> Hmm, it would work only if leds was a static array in struct sn3218.
> So, let's better leave this "chip" pointer intact.

Okay

I will wait until the end of the week before sending a new version.

Thanks
Stefan
