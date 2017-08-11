From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 3/4] leds: pca955x: add GPIO support
Date: Fri, 11 Aug 2017 17:11:14 +0200
Message-ID: <9330f31a-110c-8398-8cd1-764f8dd358e9@kaod.org>
References: <1502199760-763-1-git-send-email-clg@kaod.org>
 <1502199760-763-4-git-send-email-clg@kaod.org> <20170811134757.GA22561@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 13.mo4.mail-out.ovh.net ([178.33.251.8]:51708 "EHLO
        13.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753217AbdHKPbG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Aug 2017 11:31:06 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2E8F689B9A
        for <linux-leds@vger.kernel.org>; Fri, 11 Aug 2017 17:11:24 +0200 (CEST)
In-Reply-To: <20170811134757.GA22561@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

Hello,

On 08/11/2017 03:47 PM, Pavel Machek wrote:
> Hi!
> 
>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>
>> The following adds such a support by defining different operation
>> modes for the pins (See bindings documentation for more details). The
>> pca955x driver is then extended with a gpio_chip when some of pins are
>> operating as GPIOs. The default operating mode is to behave as a LED.
>>
>> The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> For the series,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> with minor comments below.
> 
>> @@ -125,6 +130,7 @@ struct pca955x_led {
>>  	struct led_classdev	led_cdev;
>>  	int			led_num;	/* 0 .. 15 potentially */
>>  	char			name[32];
>> +	u32			type;
> 
> u32 is highly non-standard here. enum pca955x_led_type?
>
> 
>> +/*
>> + * Read the INPUT register, which contains the state of LEDs.
>> + */
>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>> +{
>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>> +}
> 
> Is the cast needed? Should you attempt to handle errors?

ah. this is a left over. I can fix in a resend.

>> +#ifndef _DT_BINDINGS_LEDS_PCA955X_H
>> +#define _DT_BINDINGS_LEDS_PCA955X_H
>> +
>> +#define PCA955X_TYPE_NONE         0
>> +#define PCA955X_TYPE_LED          1
>> +#define PCA955X_TYPE_GPIO         2
> 
> And make these into the new enum pca955x_led_type?

These are used in the device tree bindings, so we should keep the u32
I think.

Thanks,

C.
