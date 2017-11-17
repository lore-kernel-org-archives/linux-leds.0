From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: pwm-led turns on during suspend
Date: Fri, 17 Nov 2017 12:45:06 +0000
Message-ID: <20171117124505.GP31757@n2100.armlinux.org.uk>
References: <CAOMZO5BukO0LmYL7D+nyozGJzkDZiqUo_bNAUJT7RkkYkJUvhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35396 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932970AbdKQMpV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 07:45:21 -0500
Content-Disposition: inline
In-Reply-To: <CAOMZO5BukO0LmYL7D+nyozGJzkDZiqUo_bNAUJT7RkkYkJUvhw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: jacek.anaszewski@gmail.com, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, Nov 17, 2017 at 10:31:23AM -0200, Fabio Estevam wrote:
> Hi,
> 
> On a imx6q-cubox-i board there is an LED controlled via pwm-leds and
> it works as expected:
> 
> # cd /sys/class/leds/imx6\:red\:front/
> # echo 248 > brightness  (LED is turned on with its maximum brightness)
> # echo 0 > brightness (LED is turned off)
> 
> However after entering in suspend mode:
> 
> # echo enabled > /sys/class/tty/ttymxc0/power/wakeup
> # echo mem > /sys/power/state
> 
> The LED is turned on with its maximum brightness.
> 
> Press a key in the console, system resumes and LED is turned off.
> 
> I would expect that the LED gets turned off in suspend, but this is
> not happening.
> 
> Any ideas?

The LED is wired to the 3.3V supply, and most likely the PWM output goes
low when the SoC suspends.  As SolidRun boards don't have support for
powering down the board supplies, the 3.3V supply does not collapse on
suspend.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
