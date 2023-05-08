Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA6AC77B7F
	for <linux-leds@archiver.kernel.org>; Mon,  8 May 2023 12:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbjEHMxJ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 8 May 2023 08:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbjEHMxJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 May 2023 08:53:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E223847A
        for <linux-leds@vger.kernel.org>; Mon,  8 May 2023 05:53:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pw0MJ-0003YG-1s; Mon, 08 May 2023 14:52:55 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1pw0MH-0003Ns-Hm; Mon, 08 May 2023 14:52:53 +0200
Date:   Mon, 8 May 2023 14:52:53 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 00/11] leds: introduce new LED hw control APIs
Message-ID: <20230508125253.GW29365@pengutronix.de>
References: <20230427001541.18704-1-ansuelsmth@gmail.com>
 <ZFjqKoZtgOAWrkP+@pengutronix.de>
 <6458ec16.050a0220.21ddf.3955@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6458ec16.050a0220.21ddf.3955@mx.google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 08, 2023 at 02:33:25PM +0200, Christian Marangi wrote:
> On Mon, May 08, 2023 at 02:25:14PM +0200, Sascha Hauer wrote:
> > Hi Christian,
> > 
> > On Thu, Apr 27, 2023 at 02:15:30AM +0200, Christian Marangi wrote:
> > > This is a continue of [1]. It was decided to take a more gradual
> > > approach to implement LEDs support for switch and phy starting with
> > > basic support and then implementing the hw control part when we have all
> > > the prereq done.
> > 
> > I tried to apply this series to give it a try. To what tree should this
> > series be applied upon?
> >
> 
> Hi,
> since this feature affect multiple branch, the prereq of this branch are
> still not in linux-next. (the prereq series got accepted but still has
> to be merged)
> 
> Lee created a branch.

Ok, this explains it, thanks.

> 
> We are waiting for RC stage to request a stable branch so we can
> reference ti to correctly test this.
> 
> Anyway you should be able to apply this series on top of this branch [1]
> 
> Consider that a v2 is almost ready with some crucial changes that should
> improve the implementation. (so if you are planning on adding support
> for other device I advice to check also v2, just an additional ops to
> implement)

I'll wait for v2 then. My ultimate goal is to implement LED trigger support
for the DP83867 phy. It would be great if you could Cc me on v2 so I get
a trigger once it's out.

Thanks for working on this topic. It pops up here every once in a while
and it would be good to get it solved.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
