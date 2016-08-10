From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2 v3] leds: pm8058: add device tree bindings
Date: Wed, 10 Aug 2016 15:23:04 -0500
Message-ID: <20160810202304.GA32491@rob-hp-laptop>
References: <1470679911-13669-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35433 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933743AbcHJUXG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 10 Aug 2016 16:23:06 -0400
Content-Disposition: inline
In-Reply-To: <1470679911-13669-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On Mon, Aug 08, 2016 at 08:11:50PM +0200, Linus Walleij wrote:
> This adds the device tree bindings for the PM8058 LEDs.
> 
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rename the keypad LED in the example from "keypad" to
>   "pm8050:white:keypad"
> ChangeLog v1->v2:
> - Fix some spelling mistakes
> - Reference common bindings directly without any local descriptions
> ---
>  .../devicetree/bindings/leds/leds-pm8058.txt       | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt

Acked-by: Rob Herring <robh@kernel.org>
