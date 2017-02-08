From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/4] Documentation: devicetree: Add document bindings
 for leds-mt6323
Date: Wed, 8 Feb 2017 03:47:26 +0100
Message-ID: <20170208024726.GD29174@lunn.ch>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
 <1486520357-13096-2-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:59481 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751140AbdBHCrl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 7 Feb 2017 21:47:41 -0500
Content-Disposition: inline
In-Reply-To: <1486520357-13096-2-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sean.wang@mediatek.com
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, keyhaede@gmail.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org

> +			led0: isink0 {
> +				lebel = "LED0"

label, not lebel.

       Andrew
