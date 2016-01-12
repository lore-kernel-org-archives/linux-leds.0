From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: Add Chrome OS keyboard LEDs driver
Date: Tue, 12 Jan 2016 16:09:22 +0100
Message-ID: <56951722.5010005@samsung.com>
References: <1452539530-10829-1-git-send-email-sque@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17561 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283AbcALPJe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2016 10:09:34 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0U00NCRI3V4A30@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 12 Jan 2016 15:09:31 +0000 (GMT)
In-reply-to: <1452539530-10829-1-git-send-email-sque@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Que <sque@chromium.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Sameer Nanda <snanda@chromium.org>, Todd Broch <tbroch@chromium.org>, Duncal Laurie <dlaurie@chromium.org>, Evan McClain <aeroevan@gmail.com>

Hi Simon,

This patch doesn't apply due to outdated LED tree you're using.
Please fix the issues and resubmit the patch when the required
dependencies mentioned by Evan are merged.

On 01/11/2016 08:12 PM, Simon Que wrote:
> Some Chrome OS devices use ACPI-based keyboard backlight LEDs.
>
> Enable with menuconfig option under Device Drivers -> LED Support.
>
> Change-Id: Id5a762b97e131c3b66c90fd0da93658c98bd8bc8
> Signed-off-by: Simon Que <sque@chromium.org>
> ---
>   drivers/leds/Kconfig                  |   7 +++
>   drivers/leds/Makefile                 |   1 +
>   drivers/leds/leds-chromeos-keyboard.c | 115 ++++++++++++++++++++++++++++++++++
>   3 files changed, 123 insertions(+)
>   create mode 100644 drivers/leds/leds-chromeos-keyboard.c
[...]


-- 
Best Regards,
Jacek Anaszewski
