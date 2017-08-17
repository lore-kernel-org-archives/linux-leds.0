From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] leds: Add support for Philips PCA955x I2C LED
 drivers
Date: Thu, 17 Aug 2017 16:37:22 +0300
Message-ID: <20170817133721.qwgiv3qcacxyrvk6@mwanda>
References: <20170817102847.n4h5ez6zlfclkcjs@mwanda>
 <20170817112738.GA19377@amd>
 <20170817114835.ypyhfhurntb4egvx@mwanda>
 <20170817132740.GA20401@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:34031 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750988AbdHQNhk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2017 09:37:40 -0400
Content-Disposition: inline
In-Reply-To: <20170817132740.GA20401@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: ncase@xes-inc.com, linux-leds@vger.kernel.org

On Thu, Aug 17, 2017 at 03:27:40PM +0200, Pavel Machek wrote:
> On Thu 2017-08-17 14:51:48, Dan Carpenter wrote:
> > On Thu, Aug 17, 2017 at 01:27:38PM +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > Hello Nate Case,
> > > > 
> > > > The patch f46e9203d9a1: "leds: Add support for Philips PCA955x I2C
> > > > LED drivers" from Jul 16, 2008, leads to the following static checker
> > > > warning:
> 
> > > >    472                          /*
> > > >    473                           * Platform data can specify LED names and
> > > >    474                           * default triggers
> > > >    475                           */
> > > >    476                          if (pdata->leds[i].name)
> > > >                                     ^^^^^^^^^^^^^^^^^^^
> > > > The comment implies that we should be testing pdata->leds[i].name[0] to
> > > > see if any string has been set?
> > > 
> > > Someone was already submitting patch from this one, no?
> > > 
> > > And please don't mark this one as a "bug report". There's no bug. Your
> > > code analysis tool found a way to make kernel code shorter... well, so
> > > what?
> > > 
> > 
> > You didn't read my email.  It was only one sentence long...  :/
> 
> I read your subject, and it claimed bug.
> 
> Bug normally means: Hey, there's problem with the driver. It oopses my
> kernel here.
> 

I thought it probably was a bug.  One hour ago Colin "fixed" one of
these by removing the NULL check and it turned out that it was a real
bug.  It's legit to suspect that these are often bugs.

Just set up a procmail filter to change the subject to whatever you
prefer.  I can't find it in me to care at all.

regards,
dan carpenter
