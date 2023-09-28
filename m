Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C165E732D8
	for <linux-leds@archiver.kernel.org>; Thu, 28 Sep 2023 13:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjI1No2 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 28 Sep 2023 09:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjI1No1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 28 Sep 2023 09:44:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5478E19E;
        Thu, 28 Sep 2023 06:44:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C854C433C7;
        Thu, 28 Sep 2023 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695908665;
        bh=cXUjA+LGZtBzr9vrfFevPK3DQpphxgfc5qeUDaaGDrU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tKsztWv/lMkAJjLZNCC7L70ZUOotYuFQ8ZKqX+y1+I8FAHhUxDL+zMBP3i7fzDS00
         TBjWczubIuvyeDwXjaglijEfY4cZV1VWk89u7knd+eLZvswK5nBXHTuvXN8X+0RXRV
         SBJH4xFPJzZgoZB18Wdf4RV/wWY2EZW07Xn9D6GFmr/j7J+aHlWKzJOLxuW0ks1uZQ
         +EVSyooiUWFTX7FqFFDdy0UEzKJrRqLejFFDN1gYhQe3GHjK/X73mqdtXiKyU0fm3N
         W6Psu4umL2sVZVmGW5go5PnsOhkCMxPWoWX2th084iJULiE5cTjVfYVwhKzdJNt2/i
         b/rixK/gyhDzg==
Date:   Thu, 28 Sep 2023 14:44:20 +0100
From:   Lee Jones <lee@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: pca955x: Convert enum->pointer for data in
 the match tables
Message-ID: <20230928134420.GK9999@google.com>
References: <20230923171921.53503-1-biju.das.jz@bp.renesas.com>
 <20230923171921.53503-2-biju.das.jz@bp.renesas.com>
 <ZRE08RkhG2C+Pi3l@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRE08RkhG2C+Pi3l@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 25 Sep 2023, Andy Shevchenko wrote:

> On Sat, Sep 23, 2023 at 06:19:20PM +0100, Biju Das wrote:
> > Convert enum->pointer for data in the match tables, so that
> > device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> > bus type match support added to it.
> > 
> > Replace enum->struct *pca955x_chipdefs for data in the match table.
> > Simplify the probe() by replacing device_get_match_data() and ID lookup
> > for retrieving data by i2c_get_match_data().
> > 
> > While at it, add const definition to pca955x_chipdefs[].
> 
> ...
> 
> > -	struct pca955x_chipdef	*chipdef;
> > +	const struct pca955x_chipdef	*chipdef;
> 
> No need to preserve TAB(s) here.

Follow-up please.

-- 
Lee Jones [李琼斯]
