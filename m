From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 17:30:56 +0300
Message-ID: <20150410143056.GI16501@mwanda>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:33298 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755224AbbDJOb2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 10:31:28 -0400
Content-Disposition: inline
In-Reply-To: <5527DBBA.9060109@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 10, 2015 at 04:18:34PM +0200, Jacek Anaszewski wrote:
> Hi Dan,
> 
> On 04/10/2015 10:30 AM, Dan Carpenter wrote:
> >Static checkers complain that "timers[i].delay_on" is an unsigned long
> >but we're writing to only 32 bits of it.  The code works on 32 bit
> >systems and little endian 64 bit systems so it doesn't cause a problem
> >in practise but it's still better to silence the warning.
> >
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >---
> >v2: use a temporary variable
> >
> >diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> >index 028686f2..6cb4537 100644
> >--- a/drivers/leds/leds-netxbig.c
> >+++ b/drivers/leds/leds-netxbig.c
> >@@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
> >  		if (!timers)
> >  			return -ENOMEM;
> >  		for (i = 0; i < num_timers; i++) {
> >+			u32 delay_on = 0;
> >+			u32 delay_off = 0;
> 
> These variables don't need initialization, as they are assigned
> a new value in of_property_read_u32_index anyway.

I don't know this hardware and I can't even test it so I didn't feel
comfortable leaving it out.  Also static checkers will complain that
we are ignoring the error paths.

regards,
dan carpenter
