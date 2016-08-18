From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND] leds: centralize definition of "default-state"
 property
Date: Thu, 18 Aug 2016 14:25:42 -0500
Message-ID: <20160818192542.GA29941@rob-hp-laptop>
References: <1471376496-8706-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:32882 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753564AbcHSCNl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Aug 2016 22:13:41 -0400
Content-Disposition: inline
In-Reply-To: <1471376496-8706-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Aug 16, 2016 at 09:41:36PM +0200, Linus Walleij wrote:
> Four different drivers define the "default-state" property.
> Move this into the common.txt common LEDs properties.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Resending trying to get attention from the devicetree
> maintainers.
> ---
>  Documentation/devicetree/bindings/leds/common.txt           | 7 +++++++
>  Documentation/devicetree/bindings/leds/leds-bcm6328.txt     | 2 +-
>  Documentation/devicetree/bindings/leds/leds-bcm6358.txt     | 2 +-
>  Documentation/devicetree/bindings/leds/leds-gpio.txt        | 9 ++-------
>  Documentation/devicetree/bindings/leds/register-bit-led.txt | 9 ++-------
>  5 files changed, 13 insertions(+), 16 deletions(-)

I'm assuming Jacek will take this. If not, let me know.

Acked-by: Rob Herring <robh@kernel.org>
