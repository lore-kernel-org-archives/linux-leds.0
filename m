Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251DFC77B7F
	for <linux-leds@archiver.kernel.org>; Mon,  8 May 2023 13:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjEHNLd (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 8 May 2023 09:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNLc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 May 2023 09:11:32 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CFA2FA34;
        Mon,  8 May 2023 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=c4ZTi/fdPvEGyjWULqRCx9hYDcJ4HpkQpuJc9kjoNqA=; b=KaEvqxZnRUuaaSPLPtkGRw2LCe
        Q314eTim86fE4mSgl0M0yrjA3SkuPEtgnk0UEoM7/+yAKZYXUVSO9KCWyESH2FAQlQ3lqU+ytJxuX
        0RKPB5CLBdGzLWSYGa5NhcPcjqb+1ldqjWWQ0kHtXy98C9UWcGEZyDPeVAcKe5aKDPHo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pw0dv-00CCOL-MU; Mon, 08 May 2023 15:11:07 +0200
Date:   Mon, 8 May 2023 15:11:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 00/11] leds: introduce new LED hw control APIs
Message-ID: <e206d683-6a89-4168-b8ed-ac5b1c76f94c@lunn.ch>
References: <20230427001541.18704-1-ansuelsmth@gmail.com>
 <ZFjqKoZtgOAWrkP+@pengutronix.de>
 <6458ec16.050a0220.21ddf.3955@mx.google.com>
 <20230508125253.GW29365@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508125253.GW29365@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> I'll wait for v2 then. My ultimate goal is to implement LED trigger support
> for the DP83867 phy. It would be great if you could Cc me on v2 so I get
> a trigger once it's out.

Hi Sascha

Full hardware offload is going to take a few patch sets. The v2 to be
posted soon gives basic support. It is will be missing linking the PHY
LED to the netdev. We have patches for that. And then there is a DT
binding, which again we have patches for. It could also be my Marvell
PHY patches are a separate series. You might want those to get an
example for your DP83867 work.

I'm hoping we can move faster than last cycles, there is less LED and
more networking, so we might be closer to 3 day review cycles than 2
weeks.

	Andrew
