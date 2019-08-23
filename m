Return-Path: <SRS0=qlpr=WT=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A717C3A5A2
	for <linux-leds@archiver.kernel.org>; Fri, 23 Aug 2019 20:36:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0668D2173B
	for <linux-leds@archiver.kernel.org>; Fri, 23 Aug 2019 20:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389410AbfHWUgi (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 23 Aug 2019 16:36:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:19274 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389217AbfHWUgi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 23 Aug 2019 16:36:38 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Aug 2019 13:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; 
   d="scan'208";a="191052970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2019 13:36:36 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i1GIU-0002rc-LQ; Fri, 23 Aug 2019 23:36:34 +0300
Date:   Fri, 23 Aug 2019 23:36:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: Switch to use fwnode instead of be stuck
 with OF one
Message-ID: <20190823203634.GX30120@smile.fi.intel.com>
References: <20190822151928.51274-1-andriy.shevchenko@linux.intel.com>
 <20190822151928.51274-2-andriy.shevchenko@linux.intel.com>
 <08858604-8a89-870f-9234-21c7fdd1d165@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08858604-8a89-870f-9234-21c7fdd1d165@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Aug 23, 2019 at 08:14:49PM +0200, Jacek Anaszewski wrote:
> On 8/22/19 5:19 PM, Andy Shevchenko wrote:

> > -	if (!np)
> > -		return NULL;
> 
> Why aren't you checking fwnode for being not NULL?
> It is not guaranteed to be always initialized.

And this is handled by the below. Even in the original code the check was
redundant. Note, led_parse_fwnode_props() is written with the same redundancy.

> > -	count = of_property_count_u32_elems(np, "led-pattern");
> > +	count = fwnode_property_count_u32(fwnode, "led-pattern");
> >  	if (count < 0)
> >  		return NULL;

-- 
With Best Regards,
Andy Shevchenko


