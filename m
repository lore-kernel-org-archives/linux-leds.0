From: Fabio Estevam <festevam@gmail.com>
Subject: Re: pwm-led turns on during suspend
Date: Fri, 17 Nov 2017 11:27:32 -0200
Message-ID: <CAOMZO5D66OW+pxC-11LVLnxoZ2=kCXRrJZkO1v+FbQpw0=qxFw@mail.gmail.com>
References: <CAOMZO5BukO0LmYL7D+nyozGJzkDZiqUo_bNAUJT7RkkYkJUvhw@mail.gmail.com>
 <20171117124505.GP31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f181.google.com ([74.125.82.181]:46830 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933859AbdKQN1d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 08:27:33 -0500
Received: by mail-ot0-f181.google.com with SMTP id j29so1973261oth.13
        for <linux-leds@vger.kernel.org>; Fri, 17 Nov 2017 05:27:33 -0800 (PST)
In-Reply-To: <20171117124505.GP31757@n2100.armlinux.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: jacek.anaszewski@gmail.com, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi Russell,

On Fri, Nov 17, 2017 at 10:45 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> The LED is wired to the 3.3V supply, and most likely the PWM output goes
> low when the SoC suspends.  As SolidRun boards don't have support for
> powering down the board supplies, the 3.3V supply does not collapse on
> suspend.

I managed to fix this by introducing pinctrl_pm_select_sleep_state()
support into drivers/leds/leds-pwm.c.

Here is the complete change:
https://pastebin.com/FCsLMuW1

Now I can get the LED to be turned off during suspend.

I will separate the changes and submit the patches.

Thanks
