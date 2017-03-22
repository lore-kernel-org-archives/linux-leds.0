From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 1/2] mfd: cpcap: Add missing include dependencies
Date: Wed, 22 Mar 2017 08:57:16 -0700
Message-ID: <20170322155716.GC10760@atomide.com>
References: <20170322000912.24210-1-sre@kernel.org>
 <20170322092708.GA26771@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:41240 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760292AbdCVP5V (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 11:57:21 -0400
Content-Disposition: inline
In-Reply-To: <20170322092708.GA26771@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [170322 02:29]:
> On Wed 2017-03-22 01:09:11, Sebastian Reichel wrote:
> > This fixes compilation for files, that try to include the
> > cpcap header in alphabetically sorted #include lists.
> > 
> > Signed-off-by: Sebastian Reichel <sre@kernel.org>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Hmm I wonder why I never ran into this so far. No objections
to the patch though if it fixes the issue with all the necessary
headers included.

Regards,

Tony


> > ---
> > This patch is new, since PATCHv1 did not order the includes
> > in the led driver alphabetically.
> > ---
> >  include/linux/mfd/motorola-cpcap.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
> > index 7629e0d24d26..b8916953a537 100644
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
> >  
> 
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
