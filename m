From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 0/4] leds: pca955x: add GPIO support
Date: Wed, 2 Aug 2017 13:57:29 +0200
Message-ID: <dad22552-3314-c315-a3c5-89e6718230b0@kaod.org>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
 <20170802113351.GA2528@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:56135 "EHLO
        4.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752112AbdHBL5l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2017 07:57:41 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id F010B45780
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2017 13:57:39 +0200 (CEST)
In-Reply-To: <20170802113351.GA2528@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

On 08/02/2017 01:33 PM, Pavel Machek wrote:
> Hi!
> 
>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>
>> The following adds support for device tree and Open Firmware to be
>> able do define different operation modes for each pin. See bindings
>> documentation for more details. The pca955x driver is then extended
>> with a gpio_chip when pins are operating in GPIO mode.
>>
>> The driver follows the scheme of the leds-pca9532 driver which behaves
>> quite similarly.
> 
> Is there reason not to treat pca955x chip as a GPIO extender, and then
> use leds-gpio on top?

I would say mostly because there is already a leds-pca955x driver and
that the primary nature of the chip is being a LED blinker. It also 
supports different blinking rates.

If all pins are defined as GPIOs, the device then behaves as a GPIO 
extender on which we can use leds-gpio. It might be a bit awkward
that way but it should work.

Thanks,

C.
