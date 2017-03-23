From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 1/2] mfd: cpcap: Add missing include dependencies
Date: Thu, 23 Mar 2017 07:52:15 -0700
Message-ID: <20170323145215.GK10760@atomide.com>
References: <20170322000912.24210-1-sre@kernel.org>
 <20170322092708.GA26771@amd>
 <20170322155716.GC10760@atomide.com>
 <20170323010005.xc3phqrimdcrbti4@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170323010005.xc3phqrimdcrbti4@earth>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

* Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [170322 18:02]:
> Hi,
> 
> On Wed, Mar 22, 2017 at 08:57:16AM -0700, Tony Lindgren wrote:
> > * Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> [170322 02:29]:
> > > On Wed 2017-03-22 01:09:11, Sebastian Reichel wrote:
> > > > This fixes compilation for files, that try to include the
> > > > cpcap header in alphabetically sorted #include lists.
> > > > 
> > > > Signed-off-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > 
> > > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> > 
> > Hmm I wonder why I never ran into this so far. No objections
> > to the patch though if it fixes the issue with all the necessary
> > headers included.
> 
> Because you usually sort includes differently moving headers
> from linux/subdir/XYZ after linux/XYZ. That way regmap.h and
> device.h will already be included when the compiler includes
> motorola-cpcap.h.

Ah OK yeah I do that usually. Your patch seems OK to me:

Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
