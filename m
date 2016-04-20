From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] [PATCH] drivers: led: is31fl319x: 6/9-channel light effect led driver
Date: Wed, 20 Apr 2016 10:53:24 +0200
Message-ID: <0F30E42A-9B27-4DFF-B8BD-BC226214A9BE@goldelico.com>
References: <cover.1461004995.git.hns@goldelico.com> <75127f4bf2bb11343bdff5bfb1129a092e668c61.1461004995.git.hns@goldelico.com> <5715F6EF.9090909@samsung.com> <DE691B2A-3CE5-4AB7-B72D-A4C45CD70A0C@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DE691B2A-3CE5-4AB7-B72D-A4C45CD70A0C@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, kernel@pyra-handheld.com, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Kumar Gala <galak@codeaurora.org>, linux-leds@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

>>> +static void is31fl319x_brightness_set(struct led_classdev *led_cdev,
>>> +				   enum led_brightness brightness)
>>> +{
>>> +	struct is31fl319x_led *led = container_of(led_cdev,
>>> +						  struct is31fl319x_led,
>>> +						  led_cdev);
>>> +	struct is31fl319x_chip *is31 = led->chip;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&is31->lock, flags);
>>> +
>>> +	if (brightness != is31fl319x_brightness_get(led_cdev)) {
>> 
>> Current brightness is cached in led_cdev->brightness.
> 
> Hm. I could not find the code line where it is cached.
> 
> And if I remember correctly (it is a while ago that we did develop
> this driver) experiments didn't show that it is cached there. Or the
> old value is not available inside the brightness setter but already
> the new one. Something like that was the reason why we cache
> it inside the driver.
> 

I have added a printk inside is31fl319x_brightness_set but never got
a difference between brightness and led_cdev->brightness.

This seems to confirm that it is already set to the new value. Thus we
can't detect changes in brightness by comparing to the previous value.

Can you please confirm?

Otherwise the driver works well so that I am almost ready for posting
V2.

Thanks,
Nikolaus
