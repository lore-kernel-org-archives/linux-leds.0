From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 2/3] DT: leds: Add binding for the ISSI IS31FL32xx
 family of LED drivers
Date: Tue, 23 Feb 2016 19:15:08 -0600
Message-ID: <20160224011508.GA20343@rob-hp-laptop>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:60704 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753487AbcBXBPP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 23 Feb 2016 20:15:15 -0500
Content-Disposition: inline
In-Reply-To: <1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Tue, Feb 23, 2016 at 01:17:24PM -0500, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
> 
> This adds a binding description for the is31fl3236/35/18/16 I2C LED
> drivers.
> 
> Signed-off-by: David Rivshin <drivshin@allworx.com>
> ---
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

Acked-by: Rob Herring <robh@kernel.org>
