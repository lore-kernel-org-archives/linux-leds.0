From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv3 1/2] mfd: cpcap: Add missing include dependencies
Date: Mon, 27 Mar 2017 15:26:08 +0100
Message-ID: <20170327142608.qcobnqrvyu7u4ybz@dell>
References: <20170324084732.31255-1-sre@kernel.org>
 <d1a18390-fb5f-e192-a54c-1c2574238225@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d1a18390-fb5f-e192-a54c-1c2574238225-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Fri, 24 Mar 2017, Jacek Anaszewski wrote:
> On 03/24/2017 09:47 AM, Sebastian Reichel wrote:
> > This fixes compilation for files, that try to include the
> > cpcap header in alphabetically sorted #include lists.
> > 
> > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> > Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > Changes since PATCHv2:
> >  - Add Acked-by from Tony & Pavel
> > ---
> >  include/linux/mfd/motorola-cpcap.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
> > index 793aa695faa0..aefc49cb7ba9 100644
> > --- a/include/linux/mfd/motorola-cpcap.h
> > +++ b/include/linux/mfd/motorola-cpcap.h
> > @@ -14,6 +14,9 @@
> >   * published by the Free Software Foundation.
> >   */
> >  
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +
> >  #define CPCAP_VENDOR_ST		0
> >  #define CPCAP_VENDOR_TI		1
> 
> Both patches applied to the for-next branch of linux-leds.git, thanks.

Que?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
