From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] leds: gpio: Allow retaining state on shutdown
Date: Mon, 28 Aug 2017 22:22:49 +0200
Message-ID: <abb247bd-fc16-54cf-3dc1-fbba575e5fdb@gmail.com>
References: <20170828001711.19662-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170828001711.19662-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Andrew,

Thanks for the update.

On 08/28/2017 02:17 AM, Andrew Jeffery wrote:
> Hello,
> 
> LEDs controlled by Baseboard Management Controllers (BMCs) are sometimes
> required to retain their state across BMC resets. BMC resets may occur whilst
> the host is alive, thus the chassis and host system remain powered up. In these
> two patches I define an new devicetree property to describe the behaviour for
> GPIO LEDs and add support to the leds-gpio driver.
> 
> Changes in v2:
> * Expand BMC to Baseboard Management Controller at least once in each commit
>   message.
> 
> v1: https://lkml.org/lkml/2017/8/25/44
> 
> Please review!
> 
> Cheers,
> 
> Andrew
> 
> Andrew Jeffery (2):
>   dt-bindings: leds: gpio: Add optional retain-state-shutdown property
>   leds: gpio: Allow LED to retain state at shutdown
> 
>  Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
>  drivers/leds/leds-gpio.c                             | 7 ++++++-
>  include/linux/leds.h                                 | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Patchset applied to the for-next branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
