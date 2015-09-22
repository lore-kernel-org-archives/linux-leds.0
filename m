From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/5] Documentation: leds: Add description of brightness
 setting API
Date: Tue, 22 Sep 2015 21:27:50 +0200
Message-ID: <20150922192750.GG20029@lunn.ch>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:41655 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758013AbbIVTf7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 22 Sep 2015 15:35:59 -0400
Content-Disposition: inline
In-Reply-To: <1442845770-17800-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com

On Mon, Sep 21, 2015 at 04:29:27PM +0200, Jacek Anaszewski wrote:
> This patch adds description of the LED subsystem API for
> setting an LED brightness.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>  Documentation/leds/leds-class.txt |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
> index 62261c0..2cc38fa 100644
> --- a/Documentation/leds/leds-class.txt
> +++ b/Documentation/leds/leds-class.txt
> @@ -52,6 +52,27 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Brightness setting API
> +======================
> +
> +LED subsystem core exposes following API for setting brightness:
> +
> +    - led_set_brightness : if necessary, cancels the software blink timer that
> +		implements blinking when the hardware doesn't; it is guaranteed
> +		not to sleep

I would put this in the reverse order. Not sleeping is the most
important bit. Also, stopping blinking should also happen if the
hardware is performing the blinking. There is no need to mention
software blinking, that is an implementation detail.

                which implies the possibility of delegating the
> +		job to a work queue task (uses led_set_brightness_nosleep
> +		underneath - see below),

This bit is also an implementation detail and not relevant to the API.


> +    - led_set_brightness_sync : for use cases when immediate effect is desired;
> +		it can block the caller for the time required for accessing
> +		device registers and can sleep,

In fact, i would probably have a separate paragraph that says passing
LED_OFF to either of these two functions stops blinking.

	Andrew
