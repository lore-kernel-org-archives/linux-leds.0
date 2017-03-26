From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] Revert "i2c: mux: pca954x: Add ACPI support for
 pca954x"
Date: Sun, 26 Mar 2017 15:47:18 +0300
Message-ID: <1490532438.708.10.camel@linux.intel.com>
References: <20170321191310.32957-1-andriy.shevchenko@linux.intel.com>
         <01b7c79e-c52f-8e87-59a8-2eb17a72d733@axentia.se>
         <1490187942.19767.161.camel@linux.intel.com>
         <7d5fba14-d3f1-dfaa-ac7d-5001ccf370a1@axentia.se>
         <20170323100403.GA9307@amd>
         <e4f3c6fd-3a91-ad9f-ba43-605f850d1524@axentia.se>
         <1490271392.19767.186.camel@linux.intel.com>
         <077d184d-1af5-fcdb-59c9-ff3255906be0@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59613 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751309AbdCZMrY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 26 Mar 2017 08:47:24 -0400
In-Reply-To: <077d184d-1af5-fcdb-59c9-ff3255906be0@axentia.se>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Pavel Machek <pavel@ucw.cz>
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Tin Huynh <tnhuynh@apm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

On Fri, 2017-03-24 at 11:21 +0100, Peter Rosin wrote:
> On 2017-03-23 13:16, Andy Shevchenko wrote:
> > On Thu, 2017-03-23 at 12:21 +0100, Peter Rosin wrote:

> > > So, I'm still seeking guidance on how to handle these two patches.
> > 
> > I have no strong opinion, but IDs might collide in the future if
> > PCAxxxx
> > will be assigned to something else and the patch will go stable@
> > (yeah,
> > OTOH it's quite unlikely).
> > 
> > So, we may postpone any stable@ back porting up to some real issue
> > appears. Regarding second one, it's not important at all (could be
> > even
> > dropped). Consider it as example how to use _DSD and PRP0001 in ACPI
> > case for DT-enabled drivers.
> 
> Ok, I have added 1/2 to my i2c-mux for-current branch and will drop
> 2/2 unless someone pipes up.

Fair enough.
Thanks!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
