From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] leds: lp3952: Remove ACPI support for lp3952
Date: Wed, 22 Mar 2017 22:00:28 +0200
Message-ID: <1490212828.19767.181.camel@linux.intel.com>
References: <20170322150021.62311-1-andriy.shevchenko@linux.intel.com>
         <7721924a-71d3-89d6-79fd-d4a2321f0f4c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:31387 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750989AbdCVUAd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Mar 2017 16:00:33 -0400
In-Reply-To: <7721924a-71d3-89d6-79fd-d4a2321f0f4c@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: Tony Makkiel <tony.makkiel@daqri.com>

On Wed, 2017-03-22 at 20:51 +0100, Jacek Anaszewski wrote:
> Hi Andy,
> 
> Thanks for the patch.

> What about CONFIG_ACPI dependency in drivers/leds/Kconfig?

Thanks for pointing this out. From now on it's redundant.

I will fix this in v3, but will wait a bit for other comments / tags if
any.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
