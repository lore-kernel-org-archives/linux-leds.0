From: Andrea Scian - DAVE Embedded Systems <andrea.scian@dave.eu>
Subject: Re: about pca955x led driver gpio management
Date: Tue, 17 Oct 2017 10:20:17 +0200
Message-ID: <f5b716ff-0b9b-982b-2236-970333dcbb0a@dave.eu>
References: <f4a6919a-83c8-79c9-94ed-48f803a3191f@dave.eu>
 <ea6795ac-806e-4e15-c18b-8cf4aab95ca8@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ea6795ac-806e-4e15-c18b-8cf4aab95ca8@kaod.org>
Content-Language: it-IT
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


Il 17/10/2017 10:18, Cédric Le Goater ha scritto:
> On 10/17/2017 09:36 AM, Andrea Scian - DAVE Embedded Systems wrote:
>> Dear all,
>>
>> I'm working on an iMX6 based board with a PCA9555 which is used both to drive LEDs and manage some GPIOs.
> The PCA9555 chip and the PCA955[0-3] chips have different control
> registers. You need a different led driver for it.

My typo sorry, as you can see in the device tree below, I'm using pca9551

>> My current kernel is quite old (4.1.15) but I've found Cédric patches on mainline and backported to this old revision.
>>
>> I'm facing an issue with it, because it seems that it fails when it's used in a mixed (led/gpios) environment.
>>
>> E.g.: let's say that I have one led connected to LED0 output and one GPIO connected at LED1 output.
>>
>> I define it as
>>
>>                          pca9551: pca9551@60 {
>>                                  compatible = "nxp,pca9551";
>>                                  reg = <0x60>;
>>                                  #address-cells = <1>;
>>                                  #size-cells = <0>;
>>                                  #gpio-cells = <1>;
>>
>>                                  led@0 {
>>                                          label = "led0";
>>                                          reg = <0>;
>>                                          linux,default-trigger = "none";
>>                                  };
>>                                  gpio@1 {
>>                                          label = "gpio1";
>>                                          reg = <1>;
>>                                          type = <2>; /* GPIO */
>>                                  };
>>                  };
>>
>> At boot it's probed as
>>
>> root@sbc-lynx:~# dmesg | grep pca
>> [    5.315425] leds-pca955x 5-0060: leds-pca955x: Using pca9551 8-bit LED driver at slave address 0x60
>> [    5.350349] leds-pca955x 5-0060: gpios 511...511
>>
>> But I cannot access it:
>>
>> root@sbc-lynx:~# echo 511 > /sys/class/gpio/export
>> -sh: echo: write error: Device or resource busy
>>
>> Because for pca955x_gpio_request_pin() this is at offset 0 (in fact is the first gpio registered of this gpio_chip) but it's the index 1 inside pca955x->leds[]
>>
>> Am I missing something? (maybe I made a mistake in my backport and/or I'm missing some patches about the GPIO subsystems).
>>
>> If I'm right I think I can send a patch to fix this (I'm thinking about having an array of GPIO index to map offset -> pca955x->leds[] index or just register all pins as GPIOs and then just report the busy state)
>>
>> WDYT?
>>
>> Kind Regards,
>>
