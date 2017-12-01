From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH/trivial] ledtrig-activity: Grammar s/a immediate/an
 immediate/
Date: Fri, 1 Dec 2017 21:21:40 +0100
Message-ID: <20171201202140.GA9326@1wt.eu>
References: <1512049001-19669-1-git-send-email-geert+renesas@glider.be>
 <71729f17-086f-171a-fa19-2c5cae5fecad@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71729f17-086f-171a-fa19-2c5cae5fecad@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Jiri Kosina <trivial@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi guys,

On Fri, Dec 01, 2017 at 09:14:43PM +0100, Jacek Anaszewski wrote:
> Hi Geert,
> 
> On 11/30/2017 02:36 PM, Geert Uytterhoeven wrote:
> > Fixes: 7df4f9a9f0667ee6 ("leds: ledtrig-activity: Add a system activity LED trigger")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/leds/trigger/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> > index bb090216b4dc338d..6dac48c457d17ca5 100644
> > --- a/drivers/leds/trigger/Kconfig
> > +++ b/drivers/leds/trigger/Kconfig
> > @@ -81,7 +81,7 @@ config LEDS_TRIGGER_ACTIVITY
> >  	tristate "LED activity Trigger"
> >  	depends on LEDS_TRIGGERS
> >  	help
> > -	  This allows LEDs to be controlled by a immediate CPU usage.
> > +	  This allows LEDs to be controlled by an immediate CPU usage.
> >  	  The flash frequency and duty cycle varies from faint flashes to
> >  	  intense brightness depending on the instant CPU load.
> >  	  If unsure, say N.
> > 
> 
> Applied, thanks.

Thanks for fixing this one and sorry for not having noticed this typo.

Willy
