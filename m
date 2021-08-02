Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8428C4338F
	for <linux-leds@archiver.kernel.org>; Mon,  2 Aug 2021 11:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C4D560F36
	for <linux-leds@archiver.kernel.org>; Mon,  2 Aug 2021 11:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbhHBL0B (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 2 Aug 2021 07:26:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:47188 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233408AbhHBL0B (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Aug 2021 07:26:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193718371"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193718371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:25:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="666539471"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 04:25:50 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mAW4l-004Ig1-Pb; Mon, 02 Aug 2021 14:25:43 +0300
Date:   Mon, 2 Aug 2021 14:25:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/3] leds: lp50xx: LP5009 supports three LED banks
Message-ID: <YQfWN0AEDy6rRfhf@smile.fi.intel.com>
References: <10256dd4010034d6335139d587ebfe933343ee85.1627717572.git.jan.kundrat@cesnet.cz>
 <ed0af7a1974f282847ee333bdfe4019713ab4e56.1627717572.git.jan.kundrat@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed0af7a1974f282847ee333bdfe4019713ab4e56.1627717572.git.jan.kundrat@cesnet.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jul 31, 2021 at 12:07:57AM +0200, Jan Kundrát wrote:

Something is missed here...

-- 
With Best Regards,
Andy Shevchenko


