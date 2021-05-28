Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D403C4708C
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 10:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BED3613B5
	for <linux-leds@archiver.kernel.org>; Fri, 28 May 2021 10:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhE1KtT (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 May 2021 06:49:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:31723 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236170AbhE1KtT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 06:49:19 -0400
IronPort-SDR: 33XRWXZ7kyRFNNvmRHOLYDcl3KIio7Za34Zj4n4l6xON3PlF+7zkdV3QaB3FYuepg1a+zCGgY7
 6RFLlnjqNYTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="202938959"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="202938959"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:47:43 -0700
IronPort-SDR: P88avCeQBFqgYWXMi+3kkLXlGrJpGi5JrUPh3/7IwuzZyZ8vAZUPJDgPWCz8AmIVBURhETylts
 isuKV8LTY27w==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="415253365"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 03:47:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lma1i-00FIFg-TI; Fri, 28 May 2021 13:47:38 +0300
Date:   Fri, 28 May 2021 13:47:38 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/28] leds: lgm-sso: Don't spam logs when probe is
 deferred
Message-ID: <YLDKSqXDeZTWm5XP@smile.fi.intel.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-10-andy.shevchenko@gmail.com>
 <20210528101122.GI2209@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528101122.GI2209@amd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 12:11:22PM +0200, Pavel Machek wrote:
> On Mon 2021-05-10 12:50:26, Andy Shevchenko wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > When requesting GPIO line the probe can be deferred.
> > In such case don't spam logs with an error message.
> > This can be achieved by switching to dev_err_probe().
> > 
> > Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
> > Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> From: does not match signed-off here.

True, I have noticed this later, because I have used existing commit as
template. I'll fix all such occurrences.

-- 
With Best Regards,
Andy Shevchenko


