From: Nate Case <ncase@xes-inc.com>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 08:58:16 -0500 (CDT)
Message-ID: <2070833088.88546.1502978296708.JavaMail.zimbra@xes-inc.com>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda> <20170817112738.GA19377@amd> <20170817114835.ypyhfhurntb4egvx@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.220]:29387 "EHLO mail.xes-mad.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752750AbdHQOFv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Aug 2017 10:05:51 -0400
In-Reply-To: <20170817114835.ypyhfhurntb4egvx@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org

On Aug 17, 2017, at 6:51 AM, Dan Carpenter dan.carpenter@oracle.com wrote:
> > > Hello Nate Case,

> > > The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
> > > LED drivers" from Jul 16, 2008, leads to the following static checker
> > > warning:
---[snip]---
> From the comments, it looked like maybe a different test was intended.
> Anyway, that's the point of these warnings is because many times the
> bogus NULL test should be replaced with a correct test. I don't forward
> the warning if it's obvious that the test should just be deleted.

> I probably could review the warnings even more but I am pretty busy and
> the code is obviously bogus and it's easier for the author.

> regards,
> dan carpenter

Hi Dan,

My memory is actually fuzzy on this since I wrote this code in 2008.

But, looking back, I can agree that Colin King's patch is harmless.  I
think my true original intention was to use an LED name of
"pca955x:<bit number>" as a fallback if a name was not specified in
the device tree.

So, yes, a better way to implement that would be to rework it to
something like this:

    /* Default LED name */
    snprintf(pca955x_led->name, sizeof(pca955x_led->name), "pca955x:%d", i);

    if (pdata) {
        if (pdata->leds[i].name[0] != '\0')
            /* Override LED name from pdata */
            snprintf(pca955x_led->name, ....);
        if (pdata->leds[i].default_trigger)
            ...
    }
  
Otherwise, it looks like it'd be possible to end up with LED names
of "pca955x:" in some corner cases.

Thanks,

Nate Case <ncase@xes-inc.com>
