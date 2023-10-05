Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D20E92716
	for <linux-leds@archiver.kernel.org>; Thu,  5 Oct 2023 16:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbjJEQLS (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240337AbjJEQK3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Oct 2023 12:10:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86F01BFD;
        Thu,  5 Oct 2023 07:36:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17818C43391;
        Thu,  5 Oct 2023 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696516607;
        bh=ybCbXCFBWgjsTfax0P9WErF1OiItaUIBPicnl/1gagM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=roKa+WwKfjewVZ5SIQ6STIGCsmxWlKmffPGmM5CMxQT96U0jYtKZUguzFWPZMOkQr
         AJe+/X17hj0TKYkXg7FHUDKCNTYg2xQkWwuXdXfTstE2fRoXxMro1p1hD1GbbLDtNb
         DHZfC0mFk1ADrvN5GzVGHBiwKGT6DBkZvpqLvR+g2DOG7IthjTWn7CksCPNAEEZu5W
         bF+W63hJr9JkZ0Kg4Lfbx0a+EWQEShYSTurxVUFrz0xAbip+wH8t7x2MBPRLxReGaw
         9o/e94xjIguBK5IuFJquCvEclNFGASHrEv4GJCwIkIxyqnaXbYSZltA38dypo3q8Pm
         J4AJ+zGDsheDw==
Date:   Thu, 5 Oct 2023 15:36:43 +0100
From:   Lee Jones <lee@kernel.org>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 1/1] leds: tca6507: Don't use fixed GPIO base
Message-ID: <20231005143643.GA795003@google.com>
References: <20231002135629.2605462-1-andriy.shevchenko@linux.intel.com>
 <169651655262.797431.9123574285135909840.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <169651655262.797431.9123574285135909840.b4-ty@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 05 Oct 2023, Lee Jones wrote:

> On Mon, 02 Oct 2023 16:56:29 +0300, Andy Shevchenko wrote:
> > First of all, the fixed GPIO base is source of troubles and
> > it doesn't scale. Second, there is no in-kernel user of this
> > base, so drop it.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] leds: tca6507: Don't use fixed GPIO base
>       commit: ed84d55d5115455d17fa93f63dbf89697a309d6e

Okay, looks like the (subset) issue has been fixed.

-- 
Lee Jones [李琼斯]
