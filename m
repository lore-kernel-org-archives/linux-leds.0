From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] leds: gpio: Support the "panic-indicator"
 firmware property
Date: Tue, 3 May 2016 11:53:57 -0500
Message-ID: <20160503165357.GA10505@rob-hp-laptop>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42055 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933595AbcECQyC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 3 May 2016 12:54:02 -0400
Content-Disposition: inline
In-Reply-To: <1461881020-13964-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Pavel Machek <pavel@ucw.cz>

On Thu, Apr 28, 2016 at 07:03:40PM -0300, Ezequiel Garcia wrote:
> Calling a GPIO LEDs is quite likely to work even if the kernel
> has paniced, so they are ideal to blink in this situation.
> This commit adds support for the new "panic-indicator"
> firmware property, allowing to mark a given LED to blink on
> a kernel panic.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  Documentation/devicetree/bindings/leds/leds-gpio.txt | 2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/leds/leds-gpio.c                             | 4 ++++
>  include/linux/leds.h                                 | 1 +
>  3 files changed, 7 insertions(+)
