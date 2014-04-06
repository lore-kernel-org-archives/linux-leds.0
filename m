From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH RFC] leds: pca9685: Remove leds-pca9685 driver
Date: Sun, 6 Apr 2014 11:30:53 +0200
Message-ID: <20140406093053.GH12170@pengutronix.de>
References: <1396754381.13341.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396754381.13341.4.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Maximilian =?iso-8859-1?Q?G=FCntner?= <maximilian.guentner@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

On Sun, Apr 06, 2014 at 11:19:41AM +0800, Axel Lin wrote:
> This driver is replaced by pwm-pca9685 driver and there is no user uses this
> driver in current tree. So remove it.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi,
> I found there is a modalias conflict between leds-pca9685.ko and pwm-pca9685.ko.
> I think this conflict will cause problem.
> After checking the code, I think leds-pca9685 is replaced by pwm-pca9685.

This confused me for a second, as there was no driver to replace when I wrote
the pwm-pca9685 driver and I thought I missed something. But it seems I didn't
and the pwm-pca9685 is actually older.

> Use git grep to check current tree and found there is no user uses leds-pca9685.
> So this patch removes leds-pca9685 driver.
> 

If the platform setup is needed, maybe this can be integrated into the pwm driver
instead of completely dropping it. I don't care for platform code, but if someone
does, I don't want him to lose the support for it.

Otherwise I am okay with this drop (okay, I'm completely biased of course ;-)).
But technically the pca9685 is not solely a LED driver IC, but a PWM IC, so it
is in the wrong place anyhow.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
