From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/4] leds: netdev trigger: use memcpy in device_name_store
Date: Thu, 14 Mar 2019 11:04:16 +0100
Message-ID: <20190314100416.5ywtxhsbhqz6rvdq@pengutronix.de>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-2-linux@rasmusvillemoes.dk>
 <20190314092929.65amwzsaswcvsexl@pengutronix.de>
 <8b2903c9-e56b-ea22-41b2-d6f96bec1d96@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8b2903c9-e56b-ea22-41b2-d6f96bec1d96@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Mar 14, 2019 at 10:57:14AM +0100, Rasmus Villemoes wrote:
> On 14/03/2019 10.29, Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Wed, Mar 13, 2019 at 09:26:12PM +0100, Rasmus Villemoes wrote:
> >> --- a/drivers/leds/trigger/ledtrig-netdev.c
> >> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> >> @@ -122,7 +122,8 @@ static ssize_t device_name_store(struct device *dev,
> >>  		trigger_data->net_dev = NULL;
> >>  	}
> >>  
> >> -	strncpy(trigger_data->device_name, buf, size);
> >> +	memcpy(trigger_data->device_name, buf, size);
> >> +	trigger_data->device_name[size] = '\0';
> > 
> > This is open-coding
> > 
> > 	strlcpy(trigger_data->device_name, buf, size);
> 
> No. size here is the number of bytes userspace wrote, which never (well,
> almost never, they could do something odd) contain a nul byte. Passing
> that as size to strlcpy would guarantee that we chopped off the last
> character from the user input.

You're right here, strlcpy isn't a replacement here. I withdraw my
suggestion.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
