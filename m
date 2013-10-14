From: Maximilian =?ISO-8859-1?Q?G=FCntner?=
	<maximilian.guentner@gmail.com>
Subject: Re: [PATCH] leds: Added driver for the NXP PCA9685 I2C chip
Date: Tue, 15 Oct 2013 01:26:16 +0200
Message-ID: <3285547.78o0xYBaXq@titan>
References: <2819232.mPNW6mO2uH@titan> <alpine.DEB.2.01.1310150015370.26447@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:45882 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757110Ab3JNX0U (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2013 19:26:20 -0400
In-Reply-To: <alpine.DEB.2.01.1310150015370.26447@pmeerw.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Meerwald <pmeerw@pmeerw.net>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>

On Tuesday 15 October 2013 00:38:13 Peter Meerwald wrote:
> > The NXP PCA9685 supports 16 channels/leds using a 12-bit PWM (4095
> > levels of brightness)
> > This driver supports configuration using platform_data.
> 
> some nitpicking inline
Thank you for your comments.
> chip
fixed.
> 
>> + * Driver for the NXP PCA9685 12-Bit I2C chip.
> this could be more descriptive: 12-bit PWM LED driver chip
fixed.
> > +	/*
> > +	 * 4095 is the maximum brightness, so we set the ON time to 0x1000
> > +	 * which disables the PWM generator for that LED
> > +	 */
> > +	if (pca9685->brightness == 4095)
> > +		brightness = 4096;
> 
> why not check for 4095 instead of 4096 below and save this if statement?
removed.

I left it there in order to improve the code readability, which should be equally
good when we just remove the statement and check for 4095 below.
> > +	i2c_smbus_write_byte_data(client, PCA9685_MODE1, 1 << PCA9685_AI);
> 
> maybe BIT(PCA9685_AI)
replaced.
