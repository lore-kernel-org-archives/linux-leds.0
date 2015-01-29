From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] DT: leds: Add led-sources property
Date: Thu, 29 Jan 2015 15:55:52 +0100
Message-ID: <54CA49F8.2030501@samsung.com>
References: <1422346028-16739-1-git-send-email-j.anaszewski@samsung.com>
 <1422346028-16739-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12190 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbA2Oz4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jan 2015 09:55:56 -0500
In-reply-to: <1422346028-16739-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

Hi Rob,

Have we achieved consensus concerning this patch?
If so, can you give your ack?

On 01/27/2015 09:07 AM, Jacek Anaszewski wrote:
> Add a property for defining device outputs the LED
> represented by the DT child node is connected to.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/leds/common.txt |   16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index a2c3f7a..34811c5 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -1,6 +1,19 @@
>   Common leds properties.
>
> +LED and flash LED devices provide the same basic functionality as current
> +regulators, but extended with LED and flash LED specific features like
> +blinking patterns, flash timeout, flash faults and external flash strobe mode.
> +
> +Many LED devices expose more than one current output that can be connected
> +to one or more discrete LED component. Since the arrangement of connections
> +can influence the way of the LED device initialization, the LED components
> +have to be tightly coupled with the LED device binding. They are represented
> +by child nodes of the parent LED device binding.
> +
>   Optional properties for child nodes:
> +- led-sources : List of device current outputs the LED is connected to. The
> +		outputs are identified by the numbers that must be defined
> +		in the LED device binding documentation.
>   - label : The label for this LED.  If omitted, the label is
>     taken from the node name (excluding the unit address).
>
> @@ -33,7 +46,8 @@ system-status {
>
>   camera-flash {
>   	label = "Flash";
> +	led-sources = <0>, <1>;
>   	max-microamp = <50000>;
>   	flash-max-microamp = <320000>;
>   	flash-timeout-us = <500000>;
> -}
> +};
>


-- 
Best Regards,
Jacek Anaszewski
