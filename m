Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728F9C433EF
	for <linux-leds@archiver.kernel.org>; Thu,  5 May 2022 01:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236599AbiEEB7P (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 4 May 2022 21:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbiEEB7N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 21:59:13 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871D718E10;
        Wed,  4 May 2022 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=sL15BtqxkS83BtwMcXzwwWefkBGsC27aYs1XXsPFiMg=; b=k4YcWOZ0W272989cxF2N9neV80
        zC0uryM6TrESFaN/7iEAyWBnYSUfQbkXa6eBVJrjLslY4Z2tW1PwlRW8InkBQ4sl8aLNmtH4+a9M7
        OjY/CPuYhlH+dpD3wW2tl3QcYVqLdJnMWUgeKEU6wjn0PLHQ/j5pqeTKHnl6WMBRCesU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nmQiF-001I3B-0G; Thu, 05 May 2022 03:55:27 +0200
Date:   Thu, 5 May 2022 03:55:26 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v6 10/11] net: dsa: qca8k: add LEDs support
Message-ID: <YnMujjDHD5M9UdH0@lunn.ch>
References: <20220503151633.18760-1-ansuelsmth@gmail.com>
 <20220503151633.18760-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503151633.18760-11-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> +		ret = fwnode_property_read_string(led, "default-state", &state);

You should probably use led_default_state led_init_default_state_get()

    Andrew
