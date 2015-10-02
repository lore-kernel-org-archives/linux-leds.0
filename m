From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/2] Add RT5033 Flash LED driver
Date: Fri, 02 Oct 2015 16:59:12 +0200
Message-ID: <560E9BC0.20804@samsung.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19058 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751841AbbJBO7Q (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 2 Oct 2015 10:59:16 -0400
In-reply-to: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rpurdie@rpsys.net, sameo@linux.intel.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

Thanks for the patches. Please fix build errors
and resubmit.

On 10/02/2015 11:41 AM, Ingi Kim wrote:
> This patch adds ktd2692 Flash LED driver with LED Flash class
>
> Ingi Kim (2):
>    leds: rt5033: add DT binding for RT5033
>    leds: rt5033: Add RT5033 Flash led device driver
>
>   .../devicetree/bindings/leds/leds-rt5033.txt       |  38 ++++
>   drivers/leds/Kconfig                               |   8 +
>   drivers/leds/Makefile                              |   1 +
>   drivers/leds/leds-rt5033.c                         | 222 +++++++++++++++++++++
>   drivers/mfd/rt5033.c                               |   3 +
>   include/linux/mfd/rt5033-private.h                 |  67 ++++++-
>   include/linux/mfd/rt5033.h                         |  27 ++-
>   7 files changed, 355 insertions(+), 11 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
>   create mode 100644 drivers/leds/leds-rt5033.c
>


-- 
Best Regards,
Jacek Anaszewski
