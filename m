From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Fri, 26 Jan 2018 13:44:01 +0200
Message-ID: <1516967041.7000.1282.camel@linux.intel.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
         <20180126102507.GA13775@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:41342 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751355AbeAZLoE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Jan 2018 06:44:04 -0500
In-Reply-To: <20180126102507.GA13775@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, sakari.ailus@iki.fi

On Fri, 2018-01-26 at 11:25 +0100, Pavel Machek wrote:
> On Fri 2018-01-26 09:38:28, Andy Shevchenko wrote:
> > LM3555 is supported by AS3645A.
> > Clarify this in Kconfig by referencing to AS3645A.
> > 
> > No functional change.

> > 	  This option enables support for LEDs connected to LM355x.
> >  	  LM355x includes Torch, Flash and Indicator functions.
> >  
> > +	  Note, LM3555 is driven by AS3645A.
> > +
> 
> I took a look at the driver. It seems to me lm355x only handles lm3554
> and lm3556?

Correct.

>  Perhaps Kconfig help should say that explicitely?

It's in the title.

> (I guess lm3555 is somehow different from the other two?)

Correct.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
