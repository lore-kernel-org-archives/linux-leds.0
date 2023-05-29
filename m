Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21ECFC7EE23
	for <linux-leds@archiver.kernel.org>; Mon, 29 May 2023 15:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjE2Pdh (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 29 May 2023 11:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjE2Pdg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2023 11:33:36 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28909CF;
        Mon, 29 May 2023 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=B2urfTEG0AIceXh+hN8JobHy3TUx4w+6++NQb1zfkks=; b=qaH41Ui5q9yEcJ7nOPK1pdI60l
        ZcGwx8sInXMIBIifAZPGUgjRzhFxTU9QBNn/5tvK+2GNwOkRd38IUbwHPX7LMnedYVP4LoSOh9scR
        LRo0nqSpahCIHjGXa66eJ1M8i98fcIin//0ra6wOr0yyWufGX4ku0Uh9S3ddtL0U2un4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q3esB-00EEys-IJ; Mon, 29 May 2023 17:33:27 +0200
Date:   Mon, 29 May 2023 17:33:27 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-leds@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [net-next PATCH v3 07/13] leds: trigger: netdev: reject interval
 store for hw_control
Message-ID: <9364c81f-1e8d-4c6d-a990-0acb554c6511@lunn.ch>
References: <20230527112854.2366-1-ansuelsmth@gmail.com>
 <20230527112854.2366-8-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527112854.2366-8-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 27, 2023 at 01:28:48PM +0200, Christian Marangi wrote:
> Reject interval store with hw_control enabled. It's are currently not
> supported and MUST be set to the default value with hw control enabled.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
