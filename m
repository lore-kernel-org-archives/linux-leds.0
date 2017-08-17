From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 14:51:48 +0300
Message-ID: <20170817114835.ypyhfhurntb4egvx@mwanda>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
 <20170817112738.GA19377@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:38326 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751169AbdHQLwJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 07:52:09 -0400
Content-Disposition: inline
In-Reply-To: <20170817112738.GA19377@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: ncase@xes-inc.com, linux-leds@vger.kernel.org

On Thu, Aug 17, 2017 at 01:27:38PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Hello Nate Case,
> > 
> > The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
> > LED drivers" from Jul 16, 2008, leads to the following static checker
> > warning:
> > 
> > 	drivers/leds/leds-pca955x.c:476 pca955x_probe()
> > 	warn: this array is probably non-NULL. 'pdata->leds + i->name'
> > 
> > drivers/leds/leds-pca955x.c
> >    465                  switch (pca955x_led->type) {
> >    466                  case PCA955X_TYPE_NONE:
> >    467                          break;
> >    468                  case PCA955X_TYPE_GPIO:
> >    469                          ngpios++;
> >    470                          break;
> >    471                  case PCA955X_TYPE_LED:
> >    472                          /*
> >    473                           * Platform data can specify LED names and
> >    474                           * default triggers
> >    475                           */
> >    476                          if (pdata->leds[i].name)
> >                                     ^^^^^^^^^^^^^^^^^^^
> > The comment implies that we should be testing pdata->leds[i].name[0] to
> > see if any string has been set?
> 
> Someone was already submitting patch from this one, no?
> 
> And please don't mark this one as a "bug report". There's no bug. Your
> code analysis tool found a way to make kernel code shorter... well, so
> what?
> 

You didn't read my email.  It was only one sentence long...  :/

>From the comments, it looked like maybe a different test was intended.
Anyway, that's the point of these warnings is because many times the
bogus NULL test should be replaced with a correct test.  I don't forward
the warning if it's obvious that the test should just be deleted.

I probably could review the warnings even more but I am pretty busy and
the code is obviously bogus and it's easier for the author.

regards,
dan carpenter
