From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Tue, 20 Jan 2015 14:40:43 +0100
Message-ID: <20150120134043.GK2938@lunn.ch>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch>
 <54B9259C.3070403@ti.com>
 <20150116191734.GB31577@lunn.ch>
 <54BE258A.10808@ti.com>
 <20150120132613.GJ2938@lunn.ch>
 <54BE58DA.7050707@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:58620 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752056AbbATNmu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 20 Jan 2015 08:42:50 -0500
Content-Disposition: inline
In-Reply-To: <54BE58DA.7050707@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, "R, Vignesh" <vigneshr@ti.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, Matthew.Fatheree@belkin.com, Sekhar Nori <nsekhar@ti.com>

> Right. TLC591xx has the constant output mode which should be used for
> GPIO. Perhaps that mode could be always used when the brightness is
> turned to maximum. I haven't read the spec carefully enough to know if
> there are some downsides.

The original Belkin code did use that mode for full brightness. But it
added complexity to the code which i did not see a need for. Now you
need gpio support, i can add it back.

     Andrew
