From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel i2c
 LED driver
Date: Mon, 26 Jan 2015 18:10:52 +0100
Message-ID: <20150126171052.GC5015@lunn.ch>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch>
 <1421879364-8573-3-git-send-email-andrew@lunn.ch>
 <54C62919.8000205@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:33349 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754678AbbAZRNQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 26 Jan 2015 12:13:16 -0500
Content-Disposition: inline
In-Reply-To: <54C62919.8000205@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com, linux-leds@vger.kernel.org, kaloz@openwrt.org, linux ARM <linux-arm-kernel@lists.infradead.org>

> So... To me it's still slightly unclear when should one write a PWM
> driver and when a LED driver. But I would say that as the TLC591xx
> outputs a PWM signal, it should be a PWM driver. Then the different
> users of this PWM signal could be made on top of that (LED, backlight, GPO).
> 
> What would be the technical drawbacks with having the TLC591xx driver as
> a PWM, instead of LED?
 
Hi Tomi

We have been through this once, but the big technical drawback is that
this hardware cannot do what the Linux Kernel defines as PWM.

It cannot correctly implement the PMW call:

int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns);

This hardware has a fixed period, since it is clocked at 97-kHz.  So
you cannot set the period. The duty is also somewhat restrictive, in
that it only allows 1/256 increments of the 97Khz.

This hardware does however perfectly fit the LED API:

enum led_brightness {
        LED_OFF         = 0,
        LED_HALF        = 127,
        LED_FULL        = 255,
};

        void            (*brightness_set)(struct led_classdev *led_cdev,
                                          enum led_brightness brightness);

So we can model it perfectly as an LED driver, or badly as a PWM
driver.

   Andrew
