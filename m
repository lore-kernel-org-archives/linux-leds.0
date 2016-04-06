From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] devicetree: leds: Introduce "panic-blink" optional property
Date: Wed, 6 Apr 2016 10:12:09 -0500
Message-ID: <CAL_JsqLF-cMtGERnZ0wO_GUkhsf23LQhOm6PwwKAa5evSkOHDg@mail.gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar> <1459801326-5541-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53914 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751428AbcDFPMc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 6 Apr 2016 11:12:32 -0400
In-Reply-To: <1459801326-5541-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Mon, Apr 4, 2016 at 3:22 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> It's desirable to specify which LEDs are to be blinked on a kernel
> panic. Therefore, introduce a devicetree boolean property to mark
> which LEDs should be treated this way.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 68419843e32f..dd409df9203a 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -37,6 +37,8 @@ Optional properties for child nodes:
>                       property is mandatory for the LEDs in the non-flash modes
>                       (e.g. torch or indicator).
>
> +- panic-blink : Mark this LED to be used by the panic LED trigger.
> +

We already have a way to specify LED triggers. Why can't that be used?

Rob
