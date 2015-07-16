From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] backlight: pm8941-wled: Move PM8941 WLED driver to
 backlight
Date: Thu, 16 Jul 2015 10:01:09 +0200
Message-ID: <55A764C5.5060205@samsung.com>
References: <1436990540-23354-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43657 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750AbbGPIBO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2015 04:01:14 -0400
In-reply-to: <1436990540-23354-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 07/15/2015 10:02 PM, Bjorn Andersson wrote:
> The Qualcomm PM8941 WLED block is used for backlight and should therefor
> be in the backlight framework and not in the LED framework. This moves
> the driver and adapts to the backlight api instead.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>   .../devicetree/bindings/leds/leds-pm8941-wled.txt  |  5 +-
>   drivers/leds/Kconfig                               |  8 ---
>   drivers/leds/Makefile                              |  1 -
>   drivers/video/backlight/Kconfig                    |  8 +++
>   drivers/video/backlight/Makefile                   |  1 +
>   .../backlight/pm8941-wled.c}                       | 59 ++++++++++------------
>   6 files changed, 36 insertions(+), 46 deletions(-)
>   rename drivers/{leds/leds-pm8941-wled.c => video/backlight/pm8941-wled.c} (90%)

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
