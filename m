From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5] DT: leds: Improve description of flash LEDs related
 properties
Date: Wed, 08 Apr 2015 17:15:11 +0200
Message-ID: <552545FF.2030208@samsung.com>
References: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:43765 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932483AbbDHPPR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 8 Apr 2015 11:15:17 -0400
In-reply-to: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org

On 08/04/15 16:31, Jacek Anaszewski wrote:
> Properties defining maximum values for LED currents and timeout should
> be mandatory to avoid the risk of hardware damage. This patch fixes
> the issue.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

> ---
>  Documentation/devicetree/bindings/leds/common.txt |   19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 747c538..e478ac6 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -10,6 +10,17 @@ can influence the way of the LED device initialization, the LED components
>  have to be tightly coupled with the LED device binding. They are represented
>  by child nodes of the parent LED device binding.
>  
> +Required properties for child nodes:

These properties are mandatory only for LEDs with Flash/Torch capabilities,
aren't they? Requiring those properties for all led nodes would make all
current dtses not compliant with the DT binding specification AFAICT.

How about:

"Required properties for child nodes for LEDs with Flash/Torch capabilities:" ?

> +- led-max-microamp : Maximum LED supply current in microamperes
> +                     (torch LED for flash devices). Controllers that have no
> +                     configurable current can omit this property.
> +- flash-max-microamp : Maximum flash LED supply current in microamperes.
> +- flash-timeout-us : Timeout in microseconds after which the flash
> +                     LED is turned off.
> +

> +Above properties determine a LED driver IC settings required for safe
> +operation. They should be also used as the initial settings for the IC.

Shouldn't "Controllers that have no configurable current can omit this
property" refer to both led-max-microamp and flash-max-microamp? 

I would drop the "Above...for the IC." paragraph and instead add something like:

"For controllers that have no configurable current the led-max-microamp, 
flash-max-microamp properties respectively can be omitted. For controllers that 
have no configurable timeout the flash-timeout-us property can be omitted."

--
Regards, 
Sylwester
