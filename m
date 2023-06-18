Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65090EB64D7
	for <linux-leds@archiver.kernel.org>; Sun, 18 Jun 2023 20:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjFRUPs (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 18 Jun 2023 16:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjFRUPq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Jun 2023 16:15:46 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4648DE49;
        Sun, 18 Jun 2023 13:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=5Zc4RHYTKtHGz0ciKK7STt9+U04MGOviQwwiD5AympI=; b=LDLHbkUR/samigmVwGFRpYfO0H
        ujQElx2RzVDOx+6MU9fGzP5KGwl3iPj3S/PCVHa4fGju/D0B0RCN/kSg2/iHos99LAAqVtZpnXgNG
        ILG5kjXAV8aK5jHKU6lSCqyQYjey2bev63cgelp5NQ6PobcluozHRc7qCOWshSz+0p6Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qAyoG-00GrYX-7Z; Sun, 18 Jun 2023 22:15:40 +0200
Date:   Sun, 18 Jun 2023 22:15:40 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [net-next PATCH v4 3/3] leds: trigger: netdev: expose hw_control
 status via sysfs
Message-ID: <c8065155-096f-4939-9cef-e419a0371e93@lunn.ch>
References: <20230617115355.22868-1-ansuelsmth@gmail.com>
 <20230617115355.22868-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230617115355.22868-4-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Jun 17, 2023 at 01:53:55PM +0200, Christian Marangi wrote:
> Expose hw_control status via sysfs for the netdev trigger to give
> userspace better understanding of the current state of the trigger and
> the LED.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
