From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] cleanup LED documentation and make it match reality
Date: Mon, 3 Oct 2016 10:20:07 +0200
Message-ID: <20161003082007.GA6277@kroah.com>
References: <20161003081049.GA12419@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33644 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751365AbcJCIUH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 04:20:07 -0400
Content-Disposition: inline
In-Reply-To: <20161003081049.GA12419@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

On Mon, Oct 03, 2016 at 10:10:50AM +0200, Pavel Machek wrote:
> 
> sysfs-class-led fails to mention some important details. Also fix led
> vs LED and english.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -4,16 +4,25 @@ KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
>  		Set the brightness of the LED. Most LEDs don't
> -		have hardware brightness support so will just be turned on for
> +		have hardware brightness support, so will just be turned on for
>  		non-zero brightness settings. The value is between 0 and
>  		/sys/class/leds/<led>/max_brightness.
>  
> +		Writing 0 to this file clears active trigger.
> +
> +		Writing non-zero to this file while trigger is active changes the
> +		top brightness trigger is going to use.
> +		

No trailing whitespace please...
