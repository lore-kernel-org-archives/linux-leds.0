From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/4] leds: netdev trigger: factor out middle part of
 device_name_store
Date: Thu, 14 Mar 2019 11:20:09 +0100
Message-ID: <20190314102009.o3zsxtcobuahkp7r@pengutronix.de>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-3-linux@rasmusvillemoes.dk>
 <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
 <20190314101528.GB14455@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314101528.GB14455@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello,

On Thu, Mar 14, 2019 at 11:15:28AM +0100, Pavel Machek wrote:
> On Thu 2019-03-14 10:31:11, Uwe Kleine-König wrote:
> 1;2802;0c> Hello,
> > 
> > On Wed, Mar 13, 2019 at 09:26:13PM +0100, Rasmus Villemoes wrote:
> > > +static void set_device(struct led_netdev_data *trigger_data,
> > > +		       const char *buf, size_t size)
> > 
> > "set_device" is a very generic name. Can you please prefix it with
> > "ledtrig_netdev_"?
> 
> Its static.

Still it pollutes the name space for tools like ctags. Currently there
is no other driver that provides "set_device" but there are symbol names
that are used for different purposes and that's annoying. Right, for
global names that might even be used from other source files, this is
worse. But IMHO it's still annoying enough in cases like this to not do
it.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
