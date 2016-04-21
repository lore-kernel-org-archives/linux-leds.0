From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] leds: pca963x: Inform the output that it is inverted
Date: Thu, 21 Apr 2016 10:07:50 -0500
Message-ID: <20160421150750.GA3116@rob-hp-laptop>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <1461051650-18824-6-git-send-email-oliver@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40609 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753135AbcDUPH6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 21 Apr 2016 11:07:58 -0400
Content-Disposition: inline
In-Reply-To: <1461051650-18824-6-git-send-email-oliver@schinagl.nl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Apr 19, 2016 at 09:40:49AM +0200, Olliver Schinagl wrote:
> When leds are connected in a totem-pole configuration, they can be
> connected either in a active-high, or active-low manor. The driver
> currently always assumes active-high. This patch adds the
> 'nxp,inverted-out' boolean property to tell the driver that the leds
> are driven active-low, or rather, that the behavior is inverted to what
> is normally expected.

How do I know what is normally expected?

> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
> ---
>  Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
>  drivers/leds/leds-pca963x.c                        | 20 +++++++++++++-------
>  include/linux/platform_data/leds-pca963x.h         |  1 +
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
> index dafbe99..7b23725 100644
> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
> @@ -6,6 +6,7 @@ Required properties:
>  Optional properties:
>  - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
>    to open-drain, newer chips to totem pole)
> +  nxp,inverted-out: the connected leds are active-low, default to active-high

Just state what mode you want: nxp,active-low

Rob
