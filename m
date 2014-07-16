From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH/RFC v4 04/21] leds: Reorder include directives
Date: Wed, 16 Jul 2014 18:42:36 +0300
Message-ID: <53C69D6C.3010705@iki.fi>
References: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com> <1405087464-13762-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405087464-13762-5-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

Jacek Anaszewski wrote:
> Reorder include directives so that they are arranged
> in alphabetical order.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> ---
>   drivers/leds/led-class.c |   13 +++++++------
>   drivers/leds/led-core.c  |    3 ++-
>   include/linux/leds.h     |    2 +-
>   3 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index da79bbb..0127783 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -9,16 +9,17 @@
>    * published by the Free Software Foundation.
>    */
>
> -#include <linux/module.h>
> -#include <linux/kernel.h>
> +#include <linux/ctype.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
>   #include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
>   #include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>

Do you also need slab.h?

>   #include <linux/spinlock.h>
> -#include <linux/device.h>
>   #include <linux/timer.h>
> -#include <linux/err.h>
> -#include <linux/ctype.h>
> -#include <linux/leds.h>
>   #include "leds.h"
>
>   static struct class *leds_class;
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 0ac06ed..d156fb6 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -12,10 +12,11 @@
>    */
>
>   #include <linux/kernel.h>
> +#include <linux/leds.h>
>   #include <linux/list.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>

And mutex.h here?

With that fixed, if there are some other patches that are essentially 
cleanups that could go in well before the rest of the set. Some of the 
patches will take a little longer, I presume.

I'll let you know if/when there's an update regarding the compound 
controls patchset.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org     XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
