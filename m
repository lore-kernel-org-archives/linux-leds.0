From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 1/3] leds: core: Introduce generic pattern interface
Date: Wed, 15 Nov 2017 08:36:42 +0100
Message-ID: <20171115073642.GA21307@kroah.com>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43465 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750962AbdKOHgh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Nov 2017 02:36:37 -0500
Content-Disposition: inline
In-Reply-To: <20171115071345.24331-2-bjorn.andersson@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

On Tue, Nov 14, 2017 at 11:13:43PM -0800, Bjorn Andersson wrote:
> Some LED controllers have support for autonomously controlling
> brightness over time, according to some preprogrammed pattern or
> function.
> 
> This adds a new optional operator that LED class drivers can implement
> if they support such functionality as well as a new device attribute to
> configure the pattern for a given LED.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 
> Changes since v1:
> - New patch, based on discussions following v1
> 
>  Documentation/ABI/testing/sysfs-class-led |  20 ++++
>  drivers/leds/led-class.c                  | 150 ++++++++++++++++++++++++++++++
>  include/linux/leds.h                      |  21 +++++
>  3 files changed, 191 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 5f67f7ab277b..74a7f5b1f89b 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -61,3 +61,23 @@ Description:
>  		gpio and backlight triggers. In case of the backlight trigger,
>  		it is useful when driving a LED which is intended to indicate
>  		a device in a standby like state.
> +
> +What:		/sys/class/leds/<led>/pattern
> +Date:		July 2017

That was many months ago :)

> +KernelVersion:	4.14

And that kernel version is long since released :)

thanks,

greg k-h
