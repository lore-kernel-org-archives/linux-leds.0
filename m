From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Mon, 15 May 2017 08:29:06 +0200
Message-ID: <b1834a28-f094-0c46-4ac1-7830575701c7@kaod.org>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
 <20170513112601.GA21785@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 10.mo4.mail-out.ovh.net ([188.165.33.109]:33384 "EHLO
        10.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758878AbdEOGp1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2017 02:45:27 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 65EDA64D4F
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2017 08:29:18 +0200 (CEST)
In-Reply-To: <20170513112601.GA21785@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>

Hello,

On 05/13/2017 01:26 PM, Pavel Machek wrote:
> On Tue 2017-05-09 08:36:12, Cédric Le Goater wrote:
>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>
>> The following adds support for device tree and Open Firmware to be
>> able do define different operation modes for each pin. See bindings
>> documentation for more details. The pca955x driver is then extended
>> with a gpio_chip when pins are operating in GPIO mode.
> 
> Actually.. maybe better solution would be to turn this into GPIO
> driver, and then use gpio-leds on top...?

yes probably. We could introduce a new driver for the PCA955[0-3]
when all pins are in GPIO mode. I have taken the approach of the 
leds-pca9532 which behaves quite similarly. 

> What is the difference between pin in GPIO mode and pin in LED mode?

Well, first of all the PCA955[0-3] are LED blinkers chips, and not 
GPIO chips. So you have an extra couple registers to set the frequency 
and the pwm.

As for the pins in GPIO mode, here is what the specs says : 

- For input, set LEDn to high-impedance (01) and then read the pin 
  state via the input register.

- For output, LED output pin is HIGH when the output is programmed 
  as high-impedance, and LOW when the output is programmed LOW through 
  the LS register. The output can also be pulse-width controlled when 
  PWM0 or PWM1 are used.

So for output, GPIO control is quite similar to LED control. For input,
the INPUTx registers need to be read.

Thanks,

C. 
